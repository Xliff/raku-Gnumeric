use v6.c;

use Method::Also;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Workbook::Control;

use Gnumeric::Sheet;
use Gnumeric::Sheet::View;
use Gnumeric::Workbook;
#use Gnumeric::Workbook::View;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WorkbookControlAncestry is export of Mu
  where WorkbookControl | GObject;

class Gnumeric::Workbook::Control {
  also does GLib::Roles::Object;

  has WorkbookControl $!gwc is implementor;

  submethod BUILD ( :$gnumeric-wb-control ) {
    self.setWorkbookControl($gnumeric-wb-control) if $gnumeric-wb-control
  }

  method setWorkbookControl (WorkbookControlAncestry $_) {
    my $to-parent;

    $!gwc = do {
      when WorkbookControl {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WorkbookControl, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Gnumeric::Spreadsheet::Raw::Structs::WorkbookControl
    is also<WorkbookControl>
  { $!gwc }

  multi method new (
    $gnumeric-wb-control where * ~~ WorkbookControlAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-wb-control;

    my $o = self.bless( :$gnumeric-wb-control );
    $o.ref if $ref;
    $o;
  }

  method new_wrapper (
    WorkbookView() $wbv,
    Workbook()     $wb,
    gpointer       $extra = gpointer
  )
    is also<new-wrapper>
  {
    propReturnObject(
      workbook_control_new_wrapper($!gwc, $wbv, $wb, $extra),
      $raw,
      |self.getTypePair
    );
  }

  method claim_selection is also<claim-selection> {
    so wb_control_claim_selection($!gwc);
  }

  method cur_sheet ( :$raw = False ) is also<cur-sheet> {
    propReturnObject(
      wb_control_cur_sheet($!gwc),
      $raw,
      |Gnumeric::Sheet.getTypePair
    );
  }

  method cur_sheet_view is also<cur-sheet-view> {
    propReturnObject(
      wb_control_cur_sheet_view($!gwc),
      $raw,
      |Gnumeric::Sheet::View.getTypePair
    );
  }

  method edit_line_set (Str() $text) is also<edit-line-set> {
    wb_control_edit_line_set($!gwc, $text);
  }

  method get_doc ( :$raw = False ) is also<get-doc> {
    propReturnObject(
      wb_control_get_doc($!gwc),
      $raw,
      |GOffice::Doc.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &workbook_control_get_type, $n, $t );
  }

  method get_workbook ( :$raw = False ) is also<get-workbook> {
    propReturnObject(
      wb_control_get_workbook($!gwc),
      $raw,
      |Gnumeric::Workbook.getTypePair
    );
  }

  method init_state is also<init-state> {
    wb_control_init_state($!gwc);
  }

  method jump (Sheet() $sheet, GnmRangeRef() $r) {
    wb_control_jump($!gwc, $sheet, $r);
  }

  method navigate_to_cell (wb_control_navigator_t $to)
    is also<navigate-to-cell>
  {
    wb_control_navigate_to_cell($!gwc, $to);
  }

  method parse_and_jump (Str() $text) is also<parse-and-jump> {
    wb_control_parse_and_jump($!gwc, $text);
  }

  method paste_from_selection (GnmPasteTarget() $pt)
    is also<paste-from-selection>
  {
    wb_control_paste_from_selection($!gwc, $pt);
  }

  method selection_descr_set (Str() $text) is also<selection-descr-set> {
    wb_control_selection_descr_set($!gwc, $text);
  }

  method set_view (WorkbookView() $optional_view, Workbook() $optional_wb)
    is also<set-view>
  {
    wb_control_set_view($!gwc, $optional_view, $optional_wb);
  }

  method sheet {
    unless $!gwcs {
      my \T = class :: {
        has $!gwc is built;

        method add (SheetView() $sv) {
          wb_control_sheet_add($!gwc, $sv);
        }

        method focus (Sheet() $sheet) {
          wb_control_sheet_focus($!gwc, $sheet);
        }

        method remove (Sheet() $sheet) {
          wb_control_sheet_remove($!gwc, $sheet);
        }

        method remove_all {
          wb_control_sheet_remove_all($!gwc);
        }
      }

      $!gwcs = T.new( gwc => $!gwc );
    }
    $!gwcs;
  }

  method style_feedback (Int() $changes) is also<style-feedback> {
    my GnmStyle $c = $changes;

    wb_control_style_feedback($!gwc, $c);
  }

  method undo_redo_labels (Str() $undo, Str() $redo)
    is also<undo-redo-labels>
  {
    wb_control_undo_redo_labels($!gwc, $undo, $redo);
  }

  method undo_redo_pop (Int() $is_undo) is also<undo-redo-pop> {
    my gboolean $i = $is_undo.so.Int;

    wb_control_undo_redo_pop($!gwc, $is_undo);
  }

  method undo_redo_push (
    Int()    $is_undo,
    Str()    $text,
    gpointer $key        = gpointerl
  )
    is also<undo-redo-push>
  {
    my gboolean $i = $is_undo.so.Int;

    wb_control_undo_redo_push($!gwc, $is_undo, $text, $key);
  }

  method undo_redo_truncate (Int() $n, Int() $is_undo)
    is also<undo-redo-truncate>
  {
    my gint     $nn = $n;
    my gboolean $i  = $is_undo.so.Int;

    wb_control_undo_redo_truncate($!gwc, $n, $is_undo);
  }

  method validation_msg (Int() $v, Str() $title, Str() $msg)
    is also<validation-msg>
  {
    my ValidationStyle $vv = $v;

    wb_control_validation_msg($!gwc, $vv, $title, $msg);
  }

  method view ( :$raw = False ) {
    propReturnObject(
      wb_control_view($!gwc),
      $raw,
      |Gnumeric::Workbook::View.getTypePair
    );
  }
}
