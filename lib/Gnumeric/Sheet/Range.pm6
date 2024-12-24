use v6.c;

use Method::Also;

use NativeCall;

use Gnumeric::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;


our subset GnmSheetRangeAncestry is export of Mu
  where GnmSheetRange | GObject;

class Gnumeric::Sheet::Range {
  also does GLib::Roles::Object;

  has GnmSheetRange $!gsr is implementor;

  submethod BUILD ( :$gnumeric-sheet-range ) {
    self.setGnmSheetRange($gnumeric-sheet-range) if $gnumeric-sheet-range
  }

  method setGnmSheetRange (GnmSheetRangeAncestry $_) {
    my $to-parent;

    $!gsr = do {
      when GnmSheetRange {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GnmSheetRange, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Gnumeric::Raw::Structs::GnmSheetRange
    is also<GnmSheetRange>
  { $!gsr }

  multi method new (
    $gnumeric-sheet-range where * ~~ GnmSheetRangeAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-sheet-range;

    my $o = self.bless( :$gnumeric-sheet-range );
    $o.ref if $ref;
    $o;
  }

  multi method new (Sheet() $sheet, GnmRange() $r) {
    my $gnumeric-sheet-range = gnm_sheet_range_new($sheet, $r);

    $gnumeric-sheet-range ?? self.bless( :$gnumeric-sheet-range ) !! Nil;
  }

  method dup ( :$raw = False ) {
    propReturnObject(
      gnm_sheet_range_dup($!gsr),
      $raw,
      |self.getTypePair
    )
  }

  method equal (GnmSheetRange() $b) {
    gnm_sheet_range_equal($!gsr, $b);
  }

  method free {
    gnm_sheet_range_free($!gsr);
  }

  method from_value (GnmValue() $v) is also<from-value> {
    gnm_sheet_range_from_value($!gsr, $v);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_sheet_range_get_type, $n, $t );
  }

  method overlap (GnmSheetRange() $b) {
    gnm_sheet_range_overlap($!gsr, $b);
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
