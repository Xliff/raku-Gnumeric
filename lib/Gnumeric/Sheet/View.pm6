use v6.c;

use NativeCall;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Sheet::View;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Gnumeric::Sheet::View {
  also does GLib::Roles::Object;

  has SheetView $!gsv is implementor;

  method new (Sheet() $sheet, WorkbookView() $wbv) {
    my $gnumeric-sheet-view = gnm_sheet_view_new($sheet, $wbv);

    $gnumeric-sheet-view ?? self.bless( :$gnumeric-sheet-view ) !! Nil;
  }

  multi method ant (@ranges) {
    samewith( GLib::List.new(@ranges, typed => GnmRange) );
  }
  multi method ant (GList() $ranges) {
    gnm_sheet_view_ant($!gsv, $ranges);
  }

  method attach_control (SheetControl() $sc) {
    gnm_sheet_view_attach_control($!gsv, $sc);
  }

  method cursor_set (
    GnmCellPos() $edit,
    Int()        $base_col,
    Int()        $base_row,
    Int()        $move_col,
    Int()        $move_row,
    GnmRange()   $bound      = GnmRange
  ) {
    my gint ($bc, $br, $mc, $mr) =
      ($base_col, $base_row, $move_col, $move_row);

    gnm_sheet_view_cursor_set($!gsv, $edit, $bc, $br, $mc, $mr, $bound);
  }

  method detach_control (SheetControl() $sc) {
    gnm_sheet_view_detach_control($!gsv, $sc);
  }

  method dispose {
    gnm_sheet_view_dispose($!gsv);
  }

  method editpos_in_filter ( :$raw = False ) {
    propReturnObject(
      gnm_sheet_view_editpos_in_filter($!gsv),
      $raw,
      Gnumeric::Filter.getTypePair
    );
  }

  method editpos_in_slicer ( :$raw = False ) {
    propReturnObject(
      gnm_sheet_view_editpos_in_slicer($!gsv),
      $raw,
      |Gnumeric::Sheet::Slicer.getTypePair
    );
  }

  method flag_selection_change {
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

            method update_pos (GnmCellPos() $pos) {
              gnm_sheet_view_flag_status_update_pos($!gsv, $pos);
            }

            method update_range (GnmRange()  $range) {
              gnm_sheet_view_flag_status_update_range($!gsv, $range);
            }
          }

          $!status = St.new( gsv => $!gsv );
        }

        method style {
          unless $!style {
            my \St = class :: {
              has $!gsv is built;

              method update_range (GnmRange() $range) {
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
  ) {
    gnm_sheet_view_freeze_panes($!gsv, $frozen_top_left, $unfrozen_top_left);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_sheet_view_get_type, $n, $t );
  }

  method is_frozen {
    gnm_sheet_view_is_frozen($!gsv);
  }

  method make_cell_visible (Int() $col, Int() $row, Int() $couple_panes) {
    my gint     ($c, $r) = ($col, $row);
    my gboolean  $p      =  $couple_panes.so.Int;

    gnm_sheet_view_make_cell_visible($!gsv, $c, $r, $p);
  }

  has $!gsv-panes;
  method panes {
    unless $!gsv-panes {
      my \T = class :: {

        method insert (
           $colrow,
           $count        = 1,
          :col(:$column) = False
        ) {
          $.insdel_colrow($column, True, $colrow, $count)
        }

        method insert_row ($row, $count = 1) {
          $.insert($row, $count, :insert, :!col);
        }

        method insert-col ($col, $count = 1) {
          $.insert($col, $count, :insert, :col);
        }

        method delete (
           $colrow,
           $count        = 1,
          :col(:$column) = False
        ) {
          $.insdel_colrow($column, False, $colrow, $count)
        }

        method delete_row ($row, $count = 1) {
          $.insert($row, $count, :!insert, :!col);
        }

        method delete_col ($col, $count = 1) {
          $.insert($row, $count, :!insert, :col);
        }

        method insdel_colrow (
          Int() $is_cols,
          Int() $is_insert,
          Int() $start,
          Int() $count
        ) {
          my gint     ($s,  $c)  = ($start, $count);
          my gboolean ($co, $in) = ($is_cols, $is_insert).map( *.so.Int );

          gnm_sheet_view_panes_insdel_colrow($!gsv, $co, $in, $s, $c);
        }
      }

      $!gsv-panes = T.new( gsv => $!gsv );
    }
    $!gsv-panes;
  }

  method redraw_headers (Int() $col, Int() $row, GnmRange() $r) {
    my gboolean ($c, $r) = ($col, $row).map( *.so.Int );

    gnm_sheet_view_redraw_headers($!gsv, $c, $r, $r);
  }

  method redraw_range (GnmRange() $r) {
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

        method extends_filter (GnmFilter() $f, :$raw = False) {
          propReturnObject(
            gnm_sheet_view_selection_extends_filter($!gsv, $f),
            $raw,
            |Gnumeric::Range.getTypePair
          );
        }

        method intersects_filter_rows ( :$raw = False ) {
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

  method set_edit_pos (GnmCellPos() $pos) {
    gnm_sheet_view_set_edit_pos($!gsv, $pos);
  }

  method set_initial_top_left (Int() $col, Int() $row) {
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

  method sv_wbv ( :$raw = False ) {
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
  { * }

  method weak_ref (SheetView() $sv) {
    samewith( newCArray(SheetView, $sv) );
  }
  method weak_ref (CArray[SheetView] $ptr) {
    gnm_sheet_view_weak_ref($!gsv, $ptr);
  }

  proto method weak_unref (|)
  { * }

  method weak_unref (SheetView() $sv) {
    samewith( newCArray(SheetView, $sv) );
  }
  method weak_unref (CArray[SheetView] $ptr) is static {
    gnm_sheet_view_weak_unref($ptr);
  }
}
