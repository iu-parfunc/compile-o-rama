# Name this with the tag "compile-o-rama"


# (1) Haskell, GHC 8.0.2: we bake this in (goes in /opt/ghc)
# ======================================================================
FROM fpco/stack-build:lts-9.14

# (2) Mlton, Ocaml, gcc to /usr/bin
# ======================================================================
RUN apt-get update && apt-get -y install mlton ocaml-native-compilers gcc time

# (3) Chez Scheme to /usr/bin/scheme
# ======================================================================
# TODO: Check SHA like Nix does:
ENV CHEZ_VER 9.4
RUN cd / && wget -nv https://github.com/cisco/ChezScheme/archive/v${CHEZ_VER}.tar.gz && \
    tar xf v${CHEZ_VER}.tar.gz && rm -f v${CHEZ_VER}.tar.gz
RUN cd /ChezScheme-${CHEZ_VER}/ && ./configure && time make install

# ADD ./deps /tree-velocity/BintreeBench/deps

# (4) Rust 
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


# (4) Racket to /racket
# ======================================================================
ENV RACKET_VER 6.7
# This gets 6.3, too old:
# RUN apt-get install -y racket
RUN cd /tmp/ && \
  wget --progress=dot:giga http://download.racket-lang.org/releases/${RACKET_VER}/installers/racket-${RACKET_VER}-x86_64-linux.sh && \
  chmod +x racket-${RACKET_VER}-x86_64-linux.sh && \
  ./racket-${RACKET_VER}-x86_64-linux.sh --in-place --dest /racket/ && \
  ln -s /racket/bin/* /usr/local/bin/ && \
  rm -rf racket-${RACKET_VER}-x86_64-linux.sh

# (5) Clang, LLVM
# ======================================================================
## LLVM and CLANG 3.9
RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main" && \
    apt-get update && \
    apt-get -y install clang-3.9 llvm-3.9


# TODO: .NET core


# Add your compilers here (or inherit from this with FROM):
# ------------------------------------------------------------
