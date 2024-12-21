use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Gnumeric::Raw::Types;
use Gnumeric::Raw::Value;

class Gnumeric::Value is GLib::Value {
  has GnmValue $!gv is implementor;

  method new_bool (Int() $boolean) {
    my gboolean $b = $boolean.so.Int;

    my $gnumeric-value = value_new_bool($b);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_cellrange (
    GnmCellRef() $a,
    GnmCellRef() $b,
    Int()        $eval_col,
    Int()        $eval_row
  ) {
    my gint ($c, $r) = ($eval_col, $eval_row);

    my $gnumeric-value = value_new_cellrange($a, $b, $eval_col, $eval_row);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_cellrange_parsepos_str (
    GnmParsePos() $pos,
    Str()         $str,
    Int()         $flags
  ) {
    my GnmExprParseFlags $f = $flags;

    my $gnumeric-value = value_new_cellrange_parsepos_str($pos, $str, $flags);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_cellrange_r (Sheet() $sheet, GnmRange() $r) {
    my $gnumeric-value = value_new_cellrange_r($sheet, $r);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_cellrange_str (Sheet() $sheet, Str() $str) {
    my $gnumeric-value = value_new_cellrange_str($sheet, $str);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_cellrange_unsafe (GnmCellRef() $a, GnmCellRef() $b) {
    my $gnumeric-value = value_new_cellrange_unsafe($a, $b);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_empty {
    my $gnumeric-value = value_new_empty;

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error (GnmEvalPos() $pos, Str() $mesg) {
    my $gnumeric-value = value_new_error($pos, $mesg);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_DIV0 (GnmEvalPos() $pos) {
    my $gnumeric-value = value_new_error_DIV0($pos);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_NA (GnmEvalPos() $pos) {
    my $gnumeric-value = value_new_error_NA($pos);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_NAME (GnmEvalPos() $pos) {
    my $gnumeric-value = value_new_error_NAME($pos);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_NULL (GnmEvalPos() $pos) {
    my $gnumeric-value = value_new_error_NULL($pos);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_NUM (GnmEvalPos() $pos) {
    my $gnumeric-value = value_new_error_NUM($pos);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_REF (GnmEvalPos() $pos) {
    my $gnumeric-value = value_new_error_REF($pos);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_VALUE (GnmEvalPos() $pos) {
    my $gnumeric-value = value_new_error_VALUE($pos);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_std (GnmEvalPos() $pos, GnmStdError() $err) {
    my $gnumeric-value = value_new_error_std($pos, $err);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_error_str (GnmEvalPos() $pos, GOString() $mesg) {
    my $gnumeric-value = value_new_error_str($pos, $mesg);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_float (Num() $float) {
    my gfloat $f = $float;

    my $gnumeric-value = value_new_float($f);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_from_string (
    Int()      $type,
    Str()      $str,
    GOFormat() $sf,
    Int()      $translated
  ) {
    my GnmValueType $t  = $type;
    my gboolean     $tr = $translated.so.Int;

    my $gnumeric-value = value_new_from_string($t, $str, $sf, $t);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_int (Int() $int) {
    my gint $i = $int;

    my $gnumeric-value = value_new_int($i);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_string (Str() $s) {
     my $gnumeric-value = value_new_string($s);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_string_nocopy (Str() $s) {
     my $gnumeric-value = value_new_string_nocopy($s);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_string_str (GOString() $s) {
     my $gnumeric-value = value_new_string_str($s);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method cmp (GnmValue() $ptr_a, GnmValue() $ptr_b) {
    so value_cmp($ptr_a, $ptr_b);
  }

  method cmp_reverse (GnmValue() $ptr_a, GnmValue() $ptr_b) {
    so value_cmp_reverse($!gv, $ptr_b);
  }

  method coerce_to_number (Int() $valid, GnmEvalPos() $ep) {
    my gboolean $v = $valid.so.Int;

    value_coerce_to_number($!gv, $valid, $ep);
  }

  method compare (
    GnmValue $b,
    gboolean $case_sensitive
  ) {
    value_compare($!gv, $b, $case_sensitive);
  }

  method compare_no_cache (
    GnmValue $b,
    gboolean $case_sensitive
 ) {
    value_compare_no_cache($!gv, $b, $case_sensitive);
  }

  method diff (GnmValue() $b) {
    value_diff($!gv, $b);
  }

  method dump {
    value_dump($!gv);
  }

  method dup {
    value_dup($!gv);
  }

  method equal (GnmValue() $b) {
    value_equal($!gv, $b);
  }

  method error_classify {
    value_error_classify($!gv);
  }

  method error_name (
    GnmStdError $err,
    gboolean    $translated
  ) {
    value_error_name($!gv, $translated);
  }

  method error_set_pos (GnmValueErr() $err, GnmEvalPos() $pos) {
    value_error_set_pos($err, $pos);
  }

  method get_as_bool (
    gboolean $err
  ) {
    value_get_as_bool($!gv, $err);
  }

  method get_as_checked_bool {
    value_get_as_checked_bool($!gv);
  }

  method get_as_float {
    value_get_as_float($!gv);
  }

  method get_as_gstring (
    GString        $target,
    GnmConventions $conv
  ) {
    value_get_as_gstring($!gv, $target, $conv);
  }

  method get_as_int {
    value_get_as_int($!gv);
  }

  method get_as_string {
    value_get_as_string($!gv);
  }

  method get_rangeref {
    value_get_rangeref($!gv);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_value_get_type, $n, $t );
  }

  method hash {
    value_hash($!gv);
  }

  method is_zero {
    value_is_zero($!gv);
  }

  method peek_string {
    value_peek_string($!gv);
  }

  method release {
    value_release($!gv);
  }

  method set_fmt (GOFormat $fmt) {
    value_set_fmt($!gv, $fmt);
  }


  method init is static {
    value_init();
  }

  method shutdown is static {
    value_shutdown();
  }

  method stringify {
    value_stringify($!gv);
  }

  method type_of {
    value_type_of($!gv);
  }

}

class Gnumeric::Value::Array is Gnumeric::Value {
  method new (Int() $cols, Int() $rows) {
    my guint ($c, $r) = ($cols, $rows);

    my $gnumeric-value = value_new_array($c, $r);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_empty (Int() $cols, Int() $rows) {
    my guint ($c, $r) = ($cols, $rows);

    my $gnumeric-value = value_new_array_empty($c, $rows);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method new_non_init (Int() $cols, Int() $rows) {
    my guint ($c, $r) = ($cols, $rows);

    my $gnumeric-value = value_new_array_non_init($c, $r);

    $gnumeric-value ?? self.bless( :$gnumeric-value ) !! Nil;
  }

  method set (Int() $col, Int() $row, GnmValue() $v) {
    my gint ($c, $r) = ($col, $row);

    value_array_set(self.GnmValue, $c, $r, $v);
  }
}

class Gnumeric::Value::Area is Gnumeric::Value {

  method fetch_x_y (Int() $x, Int() $y, GnmEvalPos() $ep) {
    my gint ($xx, $yy) = ($x, $y);

    value_area_fetch_x_y(self.GnmValue, $xx, $yy, $ep);
  }

  method foreach (
    GnmEvalPos       $ep,
    CellIterFlags    $flags,
    gpointer         $func, #= GnmValueIterFunc
    gpointer         $user_data
  ) {
    value_area_foreach(self.GnmValue, $ep, $flags, $func, $user_data);
  }

  method get_height (GnmEvalPos() $ep) {
    value_area_get_height(self.GnmValue, $ep);
  }

  method get_width (GnmEvalPos() $ep) {
    value_area_get_width(self.GnmValue, $ep);
  }

  method get_x_y (Int() $x, Int() $y, GnmEvalPos() $ep) {
    my gint ($xx, $yy) = ($x, $y);

    value_area_get_x_y(self.GnmValue, $x, $y, $ep);
  }

}
