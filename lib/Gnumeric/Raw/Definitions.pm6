use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use CompUnit::Util :re-export;

use Gnumeric::Raw::Compat;

use GLib::Roles::Object;

constant gnumeric         is export = 'spreadsheet-1.12.57';
constant gnumeric-support is export = %?RESOURCES<lib/linux/gnumeric-support.so>;

constant gnm_float        is export := num64;
constant ColRowIndexList  is export := GList;
constant ColRowStateGroup is export := GSList;

sub gnumeric-distribution-resources is export {
  %?RESOURCES.Map;
}

class GOFormat            is repr<CPointer> does GLib::Roles::Pointers is export { }
class ColRowState         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmExpr             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmExprEntry        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmExprRelocateInfo is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmStyle            is repr<CPointer> does GLib::Roles::Pointers is export { }

# cw: These structs are a part of the public API, but its big. Definitions will
#     be forthcoming.
class ColRowInfo               is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmCellRendererText      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmComplete              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmComment               is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmConventions           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmEvalPos               is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmExprSharer            is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmInputMsg              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmNamedExpr             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmNotebook              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmPane                  is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmScenario              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmSheetSlicer           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmSolverParameters      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmPasteTarget           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmValue                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class GnmValueErr              is repr<CPointer> does GLib::Roles::Pointers is export { }
class Sheet                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class SheetObjectView          is repr<CPointer> does GLib::Roles::Pointers is export { }
class SheetObjectViewContainer is repr<CPointer> does GLib::Roles::Pointers is export { }
class SheetView                is repr<CPointer> does GLib::Roles::Pointers is export { }
class SheetControlGUI          is repr<CPointer> does GLib::Roles::Pointers is export { }
class Workbook                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class WorkbookView             is repr<CPointer> does GLib::Roles::Pointers is export { }
class WorkbookSheetState       is repr<CPointer> does GLib::Roles::Pointers is export { }

BEGIN re-export('Gnumeric::Raw::Compat');
