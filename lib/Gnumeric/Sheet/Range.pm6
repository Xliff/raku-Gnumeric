use NativeCall;

use Gnumeric::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Gnumeric::Sheet::Range {
  also does GLib::Roles::Object;

  has GnmSheetRange $!gsr is implementor;

  multi method new (Sheet() $sheet, GnmRange() $r) {
    my $gnumeric-sheet-range = gnm_sheet_range_new($sheet, $r);

    $gnumeric-sheet-range ?? self.bless( :$gnumeric-sheet-range ) !! Nil;
  }

  method dup ( :$raw = False ) {
    propReturnObject(
      gnm_sheet_range_dup($!gr)l
      $raw,
      |self.getTypePair
    )
  }

  method equal (GnmSheetRange() $b) {
    gnm_sheet_range_equal($!gr, $b);
  }

  method free {
    gnm_sheet_range_free($!gr);
  }

  method from_value (GnmValue() $v) {
    gnm_sheet_range_from_value($!gr, $v);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_sheet_range_get_type, $n, $t );
  }

  method overlap (GnmSheetRange() $b) {
    gnm_sheet_range_overlap($!gr, $b);
  }
}

sub gnm_sheet_range_dup (GnmSheetRange $sr)
  returns GnmSheetRange
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_range_equal (GnmSheetRange $a, GnmSheetRange $b)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_range_free (GnmSheetRange $r)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_range_from_value (GnmSheetRange $r, GnmValue $v)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_range_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_range_new (Sheet $sheet, GnmRange $r)
  returns GnmSheetRange
  is      native(gnumeric)
  is      export
{ * }

sub gnm_sheet_range_overlap (GnmSheetRange $a, GnmSheetRange $b)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }
