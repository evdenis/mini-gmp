#!/bin/sh

echo '#include <linux/kernel.h>' > export.c
echo '#include "mini-gmp.h"' >> export.c


gcc -P -E -DKERNEL=1 ./mini-gmp.h |
perl -e 'my $all=join("",<>); my @d; push @d, "EXPORT_SYMBOL_GPL($1);" while $all =~ m/(\w++)\h*(\((?:[^()]++|(?2))*\))\s*;/g; print join("\n", @d) . "\n";' >> export.c

