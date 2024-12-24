/use v6.c;

use NativeCall;
use Method::Also;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Sheet;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Gnumeric::Sheet::Cell {
  has $!gs is built;

  method create ( Int() $col, Int() $row) {
    my gint ($c, $r) = ($columns, $rows);

    sheet_cell_create($!gs, $col, $row);
  }

  method fetch (Int() $col, Int() $row, :$raw = False) {
    my gint ($c, $r) = ($columns, $rows);

    propReturnObject(
      sheet_cell_fetch($!gs, $col, $row),
      $raw,
      |Gnumeric::Cell.getTypePair
    );
  }

  method foreach (GHFunc $callback, gpointer $data = gpointer) {
    sheet_cell_foreach($!gs, $callback, $data);
  }

  method get (Int() $col, Int() $row, :$raw = False) {
    my gint ($c, $r) = ($columns, $rows);

    propReturnObject(
      sheet_cell_get($!gs, $col, $row),
      $raw,
      |Gnumeric::Cell.getTypePair
    );
  }

  method get_value (Int() $col, Int() $row, :$raw = False) is also<get-value> {
    my gint ($c, $r) = ($columns, $rows);

    propReturnObject(
      sheet_cell_get_value($!gs, $col, $row),
      $raw,
      |Gnumeric::Value.getTypePair
    );
  }

  method positions (Int() $comments, :$raw = False) {
    my gboolean $c = $comments.so.Int;

    propReturnObject(
      sheet_cell_positions($!gs, $comments),
      $raw,
      |GLib::Pointer::Array.getTypePair
    )
  }

  method queue_respan (GnmCell() $c) is static is also<queue-respan> {
    sheet_cell_queue_respan($c);
  }

  method remove (
    GnmCell()  $cell,
    Int()     :$redraw                               = True,
    Int()     :recalc(:queue-recalc(:$queue_recalc)) = True
  ) {
    samewith($cell, $redraw, $queue_recalc);
  }
  method remove (
    GnmCell() $cell,
    Int()     $redraw,
    Int()     $queue_recalc
  ) {
    my gboolean ($r, $q) =* ($redraw, $queue_recalc).map( *.so.Int );

    sheet_cell_remove($!gs, $cell, $r, $q);
  }

  method set_expr (GnmCell() $cell, GnmExprTop() $texpr)
    is static

    is also<set-expr>
  {
    sheet_cell_set_expr($cell, $texpr);
  }

  method set_text (
    GnmCell()       $cell,
    Str()           $str,
    PangoAttrList() $markup
  )
    is also<set-text>
  {
    sheet_cell_set_text($cell, $str, $markup);
  }

  method set_text_gi (Int() $col, Int() $row, Str() $str)
    is also<set-text-gi>
  {
    my gint ($c, $r) = ($columns, $rows);

    sheet_cell_set_text_gi($!gs, $col, $row, $str);
  }

  method set_value (GnmCell()  $cell, GnmValue() $v)
    is also<set-value>
  {
    sheet_cell_set_value($cell, $v);
  }

  method count {
    sheet_cells_count($!gs);
  }
}

class Gnumeric::Sheet::Col {
  has $!gs is built;

  method delete ($col, $cc, $count = 1) {
    $!gs.delete_cols($col, $count, $cc);
  }

  method fetch (Int() $col) {
    my gint $c = $col;

    sheet_col_fetch($!gs, $c);
  }

  method get (Int() $col) {
    my gint $c = $col;

    sheet_col_get($!gs, $c);
  }

  method get_default_size_pixels is also<get-default-size-pixels> {
    sheet_col_get_default_size_pixels($!gs);
  }

  method get_default_size_pts is also<get-default-size-pts> {
    sheet_col_get_default_size_pts($!gs);
  }

  method get_distance_pixels (Int() $from, Int() $to)
    is also<get-distance-pixels>
  {
    my gint ($f, $t) = ($from, $to);

    sheet_col_get_distance_pixels($!gs, $f, $t);
  }

  method get_distance_pts (Int() $from, Int() $to) is also<get-distance-pts> {
    my gint ($f, $t) = ($from, $to);

    sheet_col_get_distance_pts($!gs, $f, $t);
  }

  method get_info (Int() $col) is also<get-info> {
    my gint $ = $col;

    sheet_col_get_info($!gs, $c);
  }

  multi method insert (
    Int()           $col,
    GOCmdContext()  $cc,
    Int()          :$count = 1,
    CArray[GOUndo] :$pundo = newCArray(GOUndo)
  ) {
    $!gs.insert_cols($col, $count, $pundo, $cc);
  }

  method is_hidden (Int() $col) is also<is-hidden> {
    my gint $ = $col;

    sheet_col_is_hidden($!gs, $c);
  }

  method set_default_size_pixels (Int() $width_pixels)
    is also<set-default-size-pixels>
  {
    my gint $w = $width_pixels;

    sheet_col_set_default_size_pixels($!gs, $w);
  }

  method set_default_size_pts (Num() $width_pts)
    is also<set-default-size-pts>
  {
    my gdouble $w = $width_pts;

    sheet_col_set_default_size_pts($!gs, $width_pts);
  }

