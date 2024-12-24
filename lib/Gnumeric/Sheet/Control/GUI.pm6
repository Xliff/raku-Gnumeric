use v6.c;

use Method::Also;
use NativeCall;

use Gnumeric::Raw::Types;
use Gnumeric::Raw::Sheet::Control::GUI;

use Gnumeric::Sheet::Control;

use GLib::Roles::Implementor;

our subset SheetControlGUIAncestry is export of Mu
  where SheetControlGUI | SheetControlAncestry;

class Gnumeric::Sheet::Control::GUI is Gnumeric::Sheet::Control {
  has SheetControlGUI $!scg is implementor;

  submethod BUILD ( :$gnumeric-sheet-gui ) {
    self.setSheetControlGUI($gnumeric-sheet-gui) if $gnumeric-sheet-gui
  }

  method setSheetControlGUI (SheetControlGUIAncestry $_) {
    my $to-parent;

    $!scg = do {
      when SheetControlGUI {
        $to-parent = cast(SheetControl, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(SheetControlGUI, $_);
      }
    }
    self.setSheetControl($to-parent);
  }

  method Gnumeric::Raw::Definitions::SheetControlGUI
    is also<SheetControlGUI>
  { $!scg }

  has $!rs;

  multi method new (
    $gnumeric-sheet-gui where * ~~ SheetControlGUIAncestry,

    :$ref = True
  ) {
    return unless $gnumeric-sheet-gui;

    my $o = self.bless( :$gnumeric-sheet-gui );
    $o.ref if $ref;
    $o;
  }
  multi method new (WBCGtk() $wbcg) {
    my $sheet-control-gui = sheet_control_gui_new($!scg, $wbcg);

    $sheet-control-gui ?? self.bless( :$sheet-control-gui ) !! Nil
  }

  method colrow_distance_get (Int() $is_cols, Int() $from, Int() $to)
    is also<colrow-distance-get>
  {
    my gboolean  $i      =  $is_cols.so.Int;
    my gint     ($f, $t) = ($from, $to);

    scg_colrow_distance_get($!scg, $i, $f, $t);
  }

  method colrow_select (Int() $is_cols, Int() $index, Int() $modifiers)
    is also<colrow-select>
  {
    my gboolean  $c      =  $is_cols.so.Int;
    my gint     ($i, $m) = ($index, $modifiers);

    scg_colrow_select($!scg, $c, $i, $m);
  }

  method colrow_size_set (
    Int() $is_cols,
    Int() $index,
    Int() $new_size_pixels
  )
    is also<colrow-size-set>
  {
    my gboolean  $c      = $is_cols.so.Int;
    my gint     ($i, $n) = ($index, $new_size_pixels);

    scg_colrow_size_set($!scg, $c, $i, $n);
  }

  method comment_display (GnmComment() $cc, Int() $x, Int() $y)
    is also<comment-display>
  {
    my gint ($xx, $yy) = ($x, $y);

    scg_comment_display($!scg, $cc, $xx, $yy);
  }

  method comment_select (GnmComment() $cc, Int() $x, Int() $y)
    is also<comment-select>
  {
    my gint ($xx, $yy) = ($x, $y);

    scg_comment_select($!scg, $cc, $xx, $yy);
  }

  method comment_unselect (GnmComment() $cc) is also<comment-unselect> {
    scg_comment_unselect($!scg, $cc);
  }

  method context_menu (GdkEvent() $event, Int() $is_col, Int() $is_row)
    is also<context-menu>
  {
    my gboolean ($c, $r) = ($is_col, $is_row).map( *.so.Int );

    scg_context_menu($!scg, $event, $c, $r);
  }

  has $!scg-cursor;

  method cursor {
    unless $!scg-cursor {
      my \T = class :: {
        has $!scg is built;

        method extend (Int() $n, Int() $jump_to_bound, Int() $horiz)
          is also<cursor-extend>
        {
          my gint      $nn     = $n;
          my gboolean ($j, $h) = ($jump_to_bound, $horiz).map( *.so.Int );

          scg_cursor_extend($!scg, $nn, $j, $h);
        }

        method move (Int() $dir, Int() $jump_to_bound, Int() $horiz)
          is also<cursor-move>
        {
          my gint      $d       =  $dir;
          my gboolean ($j, $h)  = ($jump_to_bound, $horiz);

          scg_cursor_move($!scg, $dir, $jump_to_bound, $horiz);
        }

        method visible (Int() $is_visible) is also<cursor-visible> {
          my gboolean $i = $is_visible.so.Int;

          scg_cursor_visible($!scg, $i);
        }
      }

      $!scg-cursor = T.new( scg => $!scg );
    }
    $!scg-cursor;
  }

  method delete_sheet_if_possible is also<delete-sheet-if-possible> {
    scg_delete_sheet_if_possible($!scg);
  }

  method drag_data_get (GtkSelectionData() $selection_data)
    is also<drag-data-get>
  {
    scg_drag_data_get($!scg, $selection_data);
  }

  method drag_data_received (
    GtkWidget()        $source_widget,
    Num()              $x,
    Num()              $y,
    GtkSelectionData() $selection_data
  )
    is also<drag-data-received>
  {
    my gdouble ($xx, $yy) = ($x, $y);

    scg_drag_data_received($!scg, $source_widget, $xx, $yy, $selection_data);
  }

  method edit_start is also<edit-start> {
    scg_edit_start($!scg);
  }

  method edit_stop is also<edit-stop> {
    scg_edit_stop($!scg);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &sheet_control_gui_get_type, $n, $t );
  }

