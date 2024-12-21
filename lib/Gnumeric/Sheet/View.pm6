use v6.c;

use NativeCall;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Sheet::View;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Gnumeric::Sheet::View {
  also does GLib::Roles::Object;

  has SheetView $!gsv is implementor;

  method ant (
    GList     $ranges
  ) {
    gnm_sheet_view_ant($!gsv, $ranges);
  }

  method attach_control (
    SheetControl $sc
  ) {
    gnm_sheet_view_attach_control($!gsv, $sc);
  }

  method cursor_set (
    GnmCellPos $edit,
    gint       $base_col,
    gint       $base_row,
    gint       $move_col,
    gint       $move_row,
    GnmRange   $bound
  ) {
    gnm_sheet_view_cursor_set($!gsv, $edit, $base_col, $base_row, $move_col, $move_row, $bound);
  }

  method detach_control (
    SheetControl $sc
  ) {
    gnm_sheet_view_detach_control($!gsv, $sc);
  }

  method dispose {
    gnm_sheet_view_dispose($!gsv);
  }

  method editpos_in_filter {
    gnm_sheet_view_editpos_in_filter($!gsv);
  }

  method editpos_in_slicer {
    gnm_sheet_view_editpos_in_slicer($!gsv);
  }

  method flag_selection_change {
    gnm_sheet_view_flag_selection_change($!gsv);
  }

  method flag_status_update_pos (
    GnmCellPos $pos
  ) {
    gnm_sheet_view_flag_status_update_pos($!gsv, $pos);
  }

  method flag_status_update_range (
    GnmRange  $range
  ) {
    gnm_sheet_view_flag_status_update_range($!gsv, $range);
  }

  method flag_style_update_range (
    GnmRange  $range
  ) {
    gnm_sheet_view_flag_style_update_range($!gsv, $range);
  }

  method freeze_panes (
    GnmCellPos $frozen_top_left,
    GnmCellPos $unfrozen_top_left
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

  method make_cell_visible (
    gint      $col,
    gint      $row,
    gboolean  $couple_panes
  ) {
    gnm_sheet_view_make_cell_visible($!gsv, $col, $row, $couple_panes);
  }

  method new (Sheet() $sheet, WorkbookView() $wbv) {
    gnm_sheet_view_new($sheet, $wbv);
  }

  method panes_insdel_colrow (
    gboolean  $is_cols,
    gboolean  $is_insert,
    gint      $start,
    gint      $count
  ) {
    gnm_sheet_view_panes_insdel_colrow($!gsv, $is_cols, $is_insert, $start, $count);
  }

  method redraw_headers (
    gboolean  $col,
    gboolean  $row,
    GnmRange  $r
  ) {
    gnm_sheet_view_redraw_headers($!gsv, $col, $row, $r);
  }

  method redraw_range (
    GnmRange  $r
  ) {
    gnm_sheet_view_redraw_range($!gsv, $r);
  }

  method resize (
    gboolean  $force_scroll
  ) {
    gnm_sheet_view_resize($!gsv, $force_scroll);
  }

  method selection_copy (
    WorkbookControl $wbc
  ) {
    gnm_sheet_view_selection_copy($!gsv, $wbc);
  }

  method selection_cut (
    WorkbookControl $wbc
  ) {
    gnm_sheet_view_selection_cut($!gsv, $wbc);
  }

  method selection_extends_filter (
    GnmFilter $f
  ) {
    gnm_sheet_view_selection_extends_filter($!gsv, $f);
  }

  method selection_intersects_filter_rows {
    gnm_sheet_view_selection_intersects_filter_rows($!gsv);
  }

  method set_edit_pos (
    GnmCellPos $pos
  ) {
    gnm_sheet_view_set_edit_pos($!gsv, $pos);
  }

  method set_initial_top_left (
    gint      $col,
    gint      $row
  ) {
    gnm_sheet_view_set_initial_top_left($!gsv, $col, $row);
  }

  method sv_sheet {
    sv_sheet($!gsv);
  }

  method sv_wbv {
    sv_wbv($!gsv);
  }

  method unant {
    gnm_sheet_view_unant($!gsv);
  }

  method update {
    gnm_sheet_view_update($!gsv);
  }

  method weak_ref (
    SheetView         $sv,
    CArray[SheetView] $ptr
  ) {
    gnm_sheet_view_weak_ref($!gsv, $ptr);
  }

  method weak_unref (CArray[SheetView] $ptr) is static {
    gnm_sheet_view_weak_unref($ptr);
  }
}
