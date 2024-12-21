use v6.c;

use NativeCall;

use Cairo;
use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Pango::Raw::Definitions;
use GTK::Raw::Definitions;
use Gnumeric::Raw::Definitions;
use Gnumeric::Raw::Enums;
use Gnumeric::Raw::Structs;

unit package Gnumeric::Raw::Object;

### /usr/src/gnumeric/src/sheet-object.h

sub sheet_object_adjust_stacking (
  SheetObject $so,
  gint        $positions
)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_anchor_dup (SheetObjectAnchor $src)
  returns SheetObjectAnchor
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_anchor_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_anchor_init (
  SheetObjectAnchor  $anchor,
  GnmRange           $r,
  CArray[gdouble]    $offsets,
  GODrawingAnchorDir $direction,
  GnmSOAnchorMode    $mode
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_anchor_to_offset_pts (
  SheetObjectAnchor $anchor,
  Sheet             $sheet,
  CArray[gdouble]   $res_pts
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_anchor_to_pts (
  SheetObjectAnchor $anchor,
  Sheet             $sheet,
  CArray[gdouble]   $res_pts
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_build_menu (
  SheetObjectView $view,
  GPtrArray       $actions,
  gint            $i is rw
)
  returns GtkWidget
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_can_edit (SheetObject $so)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_can_print (SheetObject $so)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_can_resize (SheetObject $so)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_clear_sheet (SheetObject $so)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_default_size (
  SheetObject $so,
  gdouble     $w is rw,
  gdouble     $h is rw
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_direction_set (
  SheetObject     $so,
  CArray[gdouble] $coords
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_draw_cairo (
  SheetObject $so,
  cairo_t     $cr,
  gboolean    $rtl
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_draw_cairo_sized (
  SheetObject $so,
  cairo_t     $cr,
  gdouble     $width,
  gdouble     $height
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_dup (SheetObject $so)
  returns SheetObject
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_exportable_get_target_list (SheetObject $so)
  returns GtkTargetList
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_exportable_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_foreach_dep (
  SheetObject $so,
              &func (GnmDependent, SheetObject, gpointer),
  gpointer    $user
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_anchor (SheetObject $so)
  returns SheetObjectAnchor
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_editor (SheetObject $so, SheetControl $sc)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_print_flag (SheetObject $so)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_range (SheetObject $so)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_sheet (SheetObject $so)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_stacking (SheetObject $so)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_target_list (SheetObject $so)
  returns GtkTargetList
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_get_view (
  SheetObject              $so,
  SheetObjectViewContainer $container
)
  returns SheetObjectView
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_object_anchor_mode_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_imageable_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_invalidate_sheet (
  SheetObject $so,
  Sheet       $sheet
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_move_do (
  GSList   $objects,
  GSList   $anchors,
  gboolean $objects_created
)
  returns GOUndo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_move_undo (
  GSList   $objects,
  gboolean $objects_created
)
  returns GOUndo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_new_view (
  SheetObject              $so,
  SheetObjectViewContainer $container
)
  returns SheetObjectView
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_populate_menu (
  SheetObject $so,
  GPtrArray   $actions
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_position_pts_get (
  SheetObject $so,
  gdouble     $coords is rw
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_pts_to_anchor (
  SheetObjectAnchor $anchor,
  Sheet             $sheet,
  gdouble           $res_pts is rw
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_rubber_band_directly (SheetObject $so)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_save_as_image (
  SheetObject             $so,
  Str                     $format,
  gdouble                 $resolution,
  Str                     $url,
  CArray[Pointer[GError]] $err
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_set_anchor (
  SheetObject       $so,
  SheetObjectAnchor $anchor
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_set_anchor_mode (
  SheetObject     $so,
  GnmSOAnchorMode $mode
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_set_name (
  SheetObject $so,
  Str         $name
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_set_print_flag (
  SheetObject $so,
  gboolean    $print
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_set_sheet (
  SheetObject $so,
  Sheet       $sheet
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_objects_clear (
  Sheet          $sheet,
  GnmRange       $r,
  GType          $t,
  CArray[GOUndo] $pundo
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_objects_dup (
  Sheet    $src,
  Sheet    $dst,
  GnmRange $range
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_objects_get (
  Sheet    $sheet,
  GnmRange $r,
  GType    $t
)
  returns GSList
  is      native(gnumeric)
  is      export
{ * }

sub sheet_objects_init
  is      native(gnumeric)
  is      export
{ * }

sub sheet_objects_relocate (
  GnmExprRelocateInfo $rinfo,
  gboolean            $update,
  CArray[GOUndo]      $pundo
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_objects_shutdown
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_update_bounds (
  SheetObject $so,
  GnmCellPos  $p
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_write_image (
  SheetObject             $so,
  Str                     $format,
  gdouble                 $resolution,
  GsfOutput               $output,
  CArray[Pointer[GError]] $err
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_object_write_object (
  SheetObject             $so,
  Str                     $format,
  GsfOutput               $output,
  CArray[Pointer[GError]] $err,
  GnmConventions          $convs
)
  is      native(gnumeric)
  is      export
{ * }