  method make_cell_visible (
    Int() $col,
    Int() $row,
    Int() $force_scroll,
    Int() $couple_panes
  )
    is also<make-cell-visible>
  {
    my gint     ($c, $r) = ($col, $row);
    my gboolean ($f, $p) = ($force_scroll, $couple_panes).map( *.so.Int );

    scg_make_cell_visible($!scg, $c, $r, $f, $p);
  }

  proto method object_anchor_to_coords (|)
    is also<object-anchor-to-coords>
  { * }

  multi method object_anchor_to_coords (SheetObjectAnchor() $anchor) {
    samewith( newCArray(gdouble, sized => 4 ) );
  }
  multi method object_anchor_to_coords (
    SheetObjectAnchor() $anchor,
    CArray[gdouble]     $coords
  ) {
    scg_object_anchor_to_coords($!scg, $anchor, $coords);
    CArrayToArray($coords, size => 4);
  }

  proto method object_coords_to_anchor (|)
    is also<object-coords-to-anchor>
  { * }

  multi method object_coords_to_anchor (@coords, :direction(:$dir) ) {
    samewith(
      newCArray(gdouble, sized => 4),
      SheetObjectAnchor.new
    );
  }
  multi method object_coords_to_anchor (
    CArray[gdouble]     $coords,
    SheetObjectAnchor() $in_out
  ) {
    scg_object_coords_to_anchor($!scg, $coords, $in_out);
  }

  method object_select (SheetObject() $so) is also<object-select> {
    scg_object_select($!scg, $so);
  }

  method object_select_next (Int() $reverse) is also<object-select-next> {
    my gboolean $r = $reverse.so.Int;

    scg_object_select_next($!scg, $r);
  }

  method object_unselect (SheetObject() $so) is also<object-unselect> {
    scg_object_unselect($!scg, $so);
  }

  proto method objects_drag (|)
    is also<objects-drag>
  { * }

  multi method objects_drag (
    $gcanvas,
    $dy                                        is rw,
    $dx                                        is rw,
    :d(:drag(:drag-type(:$drag_type)))                = 0,
    :p(:$primary)                                     = SheetObject,
    :s(:sym(:$symmetric))                             = True,
    :g(:grid(:snap-to-grid(:$snap_to_grid)))          = True,
    :m(:move(:is-mouse-move(:$is_mouse_move)))        = True
  ) {
    samewith(
      $gcanvas,
      $primary,
      $dx,
      $dy,
      $drag_type,
      $symmetric,
      $snap_to_grid,
      $is_mouse_move
    )
  }
  multi method objects_drag (
    GnmPane()     $gcanvas,
    SheetObject() $primary,
    Num()         $dx              is rw,
    Num()         $dy              is rw,
    Int()         $drag_type,
    Int()         $symmetric,
    Int()         $snap_to_grid,
    Int()         $is_mouse_move
  ) {
    my gint     $d          =  $drag_type;
    my gdouble ($ddx, $ddy) = ($dx, $dy);

    my gboolean ($s, $g, $i)
      = ($symmetric, $snap_to_grid, $is_mouse_move).map( *.so.Int );

    scg_objects_drag($!scg, $gcanvas, $primary, $dx, $dy, $d, $s, $g, $i);
    ($dx, $dy) = ($ddx, $ddy)
  }

