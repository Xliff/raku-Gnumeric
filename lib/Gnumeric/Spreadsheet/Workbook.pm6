use v6.c;

use Method::Also;

use Gnumeric::Spreadsheet::Raw::Types;
use Gnumeric::Spreadsheet::Raw::Workbook;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

class Gnumeric::Spreadsheet::Workbook::Sheet {
  also does Positional;
  also does Associative;

  has $!w is built;

  method add (Int() $pos, Int() $columns, Int() $rows) {
    my gint  ($p, $c, $r) = ($pos, $columns, $rows);

    workbook_sheet_add($!w, $p, $c, $r);
  }

  method add_with_type (
    Int() $sheet_type,
    Int() $pos,
    Int() $columns,
    Int() $rows
  )
    is also<add-with-type>
  {
    my GnmSheetType  $s          =  $sheet_type;
    my gint         ($p, $c, $r) = ($pos, $columns, $rows);

    workbook_sheet_add_with_type($!w, $sheet_type, $pos, $columns, $rows);
  }

  method attach (Sheet() $new_sheet) {
    workbook_sheet_attach($!w, $new_sheet);
  }

  method attach_at_pos (Sheet() $new_sheet, Int() $pos)
    is also<attach-at-pos>
  {
    my gint $p = $pos;

    workbook_sheet_attach_at_pos($!w, $new_sheet, $p);
  }

  method by_index (Int() $i) is also<by-index> {
    my gint $ii = $i;

    return Nil unless $ii ~~ 0 .. $.count;

    workbook_sheet_by_index($!w, $i);
  }

  method AT-POS (\k) is also<AT_POS> {
    $.by_index(k);
  }

  method by_name (Str() $sheet_name) is also<by-name> {
    workbook_sheet_by_name($!w, $sheet_name);
  }

  method AT-KEY (\k) is also<AT_KEY> {
    $.by-name(k);
  }

  method count is also<elems> {
    workbook_sheet_count($!w);
  }

  method delete (Sheet() $s) {
    workbook_sheet_delete($!s);
  }

  method get_free_name (
    Str() $base,
    Int() $always_suffix,
    Int() $handle_counter
  )
    is also<get-free-name>
  {
    my gboolean $a = $always_suffix.so.Int;
    my gboolean $h = $handle_counter.so.Int;

    workbook_sheet_get_free_name($!w, $base, $a, $h);
  }

  method move (Sheet() $sheet, Int() $direction) {
    my gint $d = $direction;

    workbook_sheet_move($sheet, $d);
  }

  method rename (
    GSList()       $sheet_indices,
    GSList()       $new_names,
    GOCmdContext() $cc
  ) {
    workbook_sheet_rename($!w, $sheet_indices, $new_names, $cc);
  }

  multi method reorder (@no) {
    samewith( GLib::GSList.new(@no, typed => Sheet);
  }
  multi method reorder (GSList() $new_order) {
    workbook_sheet_reorder($!w, $new_order);
  }
}


our subset WorkbookSheetStateAncestry is export of Mu
  where WorkbookSheetState | GObject;

class Gnumeric::Spreadsheet::Workbook::Sheet::State {
  also does GLib::Roles::Object;

  has WorkbookSheetState $!wss is implementor;

  submethod BUILD ( :$gnumeric-worksheet ) {
    self.setWorkbookSheetState($gnumeric-worksheet)
      if $gnumeric-worksheet
  }

