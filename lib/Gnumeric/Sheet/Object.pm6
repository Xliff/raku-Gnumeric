use v6.c;

use NativeCall;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Sheet::Object;

use GTK::TargetList:ver<3.0.1146>;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Gnumeric::Sheet::Object {
  also does GLib::Roles::Object;

  has SheetObject $!so is implementor;

  method adjust_stacking (Int() $positions) {
    my gint $p = $positions;

    sheet_object_adjust_stacking($!so, $p);
  }

  proto method build_menu (|)
  { * }

  multi method build_menu (GPtrArray() $actions) {
    samewith($);
  }
  multi method build_menu (GPtrArray() $actions, $i is rw) {
    my gint $ii = 0;

    sheet_object_build_menu($!so, $actions, $ii);
    $i = $ii;
  }

  method can_edit {
    so sheet_object_can_edit($!so);
  }

  method can_print {
    so sheet_object_can_print($!so);
  }

  method can_resize {
    so sheet_object_can_resize($!so);
  }

  method clear_sheet {
    so sheet_object_clear_sheet($!so);
  }

  proto method default_size (|c)
  { * }

  multi method default_size {
    samewith($, $);
  }
  multi method default_size ($w is rw, $h is rw) {
    my gdouble ($ww, $hh) = 0e0 xx 2;

    sheet_object_default_size($!so, $ww, $hh);
    ($w, $h) = ($ww, $hh);
  }

  proto method direction_set (|)
  { * }

  multi method direction_set (@coords) {
    X::GLib::InvalidSize.new(
      message => '@coords must be a gdouble-compatible array of size 4!'
    ).throw;

    samewith( newCArray(@coords) );
  }
  multi method direction_set (CArray[gdouble] $coords) {
    sheet_object_direction_set($!so, $coords);
  }

  method draw_cairo (cairo_t() $cr, Int() $rtl) {
    my gboolean $r = $rtl.so.Int;

    sheet_object_draw_cairo($!so, $cr, $r);
  }

  method draw_cairo_sized (
    cairo_t() $cr,
    Num()     $width,
    Num()     $height
  ) {
    my gdouble ($w, $h) = ($width, $height);

    sheet_object_draw_cairo_sized($!so, $cr, $width, $height);
  }

  method dup ( :$raw = False ) {
    propReturnObject( sheet_object_dup($!so), $raw, |self.getTypePair );
  }

  method exportable_get_target_list {
    sheet_object_exportable_get_target_list($!so);
  }

  method exportable_get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name ~ '::Exportable',
      &sheet_object_exportable_get_type,
      $n,
      $t
    );
  }

  method foreach_dep (&func, gpointer $user = gpointer) {
    sheet_object_foreach_dep($!so, &func, $user);
  }

  method get_anchor ( :$raw = False ) {
    propReturnObject(
      sheet_object_get_anchor($!so),
      $raw,
      |Gnumeric::Sheet::Object::Anchor.getTypePair
    );
  }

  method get_editor (SheetControl() $sc) {
    sheet_object_get_editor($!so, $sc);
  }

  method get_print_flag {
    sheet_object_get_print_flag($!so);
  }

  method get_range ( :$raw = False ) {
    propReturnObject(
      sheet_object_get_range($!so),
      $raw,
      |Gnumeric::Range.getTypePair
    );
  }

  method get_sheet ( :$raw = False ) {
    propReturnObject(
      sheet_object_get_sheet($!so),
      $raw,
      |Gnumeric::Sheet.getTypePair
    );
  }

  method get_stacking {
    sheet_object_get_stacking($!so);
  }

  method get_target_list ( :$raw = False ) {
    propReturnObject(
      sheet_object_get_target_list($!so),
      $raw,
      |GTK::TargetList.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &sheet_object_get_type, $n, $t );
  }

  method get_view (SheetObjectViewContainer() $container) {
    sheet_object_get_view($!so, $container);
  }

  # cw: Move to ::Enums!
  method gnm_anchor_mode_get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &gnm_sheet_object_anchor_mode_get_type,
      $n,
      $t
    );
  }

  # Move to ::Enums
  method imageable_get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &sheet_object_imageable_get_type,
      $n,
      $t
    )
  }

  method invalidate_sheet (Sheet() $sheet) {
    sheet_object_invalidate_sheet($!so, $sheet);
  }

  method move_do (
    GSList()  $objects,
    GSList()  $anchors,
    Int()     $objects_created,
             :$raw              = False
  )
    is static
  {
    my gboolean $o = $objects_created.so.Int;

    propReturnObject(
      sheet_object_move_do($objects, $anchors, $o),
      $raw,
      |GOffice::Undo.getTypePair
    );
  }

  method move_undo (
    GSList()  $objects,
    Int()     $objects_created,
             :$raw              = False
  )
    is static
  {
    my gboolean $o = $objects_created.so.Int;

    propReturnObject(
      sheet_object_move_undo($objects, $o),
      $raw,
      |GOffice::Undo.getTypePair
    );
  }

  method new_view (SheetObjectViewContainer() $container, :$raw = False) {
    propReturnObject(
      sheet_object_new_view($!so, $container),
      $raw,
      |Sheet::Object::View.getTypePair
    )
  }

  method populate_menu (GPtrArray() $actions) {
    sheet_object_populate_menu($!so, $actions);
  }

  proto method position_pts_get (|)
  { * }

  multi method position_pts_get {
    samewith( newCArray(gdouble, sized => 4) );
  }
  multi method position_pts_get (CArray[gdouble] $coords) {
    sheet_object_position_pts_get($!so, $coords);
    CArrayToArray($coords, size => 4);
  }

  proto method pts_to_anchor (|)
  { * }

  multi method pts_to_anchor (
    SheetObjectAnchor() $anchor,
    Sheet()             $sheet,
  ) {
    samewith( $anchor, $sheet, newCArray(gdouble, sized => 4) );
  }
  multi method pts_to_anchor (
    SheetObjectAnchor() $anchor,
    Sheet()             $sheet,
    CArray[gdouble]     $res_pts
  ) {
    sheet_object_pts_to_anchor($!so, $sheet, $res_pts);
    CArrayToArray($res_pts, size => 4);
  }

  method rubber_band_directly {
    sheet_object_rubber_band_directly($!so);
  }

  method save_as_image (
    Str()                   $format,
    Num()                   $resolution,
    Str()                   $url,
    CArray[Pointer[GError]] $err         = gerror
  ) {
    my gdouble $r = $resolution;

    clear_error;
    sheet_object_save_as_image($!so, $format, $r, $url, $err);
    set_error($err);
  }

  method set_anchor (SheetObjectAnchor() $anchor) {
    sheet_object_set_anchor($!so, $anchor);
  }

  method set_anchor_mode (Int() $mode) {
    my GnmSOAnchorMode $m = $mode;

    sheet_object_set_anchor_mode($!so, $m);
  }

  method set_name (Str() $name) {
    sheet_object_set_name($!so, $name);
  }

  method set_print_flag (Int() $print) {
    my gboolean $p = $print.so.Int;

    sheet_object_set_print_flag($!so, $p);
  }

  method set_sheet (Sheet() $sheet) {
    sheet_object_set_sheet($!so, $sheet);
  }

  method update_bounds (GnmCellPos() $p) {
    sheet_object_update_bounds($!so, $p);
  }

  method write_image (
    Str()                   $format,
    Num()                   $resolution,
    GsfOutput()             $output,
    CArray[Pointer[GError]] $err          = gerror
  ) {
    my gdouble $r = $resolution;

    sheet_object_write_image($!so, $format, $r, $output, $err);
  }

  proto method write_object (|)
  { * }

  multi method write_object (
    Str()                     $format,
    GsfOutput()               $output,
    GnmConventions()          $convs,
    CArray[Pointer[GError]]   $err     = gerror
  ) {
    samewith($format, $output, $err, $convs);
  }
  multi method write_object (
    Str()                     $format,
    GsfOutput()               $output,
    CArray[Pointer[GError]]   $err,
    GnmConventions()          $convs
  ) {
    clear_error;
    sheet_object_write_object($!so, $format, $output, $err, $convs);
    set_error($err);
  }

}

