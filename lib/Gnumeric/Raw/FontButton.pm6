use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Gnumeric::Raw::Definitions;

unit package Gnumeric::Raw::FontButton;

### /usr/src/gnumeric/src/widgets/gnm-fontbutton.h

sub gnm_font_button_get_font_name (GnmFontButton $font_button)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_get_show_size (GnmFontButton $font_button)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_get_show_style (GnmFontButton $font_button)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_get_title (GnmFontButton $font_button)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_get_use_font (GnmFontButton $font_button)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_get_use_size (GnmFontButton $font_button)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_new
  returns GtkWidget
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_new_with_font (Str $fontname)
  returns GnmFontButton
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_set_font_name (
  GnmFontButton $font_button,
  Str           $fontname
)
  returns uint32
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_set_show_size (
  GnmFontButton $font_button,
  gboolean      $show_size
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_set_show_style (
  GnmFontButton $font_button,
  gboolean      $show_style
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_set_title (
  GnmFontButton $font_button,
  Str           $title
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_set_use_font (
  GnmFontButton $font_button,
  gboolean      $use_font
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_font_button_set_use_size (
  GnmFontButton $font_button,
  gboolean      $use_size
)
  is      native(gnumeric)
  is      export
{ * }
