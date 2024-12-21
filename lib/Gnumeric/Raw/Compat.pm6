use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;

use GLib::Roles::Pointers;

unit package Gnumeric::Raw::Compat;

constant GODrawingAnchorDir is export := guint32;
constant GOFileFormatLevel  is export := guint32;

class GtkAction            is repr<CPointer> does GLib::Roles::Pointers is export { }
class GtkActionGroup       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GtkUIManager         is repr<CPointer> does GLib::Roles::Pointers is export { }

class GsfDocMetaData       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfInput             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfOutput            is repr<CPointer> does GLib::Roles::Pointers is export { }

class GOActionComboStack   is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboColor   is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboText    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboPixmaps is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOColor              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOCmdContext         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataCacheSource    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODateConventions    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODrawingAnchor      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOFileOpener         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOFileSaver          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOIOContext          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOLocaleSel          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOString             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOStrmapSel          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOVal                is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOValArray           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOValBucketer        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOUndo               is repr<CPointer> does GLib::Roles::Pointers is export { }

class GODoc is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS GObject        $.base;
  has Str            $.uri;
  has GsfDocMetaData $.meta_data;
  has gboolean       $.modified;
  has gint64         $.first_modification_time;
  has gboolean       $.pristine;
  has GHashTable     $.images;
  has GDateTime      $.modtime;
  has gpointer       $!priv
}

class GODocControl is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS GObject $.base;
  has GODoc   $.doc;
}
