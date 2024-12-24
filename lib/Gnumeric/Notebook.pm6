use v6.c;

use Method::Also;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Notebook;

use GTK::Widget;
use GTK::Label;

use GLib::Roles::Implementor;

our subset GnmNotebookAncestry is export of Mu
  where GnmNotebook | GtkWidgetAncestry;

class Gnumeric::Notebook is GTK::Widget {
  has GnmNotebook $!gn is implementor;

  submethod BUILD ( :$gnumeric-notebook ) {
    self.setGnmNotebook($gnumeric-notebook) if $gnumeric-notebook
  }

  method setGnmNotebook (GnmNotebookAncestry $_) {
    my $to-parent;

    $!gn = do {
      when GnmNotebook {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GnmNotebook, $_);
      }
    }
    self.setGtkWidget($to-parent);
    if self.style_context -> $sc {
      $sc.add_class('buttons');
    }
  }

  method Gnumeric::Raw::Definitions::GnmNotebook
    is also<GnmNotebook>
  { $!gn }

  multi method new (
    $gnumeric-notebook where * ~~ GnmNotebookAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-notebook;

    my $o = self.bless( :$gnumeric-notebook );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $gnumeric-notebook = cast(
      GnmNotebook,
      self.new-object-ptr( self.get_type )
    );

    $gnumeric-notebook ?? self.bless( :$gnumeric-notebook ) !! Nil;
  }

  method get_current_label is also<get-current-label> {
    gnm_notebook_get_current_label($!gn);
  }

  method get_n_visible is also<get-n-visible> {
    gnm_notebook_get_n_visible($!gn);
  }

  method get_nth_label (Int() $n) is also<get-nth-label> {
    my gint $nn = $n;

    gnm_notebook_get_nth_label($!gn, $nn);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_notebook_get_type, $n, $t );
  }

  proto method insert_tab (|)
    is also<insert-tab>
  { * }

  multi method insert_tab (Str() $label, :$pos = $.get_n_visible) {
    samewith( GTK::Label.new($label), $pos )
  }
  multi method insert_tab (GtkWidget() $label, Int() $pos) {
    my gint $p = $pos;

    gnm_notebook_insert_tab($!gn, $label, $p);
  }

  method move_tab (GtkWidget() $label, Int() $newpos) is also<move-tab> {
    my gint $n = $newpos;

    gnm_notebook_move_tab($!gn, $label, $n);
  }

  method next_page is also<next-page> {
    gnm_notebook_next_page($!gn);
  }

  method prev_page is also<prev-page> {
    gnm_notebook_prev_page($!gn);
  }

  method set_current_page (Int() $page) is also<set-current-page> {
    my gint $p = $page;

    gnm_notebook_set_current_page($!gn, $p);
  }

}

class Gnumeric::Notebook::Button {

  # # Type: GdkRGBA
  # method background-color is rw  is g-property {
  #   my $gv = GLib::Value.new( GnmRgba );
  #   Proxy.new(
  #     FETCH => sub ($) {
  #       warn 'background-color does not allow reading' if $DEBUG;
  #       0;
  #     },
  #     STORE => -> $, GdkRGBA() $val is copy {
  #       $gv.boxed = $val;
  #       self.prop_set('background-color', $gv);
  #     }
  #   );
  # }
  #
  # # Type: GdkRgba
  # method text-color is rw  is g-property {
  #   my $gv = GLib::Value.new( GnmRgba );
  #   Proxy.new(
  #     FETCH => sub ($) {
  #       warn 'text-color does not allow reading' if $DEBUG;
  #       0;
  #     },
  #     STORE => -> $, GdkRGBA() $val is copy {
  #       $gv.boxed = $val;
  #       self.prop_set('text-color', $gv);
  #     }
  #   );
  # }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gnm_notebook_button_get_type, $n, $t );
  }

}