  method set_size_pixels (
    Int() $col,
    Int() $width_pixels,
    Int() $set_by_user
  )
    is also<set-size-pixels>
  {
    my gint     ($c, $w) = ($col, $width_pixels);
    my gboolean  $s      =  $set_by_user.so.Int;

    sheet_col_set_size_pixels($!gs, $c, $w, $s);
  }

  method set_size_pts (
    Int() $col,
    Num() $width_pts,
    Int() $set_by_user
  )
    is also<set-size-pts>
  {
    my gint     $c = $col;
    my gdouble  $w = $width_pts;
    my gboolean $s =  $set_by_user.so.Int;

    sheet_col_set_size_pts($!gs, $c, $w, $s);
  }

  method size_fit_pixels (
    Int() $col,
    Int() $srow,
    Int() $erow,
    Int() $ignore_strings
  )
    is also<size-fit-pixels>
  {
    my gint     ($c, $s, $e) = ($col, $srow, $erow);
    my gboolean  $i           = $ignore_strings.so.Int;

    sheet_col_size_fit_pixels($!gs, $c, $s, $e, $i);
  }
}

class Gnumeric::Sheet::ColRow {
  has $!gs is built;

  proto method can_group (|)
    is also<can-group>
  { * }

  method can_group ($r, :c(:col(:$column)) = False) {
    samewith($r, $column);
  }
  method can_group (GnmRange() $r, Int() $is_cols) {
    my gboolean $i = $is_cols.so.Int;

    sheet_colrow_can_group($!gs, $r, $i);
  }

  proto method copy_info (|)
    is also<copy-info>
  { * }

  multi method copy_info (
     $colrow,
     $cri,
    :$raw              = False
    :c(:col(:$column)) = False,
  ) {
    samewith($colrow, $column, $cri);
  }
  multi method copy_info (
    Int()         $colrow,
    Int()         $is_cols,
    ColRowInfo()  $cri,
                 :$raw      = False
  ) {
    my gboolean $i = $is_cols.so.Int;

    propReturnObject(
      sheet_colrow_copy_info($!gs, $colrow, $i, $cri),
      $raw,
      |Gnumeric::ColRowInfo.getTypePair
    );
  }

  multi method fetch ($colrow, :c(:col(:$column)) = False, :$raw = False) {
    samewith($colrow, $column, ;$raw);
  }
  multi method fetch (Int() $colrow, Int() $is_cols, :$raw = False) {
    my gint     $c = $colrow;
    my gboolean $i = $is_cols.so.Int;

    propReturnObject(
      sheet_colrow_fetch($!gs, $colrow, $is_cols),
      $raw,
      |Gnumeric::ColRowInfo.getTypePair
    );
  }

  multi method foreach (
    Int()    $first,
    Int()    $last,
             &callback,            #= ColRowHandler
    gpointer $user_data = gpointer,
             :c(:col(:$column)) = False
  ) {
    samewith($column, $first, $last, &callback, $user_data);
  }
  multi method foreach (
    Int()    $is_cols,
    Int()    $first,
    Int()    $last,
             &callback,            #= ColRowHandler
    gpointer $user_data = gpointer
  ) {
    my gint     ($f, $l) = ($first, $last)
    my gboolean  $i      = $is_cols.so.Int;

    sheet_colrow_foreach($!gs, $i, $f, $l, &callback, $user_data);
  }

  multi method get (
    Int()  $colrow,
          :$raw              = False
          :c(:col(:$column)) = False,
  ) {
    samewith($colrow, $column, :$raw);
  }
  multi method get (Int() $colrow, Int() $is_cols, :$raw = False) {
    my gint     $c = $colrow,
    my gboolean $i = $is_cols.so.Int;

    propReturnObject(
      sheet_colrow_get($!gs, $colrow, $is_cols),
      $raw,
      |Gnnumeric::ColRowInfo.getTypePair
    );
  }

  proto method get_default (|)
    is also<get-default>
  { * }

  method get_default ( :c(:col(:$column)) = False, :$raw = False ) {
    samewith($column);
  }
  method get_default (Int() $is_cols, :$raw = False) {
    my gboolean $i = $is_cols.so.Int;

    propReturnObject(
      sheet_colrow_get_default($!gs, $is_cols),
      $raw,
      |Gnumeric::ColRowInfo.getTypePair
    )
  }

  proto method get_distance_pixels (|)
    is also<get-distance-pixels>
  { * }

  method get_distance_pixels ($from, $to, :c(:col(:$column)) = False) {
    samewith($column, $from, $to);
  }
  method get_distance_pixels (Int() $is_cols, Int() $from, Int() $to) {
    my gboolean  $i      =  $is_cols.so.Int;
    my gint     ($f, $t) = ($first, $to)

    sheet_colrow_get_distance_pixels($!gs, $is_cols, $from, $to);
  }

  proto method get_info (|)
    is also<get-info>
  { * }

  multi method get_info ($colrow, :c(:col(:$column)) = False, :$raw = False) {
    samewith($colrow, $column, :$raw);
  }
  multi method get_info (
    Int()  $colrow,
    Int()  $is_cols,
          :$raw      = False
  ) {
    my gint     $c = $colrow;
    my gboolean $i = $is_cols.so.Int;

    propReturnObject(
      sheet_colrow_get_info($!gs, $colrow, $is_cols),
      $raw,
      |Gnumeric::ColRowInfo.getTypePair
    );
  }