  proto method objects_drag_commit (|)
    is also<objects-drag-commit>
  { * }

  multi method objects_drag_commit (
    :d(:drag(:drag-type(:$drag_type)))               = 0,
    :c(:created(:created-object(:$created_objects))) = False,
    :$raw                                            = False
  ) {
    samewith(
       $drag_type,
       $created_objects,
       newCArray(GOUndo),
       newCArray(GOUndo),
       newCArray(Str),
      :$raw
    );
  }
  multi method objects_drag_commit (
    Int()           $drag_type,
    Int()           $created_objects,
    CArray[GOUndo]  $pundo,
    CArray[GOUndo]  $predo,
    CArray[Str]     $undo_title,
                   :$raw              = False
  ) {
    my gint     $d = $drag_type;
    my gboolean $c = $created_objects.so.Int;

    scg_objects_drag_commit($!scg, $d, $c, $pundo, $predo, $undo_title);

    (
      propReturnObject( ppr($pundo), $raw, |GOffice::Undo.getTypePair ),
      propReturnObject( ppr($predo), $raw, |GOffice::Undo.getTypePair ),
      ppr($undo_title)
    );
  }

  proto method objects_nudge (|)
    is also<objects-nudge>
  { * }

  multi method objects_nudge (
    GnmPane() $gcanvas,
    Num()     $dx,
    Num()     $dy,
    Int()     :d(:drag(:drag-type(:$drag_type)))         = 0,
    Int()     :s(:sym(:$symmetric))                      = True,
    Int()     :g(:grid(:snap-to-grid(:$snap_to_grid)))   = True,
  ) {
    samewith(
      $gcanvas,
      $drag_type,
      $dx,
      $dy,
      $symmetric,
      $snap_to_grid
    );
  }
  multi method objects_nudge (
    GnmPane() $gcanvas,
    Int()     $drag_type,
    Num()     $dx,
    Num()     $dy,
    Int()     $symmetric,
    Int()     $snap_to_grid
  ) {
    my gint      $d          =  $drag_type;
    my gdouble  ($ddx, $ddy) = ($dx, $dy);
    my gboolean ($s,   $g)   = ($symmetric, $snap_to_grid).map( *.so.Int );

    scg_objects_nudge($!scg, $gcanvas, $drag_type, $ddx, $ddy, $s, $g);
  }

  method pane (Int() $pane, :$raw = False) {
    my gint $p = $pane;

    propReturnObject(
      scg_pane($!scg, $p),
      $raw,
      Gnumeric::Pane.getTypePair
    )
  }

  proto method paste_image (|)
    is also<paste-image>
  { * }

  multi method paste_image ($where, $image) {
    samewith( $where, resolveBuffer($image, :carray) )
  }
  multi method paste_image (GnmRange() $where, CArray[guint8] $data) {
    scg_paste_image($!scg, $where, $data);
  }

  method queue_movement (&handler, Int() $n, Int() $jump, Int() $horiz)
    is also<queue-movement>
  {
    my gint      $nn     =  $n;
    my gboolean ($j, $h) = ($jump, $horiz).map( *.so.Int );

    scg_queue_movement($!scg, &handler, $nn, $j, $h);
  }

