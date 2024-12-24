#include <gnumeric.h>
#include <ranges.h>

GnmRange *range_union_ptr(GnmRange *a, GnmRange *b) {
  GnmRange *u = (GnmRange *)malloc( sizeof(GnmRange) );

  *u = range_union(a, b);
  return u;
}