  proto method group_ungroup (|)
    is also<group-ungroup>
  { * }

  multi method group_ungroup ($r, $inc, :c(:col(:$column)) = False) {
    samewith($r, $column, $inc);
  }
  multi method group_ungroup (
    GnmRange() $r,
    Int()      $is_cols,
    Int()      $inc
  ) {
    my gboolean $i = $is_cols.so.Int;
    my gboolean $c = $inc.so.Int;

    sheet_colrow_group_ungroup($!gs, $r, $i, $i);
  }

  multi method gutter ($max_outline, :c(:col(:$column)) = False) {
    samewith($column, $max_outline);
  }
  multi method gutter (Int() $is_cols, Int() $max_outline) {
    my gint     $m = $max_outline;
    my gboolean $i = $is_cols.so.Int;

    sheet_colrow_gutter($!gs, $i, $m);
  }

  method optimize {
    sheet_colrow_optimize($!gs);
  }
}

class Gnumeric::Sheet::Flag {
  has $!gs is built;

  has $!status;
  has $!style;

  method recompute_spans is also<recompute-spans> {
    sheet_flag_recompute_spans($!gs);
  }

  method status {
    unless $!status {
      my \T = class :: {
        has $!gs is built;

        method update_cell (GnmCell() $c) is static is also<update-cell> {
          sheet_flag_status_update_cell($c);
        }

        method update_range (GnmRange() $range) is also<update-range> {
          sheet_flag_status_update_range($!gs, $range);
        }
      }

      $!status = T.new( gs => $!gs );
    }
    $!status;
  }

  method style {
    unless $!style {
      my \T = class :: {
        has $!gs is built;

        method update_range (GnmRange() $range) is also<update-range> {
          sheet_flag_style_update_range($!gs, $range);
        }
      }

      $!style = T.new( gs => $!gs );
    }
    $!style;
  }
}

class Gnumeric::Sheet::Range {
  has $!gs is built;

  method bounding_box (GnmRange() $r) is also<bounding-box> {
    sheet_range_bounding_box($!gs, $r);
  }

  method calc_spans (GnmRange() $r, Int() $flags) is also<calc-spans> {
    my GnmSpanCalcFlags $f = $flags;

    sheet_range_calc_spans($!gs, $r, $f);
  }

  proto method contains_merges_or_arrays (|)
    is also<contains-merges-or-arrays>
  { * }

  method contains_merges_or_arrays (
    GnmRange()      $r,
    Str()           $cmd,
    GOCmdContext() :$cc                   = GOCmdContext,
    Int()          :arr(:array(:$arrays)) = False
  ) {
    samewith($r, $cmd, $cc, $arrays.not, $arrays);
  }
  method contains_merges_or_arrays (
    GnmRange()     $r,
    GOCmdContext() $cc,
    Str()          $cmd,
    Int()          $merges,
    Int()          $amethod update_range (GnmRange() $range) {
          sheet_flag_style_update_range($!gs, $range);
        }rrays
  ) {
    my gboolean ($m, $a) = ($merges, $arrays).map( *.so.Int);

    so sheet_range_contains_merges_or_arrays($!gs, $r, $cc, $cmd, $m, $a);
  }

  method flag {
    $!gs-flag = Gnumeric::Sheet::Flag.new( gs => $!gs ) unless $!gs-flag;
    $!gs-flag;
  }

  method has_heading (GnmRange() $src, Int() $top, Int() $ignore_styles)
    is also<has-heading>
  {
    my gboolean ($t, $i) = ($top, $ignore_styles).map( *.so.Int );

    so sheet_range_has_heading($!gs, $src, $top, $ignore_styles);
  }

  method set_expr_undo (GnmExprTop() $texpr)
    is static
    is also<set-expr-undo>
  {
    sheet_range_set_expr_undo($sr, $texpr);
  }

  method set_markup_undo (GnmSheetRange() $range, PangoAttrList() $markup)
    is static
    is also<set-markup-undo>
  {
    propReturnObject(
      sheet_range_set_markup_undo($range, $markup),
      $raw,
      |GOffice::Undo.getTypePair
    );
  }

  # cw: Method on GnmRange?
  method set_text (GnmRange() $r, Str() $str)
    is static
    is also<set-text>
  {
    sheet_range_set_text($p, $r, $str);
  }

  method set_text_undo (Str() $text, :$raw = False)
    is static
    is also<set-text-undo>
  {
    propReturnObject(
      sheet_range_set_text_undo($sr, $text),
      $raw,
      |GOffice::Undo.getTypePair
    );
  }

  proto method splits_array (|)
    is also<splits-array>
  { * }

  multi method splits_array (
     $r,
    :$ignore       = GnmRange,
    :context(:$cc) = GOCmdContext,
    :$cmd          = Str
  ) {
    samewith($r, $ignore, $cc, $cmd);
  }
  multi method splits_array (
    GnmRange()     $r,
    GnmRange()     $ignore,
    GOCmdContext() $cc,
    Str()          $cmd
  ) {
    so sheet_range_splits_array($!gs, $r, $ignore, $cc, $cmd);
  }

