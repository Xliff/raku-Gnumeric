use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Gnumeric::Raw::Definitions;

use GLib::Roles::StaticClass;

class Gnumeric::Main {
  also does GLib::Roles::StaticClass;

  method get_argv0 {
    gnm_get_argv0();
  }

  method get_option_group {
    gnm_get_option_group();
  }

  method init {
    gnm_init();
  }

  method pre_parse_init (Int() $argc, CArray[Str] $argv) {
    my gint $c = $argc;

    gnm_pre_parse_init($c, $argv);
  }

  method pre_parse_shutdown {
    gnm_pre_parse_shutdown();
  }

  method shutdown {
    gnm_shutdown();
  }

}

INIT { Gnumeric::Main.init }

### /usr/src/gnumeric/src/libgnumeric.h

sub gnm_get_argv0
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub gnm_get_option_group
  returns GOptionGroup
  is      native(gnumeric)
  is      export
{ * }

sub gnm_init
  is      native(gnumeric)
  is      export
{ * }

sub gnm_pre_parse_init (
  gint        $argc,
  CArray[Str] $argv
)
  returns Str
  is      native(gnumeric)
  is      export
{ * }

sub gnm_pre_parse_shutdown
  is      native(gnumeric)
  is      export
{ * }

sub gnm_shutdown
  is      native(gnumeric)
  is      export
{ * }
