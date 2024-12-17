use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Sheet::Raw::Definitions;

unit package Gnumeric::Spreadsheet::Sheet::View;

### /usr/src/gnumeric/src/sheet-view.h

sub gnm_sheet_view_ant (
  SheetView $sv,
  GList     $ranges
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_attach_control (
  SheetView    $sv,
  SheetControl $sc
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_cursor_set (
  SheetView  $sv,
  GnmCellPos $edit,
  gint       $base_col,
  gint       $base_row,
  gint       $move_col,
  gint       $move_row,
  GnmRange   $bound
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_detach_control (
  SheetView    $sv,
  SheetControl $sc
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_dispose (SheetView $sv)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_editpos_in_filter (SheetView $sv)
  returns GnmFilter
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_editpos_in_slicer (SheetView $sv)
  returns GnmSheetSlicer
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_flag_selection_change (SheetView $sv)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_flag_status_update_pos (
  SheetView  $sv,
  GnmCellPos $pos
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_flag_status_update_range (
  SheetView $sv,
  GnmRange  $range
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_flag_style_update_range (
  SheetView $sv,
  GnmRange  $range
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_freeze_panes (
  SheetView  $sv,
  GnmCellPos $frozen_top_left,
  GnmCellPos $unfrozen_top_left
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_get_type
  returns GType
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_is_frozen (SheetView $sv)
  returns uint32
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_make_cell_visible (
  SheetView $sv,
  gint      $col,
  gint      $row,
  gboolean  $couple_panes
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_new (
  Sheet        $sheet,
  WorkbookView $wbv
)
  returns SheetView
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_panes_insdel_colrow (
  SheetView $sv,
  gboolean  $is_cols,
  gboolean  $is_insert,
  gint      $start,
  gint      $count
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_redraw_headers (
  SheetView $sheet,
  gboolean  $col,
  gboolean  $row,
  GnmRange  $r
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_redraw_range (
  SheetView $sv,
  GnmRange  $r
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_resize (
  SheetView $sv,
  gboolean  $force_scroll
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_selection_copy (
  SheetView       $sv,
  WorkbookControl $wbc
)
  returns uint32
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_selection_cut (
  SheetView       $sv,
  WorkbookControl $wbc
)
  returns uint32
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_selection_extends_filter (
  SheetView $sv,
  GnmFilter $f
)
  returns GnmRange
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_selection_intersects_filter_rows (SheetView $sv)
  returns GnmFilter
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_set_edit_pos (
  SheetView  $sv,
  GnmCellPos $pos
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_set_initial_top_left (
  SheetView $sv,
  gint      $col,
  gint      $row
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_unant (SheetView $sv)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_update (SheetView $sv)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_weak_ref (
  SheetView         $sv,
  CArray[SheetView] $ptr
)
  is      native(panel)
  is      export
{ * }

sub gnm_sheet_view_weak_unref (CArray[SheetView] $ptr)
  is      native(panel)
  is      export
{ * }

sub sv_sheet (SheetView $sv)
  returns Sheet
  is      native(panel)
  is      export
{ * }

sub sv_wbv (SheetView $sv)
  returns WorkbookView
  is      native(panel)
  is      export
{ * }