  proto method splits_region (|)
    is also<splits-region>
  { * }

  multi method splits_region (
     $r,
    :$ignore       = GnmRange,
    :context(:$cc) = GOCmdContext,
    :$cmd          = Str
  ) {
    samewith($r, $ignore, $cc, $cmd);
  }
  multi method splits_region (
    GnmRange()     $r,
    GnmRange()     $ignore,
    GOCmdContext() $cc,
    Str()          $cmd
  ) {
    sheet_range_splits_region($!gs, $r, $ignore, $cc, $cmd);
  }

  method trim (GnmRange() $r, Int() $cols, Int() $rows) {
    my gboolean ($c, $r) = ($cols, $rows).map( *.so.Int );

    sheet_range_trim($!gs, $r, $c, $r);
  }

  method unrender (GnmRange() $r) {
    sheet_range_unrender($!gs, $r);
  }

  proto method split_region (|)
    is also<split-region>
  { * }

  multi method split_region (@ranges, $cc, $cmd) {
    samewith( GLib:::GSList.new(@ranges, typed => GnmRange), $cc, $cmd );
  }
  multi method split_region (
    GSList()       $ranges,
    GOCmdContext() $cc,
    Str()          $cmd
  ) {
    sheet_ranges_split_region($!gs, $ranges, $cc, $cmd);
  }
}

class Gnumeric::Sheet::Row {
  has $!gs is built;

  method delete (
     $row,
     $cc,
     $count = 1,
    :$pundo = newCArray(GOUndo),
    :$raw   = False,
    :$all   = False
  ) {
    $!rs.delete_rows($row, $cc, $count, :$pundo, :$raw, :$all);
  }

  method fetch (Int() $row, :$raw = False) {
    my gint $r = $row;

    propReturnObject(
      sheet_row_fetch($!gs, $row),
      $raw,
      |Gnumeric::Cell.getTypePair
    )
  }

  method get (Int() $row, :$raw = False) {
    my gint $r = $row;

    propReturnObject(
      sheet_row_get($!gs, $row),
      $raw,
      |Gnumeric::Cell.getTypePair
    )
  }

  method get_default_size_pixels is also<get-default-size-pixels> {
    sheet_row_get_default_size_pixels($!gs);
  }

  method get_default_size_pts is also<get-default-size-pts> {
    sheet_row_get_default_size_pts($!gs);
  }

  method get_distance_pixels (Int() $from, Int() $to) {
    my gint ($f, $t) = ($from, $to);

    sheet_row_get_distance_pixels($!gs, $f, $t);
  }

  method get_distance_pts (Int() $from, Int() $to) is also<get-distance-pts> {
    my gint ($f, $t) = ($from, $to);

    sheet_row_get_distance_pts($!gs, $f, $t);
  }

  method get_info (Int() $row, :$raw = False) {
    my gint $r = $row;

    propReturnObject(
      sheet_row_get_info($!gs, $row),
      $raw,
      |Gnumeric::CelRowInfo.getTypePair
    );
  }

  multi method insert (
    Int()           $row,
    GOCmdContext()  $cc,
    Int()          :$count = 1,
    CArray[GOUndo] :$pundo = newCArray(GOUndo)
  ) {
    $!gs.insert_rows($row, $count, $pundo, $cc);
  }

  method is_hidden (Int() $row) is also<is-hidden> {
    my gint $r = $row;

    so sheet_row_is_hidden($!gs, $row);
  }

  method set_default_size_pixels (Int() $height_pixels)
    is also<set-default-size-pixels>
  {
    my gint $h = $height_pixels;

    sheet_row_set_default_size_pixels($!gs, $height_pixels);
  }

  method set_default_size_pts (Num() $height_pts)
    is also<set-default-size-pts>
  {
    my gdouble $h = $height_pts;

    sheet_row_set_default_size_pts($!gs, $h);
  }

  method set_size_pixels (
    Int() $row,
    Int() $height_pixels,
    Int() $set_by_user
  )
    is also<set-size-pixels>
  {
    my gint     $r = $row;
    my gint     $h = $height_pixels;
    my gboolean $s =  $set_by_user.so.Int;

    sheet_row_set_size_pixels($!gs, $r, $h, $s);
  }

  method set_size_pts (
    Int() $row,
    Num() $height_pts,
    Int() $set_by_user
  )
    is also<set-size-pts>
  {
    my gint     $r = $row;
    my gdouble  $h = $height_pts;
    my gboolean $s = $set_by_user.so.Int;

    sheet_row_set_size_pts($!gs, $r, $h, $s);
  }

  method size_fit_pixels (
    Int() $row,
    Int() $scol,
    Int() $ecol,
    Int() $ignore_strings
  )
    is also<size-fit-pixels>
  {
    my gint      ($r, $s, $e) = ($row, $scol, $ecol);
    my gboolean   $i          =  $ignore_strings.so.Int;

    sheet_row_size_fit_pixels($!gs, $r, $s, $e, $i);
  }

}

