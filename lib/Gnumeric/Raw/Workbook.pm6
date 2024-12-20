use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Gnome::Office::Raw::Definitions;
use Gnumeric::Spreadsheet::Raw::Definitions;

unit package Gnumeric::Raw::Workbook;

### /usr/src/gnumeric/src/workbook.h

sub workbook_attach_view (WorkbookView $wbv)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_cells (
  Workbook           $wb,
  gboolean           $comments,
  GnmSheetVisibility $vis
)
  returns GPtrArray
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_date_conv (Workbook $wb)
  returns GODateConventions
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_detach_view (WorkbookView $wbv)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_enable_recursive_dirty (
  Workbook $wb,
  gboolean $enable
)
  returns uint32
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_find_command (
  Workbook $wb,
  gboolean $is_undo,
  gpointer $cmd
)
  returns gint
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_foreach_cell_in_range (
  GnmEvalPos    $pos,
  GnmValue      $cell_range,
  CellIterFlags $flags,
                &handler (GnmCellIter, gpointer --> GnmValue)
  gpointer      $closure
)
  returns GnmValue
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_foreach_name (
  Workbook $wb,
  gboolean $globals_only,
           &func (gpointer $key, gpointer $value, gpointer $user_data),
  gpointer $data
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_get_file_exporter (Workbook $wb)
  returns GOFileSaver
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_get_file_saver (Workbook $wb)
  returns GOFileSaver
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_get_last_export_uri (Workbook $wb)
  returns Str
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_get_recalcmode (Workbook $wb)
  returns uint32
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_get_sheet_size (Workbook $wb)
  returns GnmSheetSize
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_get_type
  returns GType
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_iteration_enabled (
  Workbook $wb,
  gboolean $enable
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_iteration_max_number (
  Workbook $wb,
  gint     $max_number
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_iteration_tolerance (
  Workbook  $wb,
  gnm_float $tolerance
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_mark_dirty (Workbook $wb)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_new
  returns Workbook
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_new_with_sheets (gint $sheet_count)
  returns Workbook
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_optimize_style (Workbook $wb)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_recalc (Workbook $wb)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_recalc_all (Workbook $wb)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_set_1904 (
  Workbook $wb,
  gboolean $base1904
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_set_date_conv (
  Workbook          $wb,
  GODateConventions $date_conv
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_set_file_exporter (
  Workbook    $wb,
  GOFileSaver $fs
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_set_last_export_uri (
  Workbook $wb,
  Str      $uri
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_set_recalcmode (
  Workbook $wb,
  gboolean $enable
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_set_saveinfo (
  Workbook          $wb,
  GOFileFormatLevel $lev,
  GOFileSaver       $saver
)
  returns uint32
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_share_expressions (
  Workbook $wb,
  gboolean $freeit
)
  returns GnmExprSharer
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_add (
  Workbook $wb,
  gint     $pos,
  gint     $columns,
  gint     $rows
)
  returns Sheet
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_add_with_type (
  Workbook     $wb,
  GnmSheetType $sheet_type,
  gint         $pos,
  gint         $columns,
  gint         $rows
)
  returns Sheet
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_attach (
  Workbook $wb,
  Sheet    $new_sheet
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_attach_at_pos (
  Workbook $wb,
  Sheet    $new_sheet,
  gint     $pos
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_by_index (
  Workbook $wb,
  gint     $i
)
  returns Sheet
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_by_name (
  Workbook $wb,
  Str      $sheet_name
)
  returns Sheet
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_count (Workbook $wb)
  returns gint
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_delete (Sheet $sheet)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_get_free_name (
  Workbook $wb,
  Str      $base,
  gboolean $always_suffix,
  gboolean $handle_counter
)
  returns Str
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_move (
  Sheet $sheet,
  gint  $direction
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_rename (
  Workbook     $wb,
  GSList       $sheet_indices,
  GSList       $new_names,
  GOCmdContext $cc
)
  returns uint32
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_reorder (
  Workbook $wb,
  GSList   $new_order
)
  returns uint32
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_state_diff (
  WorkbookSheetState $wss_a,
  WorkbookSheetState $wss_b
)
  returns Str
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_state_get_type
  returns GType
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_state_new (Workbook $wb)
  returns WorkbookSheetState
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_state_restore (
  Workbook           $wb,
  WorkbookSheetState $wss
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_state_size (WorkbookSheetState $wss)
  returns gint
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheet_state_unref (WorkbookSheetState $wss)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_sheets (Workbook $wb)
  returns GPtrArray
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_update_graphs (Workbook $wb)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }

sub workbook_update_history (
  Workbook           $wb,
  GnmFileSaveAsStyle $type
)
  is      native(gnumeric-spreadsheet)
  is      export
{ * }
