use v6.c;

use Gnumeric::Raw::Types;

use GIO::Resource;
use GTK::Application;
use GTK::Box;
use GTK::Button;
use Gnumeric::Notebook;
use Gnumeric::Sheet;
use Gnumeric::Sheet::Control::GUI;
use Gnumeric::Sheet::View;
use Gnumeric::Workbook;
use Gnumeric::Workbook::Control::GTK;
use Gnumeric::Workbook::View;

use Gnumeric::Main;

my $app = GTK::Application.new(
  title  => 'org.genex.workbook.control.gui',
  width  => 1024,
  height => 768
);

my @l = ('A' ... 'E');

$app.activate.tap: SUB {
  if GIO::Resource.load( $*PROGRAM.parent.add('gnm.gresource') ) -> $r {
    $r.register;
  }

  my $w    = Gnumeric::Workbook.new;

  say "W: { $w // '»NOW«' }";

  my $wv   = Gnumeric::Workbook::View.new($w);
  my $s    = Gnumeric::Sheet.new($w, 'Test Sheet');

  say "S: { $s // '»NOS«' }";

  my $sv   = Gnumeric::Sheet::View.new($s, $wv);
  my $wbcg = Gnumeric::Workbook::Control::GTK.new(view => $wv, wb => $w);
  my $scg  = Gnumeric::Sheet::Control::GUI.new($sv, $wbcg);

  $wbcg.toplevel.show-all;

  # $app.window.add($vbox);
  # $app.window.show-all;
}

$app.run;
