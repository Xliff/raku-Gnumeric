use v6.c;

use Method::Also;
use NativeCall;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Sheet::View;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset SheetViewAncestry is export of Mu
  where SheetView | GObject;

class Gnumeric::Sheet::View {
  also does GLib::Roles::Object;

  has SheetView $!gsv is implementor;

  submethod BUILD ( :$gnumeric-sheet-view ) {
    self.setSheetView($gnumeric-sheet-view) if $gnumeric-sheet-view
  }

  method setSheetView (SheetViewAncestry $_) {
    my $to-parent;

    $!gsv = do {
      when SheetView {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(SheetView, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Gnumeric::Raw::Definitions::SheetView
    is also<
      SheetView
      GnmSheetView
    >
  { $!gsv }

  multi method new (
    $gnumeric-sheet-view where * ~~ SheetViewAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-sheet-view;

    my $o = self.bless( :$gnumeric-sheet-view );
    $o.ref if $ref;
    $o;
  }
  multi method new (Sheet() $sheet, WorkbookView() $wbv) {
    my $gnumeric-sheet-view = gnm_sheet_view_new($sheet, $wbv);

    $gnumeric-sheet-view ?? self.bless( :$gnumeric-sheet-view ) !! Nil;
  }

  multi method ant (@ranges) {
    samewith( GLib::List.new(@ranges, typed => GnmRange) );
  }
  multi method ant (GList() $ranges) {
    gnm_sheet_view_ant($!gsv, $ranges);
  }

  method attach_control (SheetControl() $sc) is also<attach-control> {
    gnm_sheet_view_attach_control($!gsv, $sc);
  }

  method cursor_set (
    GnmCellPos() $edit,
    Int()        $base_col,
    Int()        $base_row,
    Int()        $move_col,
    Int()        $move_row,
    GnmRange()   $bound      = GnmRange
  )
    is also<cursor-set>
  {
    my gint ($bc, $br, $mc, $mr) =
      ($base_col, $base_row, $move_col, $move_row);

    gnm_sheet_view_cursor_set($!gsv, $edit, $bc, $br, $mc, $mr, $bound);
  }

  method detach_control (SheetControl() $sc) is also<detach-control> {
    gnm_sheet_view_detach_control($!gsv, $sc);
  }

  method dispose {
    gnm_sheet_view_dispose($!gsv);
  }

  method editpos_in_filter ( :$raw = False ) is also<editpos-in-filter> {
    propReturnObject(
      gnm_sheet_view_editpos_in_filter($!gsv),
      $raw,
      Gnumeric::Filter.getTypePair
    );
  }

  method editpos_in_slicer ( :$raw = False ) is also<editpos-in-slicer> {
    propReturnObject(
      gnm_sheet_view_editpos_in_slicer($!gsv),
      $raw,
      |Gnumeric::Sheet::Slicer.getTypePair
    );
  }

  method flag_selection_change is also<flag-selection-change> {
    gnm_sheet_view_flag_selection_change($!gsv);
  }

  has $!gsv-flag;

  method flag {
    unless $!gsv-flag {
      my \T = class :: {
        has $!gsv is built;

        has $!status;
        has $!style;

        method status {
          my \St = class ::{
            has $!gsv is built;

            method update_pos (GnmCellPos() $pos) is also<update-pos> {
              gnm_sheet_view_flag_status_update_pos($!gsv, $pos);
            }

            method update_range (GnmRange()  $range) is also<update-range> {
              gnm_sheet_view_flag_status_update_range($!gsv, $range);
            }
          }

          $!status = St.new( gsv => $!gsv );
        }

        method style {
          unless $!style {
            my \St = class :: {
              has $!gsv is built;

              method update_range (GnmRange() $range) is also<update-range> {
                gnm_sheet_view_flag_style_update_range($!gsv, $range);
              }
            }

            $!style = St.new( gsv => $!gsv )
          }

          $!style;
        }
      }

      $!gsv-flag = T.new( gsv => $!gsv );
    }

    $!gsv-flag
  }

  method freeze_panes (
    GnmCellPos() $frozen_top_left,
    GnmCellPos() $unfrozen_top_left
  )
    is also<freeze-panes>
  {
    gnm_sheet_view_freeze_panes($!gsv, $frozen_top_left, $unfrozen_top_left);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_sheet_view_get_type, $n, $t );
  }

  method is_frozen is also<is-frozen> {
    gnm_sheet_view_is_frozen($!gsv);
  }

  method make_cell_visible (Int() $col, Int() $row, Int() $couple_panes)
    is also<make-cell-visible>
  {
    my gint     ($c, $r) = ($col, $row);
    my gboolean  $p      =  $couple_panes.so.Int;

    gnm_sheet_view_make_cell_visible($!gsv, $c, $r, $p);
  }

  has $!gsv-panes;
  method panes {
    unless $!gsv-panes {
      my \T = class :: {
        has $!gsv is built;

        method insert (
           $colrow,
           $count        = 1,
          :col(:$column) = False
        ) {
          $.insdel_colrow($column, True, $colrow, $count)
        }

        method insert_row ($row, $count = 1) is also<insert-row> {
          $.insert($row, $count, :insert, :!col);
        }

        method insert-col ($col, $count = 1) is also<insert_col> {
          $.insert($col, $count, :insert, :col);
        }

        method delete (
           $colrow,
           $count        = 1,
          :col(:$column) = False
        ) {
          $.insdel_colrow($column, False, $colrow, $count)
        }

        method delete_row ($row, $count = 1) is also<delete-row> {
          $.insert($row, $count, :!insert, :!col);
        }

        method delete_col ($col, $count = 1) is also<delete-col> {
          $.insert($col, $count, :!insert, :col);
        }

        method insdel_colrow (
          Int() $is_cols,
          Int() $is_insert,
          Int() $start,
          Int() $count
        )
          is also<insdel-colrow>
        {
          my gint     ($s,  $c)  = ($start, $count);
          my gboolean ($co, $in) = ($is_cols, $is_insert).map( *.so.Int );

          gnm_sheet_view_panes_insdel_colrow($!gsv, $co, $in, $s, $c);
        }
      }

      $!gsv-panes = T.new( gsv => $!gsv );
    }
    $!gsv-panes;
  }

  method redraw_headers (Int() $col, Int() $row, GnmRange() $rng)
    is also<redraw-headers>
  {
    my gboolean ($c, $r) = ($col, $row).map( *.so.Int );

    gnm_sheet_view_redraw_headers($!gsv, $c, $r, $rng);
  }

  method redraw_range (GnmRange() $r) is also<redraw-range> {
    gnm_sheet_view_redraw_range($!gsv, $r);
  }

  method resize (Int() $force_scroll) {
    my gboolean $f = $force_scroll.so.Int;

    gnm_sheet_view_resize($!gsv, $f);
  }

  has $!gsv-select;

  method selection {
    unless $!gsv-select {
      my \T = class :: {
        has $!gsv is built;

        method copy (WorkbookControl() $wbc) {
          gnm_sheet_view_selection_copy($!gsv, $wbc);
        }

        method cut (WorkbookControl() $wbc) {
          gnm_sheet_view_selection_cut($!gsv, $wbc);
        }

        method extends_filter (GnmFilter() $f, :$raw = False)
          is also<extends-filter>
        {
          propReturnObject(
            gnm_sheet_view_selection_extends_filter($!gsv, $f),
            $raw,
            |Gnumeric::Range.getTypePair
          );
        }

        method intersects_filter_rows ( :$raw = False )
          is also<intersects-filter-rows>
        {
          propReturnObject(
            gnm_sheet_view_selection_intersects_filter_rows($!gsv),
            $raw,
            |Gnumeric::Filter.getTypePair
          )
        }
      }

      $!gsv-select = T.new( gsv => $!gsv );
    }
    $!gsv-select
  }

  method set_edit_pos (GnmCellPos() $pos) is also<set-edit-pos> {
    gnm_sheet_view_set_edit_pos($!gsv, $pos);
  }

  method set_initial_top_left (Int() $col, Int() $row)
    is also<set-initial-top-left>
  {
    my gint ($c, $r) = ($col, $row);

    gnm_sheet_view_set_initial_top_left($!gsv, $col, $row);
  }

  method sheet ( :$raw = False ) {
    propReturnObject(
      sv_sheet($!gsv),
      $raw,
      |Gnumeric::Sheet.getTypePair
    );
  }

  method sv_wbv ( :$raw = False ) is also<sv-wbv> {
    propReturnObject(
      sv_wbv($!gsv),
      $raw,
      ::('Gnumeric::Workbook::View').getTypePair
    );
  }

  method unant {
    gnm_sheet_view_unant($!gsv);
  }

  method update {
    gnm_sheet_view_update($!gsv);
  }

  proto method weak_ref (|)
    is also<weak-ref>
  { * }

  multi method weak_ref (SheetView() $sv) {
    samewith( newCArray(SheetView, $sv) );
  }
  multi method weak_ref (CArray[SheetView] $ptr) {
    gnm_sheet_view_weak_ref($!gsv, $ptr);
  }

  proto method weak_unref (|)
    is also<weak-unref>
    is static
  { * }

  multi method weak_unref (SheetView() $sv) {
    samewith( newCArray(SheetView, $sv) );
  }
  multi method weak_unref (CArray[SheetView] $ptr)  {
    gnm_sheet_view_weak_unref($ptr);
  }
}
