use v6.c;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Sheet::Control;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset SheetControlAncestry is export of Mu
  where SheetControl | GObject;

class Gnumeric::Sheet::Control {
  also does GLib::Roles::Object;

  has SheetControl $!sc is implementor;

  submethod BUILD ( :$gnumeric-sheet-control ) {
    self.setSheetControl($gnumeric-sheet-control) if $gnumeric-sheet-control
  }

  method setSheetControl (SheetControlAncestry $_) {
    my $to-parent;

    $!sc = do {
      when SheetControl {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(SheetControl, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Gnumeric::Raw::Definitions::SheetControl
    is also<SheetControl>
  { $!sc }

  multi method new (
    $gnumeric-sheet-control where * ~~ SheetControlAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-sheet-control;

    my $o = self.bless( :$gnumeric-sheet-control );
    $o.ref if $ref;
    $o;
  }

  method ant {
    sc_ant($!sc);
  }

  method cursor_bound (GnmRange() $r) is also<cursor-bound> {
    sc_cursor_bound($!sc, $r);
  }

  method freeze_object_view (Int() $freeze) is also<freeze-object-view> {
    my gboolean $f = $freeze.so.Int;

    sc_freeze_object_view($!sc, $f);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &sheet_control_get_type, $n, $t );
  }

  method make_cell_visible (Int() $col, Int() $row, Int() $couple_panes)
    is also<make-cell-visible>
  {
    my gint     ($c, $r) = ($col, $row);
    my gboolean  $p      =  $couple_panes.so.Int;

    sc_make_cell_visible($!sc, $col, $row, $couple_panes);
  }

  method mode_edit is also<mode-edit> {
    sc_mode_edit($!sc);
  }

  method object_create_view (SheetObject() $so, :$raw = False)
    is also<object-create-view>
  {
    sc_object_create_view($!sc, $so);
  }

  method recompute_visible_region (Int() $full_recompute)
    is also<recompute-visible-region>
  {
    my gboolean $f = $full_recompute.so.Int;

    sc_recompute_visible_region($!sc, $f);
  }

  method redraw_all (Int() $headers) is also<redraw-all> {
    my gboolean $h = $headers.so.Int;

    sc_redraw_all($!sc, $h);
  }

  method redraw_headers (Int() $col, Int() $row, GnmRange() $rr)
    is also<redraw-headers>
  {
    my gboolean ($c, $r) = ($col, $row).map( *.so.Int );

    sc_redraw_headers($!sc, $c, $r, $rr);
  }

  method redraw_range (GnmRange() $r) is also<redraw-range> {
    sc_redraw_range($!sc, $r);
  }

  method resize (Int() $force_scroll) {
    my gboolean $f = $force_scroll.so.Int;

    sc_resize($!sc, $f);
  }

  method scale_changed is also<scale-changed> {
    sc_scale_changed($!sc);
  }

  method scrollbar_config is also<scrollbar-config> {
    sc_scrollbar_config($!sc);
  }

  method set_panes is also<set-panes> {
    sc_set_panes($!sc);
  }

  method set_top_left (Int() $col, Int() $row) is also<set-top-left> {
    my gint ($c, $r) = ($col, $row);

    sc_set_top_left($!sc, $col, $row);
  }

  method sheet ( :$raw = False ) {
    propReturnObject(
      sc_sheet($!sc),
      $raw,
      |Gnumeric::Sheet.getTypePair
    );
  }

  method show_im_tooltip (GnmInputMsg() $im, GnmCellPos() $pos)
    is also<show-im-tooltip>
  {
    sc_show_im_tooltip($!sc, $im, $pos);
  }

  method unant {
    sc_unant($!sc);
  }

  method view ( :$raw = False )  {
    propReturnObject(
      sc_view($!sc),
      $raw,
      |Gnumeric::Sheet::View.getTypePair
    );
  }

  method wbc ( :$raw = False ) {
    propReturnObject(
      sc_wbc($!sc),
      $raw,
      |Gnumeric::Workbook::Control.getTypePair
    );
  }

}
