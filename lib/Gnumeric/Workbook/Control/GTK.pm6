use v6.c;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Workbook::Control::GTK;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset WBCGtkAncestry is export of Mu
  where WBCGtk | GObject;

class Gnumeric::Workbook::Control::GTK {
  also does GLib::Roles::Object;
  also does Positional;

  has WBCGtk $!gwcg is implementor;

  submethod BUILD ( :$gnumeric-wbc-gtk ) {
    self.setWBCGtk($gnumeric-wbc-gtk) if $gnumeric-wbc-gtk
  }

  method setWBCGtk (WBCGtkAncestry $_) {
    my $to-parent;

    $!gwcg = do {
      when WBCGtk {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WBCGtk, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Gnumeric::Spreadsheet::Raw::Definitions::WBCGtk
  { $!gwcg }

  proto method new (|)
  { * }

  multi method new (
    $gnumeric-wbc-gtk where * ~~ WBCGtkAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-wbc-gtk;

    my $o = self.bless( :$gnumeric-wbc-gtk );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    :view(:optional-view(:$optional_view))             = WorkbookView,
    :wb(:optional-wb(:$optional_wb))                   = Workbook,
    :screen(:optional-screen(:$optional_screen))       = GdkScreen, 
    :geometry(:optional-geometry(:$optional_geometry)) = Str
  ) {
    samewith(
      :$optional_view,
      :$optional_wb,
      :$optional_screen,
      :$optional_geometry
    );
  }
  multi method new (
    WorkbookView() $optional_view,
    Workbook()     $optional_wb,
    GdkScreen()    $optional_screen,
    Str()          $optional_geometry
  ) {
    my $gnumeric-wbc-gtk = wbc_gtk_new(
      $optional_view,
      $optional_wb,
      $optional_screen,
      $optional_geometry
    );

    $gnumeric-wbc-gtk ?? self.bless( :$gnumeric-wbc-gtk ) !! Nil;
  }

  # Type: boolean
  method autosave-prompt is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('autosave-prompt', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('autosave-prompt', $gv);
      }
    );
  }

  # Type: int
  method autosave-time is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('autosave-time', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('autosave-time', $gv);
      }
    );
  }

  method attach_guru (GtkWidget() $guru) {
    wbc_gtk_attach_guru($!gwcg, $guru);
  }

  method attach_guru_with_unfocused_rs (
    GtkWidget()    $guru,
    GnmExprEntry() $gee
  ) {
    wbc_gtk_attach_guru_with_unfocused_rs($!gwcg, $guru, $gee);
  }

  method detach_guru {
    wbc_gtk_detach_guru($!gwcg);
  }

  method get_guru {
    wbc_gtk_get_guru($!gwcg);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &wbc_gtk_get_type, $n, $t );
  }

  method auto_complete_destroy {
    wbcg_auto_complete_destroy($!gwcg);
  }

  method copy_toolbar_visibility (WBCGtk() $wbcg) {
    wbcg_copy_toolbar_visibility($!gwcg, $wbcg);
  }

  method cur_scg ( :$raw = False ) {
    propReturnObject(
      wbcg_cur_scg($!gwcg),
      $raw,
      |Gnumeric::Sheet::Control::GUI.getTypePair
    );
  }

  method cur_sheet ( :$raw = False ) {
    propReturnObject(
      wbcg_cur_sheet($!gwcg),
      $raw,
      |Gnumeric::Sheet.getTypePair
    );
  }

  method edit_add_markup (PangoAttribute() $attr) {
    wbcg_edit_add_markup($!gwcg, $attr);
  }

  method edit_finish (Int() $result, Int() $showed_dialog) {
    my WBCEditResult $r = $result;
    my gboolean      $s = $showed_dialog.so.Int;

    wbcg_edit_finish($!gwcg, $r, $s);
  }

  method edit_get_display_text {
    wbcg_edit_get_display_text($!gwcg);
  }

  method edit_get_markup (Int() $full, :$raw = False) {
    my gboolean $f = $full.so.Int;

    propReturnObject(
      wbcg_edit_get_markup($!gwcg, $f),
      $raw,
      |Pango::AttrList.getTypePair;
    )
  }

  method edit_start (Int() $blankp, Int() $cursorp) {
    my gboolean ($b, $c) = ($blankp, $cursorp).so.Int;

    so wbcg_edit_start($!gwcg, $b, $c);
  }

  method entry_has_logical {
    so wbcg_entry_has_logical($!gwcg);
  }

  proto method find_for_workbook (|)
  { *}

  method find_for_workbook (
     $wb,
    :$candidate     = WBCGtk,
    :$pref_screen   = GdkScreen,
    :$pref_display  = GdkDisplay,
    :$raw           = False
  ) {
    samewith($wb, $candidete, $pref_screen, $pref_display, :$raw);
  }s
  method find_for_workbook (
    Workbook()    $wb,
    WBCGtk()      $candidate,
    GdkScreen()   $pref_screen,
    GdkDisplay()  $pref_display,
                 :$raw           = False
  ) {
    propReturnObject(
      wbcg_find_for_workbook($wb, $candidate, $pref_screen, $pref_display),
      $raw,
      |self.getTypePair
    );
  }

  method focus_cur_scg ( :$raw = False ) {
    propReturnObject(
      wbcg_focus_cur_scg($!gwcg),
      $raw,
      |Gnumeric::Sheet.getTypePair
    );
  }

  method focus_current_cell_indicator {
    wbcg_focus_current_cell_indicator($!gwcg);
  }

  # cw: Change to returnWidget ASAP!
  method get_entry ( :$raw = False ) {
    propReturnObject(
      wbcg_get_entry($!gwcg),
      $raw,
      |GTK::Entry.getTypePair
    );
  }

  method get_entry_logical ( :$raw = False ) {
    propReturnObject(
      wbcg_get_entry_logical($!gwcg),
      $raw,
      |Gnumeric::Expr::Entry.getTypePair
    )
  }

  # cw: Change to returnWidget ASAP!
  method get_entry_underlying ( :$raw = False ) {
    propReturnObject(
      wbcg_get_entry_underlying($!gwcg),
      $raw,
      |GTK::Widget.getTypePair
    );
  }

  method get_font_desc ( :$raw = False ) {
    propReturnObject(
      wbcg_get_font_desc($!gwcg),
      $raw,
      |Pango::FontDescription.getTypePair
    );
  }

  method get_n_scg {
    wbcg_get_n_scg($!gwcg);
  }

  method get_nth_scg (Int() $i) {
    my gint $ii = $i;

    return Nil unless $i ~~ 0 .. $.get_n_scg;

    propReturnObject(
      wbcg_get_nth_scg($!gwcg, $i),
      $raw,
      |Gnumeric::Sheet::Control::GUI.getTypePair
    );
  }

  method AT-POS (\k) {

  method insert_object (SheetObject() $so) {
    wbcg_insert_object($!gwcg, $so);
  }

  method insert_object_clear {
    wbcg_insert_object_clear($!gwcg);
  }

  method is_editing {
    so wbcg_is_editing($!gwcg);
  }

  method rangesel_possible {
    so wbcg_rangesel_possible($!gwcg);
  }

  method set_end_mode (Int() $flag) {
    my gboolean $f = $flag;

    wbcg_set_end_mode($!gwcg, $f);
  }

  method set_entry (GnmExprEntry() $new_entry) {
    wbcg_set_entry($!gwcg, $new_entry);
  }

  method set_status_text (Str() $text) {
    wbcg_set_status_text($!gwcg, $text);
  }

  method set_transient (GtkWindow() $window) {
    wbcg_set_transient($!gwcg, $window);
  }

  method toggle_visibility (GtkToggleAction() $action) {
    wbcg_toggle_visibility($!gwcg, $action);
  }

  method toplevel ( :$raw = False ) {
    propReturnObject(
      wbcg_toplevel($!gwcg),
      $raw,
      |GTK::Window.getTypePair
    );
  }

}
