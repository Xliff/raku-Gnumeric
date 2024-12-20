use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Pango::Raw::Types;
use GTK::Raw::Definitions;
use Gnumeric::Spreadsheet::Raw::Definitions;
use Gnumeric::Raw::Definitions;

unit Gnumeric::Raw::Workbook::Control::GTK;

### /usr/src/gnumeric/src/wbc-gtk.h

sub wbc_gtk_attach_guru (
  WBCGtk    $wbcg,
  GtkWidget $guru
)
  is      native(gnumeric)
  is      export
{ * }

sub wbc_gtk_attach_guru_with_unfocused_rs (
  WBCGtk       $wbcg,
  GtkWidget    $guru,
  GnmExprEntry $gee
)
  is      native(gnumeric)
  is      export
{ * }

sub wbc_gtk_detach_guru (WBCGtk $wbcg)
  is      native(gnumeric)
  is      export
{ * }

sub wbc_gtk_get_guru (WBCGtk $wbcg)
  returns GtkWidget
  is      native(gnumeric)
  is      export
{ * }

sub wbc_gtk_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub wbc_gtk_new (
  WorkbookView $optional_view,
  Workbook     $optional_wb,
  GdkScreen    $optional_screen,
  Str          $optional_geometry
)
  returns WBCGtk
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_auto_complete_destroy (WBCGtk $wbcg)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_copy_toolbar_visibility (
  WBCGtk $new_wbcg,
  WBCGtk $wbcg
)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_cur_scg (WBCGtk $wbcg)
  returns SheetControlGUI
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_cur_sheet (WBCGtk $wbcg)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_edit_add_markup (
  WBCGtk         $wbcg,
  PangoAttribute $attr
)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_edit_finish (
  WBCGtk        $wbcg,
  WBCEditResult $result,
  gboolean      $showed_dialog
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_edit_get_display_text (WBCGtk $wbcg)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_edit_get_markup (
  WBCGtk   $wbcg,
  gboolean $full
)
  returns PangoAttrList
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_edit_start (
  WBCGtk   $wbcg,
  gboolean $blankp,
  gboolean $cursorp
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_entry_has_logical (WBCGtk $wbcg)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_find_for_workbook (
  Workbook   $wb,
  WBCGtk     $candidate,
  GdkScreen  $pref_screen,
  GdkDisplay $pref_display
)
  returns WBCGtk
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_focus_cur_scg (WBCGtk $wbcg)
  returns Sheet
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_focus_current_cell_indicator (WBCGtk $wbcg)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_get_entry (WBCGtk $wbcg)
  returns GtkEntry
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_get_entry_logical (WBCGtk $wbcg)
  returns GnmExprEntry
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_get_entry_underlying (WBCGtk $wbcg)
  returns GtkWidget
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_get_font_desc (WBCGtk $wbcg)
  returns PangoFontDescription
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_get_n_scg (WBCGtk $wbcg)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_get_nth_scg (
  WBCGtk $wbcg,
  gint   $i
)
  returns SheetControlGUI
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_insert_object (
  WBCGtk      $wbcg,
  SheetObject $so
)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_insert_object_clear (WBCGtk $wbcg)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_is_editing (WBCGtk $wbcg)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_rangesel_possible (WBCGtk $wbcg)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_set_end_mode (
  WBCGtk   $wbcg,
  gboolean $flag
)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_set_entry (
  WBCGtk       $wbc,
  GnmExprEntry $new_entry
)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_set_status_text (
  WBCGtk $wbcg,
  Str    $text
)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_set_transient (
  WBCGtk    $wbcg,
  GtkWindow $window
)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_toggle_visibility (
  WBCGtk          $wbcg,
  GtkToggleAction $action
)
  is      native(gnumeric)
  is      export
{ * }

sub wbcg_toplevel (WBCGtk $wbcg)
  returns GtkWindow
  is      native(gnumeric)
  is      export
{ * }
