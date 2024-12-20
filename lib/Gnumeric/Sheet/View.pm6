use v6.c;

use Gnumeric::Spreadsheet::Raw::Types;
use Gnumeric::Spreadsheet::Raw::Workbook::View;

use Gnumeric::Spreadsheet::Sheet;
use Gnumeric::Spreadsheet::Sheet::View;
#use GOffice::Doc;

use GLib::Roles::Object;

class Gnumeric::Spreadsheet::Workbook::View {
  also does GLib::Roles::Object;

  has WorkbookView $!wv is implementor;

  method new {
    my $workbook-view = workbook_view_new();

    $workbook-view ?? self.bless( :$workbook-view ) !! Nil;
  }

  method new_from_input (
    GsfInput()     $input,
    Str()          $uri,
    GOFileOpener() $file_opener,
    GOIOContext()  $io_context,
    Str()          $encoding
  ) {
    my $workbook-view = workbook_view_new_from_input(
      $input,
      $uri,
      $file_opener,
      $io_context,
      $encoding
    );

    $workbook-view ?? self.bless( :$workbook-view ) !! Nil;
  }

  method new_from_uri (
    GOFileOpener() $file_opener,
    GOIOContext()  $io_context,
    Str()          $encoding
  ) {
    my $workbook-view = workbook_view_new_from_uri(
      $file_opener,
      $io_context,
      $encoding
    );

    $workbook-view ?? self.bless( :$workbook-view ) !! Nil;
  }

  method attach_control (WorkbookControl() $wbc) {
    wb_view_attach_control($!wv, $wbc);
  }

  method auto_expr_recalc {
    wb_view_auto_expr_recalc($!wv);
  }

  method cur_sheet ( :$raw = False ) {
    propReturnObject(
      wb_view_cur_sheet($!wv),
      $raw,
      |Gnumeric::Spreadsheet::Sheet.getTypePair
    );
  }

  method cur_sheet_view ( :$raw = False ) {
    propReturnObject(
      wb_view_cur_sheet_view($!wv),
      $raw,
      |Gnumeric::Spreadsheet::Sheet::View.getTypePair
    );
  }

  method detach_control {
    wb_view_detach_control($!wv);
  }

  method detach_from_workbook {
    wb_view_detach_from_workbook($!wv);
  }

  method edit_line_set (WorkbookControl() $wbc) {
    wb_view_edit_line_set($!wv, $wbc);
  }

  method get_doc ( :$raw = False ) {
    propReturnObject(
      wb_view_get_doc($!wv),
      $raw,
      |GOffice::Doc.getTypePair
    );
  }

  method get_index_in_wb {
    wb_view_get_index_in_wb($!wv);
  }

  method get_workbook {
    wb_view_get_workbook($!wv);
  }

  method is_protected (Int() $check_sheet) {
    my gboolean $c = $check_sheet;

    wb_view_is_protected($!wv, $c);
  }

  method menus_update {
    wb_view_menus_update($!wv);
  }

  method preferred_size (Int() $w_pixels, Int() $h_pixels) {
    my gint ($w, $h) = ($w_pixels, $h_pixels);

    wb_view_preferred_size($!wv, $w_pixels, $h_pixels);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &workbook_view_get_type, $n, $t );
  }

  method selection_desc (Int() $use_pos, WorkbookControl() $wbc) {
    my gboolean $u = $use_pos.so.Int;

    wb_view_selection_desc($!wv, $u, $wbc);
  }

  method set_attribute (Str() $name, Str() $value) {
    wb_view_set_attribute($!wv, $name, $value);
  }

  method sheet_add (Sheet() $new_sheet) {
    wb_view_sheet_add($!wv, $new_sheet);
  }

  method sheet_focus (Sheet() $sheet) {
    wb_view_sheet_focus($!wv, $sheet);
  }

  method style_feedback {
    wb_view_style_feedback($!wv);
  }

  method save (GOCmdContext() $cc) {
    workbook_view_save($!wv, $cc);
  }

  method save_as (
    GOFileSaver()  $fs,
    Str()          $uri,
    GOCmdContext() $cc
  ) {
    workbook_view_save_as($!wv, $fs, $uri, $cc);
  }

  method save_to_output (
    GOFileSaver()  $fs,
    GsfOutput()    $output,
    GOIOContext()  $io_context
  ) {
    workbook_view_save_to_output($!wv, $fs, $output, $io_context);
  }

  method save_to_uri (
    GOFileSaver()  $fs,
    Str()          $uri,
    GOIOContext()  $io_context
  ) {
    workbook_view_save_to_uri($!wv, $fs, $uri, $io_context);
  }

}