  method rangesel {
    unless $!rs {
      my \C = class :: {
        has $!scg is built;

        method bound (
          Int() $base_col,
          Int() $base_row,
          Int() $move_col,
          Int() $move_row
        ) {
          my gint ($bc, $br, $mc,$mr) =
            ($base_col, $base_row, $move_col, $move_row);

          scg_rangesel_bound($!scg, $bc, $br, $mc,$mr);
        }

        method extend (Int() $n, Int() $jump_to_bound, Int() $horiz) {
          my gint      $nn     =  $n;
          my gboolean ($j, $h) = ($jump_to_bound, $horiz).map( *.so.Int );

          scg_rangesel_extend($!scg, $n, $jump_to_bound, $horiz);
        }

        method extend_to ( Int() $col, Int() $row) is also<extend-to> {
          my gint ($c, $r) = ($col, $row);

          scg_rangesel_extend_to($!scg, $c, $r);
        }

        method move (Int() $dir, Int() $jump_to_bound, Int() $horiz) {
          my gint      $d      = $dir;
          my gboolean ($j, $h) = ($jump_to_bound, $horiz).map( *.so.Int );

          scg_rangesel_move($!scg, $d, $j, $h);
        }

        method start (
          Int() $base_col,
          Int() $base_row,
          Int() $move_col,
          Int() $move_row
        ) {
          my gint ($bc, $br, $mc,$mr) =
            ($base_col, $base_row, $move_col, $move_row);

          scg_rangesel_start(
            $!scg,
            $base_col,
            $base_row,
            $move_col,
            $move_row
          );
        }

        method stop (Int() $clear_str) {
          my gboolean $c = $clear_str.so.Int;

          scg_rangesel_stop($!scg, $c);
        }
      }

      $!rs = C.new( scg => $!scg );
    }

    $!rs;
  }

  method reload_item_edits is also<reload-item-edits> {
    scg_reload_item_edits($!scg);
  }

  method select_all is also<select-all> {
    scg_select_all($!scg);
  }

  method set_display_cursor is also<set-display-cursor> {
    scg_set_display_cursor($!scg);
  }

  method set_left_col (Int() $new_first_col) is also<set-left-col> {
    my gint $n = $new_first_col;

    scg_set_left_col($!scg, $n);
  }

  method set_top_row (Int() $new_first_row) is also<set-top-row> {
    my gint $n = $new_first_row;

    scg_set_top_row($!scg, $n);
  }

  method sheet ( :$raw = False ) {
    propReturnObject(
      scg_sheet($!scg),
      $raw,
      |Gnumeric::Sheet.getTypePair
    )
  }

  method size_guide_motion (Int() $vert, Int() $guide_pos)
    is also<size-guide-motion>
  {
    my gboolean $v = $vert;
    my gint64   $g = $guide_pos;

    scg_size_guide_motion($!scg, $v, $g);
  }

  method size_guide_start (
    Int() $vert,
    Int() $colrow,
    Int() $is_colrow_resize
  )
    is also<size-guide-start>
  {
    my gboolean ($v, $i) = ($vert, $is_colrow_resize).map( *.so.Int );
    my gint      $c      =  $colrow;

    scg_size_guide_start($!scg, $v, $c, $i);
  }

  method size_guide_stop is also<size-guide-stop> {
    scg_size_guide_stop($!scg);
  }

  method special_cursor_bound_set (GnmRange() $r)
    is also<special-cursor-bound-set>
  {
    scg_special_cursor_bound_set($!scg, $r);
  }

  method special_cursor_start (Int() $style, Int() $button)
    is also<special-cursor-start>
  {
    my gint ($s, $b) = ($style, $button);

    scg_special_cursor_start($!scg, $s, $b);
  }

  method special_cursor_stop is also<special-cursor-stop> {
    scg_special_cursor_stop($!scg);
  }

  method take_focus is also<take-focus> {
    scg_take_focus($!scg);
  }

  method view ( :$raw = False ) {
    propReturnObject(
      scg_view($!scg),
      $raw,
      |Gnumeric::Sheet::View.getTypePair
    );
  }

  method wbc ( :$raw = False ) {
    propReturnObject(
      scg_wbc($!scg),
      $raw,
      |::('Gnumeric::Workbook::Control').getTypePair
    );
  }

  method wbcg ( :$raw = False ) {
    propReturnObject(
      scg_wbcg($!scg),
      $raw,
      |::('Gnumeric::Workbook::Control::GUI').getTypePair
    );
  }

}