class Gnumeric::Sheet::Objects {
  also does GLib::Roles::StaticClass;

  method clear (
    Sheet()        $sheet,
    GnmRange()     $r,
    Int()          $type,
    CArray[GOUndo] $pundo = CArray[GOUndo]
  ) {
    my GType $t = $type;

    sheet_objects_clear($sheet, $r, $t, $pundo);
  }

  method dup (
    Sheet()    $src,
    Sheet()    $dst,
    GnmRange() $range
  )
    is static
  {
    sheet_objects_dup($src, $dst, $range);
  }

  method get (
    Sheet    $sheet,
    GnmRange $r,
    GType    $t
  ) {
    sheet_objects_get($sheet, $r, $t);
  }

  method init {
    sheet_objects_init;
  }

  method relocate (
    GnmExprRelocateInfo $rinfo,
    gboolean            $update,
    CArray[GOUndo]      $pundo
  ) {
    sheet_objects_relocate($rinfo, $update, $pundo);
  }

  method shutdown {
    sheet_objects_shutdown;
  }
}

class Gnumeric::Sheet::Object::Anchor {
  also does GLib::Roles::Object;

  has SheetObjectAnchor $!soa is implementor;

  method dup ( :$raw = False ) {
    propReturnObject(
      sheet_object_anchor_dup($!soa),
      $raw,
      |self.getTypePair
    );
  }

  multi method init (GnmRange() $r, Int() $direction, Int() $mode) {
    samewith($r, $, $direction, $mode);
  }
  multi method init (
    GnmRange() $r,
               $offsets     is rw,
    Int()      $direction,
    Int()      $mode
  ) {
    my gdouble            $o = newCArray(gdouble);
    my GODrawingAnchorDir $d = $direction;
    my GnmSOAnchorMode    $m = $mode;

    sheet_object_anchor_init($!soa, $r, $o, $d, $m);
    CArrayToArray($offsets = $o);
  }

  proto method to_offset_pts (|)
  { * }

  multi method to_offset_pts (Sheet() $sheet) {
    samewith($sheet, $);
  }
  multi method to_offset_pts (Sheet() $sheet, $res_pts is rw) {
    my gdouble $r = newCArray(gdouble);

    sheet_object_anchor_to_offset_pts($!soa, $sheet, $r);
    CArrayToArray($res_pts = $r);
  }

  proto method to_pts (|)
  { * }

  multi method to_pts (Sheet() $sheet) {
    samewith($);
  }
  multi method to_pts (Sheet() $sheet, $res_pts is rw) {
    my gdouble $r = newCArray(gdouble);

    sheet_object_anchor_to_pts($!soa, $sheet, $res_pts);
    CArrayToArray($res_pts = $r);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &sheet_object_anchor_get_type, $n, $t );
  }

}
