
# Name this with the tag "compile-o-rama"

# (*) Haskell, GHC 8.0.2: we bake this in (goes in /opt/ghc)
# ======================================================================
FROM fpco/stack-build:lts-9.14

# (*) Mlton, Ocaml, gcc to /usr/bin
# ======================================================================
RUN apt-get update && apt-get -y install mlton ocaml-native-compilers gcc time


# (*) Clang, LLVM
# ======================================================================
## LLVM and CLANG 3.9
RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main" && \
    apt-get update && \
    apt-get -y install clang-3.9 llvm-3.9

# (*) Chez Scheme to /usr/bin/scheme
# ======================================================================
# TODO: Check SHA like Nix does:
ENV CHEZ_VER 9.4
RUN cd / && wget -nv https://github.com/cisco/ChezScheme/archive/v${CHEZ_VER}.tar.gz && \
    tar xf v${CHEZ_VER}.tar.gz && rm -f v${CHEZ_VER}.tar.gz
RUN cd /ChezScheme-${CHEZ_VER}/ && ./configure && time make install

# ADD ./deps /tree-velocity/BintreeBench/deps

# (*) Rust 
# ======================================================================
ENV RUST_VER 1.12.1
# Having problems on hive, disabling rustup: [2016.11.02]
# RUN deps/rustup.sh --yes --revision=1.12.0
# wget --progress=dot:giga https://static.rust-lang.org/dist/rust-${RUST_VER}-x86_64-unknown-linux-gnu.tar.gz && \
RUN mkdir /tmp/rust && cd /tmp/rust && \
  curl -O https://static.rust-lang.org/dist/rust-${RUST_VER}-x86_64-unknown-linux-gnu.tar.gz && \
  tar xf rust-${RUST_VER}-x86_64-unknown-linux-gnu.tar.gz && \
  cd rust-${RUST_VER}-x86_64-unknown-linux-gnu && \
  ./install.sh && \
  cd / && rm -rf /tmp/rust


# (*) Racket to /racket
# ======================================================================
# Xenial is Ubuntu 16.04.  Getting newer currently needs Zesty/Artful.
RUN add-apt-repository ppa:plt/racket && apt-get update && \
    apt-get -y install racket=6.10.1-1~xenial1~ppa1

# Or can do it this way:
# ENV RACKET_VER 6.11
# RUN cd /tmp/ && \
#   wget --progress=dot:giga http://download.racket-lang.org/releases/${RACKET_VER}/installers/racket-${RACKET_VER}-x86_64-linux.sh && \
#   chmod +x racket-${RACKET_VER}-x86_64-linux.sh && \
#   ./racket-${RACKET_VER}-x86_64-linux.sh --in-place --dest /racket/ && \
#   ln -s /racket/bin/* /usr/local/bin/ && \
#   rm -rf racket-${RACKET_VER}-x86_64-linux.sh


# TODO: .NET core
# TODO: manticore
# TODO: multimlton
# TODO: Java, Scala


# Add your compilers here (or inherit from this with FROM):
# ------------------------------------------------------------
