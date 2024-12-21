use v6.c;

unit package Gnumeric::Raw::Exports;

our @gnm-exports is export;

BEGIN {
  @gnm-exports = <
    Gnumeric::Raw::Compat
    Gnumeric::Raw::Definitions
    Gnumeric::Raw::Enums
    Gnumeric::Raw::Structs
  >;
}
