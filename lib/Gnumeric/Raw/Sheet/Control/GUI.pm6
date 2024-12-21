use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GDK::Raw::Structs;
use Gnumeric::Raw::Definitions;
use GTK::Raw::Definitions;
use GTK::Raw::Structs;
use Gnumeric::Raw::Enums;
use Gnumeric::Raw::Structs;

unit package Gnumeric::Sreadsheet::Sheet::Control::GUI;

### /usr/src/gnumeric/src/sheet-control-gui.h

sub sheet_control_gui_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub sheet_control_gui_new (
  SheetView $sv,
  WBCGtk    $wbcg
)
  returns SheetControlGUI
  is      native(gnumeric)
  is      export
{ * }

sub scg_colrow_distance_get (
  SheetControlGUI $scg,
  gboolean        $is_cols,
  gint            $from,
  gint            $to
)
  returns gint64
  is      native(gnumeric)
  is      export
{ * }

sub scg_colrow_select (
  SheetControlGUI $scg,
  gboolean        $is_cols,
  gint            $index,
  gint            $modifiers
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub scg_colrow_size_set (
  SheetControlGUI $scg,
  gboolean        $is_cols,
  gint            $index,
  gint            $new_size_pixels
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_comment_display (
  SheetControlGUI $scg,
  GnmComment      $cc,
  gint            $x,
  gint            $y
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_comment_select (
  SheetControlGUI $scg,
  GnmComment      $cc,
  gint            $x,
  gint            $y
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_comment_unselect (
  SheetControlGUI $scg,
  GnmComment      $cc
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_context_menu (
  SheetControlGUI $scg,
  GdkEvent        $event,
  gboolean        $is_col,
  gboolean        $is_row
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_cursor_extend (
  SheetControlGUI $scg,
  gint            $n,
  gboolean        $jump_to_bound,
  gboolean        $horiz
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_cursor_move (
  SheetControlGUI $scg,
  gint            $dir,
  gboolean        $jump_to_bound,
  gboolean        $horiz
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_cursor_visible (
  SheetControlGUI $scg,
  gboolean        $is_visible
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_delete_sheet_if_possible (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_drag_data_get (
  SheetControlGUI  $scg,
  GtkSelectionData $selection_data
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_drag_data_received (
  SheetControlGUI  $scg,
  GtkWidget        $source_widget,
  gdouble          $x,
  gdouble          $y,
  GtkSelectionData $selection_data
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_edit_start (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_edit_stop (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_make_cell_visible (
  SheetControlGUI $scg,
  gint            $col,
  gint            $row,
  gboolean        $force_scroll,
  gboolean        $couple_panes
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_object_anchor_to_coords (
  SheetControlGUI   $scg,
  SheetObjectAnchor $anchor,
  gdouble           $coords is rw
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_object_coords_to_anchor (
  SheetControlGUI   $scg,
  gdouble           $coords is rw,
  SheetObjectAnchor $in_out
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_object_select (
  SheetControlGUI $scg,
  SheetObject     $so
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_object_select_next (
  SheetControlGUI $scg,
  gboolean        $reverse
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_object_unselect (
  SheetControlGUI $scg,
  SheetObject     $so
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_objects_drag (
  SheetControlGUI $scg,
  GnmPane         $gcanvas,
  SheetObject     $primary,
  gdouble         $dx             is rw,
  gdouble         $dy             is rw,
  gint            $drag_type,
  gboolean        $symmetric,
  gboolean        $snap_to_grid,
  gboolean        $is_mouse_move
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_objects_drag_commit (
  SheetControlGUI $scg,
  gint            $drag_type,
  gboolean        $created_objects,
  CArray[GOUndo]  $pundo,
  CArray[GOUndo]  $predo,
  CArray[Str]     $undo_title
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_objects_nudge (
  SheetControlGUI $scg,
  GnmPane         $gcanvas,
  gint            $drag_type,
  gdouble         $dx,
  gdouble         $dy,
  gboolean        $symmetric,
  gboolean        $snap_to_grid
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_pane (
  SheetControlGUI $scg,
  gint            $pane
)
  returns GnmPane
  is      native(gnumeric)
  is      export
{ * }

sub scg_paste_image (
  SheetControlGUI $scg,
  GnmRange        $where,
  guint8          $data   is rw
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_queue_movement (
  SheetControlGUI $scg,
                  &handler (SheetControlGUI, int, gboolean, gboolean), # SCGUIMoveFunc
  gint            $n,
  gboolean        $jump,
  gboolean        $horiz
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_rangesel_bound (
  SheetControlGUI $scg,
  gint            $base_col,
  gint            $base_row,
  gint            $move_col,
  gint            $move_row
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_rangesel_extend (
  SheetControlGUI $scg,
  gint            $n,
  gboolean        $jump_to_bound,
  gboolean        $horiz
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_rangesel_extend_to (
  SheetControlGUI $scg,
  gint            $col,
  gint            $row
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_rangesel_move (
  SheetControlGUI $scg,
  gint            $dir,
  gboolean        $jump_to_bound,
  gboolean        $horiz
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_rangesel_start (
  SheetControlGUI $scg,
  gint            $base_col,
  gint            $base_row,
  gint            $move_col,
  gint            $move_row
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_rangesel_stop (
  SheetControlGUI $scg,
  gboolean        $clear_str
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_reload_item_edits (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_select_all (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_set_display_cursor (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_set_left_col (
  SheetControlGUI $scg,
  gint            $new_first_col
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_set_top_row (
  SheetControlGUI $scg,
  gint            $new_first_row
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_sheet (SheetControlGUI $scg)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub scg_size_guide_motion (
  SheetControlGUI $scg,
  gboolean        $vert,
  gint64          $guide_pos
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_size_guide_start (
  SheetControlGUI $scg,
  gboolean        $vert,
  gint            $colrow,
  gboolean        $is_colrow_resize
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_size_guide_stop (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_special_cursor_bound_set (
  SheetControlGUI $scg,
  GnmRange        $r
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub scg_special_cursor_start (
  SheetControlGUI $scg,
  gint            $style,
  gint            $button
)
  is      native(gnumeric)
  is      export
{ * }

sub scg_special_cursor_stop (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_take_focus (SheetControlGUI $scg)
  is      native(gnumeric)
  is      export
{ * }

sub scg_view (SheetControlGUI $scg)
  returns SheetView
  is      native(gnumeric)
  is      export
{ * }

sub scg_wbc (SheetControlGUI $scg)
  returns WorkbookControl
  is      native(gnumeric)
  is      export
{ * }

sub scg_wbcg (SheetControlGUI $scg)
  returns WBCGtk
  is      native(gnumeric)
  is      export
{ * }
