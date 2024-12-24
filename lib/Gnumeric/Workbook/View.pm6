use v6.c;

use Method::Also;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Workbook::View;

use Gnumeric::Sheet;
use Gnumeric::Sheet::View;
#use GOffice::Doc;

use GLib::Roles::Object;


our subset WorkbookViewAncestry is export of Mu
  where WorkbookView | GObject;

class Gnumeric::Workbook::View {
  also does GLib::Roles::Object;

  has WorkbookView $!wv is implementor;

  submethod BUILD ( :$gnumeric-wb-view ) {
    self.setWorkbookView($gnumeric-wb-view)
      if $gnumeric-wb-view
  }

  method setWorkbookView (WorkbookViewAncestry $_) {
    my $to-parent;

    $!wv = do {
      when WorkbookView {
        $to-parent = cast(GObject, $_);
        $_
      }

      default {
        $to-parent = $_;
        cast(WorkbookView, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Gnumeric::Raw::Definitions::WorkbookView
    is also<
      WorkbookView
      GnmWorkbookView
    >
  { $!wv }

  multi method new (
    $gnumeric-wb-view where * ~~ WorkbookViewAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-wb-view;

    my $o = self.bless( :$gnumeric-wb-view );
    $o.ref if $ref;
    $o;
  }
  multi method new (Workbook() $wb) {
    my $gnumeric-wb-view = workbook_view_new($wb);

    $gnumeric-wb-view ?? self.bless( :$gnumeric-wb-view ) !! Nil;
  }

  method new_from_input (
    GsfInput()     $input,
    Str()          $uri,
    GOFileOpener() $file_opener,
    GOIOContext()  $io_context,
    Str()          $encoding
  )
    is also<new-from-input>
  {
    my $gnumeric-wb-view = workbook_view_new_from_input(
      $input,
      $uri,
      $file_opener,
      $io_context,
      $encoding
    );

    $gnumeric-wb-view ?? self.bless( :$gnumeric-wb-view ) !! Nil;
  }

  method new_from_uri (
    GOFileOpener() $file_opener,
    GOIOContext()  $io_context,
    Str()          $encoding
  )
    is also<new-from-uri>
  {
    my $gnumeric-wb-view = workbook_view_new_from_uri(
      $file_opener,
      $io_context,
      $encoding
    );

    $gnumeric-wb-view ?? self.bless( :$gnumeric-wb-view ) !! Nil;
  }

  method attach_control (WorkbookControl() $wbc) is also<attach-control> {
    wb_view_attach_control($!wv, $wbc);
  }

  method auto_expr_recalc is also<auto-expr-recalc> {
    wb_view_auto_expr_recalc($!wv);
  }

  method cur_sheet ( :$raw = False ) is also<cur-sheet> {
    propReturnObject(
      wb_view_cur_sheet($!wv),
      $raw,
      |Gnumeric::Sheet.getTypePair
    );
  }

  method cur_sheet_view ( :$raw = False ) is also<cur-sheet-view> {
    propReturnObject(
      wb_view_cur_sheet_view($!wv),
      $raw,
      |Gnumeric::Sheet::View.getTypePair
    );
  }

  method detach_control (WorkbookControl() $wbc)
    is also<detach-control>
    is static
  {
    wb_view_detach_control($wbc);
  }

  method detach_from_workbook is also<detach-from-workbook> {
    wb_view_detach_from_workbook($!wv);
  }

  method edit_line_set (WorkbookControl() $wbc) is also<edit-line-set> {
    wb_view_edit_line_set($!wv, $wbc);
  }

  method get_doc ( :$raw = False ) is also<get-doc> {
    propReturnObject(
      wb_view_get_doc($!wv),
      $raw,
      |GOffice::Doc.getTypePair
    );
  }

  method get_index_in_wb is also<get-index-in-wb> {
    wb_view_get_index_in_wb($!wv);
  }

  method get_workbook is also<get-workbook> {
    wb_view_get_workbook($!wv);
  }

  method is_protected (Int() $check_sheet) is also<is-protected> {
    my gboolean $c = $check_sheet;

    wb_view_is_protected($!wv, $c);
  }

  method menus_update is also<menus-update> {
    wb_view_menus_update($!wv);
  }

  method preferred_size (Int() $w_pixels, Int() $h_pixels)
    is also<preferred-size>
  {
    my gint ($w, $h) = ($w_pixels, $h_pixels);

    wb_view_preferred_size($!wv, $w_pixels, $h_pixels);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &workbook_view_get_type, $n, $t );
  }

  method selection_desc (Int() $use_pos, WorkbookControl() $wbc)
    is also<selection-desc>
  {
    my gboolean $u = $use_pos.so.Int;

    wb_view_selection_desc($!wv, $u, $wbc);
  }

  method set_attribute (Str() $name, Str() $value) is also<set-attribute> {
    wb_view_set_attribute($!wv, $name, $value);
  }

  method sheet_add (Sheet() $new_sheet) is also<sheet-add> {
    wb_view_sheet_add($!wv, $new_sheet);
  }

  method sheet_focus (Sheet() $sheet) is also<sheet-focus> {
    wb_view_sheet_focus($!wv, $sheet);
  }

  method style_feedback is also<style-feedback> {
    wb_view_style_feedback($!wv);
  }

  method save (GOCmdContext() $cc) {
    workbook_view_save($!wv, $cc);
  }

  method save_as (
    GOFileSaver()  $fs,
    Str()          $uri,
    GOCmdContext() $cc
  )
    is also<save-as>
  {
    workbook_view_save_as($!wv, $fs, $uri, $cc);
  }

  method save_to_output (
    GOFileSaver()  $fs,
    GsfOutput()    $output,
    GOIOContext()  $io_context
  )
    is also<save-to-output>
  {
    workbook_view_save_to_output($!wv, $fs, $output, $io_context);
  }

  method save_to_uri (
    GOFileSaver()  $fs,
    Str()          $uri,
    GOIOContext()  $io_context
  )
    is also<save-to-uri>
  {
    workbook_view_save_to_uri($!wv, $fs, $uri, $io_context);
  }

}
