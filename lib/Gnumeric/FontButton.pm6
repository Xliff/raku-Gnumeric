use v6.c;

use Method::Also;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::FontButton;

use GTK::FontButton;

use GLib::Roles::Implementor;

our subset GnmFontButtonAncestry is export of Mu
  where GnmFontButton | GtkFontButtonAncestry;

class Gnumeric::FontButton is GTK::FontButton {
  has GnmFontButton $!gfb is implementor;

  submethod BUILD ( :$gnumeric-font-button ) {
    self.setGnmFontButton($gnumeric-font-button) if $gnumeric-font-button
  }

  method setGnmFontButton (GnmFontButtonAncestry $_) {
    my $to-parent;

    $!gfb = do {
      when GnmFontButton {
        $to-parent = cast(GtkFontButton, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GnmFontButton, $_);
      }
    }
    self.setGtkFontButton($to-parent);
  }

  method Gnumeric::Raw::Definitions::GnmFontButton
    is also<GnmFontButton>
  { $!gfb }

  multi method new (
    $gnumeric-font-button where * ~~ GnmFontButtonAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-font-button;

    my $o = self.bless( :$gnumeric-font-button );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $gnumeric-font-button = gnm_font_button_new();

    $gnumeric-font-button ?? self.bless( :$gnumeric-font-button ) !! Nil
  }

  method new_with_font (Str() $fontname) is also<new-with-font> {
    my $gnumeric-font-button = gnm_font_button_new_with_font($fontname);

    $gnumeric-font-button ?? self.bless( :$gnumeric-font-button ) !! Nil
  }

  method font-set is also<font_set> {
    self.connect($!gfb, 'font-set');
  }

  method get_font_name is also<get-font-name> {
    gnm_font_button_get_font_name($!gfb);
  }

  method get_show_size is also<get-show-size> {
    gnm_font_button_get_show_size($!gfb);
  }

  method get_show_style is also<get-show-style> {
    gnm_font_button_get_show_style($!gfb);
  }

  method get_title is also<get-title> {
    gnm_font_button_get_title($!gfb);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_font_button_get_type, $n, $t );
  }

  method get_use_font is also<get-use-font> {
    gnm_font_button_get_use_font($!gfb);
  }

  method get_use_size is also<get-use-size> {
    gnm_font_button_get_use_size($!gfb);
  }

  method set_font_name (Str() $fontname) is also<set-font-name> {
    gnm_font_button_set_font_name($!gfb, $fontname);
  }

  method set_show_size (Int() $show_size) is also<set-show-size> {
    my gboolean $s = $show_size.so.Int;

    gnm_font_button_set_show_size($!gfb, $s);
  }

  method set_show_style (Int() $show_style) is also<set-show-style> {
    my gboolean $s = $show_style.so.Int;

    gnm_font_button_set_show_style($!gfb, $s);
  }

  method set_title (Str() $title) is also<set-title> {
    gnm_font_button_set_title($!gfb, $title);
  }

  method set_use_font (Int() $use_font) is also<set-use-font> {
    my gboolean $u = $use_font.so.Int;

    gnm_font_button_set_use_font($!gfb, $u);
  }

  method set_use_size (Int() $use_size) is also<set-use-size> {
    my gboolean $u = $use_size.so.Int;

    gnm_font_button_set_use_size($!gfb, $u);
  }

}
