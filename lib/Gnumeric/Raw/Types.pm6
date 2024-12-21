use v6.c;

use GLib::Raw::Exports;
use ATK::Raw::Exports;
use Pango::Raw::Exports;
use GIO::Raw::Exports;
use GDK::Raw::Exports;
use GTK::Raw::Exports:ver<3.0.1146>;
use Gnumeric::Raw::Exports;

my constant forced = 0;

unit package Gnumeric::Raw::Types;

need Cairo;
need GLib::Raw::Debug;
need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Exceptions;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Struct_Subs;
need GLib::Raw::Subs;
need GLib::Roles::Pointers;
need GLib::Roles::Implementor;
need ATK::Raw::Definitions;
need ATK::Raw::Enums;
need ATK::Raw::Structs;
need Pango::Raw::Definitions;
need Pango::Raw::Enums;
need Pango::Raw::Structs;
need Pango::Raw::Subs;
need GIO::DBus::Raw::Types;
need GIO::Raw::Definitions;
need GIO::Raw::Enums;
need GIO::Raw::Quarks;
need GIO::Raw::Structs;
need GIO::Raw::Subs;
need GDK::Raw::Definitions;
need GDK::Raw::Enums;
need GDK::Raw::Structs;
need GDK::Raw::Subs;
need GTK::Raw::Definitions;
need GTK::Raw::Enums;
need GTK::Raw::Structs;
need GTK::Raw::Subs;
need GTK::Raw::Requisition;
need Gnumeric::Raw::Compat;
need Gnumeric::Raw::Definitions;
need Gnumeric::Raw::Enums;
need Gnumeric::Raw::Structs;

BEGIN {
  glib-re-export($_) for |@glib-exports,
                         |@atk-exports,
                         |@pango-exports,
                         |@gio-exports,
                         |@gdk-exports,
                         |@gtk-exports,
                         |@gnm-exports;
}
