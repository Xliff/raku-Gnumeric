use v6.c;

use Method::Also;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Range;

use GLib::GSList;
use Gnumeric::Value;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use GLib::Roles::StaticClass;

our subset GnmRangeAncestry is export of Mu
  where GnmRange | GObject;

class Gnumeric::Range {
  also does GLib::Roles::Object;

  has GnmRange $!gr is implementor;

  submethod BUILD ( :$gnumeric-range ) {
    self.setGnmRange($gnumeric-range) if $gnumeric-range
  }

  method setGnmRange (GnmRangeAncestry $_) {
    my $to-parent;

    $!gr = do {
      when GnmRange {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GnmRange, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Gnumeric::Raw::Definitions::GnmRange
    is also<GnmRange>
  { $!gr }

  multi method new (
     $gnumeric-range where * ~~ GnmRangeAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-range;

    my $o = self.bless( :$gnumeric-range );
    $o.ref if $ref;
    $o;
  }

  method compare (GnmRange() $b) {
    gnm_range_compare($!gr, $b);
  }

  method contains (Int() $c, Int() $r) {
    $r ~~ $!gr.start.row .. $!gr.end.row &&
    $c ~~ $!gr.start.col .. $!gr.end.col
  }

  method dup {
    gnm_range_dup($!gr);
  }

  method equal (GnmRange() $b) {
    gnm_range_equal($!gr, $b);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_range_get_type, $n, $t );
  }

  method as_string is also<as-string> {
    range_as_string($!gr);
  }

  method clip_to_finite (Sheet() $sheet) is also<clip-to-finite> {
    range_clip_to_finite($!gr, $sheet);
  }

  method contained (GnmRange() $b) {
    range_contained($!gr, $b);
  }

  method dump (Str() $suffix) {
    range_dump($!gr, $suffix);
  }

  method ensure_sanity (Sheet() $sheet) is also<ensure-sanity> {
    range_ensure_sanity($!gr, $sheet);
  }

  method fragment (GnmRange() $b) {
    range_fragment($!gr, $b);
  }

  method height {
    range_height($!gr);
  }

  multi method init (
     $start_col,
     $start_row,
    :$rows       = 1,
    :$cols       = 1,
    :$raw        = False
  ) {
    my ($er, $ec) = ($start_col, $start_row) »+« ($rows, $cols);
    samewith($start_col, $start_row, $er, $ec, :$raw);
  }
  multi method init (
    Int()  $start_col,
    Int()  $start_row,
    Int()  $end_col,
    Int()  $end_row,
          :$raw        = False
  ) {
    my gint ($sc, $sr, $ec, $er) =
      ($start_col, $start_row, $end_col, $end_row);

    propReturnObject(
      range_init($!gr, $sc, $sr, $ec, $er),
      $raw,
      |self.getTypePair
    );
  }

  method init_cellpos (GnmCellPos() $pos, :$raw = False)
    is also<init-cellpos>
  {
    propReturnObject(
      range_init_cellpos($pos),
      $raw,
      |self.getTypePair
    );
  }

  method init_cellpos_size (
    GnmCellPos()  $start,
    Int()         $cols,
    Int()         $rows,
                 :$raw    = False
  )
    is also<init-cellpos-size>
  {
    my gint ($c, $r) = ($cols, $rows);

    propReturnObject(
      range_init_cellpos_size($!gr, $start, $c, $r),
      $raw,
      |self.getTypePair
    );
  }

  method init_cols (
    Sheet()  $sheet,
    Int()    $start_col,
    Int()    $end_col,
            :$raw        = False
  )
    is also<init-cols>
  {
    my gint ($s, $e) = ($start_col, $end_col);

    propReturnObject(
      range_init_cols($!gr, $sheet, $s, $e),
      $raw,
      |self.getTypePair
    );
  }

  method init_full_sheet (Sheet() $sheet, :$raw = False)
    is also<init-full-sheet>
  {
    propReturnObject(
      range_init_full_sheet($!gr, $sheet),
      $raw,
      |self.getTypePair
    );
  }

  method init_invalid ( :$raw = False ) is also<init-invalid> {
    propReturnObject(
      range_init_invalid($!gr),
      $raw,
      |self.getTypePair
    );
  }

  method init_rangeref (GnmRangeRef() $rr, :$raw = False)
    is also<init-rangeref>
  {
    propReturnObject(
      range_init_rangeref($!gr, $rr),
      $raw,
      |self.getTypePair
    );
  }

  method init_rows (
    Sheet()  $sheet,
    Int()    $start_row,
    Int()    $end_row,
            :$raw        = False
  )
    is also<init-rows>
  {
    my gint ($s, $e) = ($start_row, $end_row);

    propReturnObject(
      range_init_rows($!gr, $sheet, $s, $e),
      $raw,
      |self.getTypePair
    );
  }

  method init_value (GnmValue() $v, :$raw = False) is also<init-value> {
    propReturnObject(
      range_init_value($!gr, $v),
      $raw,
      |self.getTypePair
    );
  }

  multi method intersection (GnmRange() $b, :$raw = False) {
    samewith( self.init(1, 1, :raw), $b, :$raw );
  }
  multi method intersection (GnmRange() $r, GnmRange() $b, :$raw = False) {
    range_intersection($r, $!gr, $b);
    propReturnObject($r, $raw, |self.getTypePair);
  }

  method is_full (Sheet() $sheet, Int() $horiz) is also<is-full> {
    my gboolean $h = $horiz.so.Int;

    range_is_full($!gr, $sheet, $horiz);
  }

  method is_sane is also<is-sane> {
    range_is_sane($!gr);
  }

  method is_singleton is also<is-singleton> {
    range_is_singleton($!gr);
  }

  proto method list_destroy (|)
    is also<list-destroy>
    is static
  { * }

  multi method list_destroy (@ranges) {
    samewith( GLib::GSList(@ranges, typed => GnmRange) );
  }
  multi method list_destroy (GSList() $ranges) {
    range_list_destroy($ranges);
  }

  method normalize {
    range_normalize($!gr);
  }

  method overlap (GnmRange() $b) {
    [&&](
      $!gr.end.row >= $b.end.row,
      $b.end.row   >= $!gr.end.row,
      $!gr.end.col >= $b.start.col,
      $b.end.col   >= $!gr.start.col
    );
  }

  method parse (Str() $text, GnmSheetSize() $ss) {
    so range_parse($!gr, $text, $ss);
  }

  method split_ranges (GnmRange() $soft) is also<split-ranges> {
    range_split_ranges($!gr, $soft);
  }

  method translate (Sheet() $sheet, Int() $col_offset, Int() $row_offset) {
    my gint ($c, $r) = ($col_offset, $row_offset);

    so range_translate($!gr, $sheet, $c, $r);
  }

  method transpose (Sheet() $sheet, GnmCellPos() $origin) {
    range_transpose($!gr, $sheet, $origin);
  }

  # method union (GnmRange() $b) {
  #   range_union_ptr($!gr, $b);
  # }

  method width {
    range_width($!gr);
  }

  method undo_cell_pos_name (Sheet() $sheet, GnmCellPos() $pos)
    is also<undo-cell-pos-name>
  {
    undo_cell_pos_name($!gr, $pos);
  }

  method undo_range_list_name (Sheet() $sheet, GSList() $ranges)
    is also<undo-range-list-name>
  {
    undo_range_list_name($!gr, $ranges);
  }

  method undo_range_name (Sheet() $sheet, GnmRange() $r)
    is also<undo-range-name>
  {
    undo_range_name($!gr, $r);
  }
}

class Gnumeric::Range::Global {
  also does GLib::Roles::StaticClass;

  method contained (
    Sheet()    $sheet,
    GnmValue() $a,
    GnmValue() $b
  ) {
    global_range_contained($sheet, $a, $b);
  }

  method list_foreach (
    GnmEvalPos() $ep,
    Int()        $flags,
                 &handler,
    gpointer     $closure   = gpointer
  )
    is also<list-foreach>
  {
    my CellIterFlags $f = $flags;

    global_range_list_foreach($ep, $f, &handler, $closure);
  }

  method list_parse (
    Sheet()  $sheet,
    Str()    $str,
            :glist(:$gslist) = False,
            :$raw            = False
  )
    is also<list-parse>
  {
    returnGSList(
      global_range_list_parse($sheet, $str),
      $raw,
      $gslist,
      |Gnumeric::Value.getTypePair
    );
  }

  method name (Sheet() $sheet, GnmRange() $r) {
    global_range_name($sheet, $r);
  }
}