class Gnumeric::Sheet::Scenario {
  has $!gs is built;

  method add (GnmScenario() $sc) {
    gnm_sheet_scenario_add($!gs, $sc);
  }

  method find (Str() $name, :$raw = False) {
    propReturnObject(
      gnm_sheet_scenario_find($!gs, $name),
      $raw,
      |Gnumeric::Scenario.getTypePair
    );
  }

  method new (Str() $name, :$raw = False) {
    propReturnObject(
      gnm_sheet_scenario_new($!gs, $name),
      $raw,
      |Gnumeric::Scenario.getTypePair
    );
  }

  method remove (GnmScenario() $sc) {
    gnm_sheet_scenario_remove($!gs, $sc);
  }
}


our subset SheetAncestry is export of Mu
  where Sheet | GObject;

class Gnumeric::Sheet {
  also does GLib::Roles::Object;

  has Sheet $!gs is implementor;

  submethod BUILD ( :$gnumeric-sheet ) {
    self.setSheet($gnumeric-sheet) if $gnumeric-sheet
  }

  method setSheet (SheetAncestry $_) {
    my $to-parent;

    $!gs = do {
      when Sheet {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(Sheet, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Gnumeric::Raw::Definitions::Sheet
    is also<
      GnmSheet
      Sheet
    >
  { $!gs }

  multi method new ($gnumeric-sheet where * ~~ SheetAncestry, :$ref = True) {
    return unless $gnumeric-sheet;

    my $o = self.bless( :$gnumeric-sheet );
    $o.ref if $ref;
    $o;
  }

  has $!gs-cell;
  has $!gs-col;
  has $!gs-colrow;
  has $!gs-range;
  has $!gs-row;
  has $!gs-scenario;

  method new (
    Workbook() $wb,
    Str()      $name,
    Int()      $columns = 255,
    Int()      $rows    = 255
  ) {
    my gint ($c, $r) = ($columns, $rows);

    my $gnumeric-sheet = sheet_new($wb, $name, $c, $r);

    $gnumeric-sheet ?? self.bless( :$gnumeric-sheet ) !! Nil;
  }

  method new_with_type (
    Workbook() $wb,
    Str()      $name,
    Int()      $type,
    Int()      $columns,
    Int()      $rows
  )
    is also<new-with-type>
  {
    my gint         ($c, $r) = ($columns, $rows);
    my GnmSheetType  $t      =  $type;

    my $gnumeric-sheet =  sheet_new_with_type($wb, $name, $t, $c, $r);

    $gnumeric-sheet ?? self.bless( :$gnumeric-sheet ) !! Nil;
  }

  method apply_border (GnmRange() $range, GnmBorder() $borders)
    is also<apply-border>
  {
    sheet_apply_border($!gs, $range, $borders);
  }

  method apply_style (GnmRange() $range, GnmStyle() $style)
    is also<apply-style>
  {
    sheet_apply_style($!gs, $range, $style);
  }

  method apply_style_gi (GnmRange() $range, GnmStyle() $style)
    is also<apply-style-gi>
  {
    sheet_apply_style_gi($!gs, $range, $style);
  }

  method apply_style_undo (
    GnmSheetRange()  $sr,
    GnmStyle()       $style,
                    :$raw     = False
  )
    is static
    is also<apply-style-undo>
  {
    propReturnObject(
      sheet_apply_style_undo($sr, $style),
      $raw,
      |GOffice::Undo.getTypePair
    );
  }

  method cell {
    $!gs-cell = Gnumeric::Sheet::Cell.new( gs => $!gs )
      unless $!gs-cell

    $!gs-cell;
  }

  method cells (GnmRange() $r) {
    propReturnObject(
      sheet_cells($!gs, $r),
      $raw,
      |GLib::Array::Pointer.getTypePair
    );
  }

  method clear_region (
    Int()          $start_col,
    Int()          $start_row,
    Int()          $end_col,
    Int()          $end_row,
    Int()          $clear_flags,
    GOCmdContext() $cc
  )
    is also<clear-region>
  {
    my gint ($sc, $sr, $ec, $er) =
      ($start_col, $start_row, $end_col, $end_row);

    my SheetClearFlags $c = $clear_flags;

    sheet_clear_region($!gs, $sc, $sr, $ec, $er, $c, $cc);
  }

  method clear_region_undo (GnmSheetRange() $sr, Int() $clear_flags)
    is static
    is also<clear-region-undo>
  {
    my SheetClearFlags $c = $clear_flags;

    sheet_clear_region_undo($sr, $c);
  }

  method col {
    $!gs-col = Gnumeric::Sheet::Col.new( gs => $!gs )
      unless $!gs-col;

    $!gs-col;
  }

  method colrow {
    $!gs-colrow = Gnumeric::Sheet::ColRow.new( gs => $!gs )
      unless $!gs-colrow;

    $!gs-colrow;
  }

  method date_conv ( :$raw = False ) is also<date-conv> {
    propReturnObject(
      sheet_date_conv($!gs),
      $raw,
      |GOffice::Date::Conventions.getTypePair
    );
  }

  proto method delete_cols (|)
    is also<delete-cols>
  { * }

  method delete_cols (
     $col,
     $cc,
     $count = 1,
    :$pundo = newCArray(GOUndo),
    :$raw   = False,
    :$all   = False
  ) {
    samewith($col, $count, $pundo, $cc, :$raw, :$all);
  }
  method delete_cols (
    Int()           $col,
    Int()           $count,
    CArray[GOUndo]  $pundo,
    GOCmdContext()  $cc,
                   :$raw = False,
                   :$all = False
  ) {
    my gint ($c, $n) = ($col, $count);

    my $res = sheet_delete_cols($!gs, $c, $n, $pundo, $cc);
    my $ru  = $pundo;
    if $all && $raw.not {
      $ru = propReturnObject(
        ppr($pundo),
        False,
        |GOffice::Undo.getTypePair
      );
    }
    $all.not ?? $res !! ($res, $ru);
  }

  proto method delete_cols (|)
    is also<delete-cols>
  { * }

  multi method delete_cols (
     $rol,
     $cc,
     $count = 1,
    :$pundo = newCArray(GOUndo),
    :$raw   = False,
    :$all   = False
  ) {
    samewith($col, $count, $pundo, $cc, :$raw, :$all);
  }
  multi method delete_rows (
    Int()           $row,
    Int()           $count,
    CArray[GOUndo]  $pundo,
    GOCmdContext    $cc,
                   :$raw = False,
                   :$all = False
  )
    is also<delete-rows>
  {
    my gint ($r, $n) = ($row, $count);

    my $res = sheet_delete_rows($!gs, $row, $count, $pundo, $cc);
    my $ru  = $pundo;
    if $all && $raw.not {
      $ru = propReturnObject(
        ppr($pundo),
        False,
        |GOffice::Undo.getTypePair
      );
    }
    $all.not ?? $res !! ($res, $ru);
  }

  method destroy_contents is also<destroy-contents> {
    sheet_destroy_contents($!gs);
  }

  method dup {
    sheet_dup($!gs);
  }

  proto method find_boundary_horizontal (|)
    is also<find-boundary-horizontal>
  { * }

  multi method find_boundary_horizontal (
     $col,
     $move_row,
     $base_row,
    :jump-to-boundaries(:jump_to_boundaries(:$jump))) = False,
    :$count                                           = $jump ?? 1 !! 0
  ) {
    samewith($col, $move_row, $base_row, $count, $jump);
  }
  multi method find_boundary_horizontal (
    Int() $col,
    Int() $move_row,
    Int() $base_row,
    Int() $count,
    Int() $jump_to_boundaries
  ) {
    my gint     ($c, $mr, $br, $c) = ($col, $move_row, $base_row, $count);
    my gboolean  $j                =  $jump_to_boundaries.so.Int;

    sheet_find_boundary_horizontal($!gs, $c, $mr, $br, $c, $j);
  }

  proto method find_boundary_vertical (|)
    is also<find-boundary-vertical>
  { * }

  method find_boundary_vertical (
     $move_col,
     $row,
     $base_col,
    :jump-to-boundaries(:jump_to_boundaries(:$jump))) = False,
    :$count                                           = $jump ?? 1 !! 0
  ) {
    samewith($move_col, $row, $base_col, $count, $jump);
  }
  method find_boundary_vertical (
    Int() $move_col,
    Int() $row,
    Int() $base_col,
    Int() $count,
    Int() $jump_to_boundaries
  ) {
    my gint     ($r, $mc, $bc, $c) = ($row, $move_col, $base_col, $count);
    my gboolean  $j                =  $jump_to_boundaries.so.Int;

    sheet_find_boundary_vertical($!gs, $mc, $r, $bc, $c, $jump_to_boundaries);
  }

  proto method foreach_cell_in_range (|)
    is also<foreach-cell-in-range>
  { * }

  multi method foreach_cell_in_range (
     $r,
     &callback,             #= CellIterFunc
     $closure   = gpointer
    :$flags     = 0
  ) {
    samewith($flags, $r, &callback, $closure);
  }
  multi method foreach_cell_in_range (
    Int()      $flags,
    GnmRange() $r,
               &callback,            #= CellIterFunc
    gpointer   $closure   = gpointer
  ) {
    my CellIterFlags $f = $flags;

    sheet_foreach_cell_in_range($!gs, $f, $r, &callback, $closure);
  }

  method foreach_cell_in_region (
     $start_col,
     $start_row,
     $end_col,
     $end_row,
     &callback,              #= CellIterFunc
     $closure    = gpointer
    :$flags      = 0
  )
    is also<foreach-cell-in-region>
  {
    samewith(
      $flags,
      $start_col,
      $start_row,
      $end_col,
      $end_row
      &callback,
      $closure
    );
  }
  method foreach_cell_in_region (
    Int()    $flags,
    Int()    $start_col,
    Int()    $start_row,
    Int()    $end_col,
    Int()    $end_row,
             &callback,              #= CellIterFunc
    gpointer $closure    = gpointer
  )
    is also<foreach-cell-in-region>
  {
    my CellIterFlags $f = $flags;

    my gint ($sc, $sr, $ec, $er) =
      ($start_col, $start_row, $end_col, $end_row);


    sheet_foreach_cell_in_region(
      $!gs,
      $f,
      $sc, $sr, $ec, $er
      &callback,
      $closure
    );
  }

  method freeze_object_views (Int() $qfreeze) is also<freeze-object-views> {
    my gboolean $q = $qfreeze.so.Int;

    sheet_freeze_object_views($!gs, $q);
  }

  method get_cells_extent ( :$raw = False ) is also<get-cells-extent> {
    propReturnObject(
      sheet_get_cells_extent($!gs),
      $raw,
      |Gnumeric::Range.getTypePair
    );
  }

  method get_comment (GnmCellPos() $pos, :$raw = false) is also<get-comment> {
    propReturnObject(
      sheet_get_comment($!gs, $pos),
      $raw,
      |Gnumeric::Comment.getTypePair
    );
  }

  method get_conventions ( :$raw = False ) is also<get-conventions> {
    propReturnObject(
      sheet_get_conventions($!gs),
      $raw,
      |Gnumeric::Conventions.getTypePair
    );
  }

  proto method get_extent (|)
    is also<get-extent>
  { * }

  multi method get_extent (
    :spans(:merges(:$extend) = False,
    :$hidden                 = False
  ) {
    samewith($extend, $hidden);
  }
  multi method get_extent (
    Int() $spans_and_merges_extend,
    Int() $include_hidden
  ) {
    my gboolean ($s, $i) =
      ($spans_and_merges_extend, $include_hidden).map( *.so.Int );

    propReurnObject(
      sheet_get_extent($!gs, $s, $i),
      $raw,
      |Gnumeric::Range.getTypePair
    );
  }

  method get_nominal_printarea ( :$raw = False )
    is also<get-nominal-printarea>
  {
    propReturnObject(
      sheet_get_nominal_printarea($!gs),
      $raw,
      |Gnumeric::Range.getTypePair
    );
  }

  proto method get_printarea (|)
    is also<get-printarea>
  { * }

  multi method get_printarea (
    :$styles    = False.
    :$printarea = False
  ) {
    samewith($styles, $printarea.not);
  }
  multi method get_printarea (
    Int() $include_styles,
    Int() $ignore_printarea
  ) {
    my gboolean ($s, $p) =
      ($include_styles, $ignore_printarea).map( *.so.Int );

    propReturnObject(
      sheet_get_printarea($!gs, $s, $p),
      $raw,
      |Gnumeric::Range.getTypePair
    );
  }

  method get_view (WorkbookView() $wbv, :$raw = False) is also<get-view> {
    propReturnObject(
      sheet_get_view($!gs, $wbv),
      $raw
      |Gnumeric::Sheet::View.getTypePair
    );
  }

  method add_sort_setup (Str() $key, gpointer $setup) is also<add-sort-setup> {
    gnm_sheet_add_sort_setup($!gs, $key, $setup);
  }

  method find_sort_setup (Str() $key) is also<find-sort-setup> {
    gnm_sheet_find_sort_setup($!gs, $key);
  }

  method foreach_name (&func, gpointer $data = gpointer)
    is also<foreach-name>
  {
    gnm_sheet_foreach_name($!gs, $func, $data);
  }

  method get_size ( :$raw = False ) is also<get-size> {
    propReturnObject(
      gnm_sheet_get_size($!gs),
      $raw,
      |Gnumeric::Sheet::Size.getTypePair
    );
  }

  method get_size2 (Sheet() $sheet, Workbook() $wb = Workbook, :$raw = False)
    is also<get-size2>
  {
    propReturnObject(
      gnm_sheet_get_size2($!gs, $wb),
      $raw,
      |Gnumeric::Sheet::Size.getTypePair
    );
  }

  method get_sort_setups ( :$raw = False, :$hash = True )
    is also<get-sort-setups>
  {
    my $ht = propReturnObject(
      gnm_sheet_get_sort_setups($!gs),
      $raw,
      |GLib::HashTable.getTypePair
    );
    return $ht if     $raw;
    return $ht unless $hash;
    $ht.Hash;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_sheet_get_type, $n, $t );
  }

  multi method resize (
    Int()          $cols,
    Int()          $rows,
    GOCmdContext() $cc
  ) {
    samewith($cols, $rows, $cc, $);
  }
  multi method resize (
    Int()          $cols,
    Int()          $rows,
    GOCmdContext() $cc,
                   $perr  is rw
  ) {
    my gint     ($c, $r) = ($cols, $rows);
    my gboolean  $p      =  0;

    gnm_sheet_resize($!gs, $c, $r, $cc, $p);
    $perr = $p.so;
  }

  method scenario {
    $!gs-scenario = Gnumeric::Sheet::Scenario.new( gs => $!gs )
      unless $!gs-scenario;
    $!gs-scenario;
  }

  method set_solver_params (GnmSolverParameters() $param)
    is also<set-solver-params>
  {
    gnm_sheet_set_solver_params($!gs, $param);
  }

  # cw: GnmSheetSize - for Gnumeric::Enums
  method gnm_sheet_size_get_type is also<gnm-sheet-size-get-type> {
    gnm_sheet_size_get_type();
  }

  method suggest_size (Int() $cols is rw, Int() $rows is rw)
    is static
    is also<suggest-size>
  {
    my gint ($c, $r) = ($cols, $rows);

    gnm_sheet_suggest_size($c, $r);
    ($cols, $rows) = ($c, $r);
  }

  # cw: GnmSheetType - for Gnumeric::Enums
  method gnm_sheet_type_get_type is also<gnm-sheet-type-get-type> {
    gnm_sheet_type_get_type();
  }

  method valid_size (Int() $cols, Int() $rows) is also<valid-size> {
    my gint ($c, $r) = ($cols, $rows);

    so gnm_sheet_valid_size($!gs, $rows);
  }

  # cw: GnmSheetVisibility - For Gnumeric::Enums
  method gnm_visibility_get_type is also<gnm-visibility-get-type> {
    gnm_sheet_visibility_get_type();
  }

  proto method insert_cols (|)
    is also<insert-cols>
  { * }

  multi method insert_cols (
    Int()           $col,
    GOCmdContext()  $cc,
    Int()          :$count = 1,
    CArray[GOUndo] :$pundo = newCArray(GOUndo)
  ) {
    samewith($col, $count, $pundo, $cc);
  }
  multi method insert_cols (
    Int()          $col,
    Int()          $count,
    CArray[GOUndo] $pundo,
    GOCmdContext() $cc
  ) {
    my gint ($c, $cc) = ($cols, $count);

    so sheet_insert_cols($!gs, $col, $count, $pundo, $cc);
  }

  proto method insert_rows (|)
    is also<insert-rows>
  { * }

  multi method insert_rows (
    Int()           $row,
    GOCmdContext()  $cc,
    Int()          :$count = 1,
    CArray[GOUndo] :$pundo = newCArray(GOUndo)
  ) {
    samewith(row, $count, $pundo, $cc);
  }
  method insert_rows (
    Int()          $row,
    Int()          $count,
    CArray[GOUndo] $pundo,
    GOCmdContext   $cc
  ) {
    my gint ($r, $c) = ($rows, $count);

    sheet_insert_rows($!gs, $r, $c, $pundo, $cc);
  }

  method is_cell_empty (Int() $col, Int() $row) is also<is-cell-empty> {
    my gint ($r, $c) = ($row, $col);

    so sheet_is_cell_empty($!gs, $c, $r);
  }

  method is_region_empty (GnmRange() $r) is also<is-region-empty> {
    sheet_is_region_empty($!gs, $r);
  }

  method mark_dirty is also<mark-dirty> {
    sheet_mark_dirty($!gs);
  }

  proto method move_range (|)
    is also<move-range>
  { * }

  multi method move_range (
     $rinfo,
     $cc,
    :undo(:$pundo) = newCArray(GOUndo)
  ) {
    samewith($rinfo, $pundo, $cc);
  }
  multi method move_range (
    GnmExprRelocateInfo() $rinfo,
    CArray[GOUndo]        $pundo,
    GOCmdContext()        $cc
  )
    is static
  {
    sheet_move_range($rinfo, $pundo, $cc);
  }

  method queue_redraw_range (GnmRange() $range) is also<queue-redraw-range> {
    sheet_queue_redraw_range($!gs, $range);
  }

  method queue_respan (Int() $start_row, Int() $end_row)
    is also<queue-respan>
  {
    my gint ($s, $e) = ($start_row, $end_row);

    sheet_queue_respan($!gs, $s, $e);
  }

  method range {
    $!gs-range = Gnumeric::Sheet::Range.new( gs => $!gs ) unless $!gs-range;
    $!gs-range;
  }

  method recompute_spans_for_col (Int() $col)
    is also<recompute-spans-for-col>
  {
    my gint $c = $col;

    sheet_recompute_spans_for_col($!gs, $c);
  }

  method redraw_all (Int() $header) is also<redraw-all> {
    my gboolean $h = $header.so.Int;

    sheet_redraw_all($!gs, $header);
  }

  method redraw_range (GnmRange() $range) is also<redraw-range> {
    sheet_redraw_range($!gs, $range);
  }

  method redraw_region (
    Int() $start_col,
    Int() $start_row,
    Int() $end_col,
    Int() $end_row
  )
    is also<redraw-region>
  {
    my gint ($sc, $sr, $ec, $er) =
      ($start_col, $start_row, $end_col, $end_row);

    sheet_redraw_region($!gs, $sc, $sr, $ec, $er);
  }

  method row {
    $!gs-row = Gnumeric::Sheet::Row.new( gs => $!gs ) unless $!gs-row;
    $!gs-row;
  }

  method scrollbar_config is also<scrollbar-config> {
    sheet_scrollbar_config($!gs);
  }

  method selection_is_allowed (GnmCellPos() $pos)
    is also<selection-is-allowed>
  {
    sheet_selection_is_allowed($!gs, $pos);
  }

  method set_outline_direction (Int() $is_cols)
    is also<set-outline-direction>
  {
    my gboolean $i = $is_cols.so.Int;

    sheet_set_outline_direction($!gs, $i);
  }

  method update {
    sheet_update($!gs);
  }

  method update_only_grid is also<update-only-grid> {
    sheet_update_only_grid($!gs);
  }

}
