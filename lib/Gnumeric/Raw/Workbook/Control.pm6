use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Gnumeric::Raw::Definitions;
use Gnumeric::Raw::Enums;
use Gnumeric::Raw::Structs;

unit package Gnumeric::Raw::Workbook::Control;

### /usr/src/gnumeric/src/workbook-control.h

sub wb_control_claim_selection (WorkbookControl $wbc)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_cur_sheet (WorkbookControl $wbc)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_cur_sheet_view (WorkbookControl $wbc)
  returns SheetView
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_edit_line_set (
  WorkbookControl $wbc,
  Str             $text
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_get_doc (WorkbookControl $wbc)
  returns GODoc
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_get_workbook (WorkbookControl $wbc)
  returns Workbook
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_init_state (WorkbookControl $wbc)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_jump (
  WorkbookControl $wbc,
  Sheet           $sheet,
  GnmRangeRef     $r
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_navigate_to_cell (
  WorkbookControl        $wbc,
  wb_control_navigator_t $to
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_parse_and_jump (
  WorkbookControl $wbc,
  Str             $text
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_paste_from_selection (
  WorkbookControl $wbc,
  GnmPasteTarget  $pt
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_selection_descr_set (
  WorkbookControl $wbc,
  Str             $text
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_set_view (
  WorkbookControl $wbc,
  WorkbookView    $optional_view,
  Workbook        $optional_wb
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_sheet_add (
  WorkbookControl $wbc,
  SheetView       $sv
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_sheet_focus (
  WorkbookControl $wbc,
  Sheet           $sheet
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_sheet_remove (
  WorkbookControl $wbc,
  Sheet           $sheet
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_sheet_remove_all (WorkbookControl $wbc)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_style_feedback (
  WorkbookControl $wbc,
  GnmStyle        $changes
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_undo_redo_labels (
  WorkbookControl $wbc,
  Str             $undo,
  Str             $redo
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_undo_redo_pop (
  WorkbookControl $wbc,
  gboolean        $is_undo
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_undo_redo_push (
  WorkbookControl $wbc,
  gboolean        $is_undo,
  Str             $text,
  gpointer        $key
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_undo_redo_truncate (
  WorkbookControl $wbc,
  gint            $n,
  gboolean        $is_undo
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_validation_msg (
  WorkbookControl $wbc,
  ValidationStyle $v,
  Str             $title,
  Str             $msg
)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub wb_control_view (WorkbookControl $wbc)
  returns WorkbookView
  is      native(gnumeric)
  is      export
{ * }

sub workbook_control_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub workbook_control_new_wrapper (
  WorkbookControl $wbc,
  WorkbookView    $wbv,
  Workbook        $wb,
  Pointer         $extra
)
  returns WorkbookControl
  is      native(gnumeric)
  is      export
{ * }
