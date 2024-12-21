use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Gnumeric::Raw::Definitions;
use Gnumeric::Raw::Structs;

unit package Gnumeric::Raw::Sheet::Control;

### /usr/src/gnumeric/src/sheet-control.h

sub sheet_control_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub sc_ant (SheetControl $sc)
  is      native(gnumeric)
  is      export
{ * }

sub sc_cursor_bound (
  SheetControl $sc,
  GnmRange     $r
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_freeze_object_view (
  SheetControl $sc,
  gboolean     $freeze
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_make_cell_visible (
  SheetControl $sc,
  gint         $col,
  gint         $row,
  gboolean     $couple_panes
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_mode_edit (SheetControl $sc)
  is      native(gnumeric)
  is      export
{ * }

sub sc_object_create_view (
  SheetControl $sc,
  SheetObject  $so
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_recompute_visible_region (
  SheetControl $sc,
  gboolean     $full_recompute
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_redraw_all (
  SheetControl $sc,
  gboolean     $headers
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_redraw_headers (
  SheetControl $sc,
  gboolean     $col,
  gboolean     $row,
  GnmRange     $r
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_redraw_range (
  SheetControl $sc,
  GnmRange     $r
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_resize (
  SheetControl $sc,
  gboolean     $force_scroll
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_scale_changed (SheetControl $sc)
  is      native(gnumeric)
  is      export
{ * }

sub sc_scrollbar_config (SheetControl $sc)
  is      native(gnumeric)
  is      export
{ * }

sub sc_set_panes (SheetControl $sc)
  is      native(gnumeric)
  is      export
{ * }

sub sc_set_top_left (
  SheetControl $sc,
  gint         $col,
  gint         $row
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_sheet (SheetControl $sc)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub sc_show_im_tooltip (
  SheetControl $sc,
  GnmInputMsg  $im,
  GnmCellPos   $pos
)
  is      native(gnumeric)
  is      export
{ * }

sub sc_unant (SheetControl $sc)
  is      native(gnumeric)
  is      export
{ * }

sub sc_view (SheetControl $sc)
  returns SheetView
  is      native(gnumeric)
  is      export
{ * }

sub sc_wbc (SheetControl $sc)
  returns WorkbookControl
  is      native(gnumeric)
  is      export
{ * }
