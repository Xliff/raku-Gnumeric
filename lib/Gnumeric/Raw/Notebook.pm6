use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Gnumeric::Raw::Definitions;
use Gnumeric::Raw::Structs;

unit package Gnumeric::Raw::Notebook;

### /usr/src/gnumeric/src/widgets/gnm-notebook.h

sub gnm_notebook_button_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_get_current_label (GnmNotebook $nb)
  returns GtkWidget
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_get_n_visible (GnmNotebook $nb)
  returns gint
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_get_nth_label (
  GnmNotebook $nb,
  gint        $n
)
  returns GtkWidget
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_get_type
  returns GType
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_insert_tab (
  GnmNotebook $nb,
  GtkWidget   $label,
  gint        $pos
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_move_tab (
  GnmNotebook $nb,
  GtkWidget   $label,
  gint        $newpos
)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_next_page (GnmNotebook $nb)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_prev_page (GnmNotebook $nb)
  is      native(gnumeric)
  is      export
{ * }

sub gnm_notebook_set_current_page (
  GnmNotebook $nb,
  gint        $page
)
  is      native(gnumeric)
  is      export
{ * }
