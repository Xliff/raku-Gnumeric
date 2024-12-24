use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Pango::Raw::Definitions;
use Gnumeric::Raw::Definitions;
use Gnumeric::Raw::Enums;
use Gnumeric::Raw::Structs;

unit package Gnumeric::Raw::Sheet;

### /usr/src/gnumeric/src/sheet.h

sub sheet_apply_border (
  Sheet     $sheet,
  GnmRange  $range,
  GnmBorder $borders
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_apply_style (
  Sheet    $sheet,
  GnmRange $range,
  GnmStyle $style
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_apply_style_gi (
  Sheet    $sheet,
  GnmRange $range,
  GnmStyle $style
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_apply_style_undo (
  GnmSheetRange $sr,
  GnmStyle      $style
)
  returns GOUndo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_create (
  Sheet $sheet,
  gint  $col,
  gint  $row
)
  returns GnmCell
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_fetch (
  Sheet $sheet,
  gint  $col,
  gint  $row
)
  returns GnmCell
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_foreach (
  Sheet    $sheet,
  GHFunc   $callback,
  gpointer $data
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_get (
  Sheet $sheet,
  gint  $col,
  gint  $row
)
  returns GnmCell
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_get_value (
  Sheet $sheet,
  gint  $col,
  gint  $rowuse
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_positions (
  Sheet    $sheet,
  gboolean $comments
)
  returns GPtrArray
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_queue_respan (GnmCell $cell)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_remove (
  Sheet    $sheet,
  GnmCell  $cell,
  gboolean $redraw,
  gboolean $queue_recalc
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_set_expr (
  GnmCell    $cell,
  GnmExprTop $texpr
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_set_text (
  GnmCell       $cell,
  Str           $str,
  PangoAttrList $markup
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_set_text_gi (
  Sheet $sheet,
  gint  $col,
  gint  $row,
  Str   $str
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cell_set_value (
  GnmCell  $cell,
  GnmValue $v
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cells (
  Sheet    $sheet,
  GnmRange $r
)
  returns GPtrArray
  is      native(gnumeric)
  is      export
{ * }

sub sheet_cells_count (Sheet $sheet)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_clear_region (
  Sheet           $sheet,
  gint            $start_col,
  gint            $start_row,
  gint            $end_col,
  gint            $end_row,
  SheetClearFlags $clear_flags,
  GOCmdContext    $cc
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_clear_region_undo (
  GnmSheetRange $sr,
  gint          $clear_flags
)
  returns GOUndo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_fetch (
  Sheet $sheet,
  gint  $col
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_get (
  Sheet $sheet,
  gint  $col
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_get_default_size_pixels (Sheet $sheet)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_get_default_size_pts (Sheet $sheet)
  returns gdouble
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_get_distance_pixels (
  Sheet $sheet,
  gint  $from,
  gint  $to
)
  returns gint64
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_get_distance_pts (
  Sheet $sheet,
  gint  $from,
  gint  $to
)
  returns gdouble
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_get_info (
  Sheet $sheet,
  gint  $col
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_is_hidden (
  Sheet $sheet,
  gint  $col
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_set_default_size_pixels (
  Sheet $sheet,
  gint  $width_pixels
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_set_default_size_pts (
  Sheet   $sheet,
  gdouble $width_pts
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_set_size_pixels (
  Sheet    $sheet,
  gint     $col,
  gint     $width_pixels,
  gboolean $set_by_user
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_set_size_pts (
  Sheet    $sheet,
  gint     $col,
  gdouble  $width_pts,
  gboolean $set_by_user
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_col_size_fit_pixels (
  Sheet    $sheet,
  gint     $col,
  gint     $srow,
  gint     $erow,
  gboolean $ignore_strings
)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_can_group (
  Sheet    $sheet,
  GnmRange $r,
  gboolean $is_cols
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_copy_info (
  Sheet      $sheet,
  gint       $colrow,
  gboolean   $is_cols,
  ColRowInfo $cri
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_fetch (
  Sheet    $sheet,
  gint     $colrow,
  gboolean $is_cols
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_foreach (
  Sheet     $sheet,
  gboolean  $is_cols,
  gint      $first,
  gint      $last,
            &callback (GnmColRowIter, gpointer --> gboolean), #= ColRowHandler
  gpointer  $user_data
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_get (
  Sheet    $sheet,
  gint     $colrow,
  gboolean $is_cols
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_get_default (
  Sheet    $sheet,
  gboolean $is_cols
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_get_distance_pixels (
  Sheet    $sheet,
  gboolean $is_cols,
  gint     $from,
  gint     $to
)
  returns gint64
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_get_info (
  Sheet    $sheet,
  gint     $colrow,
  gboolean $is_cols
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_group_ungroup (
  Sheet    $sheet,
  GnmRange $r,
  gboolean $is_cols,
  gboolean $inc
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_gutter (
  Sheet    $sheet,
  gboolean $is_cols,
  gint     $max_outline
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_colrow_optimize (Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_date_conv (Sheet $sheet)
  returns GODateConventions
  is      native(gnumeric)
  is      export
{ * }

sub sheet_delete_cols (
  Sheet          $sheet,
  gint           $col,
  gint           $count,
  CArray[GOUndo] $pundo,
  GOCmdContext   $cc
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_delete_rows (
  Sheet          $sheet,
  gint           $row,
  gint           $count,
  CArray[GOUndo] $pundo,
  GOCmdContext   $cc
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_destroy_contents (Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_dup (Sheet $source_sheet)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub sheet_find_boundary_horizontal (
  Sheet    $sheet,
  gint     $col,
  gint     $move_row,
  gint     $base_row,
  gint     $count,
  gboolean $jump_to_boundaries
)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_find_boundary_vertical (
  Sheet    $sheet,
  gint     $move_col,
  gint     $row,
  gint     $base_col,
  gint     $count,
  gboolean $jump_to_boundaries
)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_flag_recompute_spans (Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_flag_status_update_cell (GnmCell $cell)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_flag_status_update_range (
  Sheet    $sheet,
  GnmRange $range
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_flag_style_update_range (
  Sheet    $sheet,
  GnmRange $range
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_foreach_cell_in_range (
  Sheet         $sheet,
  CellIterFlags $flags,
  GnmRange      $r,
  gpointer $callback, #= CellIterFunc
  gpointer      $closure
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub sheet_foreach_cell_in_region (
  Sheet         $sheet,
  CellIterFlags $flags,
  gint          $start_col,
  gint          $start_row,
  gint          $end_col,
  gint          $end_row,
  gpointer $callback, #= CellIterFunc
  gpointer      $closure
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub sheet_freeze_object_views (
  Sheet    $sheet,
  gboolean $qfreeze
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_get_cells_extent (Sheet $sheet)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub sheet_get_comment (
  Sheet      $sheet,
  GnmCellPos $pos
)
  returns GnmComment
  is      native(gnumeric)
  is      export
{ * }

sub sheet_get_conventions (Sheet $sheet)
  returns GnmConventions
  is      native(gnumeric)
  is      export
{ * }

sub sheet_get_extent (
  Sheet    $sheet,
  gboolean $spans_and_merges_extend,
  gboolean $include_hidden
)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub sheet_get_nominal_printarea (Sheet $sheet)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub sheet_get_printarea (
  Sheet    $sheet,
  gboolean $include_styles,
  gboolean $ignore_printarea
)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub sheet_get_view (
  Sheet        $sheet,
  WorkbookView $wbv
)
  returns SheetView
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_add_sort_setup (
  Sheet    $sheet,
  Str      $key,
  gpointer $setup
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_find_sort_setup (
  Sheet $sheet,
  Str   $key
)
  returns gconstpointer
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_foreach_name (
  Sheet    $sheet,
  GHFunc   $func,
  gpointer $data
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_get_size (Sheet $sheet)
  returns GnmSheetSize
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_get_size2 (
  Sheet    $sheet,
  Workbook $wb
)
  returns GnmSheetSize
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_get_sort_setups (Sheet $sheet)
  returns GHashTable
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_resize (
  Sheet        $sheet,
  gint         $cols,
  gint         $rows,
  GOCmdContext $cc,
  gboolean     $perr   is rw
)
  returns GOUndo
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_scenario_add (
  Sheet       $sheet,
  GnmScenario $sc
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_scenario_find (
  Sheet $sheet,
  Str   $name
)
  returns GnmScenario
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_scenario_new (
  Sheet $sheet,
  Str   $name
)
  returns GnmScenario
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_scenario_remove (
  Sheet       $sheet,
  GnmScenario $sc
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_set_solver_params (
  Sheet               $sheet,
  GnmSolverParameters $param
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_size_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_suggest_size (
  gint $cols is rw,
  gint $rows is rw
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_type_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_valid_size (
  gint $cols,
  gint $rows
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_visibility_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub sheet_insert_cols (
  Sheet          $sheet,
  gint           $col,
  gint           $count,
  CArray[GOUndo] $pundo,
  GOCmdContext   $cc
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_insert_rows (
  Sheet          $sheet,
  gint           $row,
  gint           $count,
  CArray[GOUndo] $pundo,
  GOCmdContext   $cc
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_is_cell_empty (
  Sheet $sheet,
  gint  $col,
  gint  $row
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_is_region_empty (
  Sheet    $sheet,
  GnmRange $r
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_mark_dirty (Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_move_range (
  GnmExprRelocateInfo $rinfo,
  CArray[GOUndo]      $pundo,
  GOCmdContext        $cc
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_new (
  Workbook $wb,
  Str      $name,
  gint     $columns,
  gint     $rows
)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub sheet_new_with_type (
  Workbook     $wb,
  Str          $name,
  GnmSheetType $type,
  gint         $columns,
  gint         $rows
)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub sheet_queue_redraw_range (
  Sheet    $sheet,
  GnmRange $range
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_queue_respan (
  Sheet $sheet,
  gint  $start_row,
  gint  $end_row
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_bounding_box (
  Sheet    $sheet,
  GnmRange $r
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_calc_spans (
  Sheet            $sheet,
  GnmRange         $r,
  GnmSpanCalcFlags $flags
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_contains_merges_or_arrays (
  Sheet        $sheet,
  GnmRange     $r,
  GOCmdContext $cc,
  Str          $cmd,
  gboolean     $merges,
  gboolean     $arrays
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_has_heading (
  Sheet    $sheet,
  GnmRange $src,
  gboolean $top,
  gboolean $ignore_styles
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_set_expr_undo (
  GnmSheetRange $sr,
  GnmExprTop    $texpr
)
  returns GOUndo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_set_markup_undo (
  GnmSheetRange $sr,
  PangoAttrList $markup
)
  returns GOUndo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_set_text (
  GnmParsePos $pos,
  GnmRange    $r,
  Str         $str
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_set_text_undo (
  GnmSheetRange $sr,
  Str           $text
)
  returns GOUndo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_splits_array (
  Sheet        $sheet,
  GnmRange     $r,
  GnmRange     $ignore,
  GOCmdContext $cc,
  Str          $cmd
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_splits_region (
  Sheet        $sheet,
  GnmRange     $r,
  GnmRange     $ignore,
  GOCmdContext $cc,
  Str          $cmd
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_trim (
  Sheet    $sheet,
  GnmRange $r,
  gboolean $cols,
  gboolean $rows
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_range_unrender (
  Sheet    $sheet,
  GnmRange $r
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_ranges_split_region (
  Sheet        $sheet,
  GSList       $ranges,
  GOCmdContext $cc,
  Str          $cmd
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_recompute_spans_for_col (
  Sheet $sheet,
  gint  $col
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_redraw_all (
  Sheet    $sheet,
  gboolean $header
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_redraw_range (
  Sheet    $sheet,
  GnmRange $range
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_redraw_region (
  Sheet $sheet,
  gint  $start_col,
  gint  $start_row,
  gint  $end_col,
  gint  $end_row
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_fetch (
  Sheet $sheet,
  gint  $row
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_get (
  Sheet $sheet,
  gint  $row
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_get_default_size_pixels (Sheet $sheet)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_get_default_size_pts (Sheet $sheet)
  returns gdouble
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_get_distance_pixels (
  Sheet $sheet,
  gint  $from,
  gint  $to
)
  returns gint64
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_get_distance_pts (
  Sheet $sheet,
  gint  $from,
  gint  $to
)
  returns gdouble
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_get_info (
  Sheet $sheet,
  gint  $row
)
  returns ColRowInfo
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_is_hidden (
  Sheet $sheet,
  gint  $row
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_set_default_size_pixels (
  Sheet $sheet,
  gint  $height_pixels
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_set_default_size_pts (
  Sheet   $sheet,
  gdouble $height_pts
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_set_size_pixels (
  Sheet    $sheet,
  gint     $row,
  gint     $height_pixels,
  gboolean $set_by_user
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_set_size_pts (
  Sheet    $sheet,
  gint     $row,
  gdouble  $height_pts,
  gboolean $set_by_user
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_row_size_fit_pixels (
  Sheet    $sheet,
  gint     $row,
  gint     $scol,
  gint     $ecol,
  gboolean $ignore_strings
)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub sheet_scrollbar_config (Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_selection_is_allowed (
  Sheet      $sheet,
  GnmCellPos $pos
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub sheet_set_outline_direction (
  Sheet    $sheet,
  gboolean $is_cols
)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_update (Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }

sub sheet_update_only_grid (Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }
