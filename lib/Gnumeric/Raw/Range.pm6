use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Gnumeric::Spreadsheet::Raw::Definitions;

unit package Gnumeric::Raw::Range;

### /usr/src/gnumeric/src/ranges.h

sub gnm_range_compare (GnmRange $a, GnmRange $b)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub gnm_range_dup (GnmRange $r)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub gnm_range_equal (GnmRange $a, GnmRange $b)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_range_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub global_range_contained (Sheet $sheet, GnmValue $a, GnmValue $b)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub global_range_list_foreach (
  GSList        $gr_list,
  GnmEvalPos    $ep,
  CellIterFlags $flags,
                &handler (GnmCellIter, gpointer --> GnmValue), # CellIterFunc
  gpointer      $closure
)
  returns GnmValue
  is      native(gnumeric)
  is      export
{ * }

sub global_range_list_parse (Sheet $sheet, Str $str)
  returns GSList
  is      native(gnumeric)
  is      export
{ * }

sub global_range_name (Sheet $sheet, GnmRange $r)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub range_as_string (GnmRange $r)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub range_clip_to_finite (GnmRange $range, Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }

sub range_contained (GnmRange $a, GnmRange $b)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub range_dump (GnmRange $r, Str $suffix)
  is      native(gnumeric)
  is      export
{ * }

sub range_ensure_sanity (GnmRange $range, Sheet $sheet)
  is      native(gnumeric)
  is      export
{ * }

sub range_fragment (GnmRange $a, GnmRange $b)
  returns GSList
  is      native(gnumeric)
  is      export
{ * }

sub range_height (GnmRange $r)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub range_init (
  GnmRange $r,
  gint     $start_col,
  gint     $start_row,
  gint     $end_col,
  gint     $end_row
)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_init_cellpos (GnmRange $r, GnmCellPos $pos)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_init_cellpos_size (
  GnmRange   $r,
  GnmCellPos $start,
  gint       $cols,
  gint       $rows
)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_init_cols (
  GnmRange $r,
  Sheet    $sheet,
  gint     $start_col,
  gint     $end_col
)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_init_full_sheet (GnmRange $r, Sheet $sheet)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_init_invalid (GnmRange $r)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_init_rangeref (GnmRange r, GnmRangeRef $rr)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_init_rows (
  GnmRange $r,
  Sheet    $sheet,
  gint     $start_row,
  gint     $end_row
)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_init_value (GnmRange $r, GnmValue $v)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_intersection (GnmRange $r, GnmRange $a, GnmRange $b)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub range_is_full (
  GnmRange $r,
  Sheet    $sheet,
  gboolean $horiz
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub range_is_sane (GnmRange $range)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub range_is_singleton (GnmRange $r)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub range_list_destroy (GSList $ranges)
  is      native(gnumeric)
  is      export
{ * }

sub range_normalize (GnmRange $src)
  is      native(gnumeric)
  is      export
{ * }

sub range_parse (
  GnmRange     $r,
  Str          $text,
  GnmSheetSize $ss
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub range_split_ranges (GnmRange $hard, GnmRange $soft)
  returns GSList
  is      native(gnumeric)
  is      export
{ * }

sub range_translate (
  GnmRange $range,
  Sheet    $sheet,
  gint     $col_offset,
  gint     $row_offset
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub range_transpose (
  GnmRange   $range,
  Sheet      $sheet,
  GnmCellPos $origin
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub range_union (GnmRange $a, GnmRange $b)
  returns GnmRange
  is      native(gnumeric)
  is      export
{ * }

sub range_width (GnmRange $r)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub undo_cell_pos_name (Sheet $sheet, GnmCellPos $pos)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub undo_range_list_name (Sheet  $sheet, GSList $ranges)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub undo_range_name (Sheet $sheet, GnmRange $r)
  returns Str
  is      native(gnumeric)
  is      export
{ * }