  method setWorkbookSheetState (WorkbookSheetStateAncestry $_) {
    my $to-parent;

    $!wss = do {
      when WorkbookSheetState {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WorkbookSheetState, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Sheet::Raw::Definitions::WorkbookSheetState
    is also<WorkbookSheetState>
  { $!wss }

  multi method new (
    $gnumeric-worksheet where * ~~ WorkbookSheetStateAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-worksheet;

    my $o = self.bless( :$gnumeric-worksheet );
    $o.ref if $ref;
    $o;
  }

  has Workbook $!w is built;

  submethod TWEAK ( :$workbook ) {
    $!w = $workbook if $workbook
  }

  method new ( :$workbook ) {
    my $gnumeric-sheet-state = workbook_sheet_state_new();

    $gnumeric-sheet-state
      ?? self.bless( :$gnumeric-sheet-state, :$workbook )
      !! Nil;
  }

  method diff (WorkbookSheetState() $wss_b) {
    workbook_sheet_state_diff($!wss, $wss_b);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &workbook_sheet_state_get_type, $n, $t );
  }

  method restore (
    workbook_sheet_state_restore($!w, $!wss);
  }

  method size {
    workbook_sheet_state_size($!wss);
  }

  method unref {
    workbook_sheet_state_unref($!wss);
  }
}

stant WS = Gnumeric::Spreadsheet::Workbook::Sheet;

class Gnumeric::Spreadsheet::Workbook::Iteration {
  has $!w is built;

  method enabled (Int() $enable) {
    my gboolean $e = $enable.so.Int;

    workbook_iteration_enabled($!w, $e);
  }

  method max_number (Int() $max_number) is also<max-number> {
    my gint $m = $max_number;

    workbook_iteration_max_number($!w, $m);
  }

  method tolerance (gnm_float $tolerance) {
    workbook_iteration_tolerance($!w, $tolerance);
  }
}

constant WI = Gnumeric::Spreadsheet::Workbook::Iteration;


our subset WorkbookAncestry is export of Mu
  where Workbook | GObject;

class Gnumeric::Spreadsheet::Workbook {
  also does GLib::Roles::Object;

  has Workbook $!w  is implementor;

  submethod BUILD ( :$gnumeric-worksheet ) {
    self.setWorkbook($gnumeric-worksheet)
      if $gnumeric-worksheet
  }

  method setWorkbook (WorkbookAncestry $_) {
    my $to-parent;

    $!w = do {
      when Workbook {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(Workbook, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Sheet::Raw::Definitions::Workbook
    is also<Workbook>
  { $!w }

  multi method new (
    $gnumeric-worksheet where * ~~ WorkbookAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-worksheet;

    my $o = self.bless( :$gnumeric-worksheet );
    $o.ref if $ref;
    $o;
  }

  has WI       $!wi               ;
  has WS       $!ws               ;
  has WSS      $!wss              ;

  submethod TWEAK {
    $!ws = WS.new( w => $!w );
    $!wi = WI.new( w => $!w );
  }

  method sheet     { $!ws }
  method iteration { $!wi }

  method sheet-state is also<sheet_state> {
    unless $!wss {
      $!wss = WSS.new( w => $!w );
    }
    $!wss;
  }

  method new {
    my $gnumeric-workbook = workbook_new();

    $gnumeric-workbook ?? self.bless( :$gnumeric-workbook ) !! Nil;
  }

  method new_with_sheets (Int() $count) is also<new-with-sheets> {
    my gint $c = $count;

    my $gnumeric-workbook = workbook_new_with_sheets($!w, $c);

    $gnumeric-workbook ?? self.bless( :$gnumeric-workbook ) !! Nil;
  }

  method attach_view (WorkbookView() $view) is also<attach-view> {
    workbook_attach_view($view);
  }

  # Type: boolean
  method recalc-mode is rw  is g-property is also<recalc_mode>
    is also<recalc_mode>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('recalc-mode', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('recalc-mode', $gv);
      }
    );
  }

  # Type: boolean
  method being-loaded is rw  is g-property is also<being_loaded>
    is also<being_loaded>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('being-loaded', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('being-loaded', $gv);
      }
    );
  }

  method Sheet-Order-Changed is also<Sheet_Order_Changed> {
    self.connect($!w, 'sheet_order_changed');
  }

  method Sheet-Added is also<Sheet_Added> {
    self.connect($!w, 'sheet_added');
  }

  method Sheet-Deleted is also<Sheet_Deleted> {
    self.connect($!w, 'sheet_deleted');
  }

  method cells (Int() $comments, Int() $vis, :$recalc-moderaw = False) {
    my gboolean           $c = $comments.so.Int;
    my GnmSheetVisibility $v = $vis;

    my $o = propReturnObject(
      workbook_cells($!w, $c, $vis),
      $raw,
      |GLib::Array::Pointer.getTypePair
    );
    return $o if $raw;
    $o.setTypePair( |Gnumeric::Spreadsheet::Cell.getTypePair );
    $o.setRaw($raw);
    $o
  }

  method date_conv is also<date-conv> {
    workbook_date_conv($!w);
  }

  method detach_view (WorkbookView() $view) is also<detach-view> {
    workbook_detach_view($view);
  }

  method enable_recursive_dirty (Int() $enable)
    is also<enable-recursive-dirty>
  {
    my gboolean $e = $enable.so.Int;

    workbook_enable_recursive_dirty($!w, $e);
  }

  method find_command (Int() $is_undo, gpointer $cmd) is also<find-command> {
    my gboolean $i = $is_undo.so.Int;

    workbook_find_command($!w, $i, $cmd);
  }

  method foreach_cell_in_range (
    GnmEvalPos()  $pos,
    GnmValue()    $cell_range,
    Int()         $flags,
                  &handler,
    gpointer      $closure     = gpointer
  )
    is also<foreach-cell-in-range>
  {
    my CellIterFlags $f = $flags;

    workbook_foreach_cell_in_range($!w, $cell_range, $f, &handler, $closure);
  }

  method foreach_name (
    Int()    $globals_only,
             &func,
    gpointer $data          = gpointer
  )
    is also<foreach-name>
  {
    my gboolean $g = $globals_only.so.Int;

    workbook_foreach_name($!w, $g, &func, $data);
  }

  method get_file_exporter ( :$raw = False ) is also<get-file-exporter> {
    propReturnObject(
      workbook_get_file_exporter($!w),
      $raw,
      |GOffice::FileSaver.getTypePair
    );
  }

  method get_file_saver ( :$raw = False ) is also<get-file-saver> {
    propReturnObject(
      workbook_get_file_saver($!w),
      $raw,
      |GOffice::FileSaver.getTypePair
    );
  }

  method get_last_export_uri is also<get-last-export-uri> {
    workbook_get_last_export_uri($!w);
  }

  method get_recalcmode is also<get-recalcmode> {
    workbook_get_recalcmode($!w);
  }

  method get_sheet_size is also<get-sheet-size> {
    workbook_get_sheet_size($!w);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(self.^name, &workbook_get_type, $n, $t );
  }

  method mark_dirty is also<mark-dirty> {
    workbook_mark_dirty($!w);
  }

  method optimize_style is also<optimize-style> {
    workbook_optimize_style($!w);
  }

  method recalc {
    workbook_recalc($!w);
  }

  method recalc_all is also<recalc-all> {
    workbook_recalc_all($!w);
  }

  method set_1904 (Int() $base1904) is also<set-1904> {
    my gboolean $b = $base1904.so.Int;

    workbook_set_1904($!w, $b);
  }

  method set_date_conv (GODateConventions $date_conv) is also<set-date-conv> {
    workbook_set_date_conv($!w, $date_conv);
  }

  method set_file_exporter (GOFileSaver() $fs) is also<set-file-exporter> {
    workbook_set_file_exporter($!w, $fs);
  }

  method set_last_export_uri (Str() $uri) is also<set-last-export-uri> {
    workbook_set_last_export_uri($!w, $uri);
  }

  method set_recalcmode (Int() $enable) is also<set-recalcmode> {
    my gboolean $e = $enable.so.Int;

    workbook_set_recalcmode($!w, $e);
  }

  method set_saveinfo (Int() $lev, GOFileSaver() $saver)
    is also<set-saveinfo>
  {
    my GOFileFormatLevel $l = $lev;

    workbook_set_saveinfo($!w, $l, $saver);
  }

  method share_expressions (Int() $freeit) is also<share-expressions> {
    my gboolean $f = $freeit.so.Int;

    workbook_share_expressions($!w, $f);
  }

  method sheets ( :$raw = False ) {
    my $o = propReturnObject(
      workbook_sheets($!w),
      $raw,
      |GLib::Array::Pointer.getTypePair
    );
    return $o if $raw;
    $o.setTypePair( |Gnumeric::Spreadsheet::Sheet.getTypePair );
    $o.setRaw($raw);
    $o
  }

  method update_graphs is also<update-graphs> {
    workbook_update_graphs($!w);
  }

  method update_history (Int() $type) is also<update-history> {
    my GnmFileSaveAsStyle $t = $type;

    workbook_update_history($!w, $t);
  }

}
