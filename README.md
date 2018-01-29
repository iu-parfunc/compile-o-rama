# compile-o-rama

Dockerfile and or Nix expressions for building a whole bunch of
compilers.  The goal is to provide a starting point for
microbenchmarking.  The emphasis is primarily on compilers that proved
parallel programming facilities.

Docker Containers
=================

The philosophy here is to load multiple compilers/runtimes into *one*
container.  The idea is that it would be a bit clunky to build and tag
a separate container for every single compiler.  It certainly would be
possible to share some base dependencies, and create one "leaf
container" per compiler, and we can switch to that if there's a
compelling reason to do so.

dist-compile-o-rama:

The exception to the above policy comes when we get to
distributed-memory languages and runtimes, which have a different set
of dependencies.  Thus we will slice off one or more new containers
for this purpose.

Unfortunately, none of the relevant sofware (Chapel, gasnet, x10,
Charm++...) is provided as Ubuntu packages.  It's esoteric.


Nix Expressions
===============

<Coming soon>
