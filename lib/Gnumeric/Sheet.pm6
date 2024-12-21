use v6.c;

use NativeCall;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Sheet;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Gnumeric::Sheet {
  also does GLib::Roles::Object;

  has Sheet $!gs is implementor;

  method new (
    Workbook $wb,
    Str      $name,
    gint     $columns,
    gint     $rows
  ) {
    sheet_new($wb, $name, $columns, $rows);
  }

  method new_with_type (
    Workbook     $wb,
    Str          $name,
    GnmSheetType $type,
    gint         $columns,
    gint         $rows
  ) {
    sheet_new_with_type($wb, $name, $type, $columns, $rows);
  }

  method apply_border (
    Sheet     $sheet,
    GnmRange  $range,
    GnmBorder $borders
  ) {
    sheet_apply_border($!gs, $range, $borders);
  }

  method apply_style (
    Sheet    $sheet,
    GnmRange $range,
    GnmStyle $style
  ) {
    sheet_apply_style($!gs, $range, $style);
  }

  method apply_style_gi (
    Sheet    $sheet,
    GnmRange $range,
    GnmStyle $style
  ) {
    sheet_apply_style_gi($!gs, $range, $style);
  }

  method apply_style_undo (
    GnmSheetRange $sr,
    GnmStyle      $style
  )
    is static
  {
    sheet_apply_style_undo($sr, $style);
  }

  method cell_create (
    Sheet $sheet,
    gint  $col,
    gint  $row
  ) {
    sheet_cell_create($!gs, $col, $row);
  }

  method cell_fetch (
    Sheet $sheet,
    gint  $col,
    gint  $row
  ) {
    sheet_cell_fetch($!gs, $col, $row);
  }

  method cell_foreach (
    Sheet    $sheet,
    GHFunc   $callback,
    gpointer $data
  ) {
    sheet_cell_foreach($!gs, $callback, $data);
  }

  method cell_get (
    Sheet $sheet,
    gint  $col,
    gint  $row
  ) {
    sheet_cell_get($!gs, $col, $row);
  }

  method cell_get_value (
    Sheet $sheet,
    gint  $col,
    gint  $row
  ) {
    sheet_cell_get_value($!gs, $col, $row);
  }

  method cell_positions (
    Sheet    $sheet,
    gboolean $comments
  ) {
    sheet_cell_positions($!gs, $comments);
  }

  method cell_queue_respan (GnmCell() $c) is static {
    sheet_cell_queue_respan($c);
  }

  method cell_remove (
    Sheet    $sheet,
    GnmCell  $cell,
    gboolean $redraw,
    gboolean $queue_recalc
  ) {
    sheet_cell_remove($!gs, $cell, $redraw, $queue_recalc);
  }

  method cell_set_expr (
    GnmCell    $cell,
    GnmExprTop $texpr
  )
    is static
  {
    sheet_cell_set_expr($cell, $texpr);
  }

  method cell_set_text (
    GnmCell       $cell,
    Str           $str,
    PangoAttrList $markup
  ) {
    sheet_cell_set_text($cell, $str, $markup);
  }

  method cell_set_text_gi (
    Sheet $sheet,
    gint  $col,
    gint  $row,
    Str   $str
  ) {
    sheet_cell_set_text_gi($!gs, $col, $row, $str);
  }

  method cell_set_value (
    GnmCell  $cell,
    GnmValue $v
  ) {
    sheet_cell_set_value($cell, $v);
  }

  method cells (
    Sheet    $sheet,
    GnmRange $r
  ) {
    sheet_cells($!gs, $r);
  }

  method cells_count {
    sheet_cells_count($!gs);
  }

  method clear_region (
    Sheet           $sheet,
    gint            $start_col,
    gint            $start_row,
    gint            $end_col,
    gint            $end_row,
    SheetClearFlags $clear_flags,
    GOCmdContext    $cc
  ) {
    sheet_clear_region($!gs, $start_col, $start_row, $end_col, $end_row, $clear_flags, $cc);
  }

  method clear_region_undo (
    GnmSheetRange $sr,
    gint          $clear_flags
  )
    is static
  {
    sheet_clear_region_undo($sr, $clear_flags);
  }

  method col_fetch (
    Sheet $sheet,
    gint  $col
  ) {
    sheet_col_fetch($!gs, $col);
  }

  method col_get (
    Sheet $sheet,
    gint  $col
  ) {
    sheet_col_get($!gs, $col);
  }

  method col_get_default_size_pixels {
    sheet_col_get_default_size_pixels($!gs);
  }

  method col_get_default_size_pts {
    sheet_col_get_default_size_pts($!gs);
  }

  method col_get_distance_pixels (
    Sheet $sheet,
    gint  $from,
    gint  $to
  ) {
    sheet_col_get_distance_pixels($!gs, $from, $to);
  }

  method col_get_distance_pts (
    Sheet $sheet,
    gint  $from,
    gint  $to
  ) {
    sheet_col_get_distance_pts($!gs, $from, $to);
  }

  method col_get_info (
    Sheet $sheet,
    gint  $col
  ) {
    sheet_col_get_info($!gs, $col);
  }

  method col_is_hidden (
    Sheet $sheet,
    gint  $col
  ) {
    sheet_col_is_hidden($!gs, $col);
  }

  method col_set_default_size_pixels (
    Sheet $sheet,
    gint  $width_pixels
  ) {
    sheet_col_set_default_size_pixels($!gs, $width_pixels);
  }

  method col_set_default_size_pts (
    Sheet   $sheet,
    gdouble $width_pts
  ) {
    sheet_col_set_default_size_pts($!gs, $width_pts);
  }

  method col_set_size_pixels (
    Sheet    $sheet,
    gint     $col,
    gint     $width_pixels,
    gboolean $set_by_user
  ) {
    sheet_col_set_size_pixels($!gs, $col, $width_pixels, $set_by_user);
  }

  method col_set_size_pts (
    Sheet    $sheet,
    gint     $col,
    gdouble  $width_pts,
    gboolean $set_by_user
  ) {
    sheet_col_set_size_pts($!gs, $col, $width_pts, $set_by_user);
  }

  method col_size_fit_pixels (
    Sheet    $sheet,
    gint     $col,
    gint     $srow,
    gint     $erow,
    gboolean $ignore_strings
  ) {
    sheet_col_size_fit_pixels($!gs, $col, $srow, $erow, $ignore_strings);
  }

  method colrow_can_group (
    Sheet    $sheet,
    GnmRange $r,
    gboolean $is_cols
  ) {
    sheet_colrow_can_group($!gs, $r, $is_cols);
  }

  method colrow_copy_info (
    Sheet      $sheet,
    gint       $colrow,
    gboolean   $is_cols,
    ColRowInfo $cri
  ) {
    sheet_colrow_copy_info($!gs, $colrow, $is_cols, $cri);
  }

  method colrow_fetch (
    Sheet    $sheet,
    gint     $colrow,
    gboolean $is_cols
  ) {
    sheet_colrow_fetch($!gs, $colrow, $is_cols);
  }

  method colrow_foreach (
    Sheet         $sheet,
    gboolean      $is_cols,
    gint          $first,
    gint          $last,
    gpointer $callback, #= ColRowHandler
    gpointer      $user_data
  ) {
    sheet_colrow_foreach($!gs, $is_cols, $first, $last, $callback, $user_data);
  }

  method colrow_get (
    Sheet    $sheet,
    gint     $colrow,
    gboolean $is_cols
  ) {
    sheet_colrow_get($!gs, $colrow, $is_cols);
  }

  method colrow_get_default (
    Sheet    $sheet,
    gboolean $is_cols
  ) {
    sheet_colrow_get_default($!gs, $is_cols);
  }

  method colrow_get_distance_pixels (
    Sheet    $sheet,
    gboolean $is_cols,
    gint     $from,
    gint     $to
  ) {
    sheet_colrow_get_distance_pixels($!gs, $is_cols, $from, $to);
  }

  method colrow_get_info (
    Sheet    $sheet,
    gint     $colrow,
    gboolean $is_cols
  ) {
    sheet_colrow_get_info($!gs, $colrow, $is_cols);
  }

  method colrow_group_ungroup (
    Sheet    $sheet,
    GnmRange $r,
    gboolean $is_cols,
    gboolean $inc
  ) {
    sheet_colrow_group_ungroup($!gs, $r, $is_cols, $inc);
  }

  method colrow_gutter (
    Sheet    $sheet,
    gboolean $is_cols,
    gint     $max_outline
  ) {
    sheet_colrow_gutter($!gs, $is_cols, $max_outline);
  }

  method colrow_optimize {
    sheet_colrow_optimize($!gs);
  }

  method date_conv {
    sheet_date_conv($!gs);
  }

  method delete_cols (
    Sheet          $sheet,
    gint           $col,
    gint           $count,
    CArray[GOUndo] $pundo,
    GOCmdContext   $cc
  ) {
    sheet_delete_cols($!gs, $col, $count, $pundo, $cc);
  }

  method delete_rows (
    Sheet          $sheet,
    gint           $row,
    gint           $count,
    CArray[GOUndo] $pundo,
    GOCmdContext   $cc
  ) {
    sheet_delete_rows($!gs, $row, $count, $pundo, $cc);
  }

  method destroy_contents {
    sheet_destroy_contents($!gs);
  }

  method dup {
    sheet_dup($!gs);
  }

  method find_boundary_horizontal (
    Sheet    $sheet,
    gint     $col,
    gint     $move_row,
    gint     $base_row,
    gint     $count,
    gboolean $jump_to_boundaries
  ) {
    sheet_find_boundary_horizontal($!gs, $col, $move_row, $base_row, $count, $jump_to_boundaries);
  }

  method find_boundary_vertical (
    Sheet    $sheet,
    gint     $move_col,
    gint     $row,
    gint     $base_col,
    gint     $count,
    gboolean $jump_to_boundaries
  ) {
    sheet_find_boundary_vertical($!gs, $move_col, $row, $base_col, $count, $jump_to_boundaries);
  }

  method flag_recompute_spans {
    sheet_flag_recompute_spans($!gs);
  }

  method flag_status_update_cell (GnmCell() $c) is static {
    sheet_flag_status_update_cell($c);
  }

  method flag_status_update_range (
    Sheet    $sheet,
    GnmRange $range
  ) {
    sheet_flag_status_update_range($!gs, $range);
  }

  method flag_style_update_range (
    Sheet    $sheet,
    GnmRange $range
  ) {
    sheet_flag_style_update_range($!gs, $range);
  }

  method foreach_cell_in_range (
    Sheet         $sheet,
    CellIterFlags $flags,
    GnmRange      $r,
    gpointer $callback, #= CellIterFunc
    gpointer      $closure
  ) {
    sheet_foreach_cell_in_range($!gs, $flags, $r, $callback, $closure);
  }

  method foreach_cell_in_region (
    Sheet         $sheet,
    CellIterFlags $flags,
    gint          $start_col,
    gint          $start_row,
    gint          $end_col,
    gint          $end_row,
    gpointer $callback, #= CellIterFunc
    gpointer      $closure
  ) {
    sheet_foreach_cell_in_region($!gs, $flags, $start_col, $start_row, $end_col, $end_row, $callback, $closure);
  }

  method freeze_object_views (
    Sheet    $sheet,
    gboolean $qfreeze
  ) {
    sheet_freeze_object_views($!gs, $qfreeze);
  }

  method get_cells_extent {
    sheet_get_cells_extent($!gs);
  }

  method get_comment (
    Sheet      $sheet,
    GnmCellPos $pos
  ) {
    sheet_get_comment($!gs, $pos);
  }

  method get_conventions {
    sheet_get_conventions($!gs);
  }

  method get_extent (
    Sheet    $sheet,
    gboolean $spans_and_merges_extend,
    gboolean $include_hidden
  ) {
    sheet_get_extent($!gs, $spans_and_merges_extend, $include_hidden);
  }

  method get_nominal_printarea {
    sheet_get_nominal_printarea($!gs);
  }

  method get_printarea (
    Sheet    $sheet,
    gboolean $include_styles,
    gboolean $ignore_printarea
  ) {
    sheet_get_printarea($!gs, $include_styles, $ignore_printarea);
  }

  method get_view (
    Sheet        $sheet,
    WorkbookView $wbv
  ) {
    sheet_get_view($!gs, $wbv);
  }

  method gnm_add_sort_setup (
    Sheet    $sheet,
    Str      $key,
    gpointer $setup
  ) {
    gnm_sheet_add_sort_setup($!gs, $key, $setup);
  }

  method gnm_find_sort_setup (
    Sheet $sheet,
    Str   $key
  ) {
    gnm_sheet_find_sort_setup($!gs, $key);
  }

  method gnm_foreach_name (
    Sheet    $sheet,
    GHFunc   $func,
    gpointer $data
  ) {
    gnm_sheet_foreach_name($!gs, $func, $data);
  }

  method gnm_get_size {
    gnm_sheet_get_size($!gs);
  }

  method gnm_get_size2 (
    Sheet    $sheet,
    Workbook $wb
  ) {
    gnm_sheet_get_size2($!gs, $wb);
  }

  method gnm_get_sort_setups {
    gnm_sheet_get_sort_setups($!gs);
  }

  method gnm_get_type {
    gnm_sheet_get_type();
  }

  method gnm_resize (
    Sheet        $sheet,
    gint         $cols,
    gint         $rows,
    GOCmdContext $cc,
    gboolean     $perr
  ) {
    gnm_sheet_resize($!gs, $cols, $rows, $cc, $perr);
  }

  method gnm_scenario_add (
    Sheet       $sheet,
    GnmScenario $sc
  ) {
    gnm_sheet_scenario_add($!gs, $sc);
  }

  method gnm_scenario_find (
    Sheet $sheet,
    Str   $name
  ) {
    gnm_sheet_scenario_find($!gs, $name);
  }

  method gnm_scenario_new (
    Sheet $sheet,
    Str   $name
  ) {
    gnm_sheet_scenario_new($!gs, $name);
  }

  method gnm_scenario_remove (
    Sheet       $sheet,
    GnmScenario $sc
  ) {
    gnm_sheet_scenario_remove($!gs, $sc);
  }

  method gnm_set_solver_params (
    Sheet               $sheet,
    GnmSolverParameters $param
  ) {
    gnm_sheet_set_solver_params($!gs, $param);
  }

  method gnm_size_get_type {
    gnm_sheet_size_get_type();
  }

  method gnm_suggest_size (
    gint $cols is rw,
    gint $rows is rw
  ) {
    gnm_sheet_suggest_size($!gs, $rows);
  }

  method gnm_type_get_type {
    gnm_sheet_type_get_type();
  }

  method gnm_valid_size (
    gint $cols,
    gint $rows
  ) {
    gnm_sheet_valid_size($!gs, $rows);
  }

  method gnm_visibility_get_type {
    gnm_sheet_visibility_get_type();
  }

  method insert_cols (
    Sheet          $sheet,
    gint           $col,
    gint           $count,
    CArray[GOUndo] $pundo,
    GOCmdContext   $cc
  ) {
    sheet_insert_cols($!gs, $col, $count, $pundo, $cc);
  }

  method insert_rows (
    Sheet          $sheet,
    gint           $row,
    gint           $count,
    CArray[GOUndo] $pundo,
    GOCmdContext   $cc
  ) {
    sheet_insert_rows($!gs, $row, $count, $pundo, $cc);
  }

  method is_cell_empty (
    Sheet $sheet,
    gint  $col,
    gint  $row
  ) {
    sheet_is_cell_empty($!gs, $col, $row);
  }

  method is_region_empty (
    Sheet    $sheet,
    GnmRange $r
  ) {
    sheet_is_region_empty($!gs, $r);
  }

  method mark_dirty {
    sheet_mark_dirty($!gs);
  }

  method move_range (
    GnmExprRelocateInfo $rinfo,
    CArray[GOUndo]      $pundo,
    GOCmdContext        $cc
  ) {
    sheet_move_range($rinfo, $pundo, $cc);
  }

  method queue_redraw_range (
    Sheet    $sheet,
    GnmRange $range
  ) {
    sheet_queue_redraw_range($!gs, $range);
  }

  method queue_respan (
    Sheet $sheet,
    gint  $start_row,
    gint  $end_row
  ) {
    sheet_queue_respan($!gs, $start_row, $end_row);
  }

  method range_bounding_box (
    Sheet    $sheet,
    GnmRange $r
  ) {
    sheet_range_bounding_box($!gs, $r);
  }

  method range_calc_spans (
    Sheet            $sheet,
    GnmRange         $r,
    GnmSpanCalcFlags $flags
  ) {
    sheet_range_calc_spans($!gs, $r, $flags);
  }

  method range_contains_merges_or_arrays (
    Sheet        $sheet,
    GnmRange     $r,
    GOCmdContext $cc,
    Str          $cmd,
    gboolean     $merges,
    gboolean     $arrays
  ) {
    sheet_range_contains_merges_or_arrays($!gs, $r, $cc, $cmd, $merges, $arrays);
  }

  method range_has_heading (
    Sheet    $sheet,
    GnmRange $src,
    gboolean $top,
    gboolean $ignore_styles
  ) {
    sheet_range_has_heading($!gs, $src, $top, $ignore_styles);
  }

  method range_set_expr_undo (
    GnmSheetRange $sr,
    GnmExprTop    $texpr
  )
    is static
  {
    sheet_range_set_expr_undo($sr, $texpr);
  }

  method range_set_markup_undo (
    GnmSheetRange $sr,
    PangoAttrList $markup
  )
    is static
  {
    sheet_range_set_markup_undo($sr, $markup);
  }

  # cw: Method on GnmRange?
  method range_set_text (
    GnmParsePos $p,
    GnmRange    $r,
    Str         $str
  )
    is static
  {
    sheet_range_set_text($p, $r, $str);
  }

  method range_set_text_undo (
    GnmSheetRange $sr,
    Str           $text
  )
    is static
  {
    sheet_range_set_text_undo($sr, $text);
  }

  method range_splits_array (
    Sheet        $sheet,
    GnmRange     $r,
    GnmRange     $ignore,
    GOCmdContext $cc,
    Str          $cmd
  ) {
    sheet_range_splits_array($!gs, $r, $ignore, $cc, $cmd);
  }

  method range_splits_region (
    Sheet        $sheet,
    GnmRange     $r,
    GnmRange     $ignore,
    GOCmdContext $cc,
    Str          $cmd
  ) {
    sheet_range_splits_region($!gs, $r, $ignore, $cc, $cmd);
  }

  method range_trim (
    Sheet    $sheet,
    GnmRange $r,
    gboolean $cols,
    gboolean $rows
  ) {
    sheet_range_trim($!gs, $r, $cols, $rows);
  }

  method range_unrender (
    Sheet    $sheet,
    GnmRange $r
  ) {
    sheet_range_unrender($!gs, $r);
  }

  method ranges_split_region (
    Sheet        $sheet,
    GSList       $ranges,
    GOCmdContext $cc,
    Str          $cmd
  ) {
    sheet_ranges_split_region($!gs, $ranges, $cc, $cmd);
  }

  method recompute_spans_for_col (
    Sheet $sheet,
    gint  $col
  ) {
    sheet_recompute_spans_for_col($!gs, $col);
  }

  method redraw_all (
    Sheet    $sheet,
    gboolean $header
  ) {
    sheet_redraw_all($!gs, $header);
  }

  method redraw_range (
    Sheet    $sheet,
    GnmRange $range
  ) {
    sheet_redraw_range($!gs, $range);
  }

  method redraw_region (
    Sheet $sheet,
    gint  $start_col,
    gint  $start_row,
    gint  $end_col,
    gint  $end_row
  ) {
    sheet_redraw_region($!gs, $start_col, $start_row, $end_col, $end_row);
  }

  method row_fetch (
    Sheet $sheet,
    gint  $row
  ) {
    sheet_row_fetch($!gs, $row);
  }

  method row_get (
    Sheet $sheet,
    gint  $row
  ) {
    sheet_row_get($!gs, $row);
  }

  method row_get_default_size_pixels {
    sheet_row_get_default_size_pixels($!gs);
  }

  method row_get_default_size_pts {
    sheet_row_get_default_size_pts($!gs);
  }

  method row_get_distance_pixels (
    Sheet $sheet,
    gint  $from,
    gint  $to
  ) {
    sheet_row_get_distance_pixels($!gs, $from, $to);
  }

  method row_get_distance_pts (
    Sheet $sheet,
    gint  $from,
    gint  $to
  ) {
    sheet_row_get_distance_pts($!gs, $from, $to);
  }

  method row_get_info (
    Sheet $sheet,
    gint  $row
  ) {
    sheet_row_get_info($!gs, $row);
  }

  method row_is_hidden (
    Sheet $sheet,
    gint  $row
  ) {
    sheet_row_is_hidden($!gs, $row);
  }

  method row_set_default_size_pixels (
    Sheet $sheet,
    gint  $height_pixels
  ) {
    sheet_row_set_default_size_pixels($!gs, $height_pixels);
  }

  method row_set_default_size_pts (
    Sheet   $sheet,
    gdouble $height_pts
  ) {
    sheet_row_set_default_size_pts($!gs, $height_pts);
  }

  method row_set_size_pixels (
    Sheet    $sheet,
    gint     $row,
    gint     $height_pixels,
    gboolean $set_by_user
  ) {
    sheet_row_set_size_pixels($!gs, $row, $height_pixels, $set_by_user);
  }

  method row_set_size_pts (
    Sheet    $sheet,
    gint     $row,
    gdouble  $height_pts,
    gboolean $set_by_user
  ) {
    sheet_row_set_size_pts($!gs, $row, $height_pts, $set_by_user);
  }

  method row_size_fit_pixels (
    Sheet    $sheet,
    gint     $row,
    gint     $scol,
    gint     $ecol,
    gboolean $ignore_strings
  ) {
    sheet_row_size_fit_pixels($!gs, $row, $scol, $ecol, $ignore_strings);
  }

  method scrollbar_config {
    sheet_scrollbar_config($!gs);
  }

  method selection_is_allowed (
    Sheet      $sheet,
    GnmCellPos $pos
  ) {
    sheet_selection_is_allowed($!gs, $pos);
  }

  method set_outline_direction (
    Sheet    $sheet,
    gboolean $is_cols
  ) {
    sheet_set_outline_direction($!gs, $is_cols);
  }

  method update {
    sheet_update($!gs);
  }

  method update_only_grid {
    sheet_update_only_grid($!gs);
  }

}
