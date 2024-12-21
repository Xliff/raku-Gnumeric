use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Gnumeric::Raw::Definitions;
use Gnumeric::Raw::Enums;
use Gnumeric::Raw::Structs;

unit package Gnumeric::Raw::Value;

### /usr/src/gnumeric/src/value.h

sub gnm_value_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub value_area_fetch_x_y (
  GnmValue   $v,
  gint       $x,
  gint       $y,
  GnmEvalPos $ep
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_area_foreach (
  GnmValue      $v,
  GnmEvalPos    $ep,
  CellIterFlags $flags,
  gpointer      $func, #= GnmValueIterFunc
  gpointer      $user_data
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_area_get_height (
  GnmValue   $v,
  GnmEvalPos $ep
)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub value_area_get_width (
  GnmValue   $v,
  GnmEvalPos $ep
)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub value_area_get_x_y (
  GnmValue   $v,
  gint       $x,
  gint       $y,
  GnmEvalPos $ep
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_array_set (
  GnmValue $array,
  gint     $col,
  gint     $row,
  GnmValue $v
)
  is      native(gnumeric)
  is      export
{ * }

sub value_cmp (GnmValue $ptr_a, GnmValue $ptr_b)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub value_cmp_reverse (GnmValue $ptr_a, GnmValue $ptr_b)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub value_coerce_to_number (
  GnmValue   $v,
  gboolean   $valid,
  GnmEvalPos $ep
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_compare (
  GnmValue $a,
  GnmValue $b,
  gboolean $case_sensitive
)
  returns GnmValDiff
  is      native(gnumeric)
  is      export
{ * }

sub value_compare_no_cache (
  GnmValue $a,
  GnmValue $b,
  gboolean $case_sensitive
)
  returns GnmValDiff
  is      native(gnumeric)
  is      export
{ * }

sub value_diff (
  GnmValue $a,
  GnmValue $b
)
  returns gnm_float
  is      native(gnumeric)
  is      export
{ * }

sub value_dump (GnmValue $v)
  is      native(gnumeric)
  is      export
{ * }

sub value_dup (GnmValue $v)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_equal (
  GnmValue $a,
  GnmValue $b
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub value_error_classify (GnmValue $v)
  returns GnmStdError
  is      native(gnumeric)
  is      export
{ * }

sub value_error_name (
  GnmStdError $err,
  gboolean    $translated
)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub value_error_set_pos (
  GnmValueErr $err,
  GnmEvalPos  $pos
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_get_as_bool (
  GnmValue $v,
  gboolean $err
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub value_get_as_checked_bool (GnmValue $v)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub value_get_as_float (GnmValue $v)
  returns gnm_float
  is      native(gnumeric)
  is      export
{ * }

sub value_get_as_gstring (
  GnmValue       $v,
  GString        $target,
  GnmConventions $conv
)
  is      native(gnumeric)
  is      export
{ * }

sub value_get_as_int (GnmValue $v)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub value_get_as_string (GnmValue $v)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub value_get_rangeref (GnmValue $v)
  returns GnmRangeRef
  is      native(gnumeric)
  is      export
{ * }

sub value_hash (GnmValue $v)
  returns guint
  is      native(gnumeric)
  is      export
{ * }

sub value_init
  is      native(gnumeric)
  is      export
{ * }

sub value_is_zero (GnmValue $v)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub value_new_array (
  guint $cols,
  guint $rows
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_array_empty (
  guint $cols,
  guint $rows
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_array_non_init (
  guint $cols,
  guint $rows
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_bool (gboolean $b)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_cellrange (
  GnmCellRef $a,
  GnmCellRef $b,
  gint       $eval_col,
  gint       $eval_row
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_cellrange_parsepos_str (
  GnmParsePos       $pp,
  Str               $str,
  GnmExprParseFlags $flags
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_cellrange_r (
  Sheet    $sheet,
  GnmRange $r
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_cellrange_str (
  Sheet $sheet,
  Str   $str
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_cellrange_unsafe (
  GnmCellRef $a,
  GnmCellRef $b
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_empty
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error (
  GnmEvalPos $pos,
  Str        $mesg
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_DIV0 (GnmEvalPos $pos)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_NA (GnmEvalPos $pos)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_NAME (GnmEvalPos $pos)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_NULL (GnmEvalPos $pos)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_NUM (GnmEvalPos $pos)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_REF (GnmEvalPos $pos)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_VALUE (GnmEvalPos $pos)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_std (
  GnmEvalPos  $pos,
  GnmStdError $err
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_error_str (
  GnmEvalPos $pos,
  GOString   $mesg
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_float (gnm_float $f)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_from_string (
  GnmValueType $t,
  Str          $str,
  GOFormat     $sf,
  gboolean     $translated
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_int (gint $i)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_string (Str $str)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_string_nocopy (Str $str)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_new_string_str (GOString $str)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub value_peek_string (GnmValue $v)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub value_release (GnmValue $v)
  is      native(gnumeric)
  is      export
{ * }

sub value_set_fmt (
  GnmValue $v,
  GOFormat $fmt
)
  is      native(gnumeric)
  is      export
{ * }

sub value_shutdown
  is      native(gnumeric)
  is      export
{ * }

sub value_stringify (GnmValue $v)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub value_type_of (GnmValue $v)
  returns GnmValueType
  is      native(gnumeric)
  is      export
{ * }
