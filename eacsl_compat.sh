#!/bin/sh

EACSL=''
GMP=''

list=$(cat "$EACSL/share/e-acsl/e_acsl_gmp.h" | grep -Poe 'extern.*?\K\b\w+(?=\()' | perl -n -e 'BEGIN{@r=();} chomp; push @r, $_; END{print join("\\b\\|\\b", @r);}')

grep -e "$list" "$GMP/gmp.h" | perl -ne 'chomp; @s=split /\h/; print "$s[0] $s[2] $s[1]\n";' 
