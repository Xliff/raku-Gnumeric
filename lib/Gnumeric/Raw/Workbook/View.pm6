use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Gnumeric::Raw::Definitions;
use Gnumeric::Raw::Structs;

unit package Gnumeric::Raw::Workbook::View;

### /usr/src/gnumeric/src/workbook-view.h

sub wb_view_attach_control (
  WorkbookView    $wbv,
  WorkbookControl $wbc
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_auto_expr_recalc (WorkbookView $wbv)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_cur_sheet (WorkbookView $wbv)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_cur_sheet_view (WorkbookView $wbv)
  returns SheetView
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_detach_control (WorkbookControl $wbc)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_detach_from_workbook (WorkbookView $wbv)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_edit_line_set (
  WorkbookView    $wbv,
  WorkbookControl $wbc
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_get_doc (WorkbookView $wbv)
  returns GODoc
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_get_index_in_wb (WorkbookView $wbv)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_get_workbook (WorkbookView $wbv)
  returns Workbook
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_is_protected (
  WorkbookView $wbv,
  gboolean     $check_sheet
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_menus_update (WorkbookView $wbv)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_preferred_size (
  WorkbookView $wbv,
  gint         $w_pixels,
  gint         $h_pixels
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_selection_desc (
  WorkbookView    $wbv,
  gboolean        $use_pos,
  WorkbookControl $wbc
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_set_attribute (
  WorkbookView $wbv,
  Str          $name,
  Str          $value
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_sheet_add (
  WorkbookView $wbv,
  Sheet        $new_sheet
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_sheet_focus (
  WorkbookView $wbv,
  Sheet        $sheet
)
  is      native(gnumeric)
  is      export
{ * }

sub wb_view_style_feedback (WorkbookView $wbv)
  is      native(gnumeric)
  is      export
{ * }

sub workbook_view_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub workbook_view_new (Workbook $wb)
  returns WorkbookView
  is      native(gnumeric)
  is      export
{ * }

sub workbook_view_new_from_input (
  GsfInput     $input,
  Str          $uri,
  GOFileOpener $file_opener,
  GOIOContext  $io_context,
  Str          $encoding
)
  returns WorkbookView
  is      native(gnumeric)
  is      export
{ * }

sub workbook_view_new_from_uri (
  Str          $uri,
  GOFileOpener $file_opener,
  GOIOContext  $io_context,
  Str          $encoding
)
  returns WorkbookView
  is      native(gnumeric)
  is      export
{ * }

sub workbook_view_save (
  WorkbookView $wbv,
  GOCmdContext $cc
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub workbook_view_save_as (
  WorkbookView $wbv,
  GOFileSaver  $fs,
  Str          $uri,
  GOCmdContext $cc
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub workbook_view_save_to_output (
  WorkbookView $wbv,
  GOFileSaver  $fs,
  GsfOutput    $output,
  GOIOContext  $io_context
)
  is      native(gnumeric)
  is      export
{ * }

sub workbook_view_save_to_uri (
  WorkbookView $wbv,
  GOFileSaver  $fs,
  Str          $uri,
  GOIOContext  $io_context
)
  is      native(gnumeric)
  is      export
{ * }
