;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2014-2023 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2015, 2016, 2017, 2018 Ben Woodcroft <donttrustben@gmail.com>
;;; Copyright © 2015, 2016, 2018, 2019, 2020 Pjotr Prins <pjotr.guix@thebird.nl>
;;; Copyright © 2015 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2016, 2020, 2021 Roel Janssen <roel@gnu.org>
;;; Copyright © 2016-2023 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016, 2020, 2022 Marius Bakke <marius@gnu.org>
;;; Copyright © 2016, 2018 Raoul Bonnal <ilpuccio.febo@gmail.com>
;;; Copyright © 2017, 2018 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017, 2021, 2022 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Joshua Sierles, Nextjournal <joshua@nextjournal.com>
;;; Copyright © 2018 Gábor Boskovits <boskovits@gmail.com>
;;; Copyright © 2018-2023 Mădălin Ionel Patrașcu <madalinionel.patrascu@mdc-berlin.de>
;;; Copyright © 2019, 2020, 2021 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2019 Brian Leung <bkleung89@gmail.com>
;;; Copyright © 2019 Brett Gilio <brettg@gnu.org>
;;; Copyright © 2020 Björn Höfling <bjoern.hoefling@bjoernhoefling.de>
;;; Copyright © 2020 Jakub Kądziołka <kuba@kadziolka.net>
;;; Copyright © 2020 Pierre Langlois <pierre.langlois@gmx.com>
;;; Copyright © 2020 Bonface Munyoki Kilyungi <bonfacemunyoki@gmail.com>
;;; Copyright © 2021 Tim Howes <timhowes@lavabit.com>
;;; Copyright © 2021 Hong Li <hli@mdc-berlin.de>
;;; Copyright © 2021, 2022, 2023 Simon Tournier <zimon.toutoune@gmail.com>
;;; Copyright © 2021 Felix Gruber <felgru@posteo.net>
;;; Copyright © 2022, 2023 Navid Afkhami <navid.afkhami@mdc-berlin.de>
;;; Copyright © 2022 Antero Mejr <antero@mailbox.org>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages bioinformatics)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system go)
  #:use-module (guix build-system haskell)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system r)
  #:use-module (guix build-system ruby)
  #:use-module (guix build-system trivial)
  #:use-module (guix deprecation)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages bioconductor)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages cpio)
  #:use-module (gnu packages cran)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages dlang)
  #:use-module (gnu packages file)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages graph)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages java)
  #:use-module (gnu packages java-compression)
  #:use-module (gnu packages java-xml)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages jupyter)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages man)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages node)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages parallel)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rdf)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages rpc)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages skribilo)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages tbb)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages uglifyjs)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (guix platform)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 match))

(define-public aragorn
  (package
    (name "aragorn")
    (version "1.2.41")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ansikte.se/ARAGORN/Downloads/"
                                  "aragorn" version ".c"))
              (sha256
               (base32
                "0jkzx7sqiarydvz3bwaxh790fpvpkfc926dhsza1dbdhq32ir8wj"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f ; there are no tests
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (invoke "gcc" "-O3" "-ffast-math" "-finline-functions"
                      "-o" "aragorn" #$source)))
          (replace 'install
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((bin (string-append #$output "/bin"))
                    (man (string-append #$output "/share/man/man1")))
                (install-file "aragorn" bin)
                (mkdir-p man)
                (copy-file (assoc-ref inputs "aragorn.1")
                           (string-append man "/aragorn.1"))))))))
    (native-inputs
     `(("aragorn.1"
        ,(origin
           (method url-fetch)
           (uri "https://www.ansikte.se/ARAGORN/Downloads/aragorn.1")
           (sha256
            (base32
             "0bn9lapa6f0cl07dbn2fjrapirv9d4bk7w248w39fhb4vbczcc3f"))))))
    (home-page "https://www.ansikte.se/ARAGORN/")
    (synopsis "Detect tRNA, mtRNA and tmRNA genes in nucleotide sequences")
    (description
     "Aragorn identifies transfer RNA, mitochondrial RNA and
transfer-messenger RNA from nucleotide sequences, based on homology to known
tRNA consensus sequences and RNA structure.  It also outputs the secondary
structure of the predicted RNA.")
    (license license:gpl3+)))

(define-public bamtools
  (package
    (name "bamtools")
    (version "2.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pezmaster31/bamtools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "14lw571vbks138i0lj66qjdbk8iwa817x2zbpzij61vv1gdgfbn5"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      '(list "-DBUILD_SHARED_LIBS=ON")))
    (inputs (list jsoncpp zlib))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/pezmaster31/bamtools")
    (synopsis "C++ API and command-line toolkit for working with BAM data")
    (description
     "BamTools provides both a C++ API and a command-line toolkit for handling
BAM files.")
    (license license:expat)))

(define-public bamutils
  (package
    (name "bamutils")
    (version "1.0.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/statgen/bamUtil")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1pxydf9qsr8667jh525bc2wiqn9nwk8rkg05kbyfmjs8d261fl9y"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f ;fails to link debug libraries
      #:test-target "test"
      #:make-flags
      #~(list (string-append "INSTALLDIR=" #$output "/bin"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "src/Makefile"
                (("^DATE=.*") "DATE=\"1970-01-01\"\n"))
              (copy-recursively (assoc-ref inputs "libstatgen")
                                "../libStatGen"))))))
    (inputs
     (list zlib))
    (native-inputs
     `(("libstatgen"
        ,(origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/statgen/libStatGen/")
                 (commit (string-append "v" version))))
           (file-name (git-file-name "libstatgen" version))
           (sha256
            (base32
             "0spvbpvnpxrgj8kajpkhf1mv7kdyvj723y9zh13jykvnjh8a15j3"))))))
    (home-page "https://genome.sph.umich.edu/wiki/BamUtil")
    (synopsis "Programs for working on SAM/BAM files")
    (description "This package provides several programs that perform
operations on SAM/BAM files.  All of these programs are built into a
single executable called @code{bam}.")
    (license license:gpl3+)))

(define-public bcftools
  (package
    (name "bcftools")
    (version "1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/samtools/bcftools/"
                                  "releases/download/"
                                  version "/bcftools-" version ".tar.bz2"))
              (sha256
               (base32
                "1jqrma16fx8kpvb3c0462dg0asvmiv5yi8myqmc5ddgwi6p8ivxp"))
              (modules '((guix build utils)))
              (snippet '(begin
                          ;; Delete bundled htslib.
                          (delete-file-recursively "htslib-1.14")))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list "--enable-libgsl")
       #:test-target "test"
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'patch-tests
           (lambda _
             (substitute* "test/test.pl"
               (("/bin/bash") (which "bash"))))))))
    (native-inputs
     (list htslib perl))
    (inputs
     (list gsl zlib))
    (home-page "https://samtools.github.io/bcftools/")
    (synopsis "Utilities for variant calling and manipulating VCFs and BCFs")
    (description
     "BCFtools is a set of utilities that manipulate variant calls in the
Variant Call Format (VCF) and its binary counterpart BCF.  All commands work
transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.")
    ;; The sources are dual MIT/GPL, but becomes GPL-only when USE_GPL=1.
    (license (list license:gpl3+ license:expat))))

(define-public bcftools-1.12
  (package/inherit bcftools
    (version "1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/samtools/bcftools/"
                                  "releases/download/"
                                  version "/bcftools-" version ".tar.bz2"))
              (sha256
               (base32
                "1x94l1hy2pi3lbz0sxlbw0g6q5z5apcrhrlcwda94ns9n4r6a3ks"))
              (modules '((guix build utils)))
              (snippet '(begin
                          ;; Delete bundled htslib.
                          (delete-file-recursively "htslib-1.12")))))
    (native-inputs (list htslib-1.12 perl))))

(define-public bcftools-1.10
  (package/inherit bcftools
    (version "1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/samtools/bcftools/"
                                  "releases/download/"
                                  version "/bcftools-" version ".tar.bz2"))
              (sha256
               (base32
                "10xgwfdgqb6dsmr3ndnpb77mc3a38dy8kh2c6czn6wj7jhdp4dra"))
              (modules '((guix build utils)))
              (snippet '(begin
                          ;; Delete bundled htslib.
                          (delete-file-recursively "htslib-1.10")))))
    (native-inputs (list htslib-1.10 perl))))

(define-public bedops
  (package
    (name "bedops")
    (version "2.4.41")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bedops/bedops")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "046037qdxsn01ln28rbrwnc7wq4a3xahmb2k74l0w75dby5ni42l"))))
    (build-system gnu-build-system)
    (arguments
     (list
      ;; We cannot run the tests because the build system makes strange
      ;; assumptions about where executables are located.
      #:tests? #false
      #:test-target "tests"
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'unpack-tarballs
            (lambda _
              ;; FIXME: Bedops includes tarballs of minimally patched upstream
              ;; libraries jansson, zlib, and bzip2.  We cannot just use stock
              ;; libraries because at least one of the libraries (zlib) is
              ;; patched to add a C++ function definition (deflateInit2cpp).
              ;; Until the Bedops developers offer a way to link against system
              ;; libraries we have to build the in-tree copies of these three
              ;; libraries.

              ;; See upstream discussion:
              ;; https://github.com/bedops/bedops/issues/124

              ;; Unpack the tarballs to benefit from shebang patching.
              (with-directory-excursion "third-party"
                (invoke "tar" "xvf" "jansson-2.6.tar.bz2")
                (invoke "tar" "xvf" "zlib-1.2.7.tar.bz2")
                (invoke "tar" "xvf" "bzip2-1.0.6.tar.bz2"))
              ;; Disable unpacking of tarballs in Makefile.
              (substitute* "system.mk/Makefile.linux"
                (("^\tbzcat .*") "\t@echo \"not unpacking\"\n")
                (("\\./configure") "CONFIG_SHELL=bash ./configure"))
              (substitute* "third-party/zlib-1.2.7/Makefile.in"
                (("^SHELL=.*$") "SHELL=bash\n"))))
          (delete 'configure)
          (replace 'install
            (lambda _
              (invoke "make" "install"
                      (string-append "BINDIR=" #$output "/bin")))))))
    (native-inputs
     (list diffutils perl which))
    (home-page "https://github.com/bedops/bedops")
    (synopsis "Tools for high-performance genomic feature operations")
    (description
     "BEDOPS is a suite of tools to address common questions raised in genomic
studies---mostly with regard to overlap and proximity relationships between
data sets.  It aims to be scalable and flexible, facilitating the efficient
and accurate analysis and management of large-scale genomic data.

BEDOPS provides tools that perform highly efficient and scalable Boolean and
other set operations, statistical calculations, archiving, conversion and
other management of genomic data of arbitrary scale.  Tasks can be easily
split by chromosome for distributing whole-genome analyses across a
computational cluster.")
    (license license:gpl2+)))

(define-public bedtools
  (package
    (name "bedtools")
    (version "2.30.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/arq5x/bedtools2/releases/"
                                  "download/v" version "/"
                                  "bedtools-" version ".tar.gz"))
              (sha256
               (base32
                "1f2hh79l7dn147c2xyfgf5wfjvlqfw32kjfnnh2n1qy6rpzx2fik"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:test-target "test"
      #:make-flags
      #~(list (string-append "prefix=" #$output))
      #:phases
      '(modify-phases %standard-phases
         (delete 'configure))))
    (native-inputs
     (list python-wrapper))
    (inputs
     (list samtools zlib))
    (home-page "https://github.com/arq5x/bedtools2")
    (synopsis "Tools for genome analysis and arithmetic")
    (description
     "Collectively, the bedtools utilities are a swiss-army knife of tools for
a wide-range of genomics analysis tasks.  The most widely-used tools enable
genome arithmetic: that is, set theory on the genome.  For example, bedtools
allows one to intersect, merge, count, complement, and shuffle genomic
intervals from multiple files in widely-used genomic file formats such as BAM,
BED, GFF/GTF, VCF.")
    (license license:expat)))

;; Later releases of bedtools produce files with more columns than
;; what Ribotaper expects.
(define-public bedtools-2.18
  (package (inherit bedtools)
    (name "bedtools")
    (version "2.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/arq5x/bedtools2/"
                                  "releases/download/v" version
                                  "/bedtools-" version ".tar.gz"))
              (sha256
               (base32
                "11rvca19ncg03kxd0wzlfx5ws7r3nisd0z8s9j9n182d8ksp2pxz"))))
    (arguments
     (list
      #:test-target "test"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'compatibility
            (lambda _
              (substitute* "src/utils/fileType/FileRecordTypeChecker.h"
                (("static const float PERCENTAGE")
                 "static constexpr float PERCENTAGE"))
              (substitute* "src/utils/general/DualQueue.h"
                (("template <class T, template<class T> class CompareFunc>")
                 "template <class T, template<class U> class CompareFunc>"))
              (substitute* '("src/utils/BamTools/src/api/algorithms/Sort.h"
                             "src/utils/BamTools/src/api/internal/bam/BamMultiMerger_p.h")
                (("(bool operator\\(\\).*) \\{" m pre)
                 (string-append pre " const {")))))
          (delete 'configure)
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin/")))
                (for-each (lambda (file)
                            (install-file file bin))
                          (find-files "bin" ".*"))))))))
    (native-inputs
     (list python-wrapper))
    (inputs
     (list samtools zlib))))

(define-public bitmapperbs
  (package
    (name "bitmapperbs")
    (version "1.0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chhylp123/BitMapperBS/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "02ksssfnvmpskld0a2016smfz5nrzm3d90v8974f3cpzywckvp8v"))
              (modules '((guix build utils)))
              ;; This package bundles a modified copy of htslib, so we cannot
              ;; unbundle it.
              (snippet
               '(begin
                  (delete-file-recursively "libdivsufsort-2.0.1")
                  (delete-file-recursively "pSAscan-0.1.0")))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #false
      #:make-flags '(list "bitmapperBS")
      ;; The build system checks for CPU features.  For this reason, we want
      ;; users to build it locally instead of using substitutes.
      #:substitutable? #false
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-build-system
            (lambda _
              (substitute* "Makefile"
                (("make prefix=../htslib_aim install")
                 (string-append "make prefix=" #$output " install-so"))
                (("htslib_aim/include") "htslib")
                (("htslib_aim/lib")
                 (string-append #$output "/lib")))))
          (add-after 'unpack 'patch-references-to-psascan
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "Makefile"
                (("\"(./)?psascan" pre all)
                 (string-append "\"" pre (search-input-file inputs "/bin/psascan"))))))
          (delete 'configure)
          (replace 'install
            (lambda _
              (install-file "bitmapperBS"
                            (string-append #$output "/bin/")))))))
    (inputs
     (list libdivsufsort psascan zlib))
    (home-page "https://github.com/chhylp123/BitMapperBS/")
    (synopsis "Read aligner for whole-genome bisulfite sequencing")
    (description
     "BitMapperBS is memory-efficient aligner that is designed for
whole-genome bisulfite sequencing (WGBS) reads from directional protocol.")
    (license license:asl2.0)))

(define-public cellsnp-lite
  ;; Last release is from November 2021 and does not contain fixes.
  (let ((commit "0885d746b0b1ea65c8ef92f8943ca7669ca9734a")
        (revision "0"))
    (package
      (name "cellsnp-lite")
      (version (git-version "1.2.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/single-cell-genetics/cellsnp-lite")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1qrvqgbvw6mbhpyqvqbmvv8dmyc67bsk1041cn7ib6zmd47qm444"))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:configure-flags
        #~(list (string-append "--with-htslib="
                               #$(this-package-input "htslib")))))
      (inputs
       (list curl
             htslib
             openssl
             zlib))
      (native-inputs
       (list autoconf))
      (home-page "https://cellsnp-lite.readthedocs.io")
      (synopsis "Pileup expresses alleles in single-cell or bulk RNA-seq data")
      (description
       "This package is designed to pileup the expressed alleles in
single-cell or bulk RNA-seq data, which can be directly used for donor
deconvolution in multiplexed single-cell RNA-seq data, particularly with other
packages, which assigns cells to donors and detects doublets as vireo, even
without genotyping reference.

This package is the C version of the deprecated cellSNP implemented in Python.
Compared to cellSNP, this package is more efficient with higher speed and less
memory usage.")
      (license license:asl2.0))))

(define-public pbcopper
  (package
    (name "pbcopper")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PacificBiosciences/pbcopper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "04mgmla96bsmr9gijbn3ibspry625cv4kqqxv70z4jq4qc407jy3"))))
    (build-system meson-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-meson-files
           (lambda _
             (substitute* "meson.build"
               (("-msse4.1") "")))))))
    (inputs
     (list boost))
    (native-inputs
     (list googletest pkg-config))
    (home-page "https://github.com/PacificBiosciences/pbcopper")
    (synopsis "Data structures, algorithms, and utilities for PacBio C++ applications")
    (description
     "The pbcopper library provides a suite of data structures, algorithms,
and utilities for PacBio C++ applications.")
    (license license:bsd-3)))

(define-public r-bedtorch
  (let ((commit "f5ff4f83b94f59eac660333c64e4b2f296b35cea")
        (revision "1"))
    (package
      (name "r-bedtorch")
      (version (git-version "0.1.12.12" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/haizi-zh/bedtorch/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "08l04iqf54b5995gc7rvqqd7w327fwqs7qjyhc9y5cqfj8yv4c48"))))
      (properties `((upstream-name . "bedtorch")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-assertthat
             r-curl
             r-data-table
             r-dplyr
             r-genomeinfodb
             r-genomicranges
             r-purrr
             r-r-utils
             r-rcpp
             r-rcurl
             r-readr
             r-rhtslib12
             r-s4vectors
             r-stringr
             r-tidyr))
      (home-page "https://github.com/haizi-zh/bedtorch/")
      (synopsis "R package for fast BED-file manipulation")
      (description
       "The goal of bedtorch is to provide a fast BED file manipulation tool
suite native in R.")
      (license license:expat))))

(define-public r-btools
  (let ((commit "fa21d4ca01d37ea4d98b45582453f3bf95cbc2b5")
        (revision "1"))
    (package
      (name "r-btools")
      (version (git-version "0.0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/twbattaglia/btools")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0bca593dnxz6xdywpdi0ipli0paln2b3bfxxj0csnmj55ryrz428"))))
      (properties `((upstream-name . "btools")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-biomformat
             r-coin
             r-deseq2
             r-dplyr
             r-genefilter
             r-phyloseq
             r-picante
             r-plotly
             r-reshape2
             r-stringr
             r-vegan))
      (home-page "https://github.com/twbattaglia/btools")
      (synopsis "R functions for microbial diversity analyses")
      (description
       "This package provides an assortment of R functions that is suitable
for all types of microbial diversity analyses.")
      (license license:expat))))

(define-public r-codeandroll2
  (let ((commit "d58e258851a5c0b430e8620d34dbeefb597c548f")
        (revision "1"))
    (package
      (name "r-codeandroll2")
      (version (git-version "2.3.6" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vertesy/CodeAndRoll2")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0sy88mfgw6qqhpnlc5020qzr1jllkcrxfhl2lw42bkl5nb56is71"))))
      (properties `((upstream-name . "CodeAndRoll2")))
      (build-system r-build-system)
      (propagated-inputs (list r-colorramps
                               r-dplyr
                               r-gplots
                               r-gtools
                               r-plyr
                               r-rcolorbrewer
                               r-sessioninfo
                               r-sm
                               r-stringendo
                               r-stringr))
      (home-page "https://github.com/vertesy/CodeAndRoll2")
      (synopsis "CodeAndRoll2 for vector, matrix and list manipulations")
      (description
       "CodeAndRoll2 is a set of more than 130 productivity functions.
These functions are used by MarkdownReports, ggExpress, and SeuratUtils.")
      (license license:gpl3))))

(define-public r-conospanel
  (let ((commit "39e76b201a783b4e92fd615010a735a61746fbb9")
        (revision "1"))
    (package
      (name "r-conospanel")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kharchenkolab/conosPanel")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1zf0aj5d4iaxc3ghvjnaja5qby1avlmljzh94bpyvxbd359z9snn"))))
      (properties `((upstream-name . "conosPanel")))
      (build-system r-build-system)
      (home-page "https://github.com/kharchenkolab/conosPanel")
      (synopsis "Data for the conos package")
      (description "The data within this package is a panel of four samples,
each with 3000 cells.  There are two samples which are bone marrow (BM), and
two samples which are cord blood (CB).")
      (license license:gpl3))))

(define-public r-conqur
  (let ((commit "c7a88794efd4ecfe4d96988dceeec3b410222e48")
        (revision "1"))
    (package
      (name "r-conqur")
      (version (git-version "2.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/wdl2459/ConQuR")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "19a7p2l67mgjy99i5ksjxlhzaqmrnyi1vzvwnhgnx2jrr6crj7rq"))))
      (properties `((upstream-name . "ConQuR")))
      (build-system r-build-system)
      (propagated-inputs (list r-ade4
                               r-ape
                               r-compositions
                               r-cqrreg
                               r-doparallel
                               r-dplyr
                               r-fastdummies
                               r-glmnet
                               r-gplots
                               r-gunifrac
                               r-quantreg
                               r-randomforest
                               r-rocr
                               r-vegan))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/wdl2459/ConQuR")
      (synopsis "Batch effects removal for microbiome data")
      (description
       "This package conducts batch effects removal from a taxa read count
table by a conditional quantile regression method.  The distributional
attributes of microbiome data - zero-inflation and over-dispersion, are
simultaneously considered.")
      (license license:gpl3))))

(define-public r-p2data
  (let ((commit "7d4c0e17d7899f9d9b08ab2bf455abe150912f4c")
        (revision "1"))
    (package
      (name "r-p2data")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kharchenkolab/p2data")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1hadrldldxvhqs43aqs3c88bqfgql3wcfkbll3jz7fh6z7p3x324"))))
      (properties `((upstream-name . "p2data")))
      (build-system r-build-system)
      (home-page "https://github.com/kharchenkolab/p2data")
      (synopsis "Data for pagoda2")
      (description "This package contains data used by pagoda2.  The data
within this package are the 3000 bone marrow cells used for vignettes.")
      (license license:gpl3))))

(define-public r-rhtslib12
  (let ((commit "ee186daf04876969c7f31c16a0e0fda8e7c16a30")
        (revision "1"))
    (package
      (name "r-rhtslib12")
      (version (git-version "1.23.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/haizi-zh/Rhtslib12")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0a3kkp0phi2fq6ip8p9vfj3axn7l15f2mb51a6v3ai4nlkhqqawj"))))
      (properties `((upstream-name . "Rhtslib12")))
      (build-system r-build-system)
      (propagated-inputs (list curl zlib r-zlibbioc))
      (native-inputs (list pkg-config r-knitr))
      (home-page "https://github.com/haizi-zh/Rhtslib12")
      (synopsis "HTSlib high-throughput sequencing library as an R package")
      (description
       "This package provides version 1.12 of the HTSlib C library for
high-throughput sequence analysis.  The package is primarily useful to
developers of other R packages who wish to make use of HTSlib.")
      (license license:lgpl2.0+))))

(define-public r-singlet
  (let ((commit "765a6c45081807a1522f0e8983e2417822a36f36")
        (revision "1"))
    (package
      (name "r-singlet")
      (version (git-version "0.99.26" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/zdebruine/singlet")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "040v8wzl9qr8ribr6qss61fz4698d14cqs8nxbc8hqwiqlpy3vs4"))))
      (properties `((upstream-name . "singlet")))
      (build-system r-build-system)
      (propagated-inputs (list r-dplyr
                               r-fgsea
                               r-ggplot2
                               r-knitr
                               r-limma
                               r-matrix
                               r-msigdbr
                               r-rcpp
                               r-rcppml/devel
                               r-reshape2
                               r-scuttle
                               r-seurat))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/zdebruine/singlet")
      (synopsis "Non-negative Matrix Factorization for single-cell analysis")
      (description
       "This is a package for fast @dfn{Non-negative Matrix
Factorization} (NMF) with automatic rank-determination for dimension reduction
of single-cell data using Seurat, RcppML nmf, SingleCellExperiments and
similar.")
      (license license:gpl2+))))

(define-public r-stringendo
  (let ((commit "83b8f2d82a09b33b9e895438bb523a021138be01")
        (revision "1"))
    (package
      (name "r-stringendo")
      (version (git-version "0.3.4" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vertesy/Stringendo")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1ap0nhbyd6xx0yl2vgmwk38p22yrkv4k9hw13r35z4wf343rry6v"))))
      (properties `((upstream-name . "Stringendo")))
      (build-system r-build-system)
      (propagated-inputs (list r-devtools r-usethis))
      (home-page "https://github.com/vertesy/Stringendo")
      (synopsis "Stringendo is a string parsing library")
      (description
       "This package provides string parsing functionalites for generating
plotnames, filenames and paths.")
      (license license:gpl3))))

(define-public r-readwriter
  (let ((commit "71454f4aa706f5d2fbe606acd95abc14224e7058")
        (revision "1"))
    (package
      (name "r-readwriter")
      (version (git-version "0.2.9" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vertesy/ReadWriter")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0sp27smhdva2hi2x0svia2l56k8xrh7p5akn78g5b0lcvz4x3hd7"))))
      (properties `((upstream-name . "ReadWriter")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-gdata r-gtools r-openxlsx r-readr r-stringendo))
      (home-page "https://github.com/vertesy/ReadWriter")
      (synopsis "Functions to read and write files conveniently")
      (description
       "ReadWriter is a set of R functions to read and write files
conveniently.")
      (license license:gpl3))))

(define-public r-streamgraph
  (let ((commit "76f7173ec89d456ace5943a512e20b1f6810bbcb")
        (revision "1"))
    (package
      (name "r-streamgraph")
      (version (git-version "0.9.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/hrbrmstr/streamgraph")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "010rhnby5a9dg08jvlkr65b3p9iipdxi2f5m1k6j53s80p25yvig"))))
      (properties `((upstream-name . "streamgraph")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-dplyr
             r-htmltools
             r-htmlwidgets
             r-magrittr
             r-tidyr
             r-xts))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/hrbrmstr/streamgraph")
      (synopsis "Htmlwidget for building streamgraph visualizations")
      (description
       "A streamgraph is a type of stacked area chart.  It represents the
evolution of a numeric variable for several groups.  Areas are usually
displayed around a central axis, and edges are rounded to give a flowing
shape.  This package provides an @code{htmlwidget} for building streamgraph
visualizations.")
      (license license:expat))))

(define-public pbbam
  (package
    (name "pbbam")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PacificBiosciences/pbbam")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1iyazi3l7dswpfxh39k5j7ydi0ywja0579xz3r6l9kkwz2n1z6dc"))))
    (build-system meson-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-tests
           (lambda* (#:key inputs #:allow-other-keys)
             ;; Disable this test.  I tried fixing it by including
             ;; optional_io.hpp, but there's a type error.
             (substitute* "tests/src/meson.build"
               (("'test_ReadGroupInfo.cpp',") ""))
             #;
             (substitute* "include/pbbam/ReadGroupInfo.h"
               (("#include <boost/optional.hpp>" m)
                (string-append m "\n#include <boost/optional/optional_io.hpp>")))
             (substitute* '("tests/scripts/cram/_test.py"
                            "tests/scripts/cram/_main.py")
               (("'/bin/sh'")
                (string-append "'" (which "sh") "'"))))))))
    ;; These libraries are listed as "Required" in the pkg-config file.
    (propagated-inputs
     (list htslib-1.14 pbcopper zlib))
    (inputs
     (list boost samtools))
    (native-inputs
     (list googletest
           pkg-config
           python-wrapper)) ;for tests
    (home-page "https://github.com/PacificBiosciences/pbbam")
    (synopsis "Work with PacBio BAM files")
    (description
     "The pbbam software package provides components to create, query, and
edit PacBio BAM files and associated indices.  These components include a core
C++ library, bindings for additional languages, and command-line utilities.
This library is not intended to be used as a general-purpose BAM utility - all
input and output BAMs must adhere to the PacBio BAM format specification.
Non-PacBio BAMs will cause exceptions to be thrown.")
    (license license:bsd-3)))

(define-public pbgzip
  (let ((commit "2b09f97b5f20b6d83c63a5c6b408d152e3982974"))
    (package
      (name "pbgzip")
      (version (git-version "0.0.0" "0" commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/nh13/pbgzip")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1mlmq0v96irbz71bgw5zcc43g1x32zwnxx21a5p1f1ch4cikw1yd"))))
      (build-system gnu-build-system)
      (native-inputs
       (list autoconf automake))
      (inputs
       (list zlib))
      (home-page "https://github.com/nh13/pbgzip")
      (synopsis "Parallel Block GZIP")
      (description "This package implements parallel block gzip.  For many
formats, in particular genomics data formats, data are compressed in
fixed-length blocks such that they can be easily indexed based on a (genomic)
coordinate order, since typically each block is sorted according to this order.
This allows for each block to be individually compressed (deflated), or more
importantly, decompressed (inflated), with the latter enabling random retrieval
of data in large files (gigabytes to terabytes).  @code{pbgzip} is not limited
to any particular format, but certain features are tailored to genomics data
formats when enabled.  Parallel decompression is somewhat faster, but the true
speedup comes during compression.")
      (license license:expat))))

(define-public blasr-libcpp
  (package
    (name "blasr-libcpp")
    (version "5.3.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PacificBiosciences/blasr_libcpp")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "07cdfnfl29zf2j7fpaaqaxghq3p0wnc109razs0icwm2q6l3gycb"))))
    (build-system meson-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'link-with-hdf5
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((hdf5 (assoc-ref inputs "hdf5")))
               (substitute* "meson.build"
                 (("libblasr_deps = \\[" m)
                  (string-append
                   m
                   (format #f "cpp.find_library('hdf5', dirs : '~a'), \
cpp.find_library('hdf5_cpp', dirs : '~a'), "
                           hdf5 hdf5)))))))
         (add-after 'unpack 'find-googletest
           (lambda* (#:key inputs #:allow-other-keys)
             ;; It doesn't find gtest_main because there's no pkg-config file
             ;; for it.  Find it another way.
             (substitute* "unittest/meson.build"
               (("libblasr_gtest_dep = dependency\\('gtest_main'.*")
                (format #f "cpp = meson.get_compiler('cpp')
libblasr_gtest_dep = cpp.find_library('gtest_main', dirs : '~a')\n"
                        (assoc-ref inputs "googletest")))))))
       ;; TODO: unittest/libblasr_unittest cannot be linked
       ;; ld: ;; unittest/df08227@@libblasr_unittest@exe/alignment_utils_FileUtils_gtest.cpp.o:
       ;; undefined reference to symbol
       ;; '_ZN7testing8internal9DeathTest6CreateEPKcPKNS0_2REES3_iPPS1_'
       ;; ld: /gnu/store/...-googletest-1.8.0/lib/libgtest.so:
       ;;   error adding symbols: DSO missing from command line
       #:tests? #f
       #:configure-flags '("-Dtests=false")))
    (inputs
     (list boost hdf5 htslib pbbam zlib))
    (native-inputs
     (list googletest pkg-config))
    (home-page "https://github.com/PacificBiosciences/blasr_libcpp")
    (synopsis "Library for analyzing PacBio genomic sequences")
    (description
     "This package provides three libraries used by applications for analyzing
PacBio genomic sequences.  This library contains three sub-libraries: pbdata,
hdf and alignment.")
    (license license:bsd-3)))

(define-public blasr
  (package
    (name "blasr")
    (version "5.3.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PacificBiosciences/blasr")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0axyd06gn2xa0p0k76fihsbxpfxvhlb18jn6bf97c0ii58r1wc0k"))))
    (build-system meson-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'link-with-hdf5
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((hdf5 (assoc-ref inputs "hdf5")))
               (substitute* "meson.build"
                 (("blasr_deps = \\[" m)
                  (string-append
                   m
                   (format #f "cpp.find_library('hdf5', dirs : '~a'), \
cpp.find_library('hdf5_cpp', dirs : '~a'), "
                           hdf5 hdf5))))))))
       ;; Tests require "cram" executable, which is not packaged.
       #:tests? #f
       #:configure-flags '("-Dtests=false")))
    (inputs
     (list boost blasr-libcpp hdf5 pbbam zlib))
    (native-inputs
     (list pkg-config))
    (home-page "https://github.com/PacificBiosciences/blasr")
    (synopsis "PacBio long read aligner")
    (description
     "Blasr is a genomic sequence aligner for processing PacBio long reads.")
    (license license:bsd-3)))

(define-public ribotaper
  (package
    (name "ribotaper")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ohlerlab.mdc-berlin.de/"
                                  "files/RiboTaper/RiboTaper_Version_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0ykjbps1y3z3085q94npw8i9x5gldc6shy8vlc08v76zljsm07hv"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-executables
            (lambda _
              (for-each
               (lambda (script)
                 (wrap-program (string-append #$output "/bin/" script)
                   `("R_LIBS_SITE" ":" = (,(getenv "R_LIBS_SITE")))))
               '("create_annotations_files.bash"
                 "create_metaplots.bash"
                 "Ribotaper_ORF_find.sh"
                 "Ribotaper.sh")))))))
    (inputs
     (list bedtools-2.18
           samtools-0.1
           r-minimal
           r-foreach
           r-xnomial
           r-domc
           r-multitaper
           r-seqinr))
    (home-page "https://ohlerlab.mdc-berlin.de/software/RiboTaper_126/")
    (synopsis "Define translated ORFs using ribosome profiling data")
    (description
     "Ribotaper is a method for defining translated @dfn{open reading
frames} (ORFs) using ribosome profiling (ribo-seq) data.  This package
provides the Ribotaper pipeline.")
    (license license:gpl3+)))

(define-public bioawk
  (package
    (name "bioawk")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lh3/bioawk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1pxc3zdnirxbf9a0az698hd8xdik7qkhypm7v6hn922x8y9qmspm"))))
    (build-system gnu-build-system)
    (inputs (list zlib))
    (native-inputs (list bison))
    (arguments
     (list
      #:tests? #f ; There are no tests to run.
      ;; Bison must generate files, before other targets can build.
      #:parallel-build? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)           ; There is no configure phase.
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin"))
                    (man (string-append #$output "/share/man/man1")))
                (mkdir-p man)
                (copy-file "awk.1" (string-append man "/bioawk.1"))
                (install-file "bioawk" bin)))))))
    (home-page "https://github.com/lh3/bioawk")
    (synopsis "AWK with bioinformatics extensions")
    (description "Bioawk is an extension to Brian Kernighan's awk, adding the
support of several common biological data formats, including optionally gzip'ed
BED, GFF, SAM, VCF, FASTA/Q and TAB-delimited formats with column names.  It
also adds a few built-in functions and a command line option to use TAB as the
input/output delimiter.  When the new functionality is not used, bioawk is
intended to behave exactly the same as the original BWK awk.")
    (license license:x11)))

(define-public python-bcbio-gff
  (package
    (name "python-bcbio-gff")
    (version "0.6.9")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "bcbio-gff" version))
              (sha256
               (base32
                "1pm1szyxabhn8jismrj9cjhf88ajgcmm39f0cgf36iagw5qakprl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-biopython python-six))
    (native-inputs (list python-pytest))
    (home-page "https://github.com/chapmanb/bcbb/tree/master/gff")
    (synopsis "Read and write GFF files with Biopython integration")
    (description
     "This package lets you read and write files in Generic Feature
Format (GFF) with Biopython integration.")
    (license (license:non-copyleft "http://www.biopython.org/DIST/LICENSE"))))

(define-public python-bcbio-gff/biopython-1.73
  (package
    (inherit python-bcbio-gff)
    (propagated-inputs
     (modify-inputs (package-propagated-inputs python-bcbio-gff)
       (replace "python-biopython" python-biopython-1.73)))))

;; Note: the name on PyPi is "biofluff".
(define-public python-biofluff
  (package
    (name "python-biofluff")
    (version "3.0.4")
    ;; PyPi tarball does not contain test data.
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simonvh/fluff")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "12yvhgp72s2ygf3h07rrc852zd6q8swc41hm28mcczpsyprggxyz"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:test-flags
      ;; Theses tests require internet access
      '(list "--ignore=tests/test_mirror.py"
             "-k" "not test_plots_big")
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'matplotlib-compatibility
           (lambda _
             (substitute* "fluff/plot.py"
               (("beginarrow=False, endarrow=True,") "")))))))
    (propagated-inputs
     (list htseq
           python-matplotlib
           python-numpy
           python-palettable
           python-pybedtools
           python-pybigwig
           python-pysam
           python-scikit-learn
           python-scipy))
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/simonvh/fluff/")
    (synopsis "Analysis and visualization of high-throughput sequencing data")
    (description
     "Fluff is a Python package that contains several scripts to produce
pretty, publication-quality figures for next-generation sequencing
experiments.")
    (license license:expat)))

(define-public python-bulkvis
  (let ((commit "00a82a90c7e748a34af896e779d27e78a2c82b5e")
        (revision "2"))
    (package
      (name "python-bulkvis")
      (version (git-version "2.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/LooseLab/bulkVis")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "02blai158xyyqcg0ljzkmfa6ci05m4awrl4njvp9nwfp717xq8n0"))
                (modules '((guix build utils)))
                (snippet
                 '(substitute* '("requirements.txt"
                                 "setup.py")
                    (("tqdm~=4.46.1") "tqdm")
                    (("tornado~=6.0.4") "tornado")
                    (("pandas~=1.0.5") "pandas")
                    (("h5py~=2.10.0") "h5py")
                    ;; See below for com
                    (("bokeh~=2.1.0") "bokeh")))))
      (build-system pyproject-build-system)
      (arguments
       (list #:tests? #f                ;There are no tests
             #:phases
             '(modify-phases %standard-phases
                ;; See https://github.com/LooseLab/bulkvis/issues/58
                (add-after 'unpack 'bokeh-compatibility
                  (lambda _
                    (substitute* "bulkvis/bulkvis.py"
                      (("import importlib" m)
                       (string-append m "
from bokeh.command.subcommand import Argument
from bokeh.util.dataclasses import entries\n"))
                      (("( *)_parser.add_argument" m indent)
                       (string-append
                        (string-join (list "if isinstance(opts, Argument):\n"
                                           "  opts = dict(entries(opts))\n")
                                     indent 'prefix)
                        m))))))))
      (propagated-inputs (list python-bokeh
                               python-dill
                               python-h5py
                               python-joblib
                               python-matplotlib
                               python-numpy
                               python-pandas
                               python-plotly
                               python-readpaf
                               python-scikit-learn
                               python-scikit-image
                               python-scipy
                               python-seaborn
                               python-tornado-6
                               python-tqdm
                               python-umap-learn))
      (native-inputs (list python-pytest))
      (home-page "https://github.com/LooseLab/bulkVis")
      (synopsis "Interactive visualization of bulk RNA-seq data")
      (description
       "This is a Python package for the interactive visualization of bulk
RNA-seq data.  It provides a range of plotting functions and interactive tools
to explore and analyze bulk RNA-seq data.")
      (license license:expat))))

(define-public python-cell2cell
  (package
    (name "python-cell2cell")
    (version "0.6.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/earmingol/cell2cell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1hwww0rcv8sc4k312n4d0jhbyix1jjqgv5djg25bw8127q5iym3s"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; We remove the dependency on statannotations because it
                  ;; will not work with the current version of seaborn.  See
                  ;; https://github.com/trevismd/statannotations/issues/122
                  (substitute* "cell2cell/plotting/factor_plot.py"
                    (("from statannotations.Annotator import Annotator")
                     "")
                    (("if statistical_test is not None")
                     "if False"))
                  (substitute* "setup.py"
                    (("'statannotations',") "")
                    ;; We provide version 1.0.4, which should be fine.
                    (("'gseapy == 1.0.3'") "'gseapy'")
                    ;; Using matplotlib 3.5.2 leads to this bug:
                    ;; https://github.com/earmingol/cell2cell/issues/19 but we
                    ;; can't package a different minor version of matplotlib
                    ;; and limit its use to just this package.
                    (("matplotlib >= 3.2.0,<=3.5.1") ""))))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f                  ;There are no tests
      #:phases
      '(modify-phases %standard-phases
         ;; Numba needs a writable dir to cache functions.
         (add-before 'build 'set-numba-cache-dir
           (lambda _ (setenv "NUMBA_CACHE_DIR" "/tmp"))))))
    (propagated-inputs
     (list python-gseapy
           python-kneed
           python-matplotlib
           python-networkx
           python-numpy
           python-openpyxl
           python-pandas
           python-scikit-learn
           python-scipy
           python-seaborn
           python-statsmodels
           python-scanpy
           python-seaborn
           python-tensorly
           python-tqdm
           python-umap-learn
           python-xlrd))
    (home-page "https://github.com/earmingol/cell2cell")
    (synopsis "Python library for cell communication analysis")
    (description
     "Cell2cell is a Python library for cell communication analysis.
This is a method to calculate, visualize and analyze communication between
cell types.  Cell2cell is suitable for single-cell RNA sequencing
(scRNA-seq) data.")
    (license license:bsd-3)))

(define-public python-cellbender
  (package
    (name "python-cellbender")
    (version "0.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/broadinstitute/CellBender")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0h9d9pznffdbya631hkk7b7jwjrgx5saqssar1d42qbyvdji3hgy"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #false)) ;there are none
    (propagated-inputs
     (list python-anndata
           python-matplotlib
           python-numpy
           python-pandas
           python-pyro-ppl
           python-scikit-learn
           python-scipy
           python-sphinx
           python-sphinx-argparse
           python-sphinx-autodoc-typehints
           python-sphinx-rtd-theme
           python-sphinxcontrib-programoutput
           python-tables))
    (home-page "https://cellbender.rtfd.io/")
    (synopsis "Eliminate technical artifacts from single-cell RNA-seq data")
    (description
     "CellBender is a software package for eliminating technical artifacts
from high-throughput single-cell RNA sequencing (scRNA-seq) data.")
    (license license:bsd-3)))

(define-public python-cmseq
  (package
    (name "python-cmseq")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "CMSeq" version))
              (sha256
               (base32
                "0p6a99c299m5wi2z57dgqz52m1z3nfr8mv7kdnk2jvl2p9nql0wk"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #false ;there are no tests
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'patch-samtools-reference
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "cmseq/cmseq.py"
               (("'samtools'")
                (string-append "'" (search-input-file inputs "/bin/samtools") "'"))))))))
    (inputs (list samtools))
    (propagated-inputs
     (list python-bcbio-gff/biopython-1.73
           python-biopython-1.73
           python-numpy
           python-pandas
           python-pysam
           python-scipy))
    (home-page "https://github.com/SegataLab/cmseq/")
    (synopsis "Set of utilities on sequences and BAM files")
    (description
     "CMSeq is a set of commands to provide an interface to .bam files for coverage
and sequence consensus.")
    (license license:expat)))

(define-public python-decoupler-py
  ;; This latest commit fixes a bug in test_omnip.py.
  (let ((commit "b84c524ec4a9280a56c0db963e2c7b010316ce8f")
        (revision "1"))
    (package
      (name "python-decoupler-py")
      (version (git-version "1.3.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/saezlab/decoupler-py")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0d74yr5jqc52vcxaca84kxqw7m5rbazpmvnrcp2y4xxrj6yr1sfc"))))
      (build-system pyproject-build-system)
      (arguments
       (list
        #:test-flags
        '(list "-k"
               ;; These tests require internet access
               (string-append "not test_get_resource"
                              " and not test_show_resources"
                              " and not test_get_dorothea"
                              " and not test_get_progeny"
                              ;; XXX This one fails because the "texts" list
                              ;; is empty, so there are no texts to adjust.
                              ;; It is not clear whether this a compatibility
                              ;; problem with our adjusttext package.
                              " and not test_plot_volcano"))
        #:phases
        '(modify-phases %standard-phases
           (add-before 'check 'set-home
             ;; Some tests require a home directory to be set.
             (lambda _ (setenv "HOME" "/tmp")))
           ;; Numba needs a writable dir to cache functions.
           (add-before 'build 'set-numba-cache-dir
             (lambda _ (setenv "NUMBA_CACHE_DIR" "/tmp"))))))
      (propagated-inputs (list python-adjusttext
                               python-anndata
                               python-ipython
                               python-matplotlib
                               python-nbsphinx
                               python-numba
                               python-numpy
                               python-numpydoc
                               python-omnipath
                               python-scanpy
                               python-scikit-learn
                               python-scipy
                               python-skranger
                               python-tqdm
                               python-typing-extensions))
      (native-inputs (list python-pytest))
      (home-page "https://github.com/saezlab/decoupler-py")
      (synopsis
       "Framework for modeling, analyzing and interpreting single-cell RNA-seq data")
      (description
       "This package provides different statistical methods to extract
biological activities from omics data within a unified framework.")
      (license license:gpl3+))))

(define-public python-demuxem
  (package
    (name "python-demuxem")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "demuxEM" version))
              (sha256
               (base32
                "1bhyxqjk44bmyd26m1smapf68wyf7252kk65i27k50dd3kswgnd6"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-docopt
           python-importlib-metadata
           python-numpy
           python-pandas
           python-pegasusio
           python-scikit-learn
           python-scipy
           python-seaborn))
    (native-inputs (list python-cython python-setuptools-scm))
    (home-page "https://github.com/lilab-bcb/demuxEM")
    (synopsis "Analyze cell-hashing/nucleus-hashing data")
    (description
     "This is a Python module for analyzing cell-hashing/nucleus-hashing data.
It is the demultiplexing module of Pegasus, which is used by Cumulus in the
demultiplexing step.")
    (license license:bsd-3)))

(define-public python-doubletdetection
  (package
    (name "python-doubletdetection")
    (version "4.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "doubletdetection" version))
              (sha256
               (base32
                "0v0a19014h4p6x8pyz1s78xn3q5w5166cysvg574z6vw79a3s9vp"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #false ;there are none
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-poetry-core
            (lambda _
              ;; Patch to use the core poetry API.
              (substitute* "pyproject.toml"
                (("poetry.masonry.api")
                 "poetry.core.masonry.api")))))))
    (propagated-inputs
     (list python-anndata
           python-ipywidgets
           python-leidenalg
           python-vtraag-louvain
           python-matplotlib
           python-numpy
           python-pandas
           python-phenograph
           python-scanpy
           python-scipy
           python-tqdm))
    (native-inputs
     (list python-black
           python-flake8
           python-poetry-core
           python-pytest))
    (home-page "https://github.com/JonathanShor/DoubletDetection")
    (synopsis
     "This is a package to detect doublets in single-cell RNA-seq count matrices")
    (description
     "This package provides a method to detect and enable removal of doublets
from single-cell RNA-sequencing.")
    (license license:expat)))

(define-public python-hclust2
  (package
    (name "python-hclust2")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "hclust2" version))
              (sha256
               (base32
                "0v89n2g42d7jhgfs8glf06apgxx6aswp3mfisgnhm518cv8z2rwn"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))      ;there are no tests
    (propagated-inputs
     (list python-matplotlib
           python-numpy
           python-pandas
           python-scipy))
    (home-page "https://github.com/SegataLab/hclust2/")
    (synopsis "Plotting heat-maps for publications")
    (description
     "Hclust2 is a handy tool for plotting heat-maps with several useful options
to produce high quality figures that can be used in publications.")
    (license license:expat)))

(define-public python-htsget
  (package
   (name "python-htsget")
   (version "0.2.6")
   (source (origin
            (method url-fetch)
            (uri (pypi-uri "htsget" version))
            (sha256
             (base32
              "111q4pzkav26aa3hkgh948wqlyrq7dq6sjml9z63n3blw8s6b0c4"))))
   (build-system pyproject-build-system)
   (native-inputs
    (list python-setuptools-scm))
   (propagated-inputs
    (list python-humanize python-requests python-six))
   (home-page "https://pypi.org/project/htsget/")
   (synopsis "Python API and command line interface for the GA4GH htsget API")
   (description "This package is a client implementation of the GA4GH htsget
protocol.  It provides a simple and reliable way to retrieve genomic data from
servers supporting the protocol.")
   (license license:asl2.0)))

(define-public python-logomaker
  (package
    (name "python-logomaker")
    (version "0.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "logomaker" version))
              (sha256
               (base32
                "0v9z3ml1s7imk28hqyhrqjqg3sq0j29lx975d36n2ybdgld51iyq"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-matplotlib python-numpy python-pandas))
    (home-page "https://logomaker.readthedocs.io")
    (synopsis "Package for making Sequence Logos")
    (description "Logomaker is a Python package for generating
publication-quality sequence logos.  Logomaker can generate both standard and
highly customized logos illustrating the properties of DNA, RNA, or protein
sequences.  Logos are rendered as vector graphics embedded within native
matplotlib Axes objects, making them easy to style and incorporate into
multi-panel figures.")
    (license license:expat)))

(define-public python-pegasusio
  (package
    (name "python-pegasusio")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pegasusio" version))
              (sha256
               (base32
                "0gqygspdy398vjymdy6756jmk99s7fhwav9rivdx59kpqjcdxaz9"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-anndata
           python-docopt
           python-h5py
           python-importlib-metadata
           python-loompy
           python-natsort
           python-numpy
           python-pandas
           python-pillow
           python-scipy
           python-zarr))
    (native-inputs (list python-cython python-setuptools-scm))
    (home-page "https://github.com/lilab-bcb/pegasusio")
    (synopsis "Read or write single-cell genomics data")
    (description
     "Pegasusio is a Python package for reading or writing single-cell
genomics data.")
    (license license:bsd-3)))

(define-public python-phenograph
  (package
    (name "python-phenograph")
    (version "1.5.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "PhenoGraph" version))
              (sha256
               (base32
                "0nji449mzwgp1f87iknl5fmnjdkrhkfkapxvafxdw01s0jg8zcj6"))
              (modules '((guix build utils)))
              ;; Remove bundled binaries
              (snippet
               '(delete-file-recursively "phenograph/louvain"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; This test can never succeed because Q_leiden is never set to
          ;; anything other than None.
          (add-after 'unpack 'disable-leiden-test
            (lambda _
              (substitute* "tests/test_cluster.py"
                (("def test_run_leiden") "def _test_run_leiden"))))
          (add-after 'unpack 'patch-louvain
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "phenograph/core.py"
                (("lpath = os.path.*")
                 (string-append "lpath = \""
                                (dirname (search-input-file inputs "/bin/community"))
                                "\"\n"))
                (("linux-(community|hierarchy|convert)" _ thing) thing)
                ;; Do not write binaries, because the unmodified "convert"
                ;; from louvain only knows how to process plain text files.
                (("with open\\(filename \\+ \".bin\", \"w\\+b\"\\) as f:")
                 "with open(filename + \".bin\", \"w+\") as f:")
                (("f.writelines\\(\\[e for t in zip\\(ij, s\\) for e in t\\]\\)")
                 "for [src, dest], weight in zip(ij, s): \
f.write(src.astype(\"str\") + ' ' + \
dest.astype(\"str\") + ' ' + \
weight.astype(\"str\") + '\\n')")))))))
    (inputs
     (list louvain))
    (propagated-inputs
     (list python-leidenalg
           python-numpy
           python-psutil
           python-scikit-learn
           python-scipy))
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/dpeerlab/PhenoGraph.git")
    (synopsis "Graph-based clustering for high-dimensional single-cell data")
    (description
     "PhenoGraph is a clustering method designed for high-dimensional
single-cell data.  It works by creating a graph representing phenotypic
similarities between cells and then identifying communities in this graph.")
    (license license:expat)))

(define-public python-phylophlan
  (package
    (name "python-phylophlan")
    (version "3.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/biobakery/phylophlan")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1wz70xzxqx2sf5flmf45m15jq027dqijfaj1r51pl50w5x6dkawx"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))      ;there are no tests
    (propagated-inputs
     (list python-biopython
           python-dendropy
           python-matplotlib
           python-numpy
           python-pandas
           python-seaborn))
    (home-page "https://github.com/biobakery/phylophlan")
    (synopsis
     "Phylogenetic analysis of microbial isolates and genomes from metagenomes")
    (description
     "This package is an integrated pipeline for large-scale phylogenetic
profiling of genomes and metagenomes.  PhyloPhlAn is an accurate, rapid, and
easy-to-use method for large-scale microbial genome characterization and
phylogenetic analysis at multiple levels of resolution.  This software package
can assign both genomes and @acronym{MAGs, metagenome-assembled genomes} to
@acronym{SGBs, species-level genome bins}.  PhyloPhlAn can reconstruct
strain-level phylogenies using clade- specific maximally informative
phylogenetic markers, and can also scale to very large phylogenies comprising
>17,000 microbial species.")
    (license license:expat)))

(define-public python-pybedtools
  (package
    (name "python-pybedtools")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pybedtools" version))
              (sha256
               (base32
                "18rhzk08d3rpxhi5xh6pqg64x6v5q3daw6y3v54k85v4swncjrwj"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:modules ((srfi srfi-26)
                  (guix build utils)
                  (guix build python-build-system)
                  (guix build pyproject-build-system))
       ;; See https://github.com/daler/pybedtools/issues/192
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'disable-broken-tests
           (lambda _
             (substitute* "pybedtools/test/test_helpers.py"
               ;; Requires internet access.
               (("def test_chromsizes")
                "def _do_not_test_chromsizes")
               ;; Broken as a result of the workaround used in the check phase
               ;; (see: https://github.com/daler/pybedtools/issues/192).
               (("def test_getting_example_beds")
                "def _do_not_test_getting_example_beds"))
             ;; This issue still occurs on python2
             (substitute* "pybedtools/test/test_issues.py"
               (("def test_issue_303")
                "def _test_issue_303"))))
         ;; Force the Cythonization of C++ files to guard against compilation
         ;; problems.
         (add-after 'unpack 'remove-cython-generated-files
           (lambda _
             (let ((cython-sources (map (cut string-drop-right <> 4)
                                        (find-files "." "\\.pyx$")))
                   (c/c++-files (find-files "." "\\.(c|cpp|cxx)$")))
               (define (strip-extension filename)
                 (string-take filename (string-index-right filename #\.)))
               (define (cythonized? c/c++-file)
                 (member (strip-extension c/c++-file) cython-sources))
               (for-each delete-file (filter cythonized? c/c++-files)))))
         (add-after 'remove-cython-generated-files 'generate-cython-extensions
           (lambda _
             (invoke "python" "setup.py" "cythonize")))
         (replace 'check
           (lambda _
             ;; The tests need to be run from elsewhere...
             (mkdir-p "/tmp/test")
             (copy-recursively "pybedtools/test" "/tmp/test")
             (with-directory-excursion "/tmp/test"
               (invoke "pytest" "-v" "--doctest-modules")))))))
    (propagated-inputs
     (list bedtools samtools python-matplotlib python-pysam
           python-pyyaml))
    (native-inputs
     (list python-numpy
           python-pandas
           python-cython
           kentutils ; for bedGraphToBigWig
           python-six
           ;; For the test suite.
           python-pytest
           python-psutil))
    (home-page "https://pythonhosted.org/pybedtools/")
    (synopsis "Python wrapper for BEDtools programs")
    (description
     "This package is a Python wrapper for Aaron Quinlan's BEDtools programs,
which are widely used for genomic interval manipulation or \"genome algebra\".
pybedtools extends BEDTools by offering feature-level manipulations from with
Python.")
    ;; pypi lists GPLv2 in the PKG-INFO and website, but was relicensed in
    ;; version 0.9.0 and the LICENSE.txt is consistent with the source code.
    ;;
    ;; pybedtools/include/gzstream.cpp and pybedtools/include/gzstream.h are
    ;; licensed lgpl2.1+
    (license (list license:expat license:lgpl2.1+))))

(define-public python-bioframe
  (package
    (name "python-bioframe")
    (version "0.3.3")
    (source
     (origin
       (method git-fetch)
       ;; pypi version does not contain tests and requirements.txt
       (uri (git-reference
             (url "https://github.com/open2c/bioframe")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "14lvb18d4npapyi6j2zqh9q94l658dzmka5riiizw1h0zb0kp9xb"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (setenv "MPLCONFIGDIR" "/tmp")
             (when tests?
               (invoke "pytest" "-v")))))))
    (native-inputs
     (list python-biopython
           python-pysam
           python-pytest
           python-wheel))
    (propagated-inputs
     (list python-matplotlib
           python-numpy
           python-pandas
           python-requests))
    (home-page "https://github.com/open2c/bioframe")
    (synopsis "Pandas utilities for tab-delimited and other genomic files")
    (description
     "This package is a library to enable flexible and scalable operations on
genomic interval dataframes in Python.  Bioframe enables access to a rich set
of dataframe operations.  Working in Python enables rapid visualization and
iteration of genomic analyses.  The philosophy underlying bioframe is to
enable flexible operations.  Instead of creating a function for every possible
use-case, we encourage users to compose functions to achieve their goals.")
    (license license:expat)))

(define-public python-biom-format
  (package
    (name "python-biom-format")
    (version "2.1.12")
    (source
     (origin
       (method git-fetch)
       ;; Use GitHub as source because PyPI distribution does not contain
       ;; test data: https://github.com/biocore/biom-format/issues/693
       (uri (git-reference
             (url "https://github.com/biocore/biom-format")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "06x2d8fv80jp86kd66fm3ragmxrpa2j0lzsbm337ziqjnpsdwc0f"))
       (modules '((guix build utils)))
       ;; Delete generated C files.
       (snippet
        '(for-each delete-file (find-files "." "\\.c")))))
    (build-system python-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'use-cython
           (lambda _ (setenv "USE_CYTHON" "1")))
         (add-after 'unpack 'disable-broken-tests
           (lambda _
             (substitute* "biom/tests/test_util.py"
               (("^(.+)def test_biom_open_hdf5_no_h5py" m indent)
                (string-append indent
                               "@npt.dec.skipif(True, msg='Guix')\n"
                               m)))
             (substitute* "biom/tests/test_table.py"
               (("^(.+)def test_from_hdf5_issue_731" m indent)
                (string-append indent
                               "@npt.dec.skipif(True, msg='Guix')\n"
                               m))))))))
    (propagated-inputs
     (list python-anndata
           python-click
           python-flake8
           python-future
           python-h5py
           python-numpy
           python-pandas
           python-scikit-bio
           python-scipy))
    (native-inputs
     (list python-cython python-pytest python-pytest-cov python-nose))
    (home-page "https://www.biom-format.org")
    (synopsis "Biological Observation Matrix (BIOM) format utilities")
    (description
     "The BIOM file format is designed to be a general-use format for
representing counts of observations e.g. operational taxonomic units, KEGG
orthology groups or lipid types, in one or more biological samples
e.g. microbiome samples, genomes, metagenomes.")
    (license license:bsd-3)))

(define-public python-pairtools
  (package
    (name "python-pairtools")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open2c/pairtools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0xn4cg4jq3rfn42h8rfwg0k6xkvihjrv32gwldb9y0jp05lzw9cs"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-references
           (lambda _
             (substitute* '("pairtools/cli/header.py"
                            "pairtools/cli/merge.py"
                            "pairtools/cli/sort.py")
               (("/bin/bash") (which "bash")))))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (with-directory-excursion "/tmp"
                 (invoke "pytest" "-v"))))))))
    (native-inputs
     (list python-cython python-pytest))
    (propagated-inputs
     (list htslib ; for bgzip, looked up in PATH
           samtools ; looked up in PATH
           lz4 ; for lz4c
           python-bioframe
           python-click
           python-numpy
           python-pandas
           python-pysam
           python-pyyaml
           python-scipy))
    (home-page "https://github.com/open2c/pairtools")
    (synopsis "Process mapped Hi-C data")
    (description "Pairtools is a simple and fast command-line framework to
process sequencing data from a Hi-C experiment.  Process pair-end sequence
alignments and perform the following operations:

@itemize
@item detect ligation junctions (a.k.a. Hi-C pairs) in aligned paired-end
  sequences of Hi-C DNA molecules
@item sort @code{.pairs} files for downstream analyses
@item detect, tag and remove PCR/optical duplicates
@item generate extensive statistics of Hi-C datasets
@item select Hi-C pairs given flexibly defined criteria
@item restore @code{.sam} alignments from Hi-C pairs.
@end itemize
")
    (license license:expat)))

(define-public python-readpaf
  (package
    (name "python-readpaf")
    (version "0.0.10")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "readpaf" version))
              (sha256
               (base32
                "15m6ffks4zwpp1ycwk6n02py6mw2yh7qr0vhpc178b91gldr97ia"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pandas))
    (home-page "https://github.com/alexomics/read-paf")
    (synopsis "Minimap2 PAF file reader")
    (description
     "This is a fast parser for minimap2 PAF (Pairwise mApping Format)
files.")
    (license license:expat)))

(define-public bioperl-minimal
  (package
    (name "bioperl-minimal")
    (version "1.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bioperl/bioperl-live")
             (commit (string-append "release-"
                                    (string-map (lambda (c)
                                                  (if (char=? c #\.)
                                                      #\- c)) version)))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0wl8yvzcls59pwwk6m8ahy87pwg6nnibzy5cldbvmcwg2x2w7783"))))
    (build-system perl-build-system)
    (arguments
     (let ((transitive-inputs
            (map (compose package-name cadr)
                 (delete-duplicates
                  (concatenate
                   (map (compose package-transitive-target-inputs cadr)
                        (package-inputs this-package)))))))
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'install 'wrap-programs
             (lambda* (#:key outputs #:allow-other-keys)
               ;; Make sure all executables in "bin" find the required Perl
               ;; modules at runtime.  As the PERL5LIB variable contains also
               ;; the paths of native inputs, we pick the transitive target
               ;; inputs from %build-inputs.
               (let* ((out  (assoc-ref outputs "out"))
                      (bin  (string-append out "/bin/"))
                      (path (string-join
                             (cons (string-append out "/lib/perl5/site_perl")
                                   (map (lambda (name)
                                          (assoc-ref %build-inputs name))
                                        ',transitive-inputs))
                             ":")))
                 (for-each (lambda (file)
                             (wrap-program file
                               `("PERL5LIB" ":" prefix (,path))))
                           (find-files bin "\\.pl$")))))))))
    (inputs
     (list perl-module-build perl-data-stag perl-libwww perl-uri))
    (native-inputs
     (list perl-test-most))
    (home-page "https://metacpan.org/release/BioPerl")
    (synopsis "Bioinformatics toolkit")
    (description
     "BioPerl is the product of a community effort to produce Perl code which
is useful in biology.  Examples include Sequence objects, Alignment objects
and database searching objects.  These objects not only do what they are
advertised to do in the documentation, but they also interact - Alignment
objects are made from the Sequence objects, Sequence objects have access to
Annotation and SeqFeature objects and databases, Blast objects can be
converted to Alignment objects, and so on.  This means that the objects
provide a coordinated and extensible framework to do computational biology.")
    (license license:perl-license)))

(define-public perl-bio-db-hts
  (package
    (name "perl-bio-db-hts")
    (version "3.01")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://cpan/authors/id/A/AV/AVULLO/Bio-DB-HTS-"
                           version ".tar.gz"))
       (sha256
        (base32
         "0hjg0igfkpvh27zdkdr6pa7cqm9n6r7cwz0np74cl4wmawgvr9hj"))))
    (build-system perl-build-system)
    (native-inputs
     (list perl-module-build pkg-config))
    (propagated-inputs
     (list bioperl-minimal htslib-1.9))
    (home-page "https://metacpan.org/release/Bio-DB-HTS")
    (synopsis "Perl interface to HTS library for DNA sequencing")
    (description "This is a Perl interface to the HTS library for DNA
sequencing.")
    (license license:asl2.0)))

(define-public python-biopython
  (package
    (name "python-biopython")
    (version "1.80")
    (source (origin
              (method url-fetch)
              ;; use PyPi rather than biopython.org to ease updating
              (uri (pypi-uri "biopython" version))
              (sha256
               (base32
                "0hqf3jsxn2sphcx81fx7x3i69sarpjsi70fzw98f8rw7z2d5x02j"))))
    (build-system pyproject-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'set-home
           ;; Some tests require a home directory to be set.
           (lambda _ (setenv "HOME" "/tmp"))))))
    (propagated-inputs
     (list python-numpy))
    (home-page "https://biopython.org/")
    (synopsis "Tools for biological computation in Python")
    (description
     "Biopython is a set of tools for biological computation including parsers
for bioinformatics files into Python data structures; interfaces to common
bioinformatics programs; a standard sequence class and tools for performing
common operations on them; code to perform data classification; code for
dealing with alignments; code making it easy to split up parallelizable tasks
into separate processes; and more.")
    (license (license:non-copyleft "http://www.biopython.org/DIST/LICENSE"))))

(define-public python-biopython-1.73
  (package
    (inherit python-biopython)
    (version "1.73")
    (source (origin
              (method url-fetch)
              ;; use PyPi rather than biopython.org to ease updating
              (uri (pypi-uri "biopython" version))
              (sha256
               (base32
                "1q55jhf76z3k6is3psis0ckbki7df26x7dikpcc3vhk1vhkwribh"))))))

(define-public python-fastalite
  (package
    (name "python-fastalite")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fastalite" version))
       (sha256
        (base32
         "1qli6pxp77i9xn2wfciq2zaxhl82bdxb33cpzqzj1z25yd036wqj"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f)) ; Test data is not distributed.
    (home-page "https://github.com/nhoffman/fastalite")
    (synopsis "Simplest possible FASTA parser")
    (description "This library implements a FASTA and a FASTQ parser without
relying on a complex dependency tree.")
    (license license:expat)))

(define-public biosoup
  (package
    (name "biosoup")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rvaser/biosoup")
             ;; Corresponds to version 0.10.0
             (commit "38181f09854ff42cbd9632200a2ec9fb37a4b7b6")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "02hvyka703zagx0nvv2yx3dkc748zc8g6qbrpya7r8kfkcl7y8hw"))))
    (build-system cmake-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "./bin/biosoup_test")))))))
    (native-inputs
     (list googletest))
    (home-page "https://github.com/rvaser/biosoup")
    (synopsis "C++ support library for bioinformatics tools")
    (description "Biosoup is a C++ collection of header-only data structures
used for storage and logging in bioinformatics tools.")
    (license license:expat)))

(define-public bioparser
  (package
    (name "bioparser")
    (version "3.0.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rvaser/bioparser")
             ;; Corresponds to tag 3.0.13
             (commit "13341e6e0855c6b358ffcea6dad216e1009e1287")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0c5p2dl8jb12ci9f427jzrmmm9cgvc1k4fxsn2ggkfsin6r1r82i"))))
    (build-system cmake-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "./bin/bioparser_test")))))))
    (inputs
     (list biosoup))
    (propagated-inputs
     (list zlib))
    (native-inputs
     (list googletest))
    (home-page "https://github.com/rvaser/bioparser")
    (synopsis "C++ library for parsing several formats in bioinformatics")
    (description "Bioparser is a C++ header only parsing library for several
bioinformatics formats (FASTA/Q, MHAP/PAF/SAM), with support for zlib
compressed files.")
    (license license:expat)))

(define-public circtools
  (package
    (name "circtools")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Kevinzjy/circtools")
             ;; Corresponds to tag v1.0.0
             (commit "79380de59013601021ca3b1352d6f64d2fb89646")
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0wg1s927g32k25j967kfr8l30nmr4c0p4zvy5igvy7cs6chd60lh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'make-writable
           (lambda _
             (for-each make-file-writable (find-files "."))))
         (add-after 'unpack 'prepare-spoa-dependencies
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "vendor/spoa/CMakeLists.txt"
               (("find_package\\(bioparser 3.0.13 QUIET\\)")
                "find_package(bioparser 3.0.13 CONFIG)")
               (("find_package\\(biosoup 0.10.0 QUIET\\)")
                "find_package(biosoup 0.10.0 CONFIG)")
               (("GTest_FOUND") "TRUE")))))
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-bio" ,rust-bio-0.33)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-docopt" ,rust-docopt-1)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-indicatif" ,rust-indicatif-0.15)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-serde" ,rust-serde-1)
        ("rust-seq-io" ,rust-seq-io-0.3))))
    (inputs
     (list bioparser biosoup))
    (native-inputs
     (list cmake pkg-config googletest))
    (home-page "https://github.com/Kevinzjy/circtools")
    (synopsis "Accelerating functions in CIRI toolkit")
    (description "This package provides accelerated functions for the CIRI
toolkit.  It also provides the @code{ccs} executable to scan for circular
consensus sequences.")
    (license license:expat)))

(define-public ciri-long
  (package
    (name "ciri-long")
    (version "1.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bioinfo-biols/CIRI-long")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "10k88i1fcqchrrjv82rmylwvbwqfba0n51palhig9hsg71xs0dbi"))
       ;; Delete bundled binary
       (snippet '(delete-file "libs/ccs"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'relax-requirements
           (lambda _
             (substitute* "setup.py"
               (("'argparse[^']*',") "") ; only for python2
               (("==") ">="))))
         (add-before 'build 'build-libssw
           (lambda _
             (with-directory-excursion "libs/striped_smith_waterman"
               (invoke "make" "libssw.so"))))
         (add-before 'build 'fix-reference-to-ccs
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "CIRI_long/pipeline.py"
               (("'ccs -i")
                (string-append "'"
                               (assoc-ref inputs "circtools") "/bin/ccs"
                               " -i")))
             ;; yuck!
             (substitute* "CIRI_long/main.py"
               (("os.chmod\\(lib_path.*") "")))))))
    (inputs
     (list circtools
           python-biopython
           python-bwapy
           python-levenshtein
           python-mappy
           python-numpy
           python-pandas
           python-pysam
           python-pyspoa
           python-scikit-learn
           python-scipy))
    (native-inputs
     (list python-cython python-nose python-setuptools))
    (home-page "https://ciri-cookbook.readthedocs.io/")
    (synopsis "Circular RNA identification for Nanopore sequencing")
    (description "CIRI-long is a package for circular RNA identification using
long-read sequencing data.")
    (license license:expat)))

(define-public qtltools
  (package
    (name "qtltools")
    (version "1.3.1")
    (source (origin
              (method url-fetch/tarbomb)
              (uri (string-append "https://qtltools.github.io/qtltools/"
                                  "binaries/QTLtools_" version
                                  "_source.tar.gz"))
              (sha256
               (base32
                "13gdry5l43abn3464fmk8qzrxgxnxah2612r66p9dzhhl92j30cd"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests included
       #:make-flags
       ,#~(list (string-append "BOOST_INC="
                               #$(this-package-input "boost") "/include")
                (string-append "BOOST_LIB="
                               #$(this-package-input "boost") "/lib")
                (string-append "HTSLD_INC="
                               #$(this-package-input "htslib") "/include")
                (string-append "HTSLD_LIB="
                               #$(this-package-input "htslib") "/lib")
                (string-append "RMATH_INC="
                               #$(this-package-input "rmath-standalone")
                               "/include")
                (string-append "RMATH_LIB="
                               #$(this-package-input "rmath-standalone")
                               "/lib"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-linkage
           (lambda _
             (substitute* "qtltools/Makefile"
               (("libboost_iostreams.a")
                "libboost_iostreams.so")
               (("libboost_program_options.a")
                "libboost_program_options.so")
               (("-lblas") "-lopenblas"))))
         (add-before 'build 'chdir
           (lambda _ (chdir "qtltools")))
         (replace 'configure
           (lambda _
             (substitute* "qtltools/Makefile"
               (("LIB_FLAGS=-lz")
                "LIB_FLAGS=-lz -lcrypto -lssl")
               (("LIB_FILES=\\$\\(RMATH_LIB\\)/libRmath.a \
\\$\\(HTSLD_LIB\\)/libhts.a \
\\$\\(BOOST_LIB\\)/libboost_iostreams.a \
\\$\\(BOOST_LIB\\)/libboost_program_options.a")
                "LIB_FILES=$(RMATH_LIB)/libRmath.so \
$(HTSLD_LIB)/libhts.so \
$(BOOST_LIB)/libboost_iostreams.so \
$(BOOST_LIB)/libboost_program_options.so"))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
               (mkdir-p bin)
               (install-file "bin/QTLtools" bin)))))))
    (inputs
     (list curl
           gsl
           boost
           rmath-standalone
           htslib-1.3
           openssl
           openblas
           zlib))
    (home-page "https://qtltools.github.io/qtltools/")
    (synopsis "Tool set for molecular QTL discovery and analysis")
    (description "QTLtools is a tool set for molecular QTL discovery
and analysis.  It allows going from the raw genetic sequence data to
collection of molecular @dfn{Quantitative Trait Loci} (QTLs) in few
easy-to-perform steps.")
    (license license:gpl3+)))

(define-public bpp-core
  (package
    (name "bpp-core")
    (version "2.4.1")
    (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/BioPP/bpp-core")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ma2cl677l7s0n5sffh66cy9lxp5wycm50f121g8rx85p95vkgwv"))))
    (build-system cmake-build-system)
    ;; XXX: does not build with later GCC:
    ;; error: ‘numeric_limits’ was not declared in this scope
    (native-inputs (list gcc-10))
    (home-page "https://pbil.univ-lyon1.fr/bpp-doc/bpp-core/html/index.html")
    (synopsis "C++ libraries for Bioinformatics")
    (description
     "Bio++ is a set of C++ libraries for Bioinformatics, including sequence
analysis, phylogenetics, molecular evolution and population genetics.  It is
Object Oriented and is designed to be both easy to use and computer efficient.
Bio++ intends to help programmers to write computer expensive programs, by
providing them a set of re-usable tools.")
      (license license:cecill-c)))

(define-public bpp-phyl
  (package
    (name "bpp-phyl")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BioPP/bpp-phyl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "192zks6wyk903n06c2lbsscdhkjnfwms8p7jblsmk3lvjhdipb20"))))
    (build-system cmake-build-system)
    (inputs
     (list bpp-core bpp-seq))
    (home-page "https://pbil.univ-lyon1.fr/bpp-doc/bpp-phyl/html/")
    (synopsis "Bio++ phylogenetic library")
    (description
     "Bio++ is a set of C++ libraries for Bioinformatics, including sequence
analysis, phylogenetics, molecular evolution and population genetics.  This
library provides phylogenetics-related modules.")
    (license license:cecill-c)))

(define-public bpp-phyl-omics
  (package
    (name "bpp-phyl-omics")
    (version "2.4.1")
    (source
      (origin
       (method git-fetch)
       (uri (git-reference
            (url "https://github.com/BioPP/bpp-phyl-omics")
            (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "172psb8njkjwg3cd6gdy5w0mq8f0817v635yw4bk7146aggjzl1h"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f)) ; No test provided.
    (inputs
     (list bpp-core
           bpp-phyl
           bpp-seq
           bpp-seq-omics))
    (home-page "https://github.com/BioPP/bpp-phyl-omics")
    (synopsis "Bio++ phylogenetic library genomics components")
    (description
     "This library contains the genomics components of the Bio++ phylogenetics
library.  It is part of the Bio++ project.")
    (license license:cecill)))

(define-public bpp-popgen
  (package
    (name "bpp-popgen")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BioPP/bpp-popgen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0bz0fhrq3dri6a0hvfc3zlvrns8mrzzlnicw5pyfa812gc1qwfvh"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f)) ; There are no tests.
    (inputs
     (list bpp-core bpp-seq))
    (home-page "https://pbil.univ-lyon1.fr/bpp-doc/bpp-popgen/html/")
    (synopsis "Bio++ population genetics library")
    (description
     "Bio++ is a set of C++ libraries for Bioinformatics, including sequence
analysis, phylogenetics, molecular evolution and population genetics.  This
library provides population genetics-related modules.")
    (license license:cecill-c)))

(define-public bpp-seq
  (package
    (name "bpp-seq")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BioPP/bpp-seq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1mc09g8jswzsa4wgrfv59jxn15ys3q8s0227p1j838wkphlwn2qk"))))
    (build-system cmake-build-system)
    (inputs
     (list bpp-core))
    (home-page "https://pbil.univ-lyon1.fr/bpp-doc/bpp-seq/html/")
    (synopsis "Bio++ sequence library")
    (description
     "Bio++ is a set of C++ libraries for Bioinformatics, including sequence
analysis, phylogenetics, molecular evolution and population genetics.  This
library provides sequence-related modules.")
    (license license:cecill-c)))

(define-public bpp-seq-omics
  (package
    (name "bpp-seq-omics")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BioPP/bpp-seq-omics")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1sc2xdfnfp5a6qihplp49rgrqmj89898avfy9bqaq1g2fajppgjj"))))
    (build-system cmake-build-system)
    (inputs
     (list bpp-core bpp-seq))
    (home-page "https://github.com/BioPP/bpp-seq-omics")
    (synopsis "Bio++ sequence library genomics components")
    (description
     "This library contains the genomics components of the Bio++ sequence library.
It is part of the Bio++ project.")
    (license license:cecill)))

(define-public bppsuite
  (package
    (name "bppsuite")
    (version "2.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BioPP/bppsuite")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1wdwcgczqbc3m116vakvi0129wm3acln3cfc7ivqnalwvi6lrpds"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f)) ; There are no tests.
    (native-inputs
     (list groff man-db texinfo))
    (inputs
     (list bpp-core bpp-seq bpp-phyl bpp-popgen))
    (home-page "https://github.com/BioPP")
    (synopsis "Bioinformatics tools written with the Bio++ libraries")
    (description
     "Bio++ is a set of C++ libraries for Bioinformatics, including sequence
analysis, phylogenetics, molecular evolution and population genetics.  This
package provides command line tools using the Bio++ library.")
    (license license:cecill-c)))

(define-public blast+
  (package
    (name "blast+")
    (version "2.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/"
                    version "/ncbi-blast-" version "+-src.tar.gz"))
              (sha256
               (base32
                "003mn7m4y306k7visv3in3ikfgm8m41z0jq9lyvz10iv1hdpyixz"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Remove bundled bzip2, zlib and pcre.
                  (delete-file-recursively "c++/src/util/compress/bzip2")
                  (delete-file-recursively "c++/src/util/compress/zlib")
                  (delete-file-recursively "c++/src/util/regexp")
                  (substitute* "c++/src/util/compress/Makefile.in"
                    (("bzip2 zlib api") "api"))
                  ;; Remove useless msbuild directory
                  (delete-file-recursively
                   "c++/src/build-system/project_tree_builder/msbuild")

                  ;; Build reproducibly.
                  ;; Do not record the kernel version
                  (substitute* "c++/src/build-system/configure"
                    (("kver=.*") "kver=\"\""))
                  ;; Do not generate random numbers.
                  (substitute* "c++/scripts/common/impl/define_random_macros.sh"
                    (("#define NCBI_RANDOM_VALUE_MAX  0xffffffffu" m)
                     (string-append m "
#define NCBI_RANDOM_VALUE_0    2845495105u
#define NCBI_RANDOM_VALUE_1    2158634051u
#define NCBI_RANDOM_VALUE_2    4072202242u
#define NCBI_RANDOM_VALUE_3    902228395u
#define NCBI_RANDOM_VALUE_4    1353323915u
#define NCBI_RANDOM_VALUE_5    574823513u
#define NCBI_RANDOM_VALUE_6    4119501261u
#define NCBI_RANDOM_VALUE_7    2477640938u
#define NCBI_RANDOM_VALUE_8    2776595395u
#define NCBI_RANDOM_VALUE_9    270550684u
"))
                    (("cksum") "cksum >/dev/null"))))))
    (build-system gnu-build-system)
    (arguments
     (list
      ;; There are two(!) tests for this massive library, and both fail with
      ;; "unparsable timing stats".
      ;; ERR [127] --  [serial/datatool] datatool.sh     (unparsable timing stats)
      ;; ERR [127] --  [serial/datatool] datatool_xml.sh     (unparsable timing stats)
      #:tests? #f
      #:out-of-source? #t
      #:parallel-build? #f              ;not supported
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'set-HOME
            ;; $HOME needs to be set at some point during the configure phase
            (lambda _ (setenv "HOME" "/tmp")))
          (add-after 'unpack 'enter-dir
            (lambda _ (chdir "c++")))
          (add-after 'enter-dir 'fix-build-system
            (lambda _
              (define (which* cmd)
                (cond ((string=? cmd "date")
                       ;; make call to "date" deterministic
                       "date -d @0")
                      ((which cmd)
                       => identity)
                      (else
                       (format (current-error-port)
                               "WARNING: Unable to find absolute path for ~s~%"
                               cmd)
                       #false)))

              ;; Rewrite hardcoded paths to various tools
              (substitute* (append '("src/build-system/configure.ac"
                                     "src/build-system/configure"
                                     "src/build-system/helpers/run_with_lock.c"
                                     "scripts/common/impl/if_diff.sh"
                                     "scripts/common/impl/run_with_lock.sh"
                                     "src/build-system/Makefile.configurables.real"
                                     "src/build-system/Makefile.in.top"
                                     "src/build-system/Makefile.meta.gmake=no"
                                     "src/build-system/Makefile.meta.in"
                                     "src/build-system/Makefile.meta_l"
                                     "src/build-system/Makefile.meta_p"
                                     "src/build-system/Makefile.meta_r"
                                     "src/build-system/Makefile.mk.in"
                                     "src/build-system/Makefile.requirements"
                                     "src/build-system/Makefile.rules_with_autodep.in")
                                   (find-files "scripts/common/check" "\\.sh$"))
                (("(/usr/bin/|/bin/)([a-z][-_.a-z]*(\\+\\+)?)" all dir cmd)
                 (or (which* cmd) all)))

              (substitute* (find-files "src/build-system" "^config.*")
                (("LN_S=/bin/\\$LN_S") (string-append "LN_S=" (which "ln")))
                (("^PATH=.*") ""))

              ;; rewrite "/var/tmp" in check script
              (substitute* "scripts/common/check/check_make_unix.sh"
                (("/var/tmp") "/tmp"))

              ;; do not reset PATH
              (substitute* (find-files "scripts/common/impl/" "\\.sh$")
                (("^ *PATH=.*") "")
                (("action=/bin/") "action=")
                (("export PATH") ":"))))
          (replace 'configure
            (lambda _
              (let ((lib     (string-append #$output:lib "/lib"))
                    (include (string-append #$output:include
                                            "/include/ncbi-tools++")))
                ;; The 'configure' script doesn't recognize things like
                ;; '--enable-fast-install'.
                (invoke "./configure.orig"
                        (string-append "--with-build-root=" (getcwd) "/build")
                        (string-append "--prefix=" #$output)
                        (string-append "--libdir=" lib)
                        (string-append "--includedir=" include)
                        (string-append "--with-bz2="
                                       #$(this-package-input "bzip2"))
                        (string-append "--with-z="
                                       #$(this-package-input "zlib"))
                        (string-append "--with-pcre="
                                       #$(this-package-input "pcre"))
                        ;; Each library is built twice by default, once
                        ;; with "-static" in its name, and again
                        ;; without.
                        "--without-static"
                        "--with-dll")))))))
    (outputs '("out"       ;  21 MB
               "lib"       ; 226 MB
               "include")) ;  33 MB
    (inputs
     (list bzip2
           lmdb
           zlib
           pcre
           perl
           python-wrapper))
    (native-inputs
     (list cpio))
    (home-page "https://blast.ncbi.nlm.nih.gov")
    (synopsis "Basic local alignment search tool")
    (description
     "BLAST is a popular method of performing a DNA or protein sequence
similarity search, using heuristics to produce results quickly.  It also
calculates an “expect value” that estimates how many matches would have
occurred at a given score by chance, which can aid a user in judging how much
confidence to have in an alignment.")
    ;; Most of the sources are in the public domain, with the following
    ;; exceptions:
    ;;   * Expat:
    ;;     * ./c++/include/util/bitset/
    ;;     * ./c++/src/html/ncbi_menu*.js
    ;;   * Boost license:
    ;;     * ./c++/include/util/impl/floating_point_comparison.hpp
    ;;   * LGPL 2+:
    ;;     * ./c++/include/dbapi/driver/odbc/unix_odbc/
    ;;   * ASL 2.0:
    ;;     * ./c++/src/corelib/teamcity_*
    (license (list license:public-domain
                   license:expat
                   license:boost1.0
                   license:lgpl2.0+
                   license:asl2.0))))

(define-public bless
  (package
    (name "bless")
    (version "1p02")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/bless-ec/bless.v"
                                  version ".tgz"))
              (sha256
               (base32
                "0rm0gw2s18dqwzzpl3c2x1z05ni2v0xz5dmfk3d33j6g4cgrlrdd"))
              (modules '((guix build utils)))
              (snippet
               `(begin
                  ;; Remove bundled boost, pigz, zlib, and .git directory
                  ;; FIXME: also remove bundled sources for murmurhash3 and
                  ;; kmc once packaged.
                  (delete-file-recursively "boost")
                  (delete-file-recursively "pigz")
                  (delete-file-recursively "google-sparsehash")
                  (delete-file-recursively "zlib")
                  (delete-file-recursively ".git")))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ;no "check" target
       #:make-flags
       ,#~(list (string-append "ZLIB="
                               #$(this-package-input "zlib")
                               "/lib/libz.so")
                (string-append "LDFLAGS="
                               (string-join '("-lboost_filesystem"
                                              "-lboost_system"
                                              "-lboost_iostreams"
                                              "-lz"
                                              "-fopenmp"))))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'do-not-build-bundled-pigz
          (lambda* (#:key inputs outputs #:allow-other-keys)
            (substitute* "Makefile"
              (("cd pigz/pigz-2.3.3; make") ""))))
         (add-after 'unpack 'patch-paths-to-executables
          (lambda* (#:key inputs outputs #:allow-other-keys)
            (substitute* "parse_args.cpp"
              (("kmc_binary = .*")
               (string-append "kmc_binary = \""
                              (assoc-ref outputs "out")
                              "/bin/kmc\";"))
              (("pigz_binary = .*")
               (string-append "pigz_binary = \""
                              (assoc-ref inputs "pigz")
                              "/bin/pigz\";")))))
         (replace 'install
          (lambda* (#:key outputs #:allow-other-keys)
            (let ((bin (string-append (assoc-ref outputs "out") "/bin/")))
              (for-each (lambda (file)
                          (install-file file bin))
                        '("bless" "kmc/bin/kmc")))))
         (delete 'configure))))
    (native-inputs
     (list perl))
    (inputs
     (list openmpi boost sparsehash pigz zlib))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourceforge.net/p/bless-ec/wiki/Home/")
    (synopsis "Bloom-filter-based error correction tool for NGS reads")
    (description
     "@dfn{Bloom-filter-based error correction solution for high-throughput
sequencing reads} (BLESS) uses a single minimum-sized bloom filter is a
correction tool for genomic reads produced by @dfn{Next-generation
sequencing} (NGS).  BLESS produces accurate correction results with much less
memory compared with previous solutions and is also able to tolerate a higher
false-positive rate.  BLESS can extend reads like DNA assemblers to correct
errors at the end of reads.")
    (license license:gpl3+)))

(define-public bowtie
  (package
    (name "bowtie")
    (version "2.3.4.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BenLangmead/bowtie2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1zl3cf327y2p7p03cavymbh7b00djc7lncfaqih33n96iy9q8ibp"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (substitute* "Makefile"
                    ;; replace BUILD_HOST and BUILD_TIME for deterministic build
                    (("-DBUILD_HOST=.*") "-DBUILD_HOST=\"\\\"guix\\\"\"")
                    (("-DBUILD_TIME=.*") "-DBUILD_TIME=\"\\\"0\\\"\""))))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags
       ,#~(list "allall"
                "WITH_TBB=1"
                (string-append "prefix=" #$output))
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda _
             ;; This "extended character" is not considered valid.
             (substitute* "processor_support.h"
               (("“") "\"")
               (("”") "\""))))
         (replace 'check
           (lambda _
             (invoke "perl"
                     "scripts/test/simple_tests.pl"
                     "--bowtie2=./bowtie2"
                     "--bowtie2-build=./bowtie2-build"))))))
    (inputs
     `(("tbb" ,tbb-2020)
       ("zlib" ,zlib)
       ("python" ,python-wrapper)))
    (native-inputs
     (list perl perl-clone perl-test-deep perl-test-simple))
    (home-page "https://bowtie-bio.sourceforge.net/bowtie2/index.shtml")
    (synopsis "Fast and sensitive nucleotide sequence read aligner")
    (description
     "Bowtie 2 is a fast and memory-efficient tool for aligning sequencing
reads to long reference sequences.  It is particularly good at aligning reads
of about 50 up to 100s or 1,000s of characters, and particularly good at
aligning to relatively long (e.g. mammalian) genomes.  Bowtie 2 indexes the
genome with an FM Index to keep its memory footprint small: for the human
genome, its memory footprint is typically around 3.2 GB.  Bowtie 2 supports
gapped, local, and paired-end alignment modes.")
    (supported-systems '("x86_64-linux"))
    (license license:gpl3+)))

(define-public bowtie1
  (package
    (name "bowtie1")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/bowtie-bio/bowtie/"
                                  version "/bowtie-" version "-src.zip"))
              (sha256
               (base32
                "11dbihdnrizc6qhx9xsw77w3q5ssx642alaqzvhxx32ak9glvq04"))
              (modules '((guix build utils)))
              (snippet
               '(substitute* "Makefile"
                  ;; replace BUILD_HOST and BUILD_TIME for deterministic build
                  (("-DBUILD_HOST=.*") "-DBUILD_HOST=\"\\\"guix\\\"\"")
                  (("-DBUILD_TIME=.*") "-DBUILD_TIME=\"\\\"0\\\"\"")))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no "check" target
       #:make-flags
       ,#~(list "CC=gcc" "all"
                (string-append "prefix=" #$output))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))
    (inputs
     (list python-wrapper tbb-2020 zlib))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bowtie-bio.sourceforge.net/index.shtml")
    (synopsis "Fast aligner for short nucleotide sequence reads")
    (description
     "Bowtie is a fast, memory-efficient short read aligner.  It aligns short
DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp
reads per hour.  Bowtie indexes the genome with a Burrows-Wheeler index to
keep its memory footprint small: typically about 2.2 GB for the human
genome (2.9 GB for paired-end).")
    (license license:artistic2.0)))

(define-public tophat
  (package
    (name "tophat")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://ccb.jhu.edu/software/tophat/downloads/tophat-"
                    version ".tar.gz"))
              (sha256
               (base32
                "19add02kv2xhd6ihd779dr7x35ggym3jqr0m5c4315i1yfb0p11p"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Remove bundled SeqAn and samtools
                  (delete-file-recursively "src/SeqAn-1.4.2")
                  (delete-file-recursively "src/samtools-0.1.18")))))
    (build-system gnu-build-system)
    (arguments
     '(#:parallel-build? #f             ; not supported
       #:phases
       (modify-phases %standard-phases
         (add-after 'set-paths 'hide-default-gcc
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((gcc (assoc-ref inputs "gcc")))
               ;; Remove the default GCC from CPLUS_INCLUDE_PATH to prevent
               ;; conflicts with the GCC 5 input.
               (setenv "CPLUS_INCLUDE_PATH"
                       (string-join
                        (delete (string-append gcc "/include/c++")
                                (string-split (getenv "CPLUS_INCLUDE_PATH") #\:))
                        ":")))))
         (add-after 'unpack 'use-system-samtools
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "src/Makefile.in"
               (("(noinst_LIBRARIES = )\\$\\(SAMLIB\\)" _ prefix) prefix)
               (("\\$\\(SAMPROG\\): \\$\\(SAMLIB\\)") "")
               (("SAMPROG = samtools_0\\.1\\.18") "")
               (("\\$\\(samtools_0_1_18_SOURCES\\)") "")
               (("am__EXEEXT_1 = samtools_0\\.1\\.18\\$\\(EXEEXT\\)") ""))
             (substitute* '("src/common.cpp"
                            "src/tophat.py")
               (("samtools_0.1.18") (which "samtools")))
             (substitute* '("src/common.h"
                            "src/bam2fastx.cpp")
               (("#include \"bam.h\"") "#include <samtools/bam.h>")
               (("#include \"sam.h\"") "#include <samtools/sam.h>"))
             (substitute* '("src/bwt_map.h"
                            "src/map2gtf.h"
                            "src/align_status.h")
               (("#include <bam.h>") "#include <samtools/bam.h>")
               (("#include <sam.h>") "#include <samtools/sam.h>")))))))
    (native-inputs
     `(("gcc@5" ,gcc-5))) ;; doesn't build with later versions
    (inputs
     `(("boost" ,boost)
       ("bowtie" ,bowtie)
       ("ncurses" ,ncurses)
       ("perl" ,perl)
       ("python" ,python-2)
       ("samtools" ,samtools-0.1)
       ("seqan" ,seqan-1)
       ("zlib" ,zlib)))
    (home-page "https://ccb.jhu.edu/software/tophat/index.shtml")
    (synopsis "Spliced read mapper for RNA-Seq data")
    (description
     "TopHat is a fast splice junction mapper for nucleotide sequence
reads produced by the RNA-Seq method.  It aligns RNA-Seq reads to
mammalian-sized genomes using the ultra high-throughput short read
aligner Bowtie, and then analyzes the mapping results to identify
splice junctions between exons.")
    ;; TopHat is released under the Boost Software License, Version 1.0
    ;; See https://github.com/infphilo/tophat/issues/11#issuecomment-121589893
    (license license:boost1.0)))

(define-public bwa
  (package
    (name "bwa")
    (version "0.7.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lh3/bwa/releases/download/v"
                    version "/bwa-" version ".tar.bz2"))
              (sha256
               (base32
                "1zfhv2zg9v1icdlq4p9ssc8k01mca5d1bd87w71py2swfi74s6yy"))))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f ;no "check" target
       #:make-flags '("CFLAGS=-fcommon")
       #:phases
       (modify-phases %standard-phases
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (lib (string-append out "/lib"))
                    (doc (string-append out "/share/doc/bwa"))
                    (man (string-append out "/share/man/man1")))
               (install-file "bwa" bin)
               (install-file "libbwa.a" lib)
               (install-file "README.md" doc)
               (install-file "bwa.1" man))))
           ;; no "configure" script
          (delete 'configure))))
    (inputs (list zlib))
    ;; Non-portable SSE instructions are used so building fails on platforms
    ;; other than x86_64.
    (supported-systems '("x86_64-linux"))
    (home-page "https://bio-bwa.sourceforge.net/")
    (synopsis "Burrows-Wheeler sequence aligner")
    (description
     "BWA is a software package for mapping low-divergent sequences against a
large reference genome, such as the human genome.  It consists of three
algorithms: BWA-backtrack, BWA-SW and BWA-MEM.  The first algorithm is
designed for Illumina sequence reads up to 100bp, while the rest two for
longer sequences ranged from 70bp to 1Mbp.  BWA-MEM and BWA-SW share similar
features such as long-read support and split alignment, but BWA-MEM, which is
the latest, is generally recommended for high-quality queries as it is faster
and more accurate.  BWA-MEM also has better performance than BWA-backtrack for
70-100bp Illumina reads.")
    (license license:gpl3+)))

(define-public bwa-pssm
  (package (inherit bwa)
    (name "bwa-pssm")
    (version "0.5.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pkerpedjiev/bwa-pssm")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "076c4q0cdqz8jgylb067y9zmvxglppnzi3qiscn0xiypgc6lgb5r"))))
    (build-system gnu-build-system)
    (arguments
     (substitute-keyword-arguments (package-arguments bwa)
       ((#:phases phases '%standard-phases)
        `(modify-phases ,phases
           (add-after 'unpack 'patch-C-error
             (lambda _
               (substitute* "pssm.c"
                 (("inline int map") "int map"))))))))
    (inputs
     (list gdsl zlib perl))
    (home-page "http://bwa-pssm.binf.ku.dk/")
    (synopsis "Burrows-Wheeler transform-based probabilistic short read mapper")
    (description
     "BWA-PSSM is a probabilistic short genomic sequence read aligner based on
the use of @dfn{position specific scoring matrices} (PSSM).  Like many of the
existing aligners it is fast and sensitive.  Unlike most other aligners,
however, it is also adaptible in the sense that one can direct the alignment
based on known biases within the data set.  It is coded as a modification of
the original BWA alignment program and shares the genome index structure as
well as many of the command line options.")
    (license license:gpl3+)))

(define-public bwa-meth
  (package
    (name "bwa-meth")
    (version "0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brentp/bwa-meth")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0c695lkrr0996zwkibl7324wg2vxmn6522sz30xv4a9gaf0lnbh3"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'keep-references-to-bwa
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "bwameth.py"
               (("bwa (mem|index)" _ command)
                (string-append (which "bwa") " " command))
               ;; There's an ill-advised check for "samtools" on PATH.
               (("^checkX.*") "")))))))
    (inputs
     (list bwa))
    (native-inputs
     (list python-toolshed))
    (home-page "https://github.com/brentp/bwa-meth")
    (synopsis "Fast and accurante alignment of BS-Seq reads")
    (description
     "BWA-Meth works for single-end reads and for paired-end reads from the
directional protocol (most common).  It uses the method employed by
methylcoder and Bismark of in silico conversion of all C's to T's in both
reference and reads.  It recovers the original read (needed to tabulate
methylation) by attaching it as a comment which BWA appends as a tag to the
read.  It performs favorably to existing aligners gauged by number of on and
off-target reads for a capture method that targets CpG-rich region.")
    (license license:expat)))

(define-public python-bx-python
  (package
    (name "python-bx-python")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bxlab/bx-python")
                    (commit "4f4a48d3f227ae390c1b22072867ba86e347bdef")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1c914rw8phiw7zwzngz9i9hdciz5lq53drwdbpl2bd2sf5bj2biy"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         (add-before 'check 'build-extensions
           (lambda _
             ;; Cython extensions have to be built before running the tests.
             (invoke "python" "setup.py" "build_ext" "--inplace")))
         ;; Unrecognized argument.
         (add-after 'unpack 'disable-cython-doctests
           (lambda _ (substitute* "pytest.ini" (("--doctest-cython") "")))))))
    (propagated-inputs
     (list python-numpy))
    (inputs
     (list zlib))
    (native-inputs
     (list python-cython python-lzo python-pytest))
    (home-page "https://github.com/bxlab/bx-python")
    (synopsis "Tools for manipulating biological data")
    (description
     "bx-python provides tools for manipulating biological data, particularly
multiple sequence alignments.")
    (license license:expat)))

(define-public python-mofax
  ;; This is a recent commit from the "dev" branch, which is much more recent
  ;; than the latest commit from the "master" branch.
  (let ((commit "4d96f8f0a5d5251847353656f523684d66c3c47a")
        (revision "0"))
    (package
      (name "python-mofax")
      (version (git-version "0.4.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/bioFAM/mofax")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1lwrw0qyvvnyiqz1l20dhcf7dxidb80cqgvk78czvdgba87yxzqx"))
                (modules '((guix build utils)))
                ;; Prevent the pyproject-build-system from guessing that flit
                ;; should be used as a builder.
                (snippet '(substitute* "pyproject.toml"
                            (("^#.*") "")))))
      (build-system pyproject-build-system)
      (arguments
       (list
        ;; This test is failing due to a bug. The bug has been reported to the
        ;; developers. See https://github.com/bioFAM/mofax/issues/12 for more
        ;; info.
        #:test-flags '(list "-k" "not test_get_methods")))
      (propagated-inputs (list python-h5py
                               python-matplotlib
                               python-pandas
                               python-poetry-core
                               python-scipy
                               python-seaborn))
      (native-inputs (list python-numpy python-pytest))
      (home-page "https://github.com/bioFAM/mofax")
      (synopsis
       "Motif activity finder for transcription factor motif analysis")
      (description
       "MoFax is a Python package for transcription factor motif analysis.
It provides convenience functions to load and visualize factor models trained
with MOFA+ in Python.")
      (license license:expat))))

(define-public python-mudata
  (package
    (name "python-mudata")
    (version "0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/scverse/mudata")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "02h0k1q57589r0hdv8nwg1vk7g2ljvn5g66c47fy5gdilbm3gjws"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-anndata python-h5py python-pandas))
    (native-inputs
     (list python-flit-core python-numpy python-pytest python-zarr))
    (home-page "https://github.com/scverse/mudata")
    (synopsis "Python package for multi-omics data analysis")
    (description
     "Mudata is a Python package for multi-omics data analysis.
It is designed to provide functionality to load, process, and store multimodal
omics data.")
    (license license:bsd-3)))

(define-public python-pyega3
  (package
    (name "python-pyega3")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyega3" version))
              (sha256
               (base32
                "1k736in8g27rarx65ym9xk50x53zjg75h37bb8ljynxv04rypx2q"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f)) ; The tests require network access.
    (native-inputs
     (list python-psutil python-htsget))
    (propagated-inputs
     (list python-requests python-tqdm python-urllib3 python-responses))
    (home-page "https://github.com/EGA-archive/ega-download-client")
    (synopsis "Python client for EGA")
    (description "This package is a python-based tool for viewing and
downloading files from authorized EGA datasets.  It uses the EGA data API and
has several key features:
@itemize
@item Files are transferred over secure https connections and received
  unencrypted, so no need for decryption after download.
@item Downloads resume from where they left off in the event that the
  connection is interrupted.
@item Supports file segmenting and parallelized download of segments,
  improving overall performance.
@item After download completes, file integrity is verified using checksums.
@item Implements the GA4GH-compliant htsget protocol for download of genomic
  ranges for data files with accompanying index files.
@end itemize\n")
    (license license:asl2.0)))

(define-public python-pysam
  (package
    (name "python-pysam")
    (version "0.20.0")
    (source (origin
              (method git-fetch)
              ;; Test data is missing on PyPi.
              (uri (git-reference
                    (url "https://github.com/pysam-developers/pysam")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1dq6jwwm98lm30ijdgqc5xz5ppda4nj999y6qs78mhw8x0kij8gg"))
              (modules '((guix build utils)))
              (snippet '(begin
                          ;; FIXME: Unbundle samtools and bcftools.
                          (delete-file-recursively "htslib")))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-flags
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "HTSLIB_MODE" "external")
             (setenv "HTSLIB_LIBRARY_DIR"
                     (string-append (assoc-ref inputs "htslib") "/lib"))
             (setenv "HTSLIB_INCLUDE_DIR"
                     (string-append (assoc-ref inputs "htslib") "/include"))
             (setenv "LDFLAGS" "-lncurses")
             (setenv "CFLAGS" "-D_CURSES_LIB=1")))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               ;; Step out of source dir so python does not import from CWD.
               (with-directory-excursion "tests"
                 (setenv "HOME" "/tmp")
                 (invoke "make" "-C" "pysam_data")
                 (invoke "make" "-C" "cbcf_data")
                 ;; The FileHTTP test requires network access.
                 (invoke "pytest" "-k" "not FileHTTP"))))))))
    (propagated-inputs
     (list htslib))                    ; Included from installed header files.
    (inputs
     (list ncurses curl zlib))
    (native-inputs
     (list python-cython
           python-pytest
           ;; Dependencies below are are for tests only.
           samtools
           bcftools))
    (home-page "https://github.com/pysam-developers/pysam")
    (synopsis "Python bindings to the SAMtools C API")
    (description
     "Pysam is a Python module for reading and manipulating files in the
SAM/BAM format.  Pysam is a lightweight wrapper of the SAMtools C API.  It
also includes an interface for tabix.")
    (license license:expat)))

(define-public python-twobitreader
  (package
    (name "python-twobitreader")
    (version "3.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/benjschiller/twobitreader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1qbxvv1h58cismbk1anpjrkpghsaiy64a11ir3lhy6qch6xf8n62"))))
    (build-system python-build-system)
    ;; Tests are not included
    (arguments '(#:tests? #f))
    (native-inputs
     (list python-sphinx))
    (home-page "https://github.com/benjschiller/twobitreader")
    (synopsis "Python library for reading .2bit files")
    (description
     "twobitreader is a Python library for reading .2bit files as used by the
UCSC genome browser.")
    (license license:artistic2.0)))

(define-public python-plastid
  (package
    (name "python-plastid")
    (version "0.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/joshuagryphon/plastid")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1ka9j08j6i105l89w8b7sg0l8lm3lcrxzy4cjl5dp4cxdmycap62"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'unpack-test-data
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "tar" "-C" "plastid/test"
                      "-xf" (assoc-ref inputs "test-data"))
              ;; This one requires bowtie-build
              (delete-file "plastid/test/functional/test_crossmap.py")))
          (add-before 'check 'build-extensions
            (lambda _
              ;; Cython extensions have to be built before running the tests.
              (invoke "python3" "setup.py" "build_ext" "--inplace"))))))
    (propagated-inputs
     (list python-numpy
           python-scipy
           python-pandas
           python-pysam
           python-matplotlib
           python-biopython
           python-twobitreader
           python-termcolor))
    (inputs
     (list openssl))
    (native-inputs
     `(("python-cython" ,python-cython)
       ("python-nose" ,python-nose)
       ("test-data"
        ,(origin
           (method url-fetch)
           (uri "https://www.dropbox.com/s/np3wlfvp6gx8tb8/2022-05-04.plastid-test-data.tar.bz2?dl=1")
           (file-name "plastid-test-data-2022-05-04.tar.bz2")
           (sha256
            (base32 "1szsji06m2r21flnvxg84jnj5zmlk6z10c9651v9ag71nxj9rbzn"))))))
    (home-page "https://github.com/joshuagryphon/plastid")
    (synopsis "Python library for genomic analysis")
    (description
     "plastid is a Python library for genomic analysis – in particular,
high-throughput sequencing data – with an emphasis on simplicity.")
    (license license:bsd-3)))

(define-public tetoolkit
  (package
    (name "tetoolkit")
    (version "2.2.1b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mhammell-laboratory/TEtranscripts")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1m3xsydakhdan9gp9mfdz7llka5g6ak91d0mbl1cmmxq9qs6an4y"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'adjust-requirements
           (lambda _
             (substitute* "setup.py"
               ;; This defunct dependency isn't required for Python 3 (see:
               ;; https://github.com/mhammell-laboratory/TEtranscripts/issues/111).
               ((".*'argparse'.*") ""))))
         (add-after 'unpack 'patch-invocations
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* '("bin/TEtranscripts"
                            "bin/TEcount")
               (("'sort ")
                (string-append "'" (search-input-file inputs "bin/sort") " "))
               (("'rm -f ")
                (string-append "'" (search-input-file inputs "bin/rm") " -f "))
               (("'Rscript'")
                (string-append "'" (search-input-file inputs "bin/Rscript")
                               "'")))
             (substitute* "TEToolkit/IO/ReadInputs.py"
               (("BamToBED")
                (search-input-file inputs "bin/bamToBed")))
             (substitute* "TEToolkit/Normalization.py"
               (("\"Rscript\"")
                (string-append "\"" (search-input-file inputs "bin/Rscript")
                               "\"")))))
         (add-after 'install 'wrap-program
           (lambda* (#:key outputs #:allow-other-keys)
             ;; Make sure the executables find R packages.
             (for-each (lambda (script)
                         (wrap-program script
                           `("R_LIBS_SITE" ":" = (,(getenv "R_LIBS_SITE")))))
                       (list (search-input-file outputs "bin/TEtranscripts")
                             (search-input-file outputs "bin/TEcount"))))))))
    (inputs
     (list bash-minimal
           coreutils
           bedtools
           python-pysam
           r-minimal
           r-deseq2))
    (home-page "https://github.com/mhammell-laboratory/TEtranscripts")
    (synopsis "Transposable elements in differential enrichment analysis")
    (description
     "This is package for including transposable elements in differential
enrichment analysis of sequencing datasets.  TEtranscripts and TEcount take
RNA-seq (and similar data) and annotates reads to both genes and transposable
elements.  TEtranscripts then performs differential analysis using DESeq2.
Note that TEtranscripts and TEcount rely on specially curated GTF files, which
are not included due to their size.")
    (license license:gpl3+)))

(define-public cd-hit
  (package
    (name "cd-hit")
    (version "4.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/weizhongli/cdhit"
                                  "/releases/download/V" version
                                  "/cd-hit-v" version
                                  "-2019-0228.tar.gz"))
              (sha256
               (base32
                "1phmfhgcpyfd6kj7jwzw976613lcpv1wc2pzfdfaxla062x2s5r6"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ; there are no tests
      #:make-flags
      ;; Executables are copied directly to the PREFIX.
      #~(list (string-append "PREFIX=" #$output "/bin")
              ;; Support longer sequences (e.g. Pacbio sequences)
              "MAX_SEQ=60000000")
      #:phases
      '(modify-phases %standard-phases
         ;; No "configure" script
         (delete 'configure)
         ;; Remove sources of non-determinism
         (add-after 'unpack 'be-timeless
           (lambda _
             (substitute* "cdhit-utility.c++"
               ((" \\(built on \" __DATE__ \"\\)") ""))
             (substitute* "cdhit-common.c++"
               (("__DATE__") "\"0\"")
               (("\", %s, \" __TIME__ \"\\\\n\", date") ""))))
         ;; The "install" target does not create the target directory.
         (add-before 'install 'create-target-dir
           (lambda* (#:key outputs #:allow-other-keys)
             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (inputs
     (list perl zlib))
    (home-page "http://weizhongli-lab.org/cd-hit/")
    (synopsis "Cluster and compare protein or nucleotide sequences")
    (description
     "CD-HIT is a program for clustering and comparing protein or nucleotide
sequences.  CD-HIT is designed to be fast and handle extremely large
databases.")
    ;; The manual says: "It can be copied under the GNU General Public License
    ;; version 2 (GPLv2)."
    (license license:gpl2)))

(define-public cd-hit-auxtools
  (package
    (inherit cd-hit)
    (name "cd-hit-auxtools")
    (arguments
     (list
      #:tests? #f                       ; there are no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'chdir (lambda _ (chdir "cd-hit-auxtools")))
          ;; No "configure" script
          (delete 'configure)
          ;; There is no install target.
          (replace 'install
            (lambda _
              (for-each (lambda (file)
                          (install-file file (string-append #$output "/bin")))
                        '("cd-hit-dup" "cd-hit-lap" "read-linker")))))))
    (inputs '())))

(define-public clipper
  (package
    (name "clipper")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/YeoLab/clipper")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0508rgnfjk5ar5d1mjbjyrnarv4kw9ksq0m3jw2bmgabmb5v6ikk"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Delete pre-compiled files.
                  (delete-file "clipper/src/peaks.so")))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #false
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'use-python3-for-cython
           (lambda _
             (substitute* "setup.py"
               (("^setup")
                "\
peaks.cython_directives = {'language_level': '3'}
readsToWiggle.cython_directives = {'language_level': '3'}
setup"))))
         (add-after 'unpack 'disable-nondeterministic-test
           (lambda _
             ;; This test fails/succeeds non-deterministically.
             (substitute* "clipper/test/test_call_peak.py"
               (("test_get_FDR_cutoff_mean") "_test_get_FDR_cutoff_mean"))))
         ;; This doesn't work because "usage" is executed, and that calls
         ;; exit(8).
         (replace 'check
           (lambda* (#:key tests? inputs outputs #:allow-other-keys)
             (when tests?
               (add-installed-pythonpath inputs outputs)
               (with-directory-excursion "clipper/test"
                 (invoke "python" "-m" "unittest")))))
         ;; This is not a library
         (delete 'sanity-check))))
    (inputs
     (list htseq
           python-pybedtools
           python-cython
           python-scikit-learn
           python-matplotlib
           python-pandas
           python-pysam
           python-numpy
           python-scipy))
    (native-inputs
     (list python-setuptools-git
           python-mock ; for tests
           python-nose ; for tests
           python-pytz)) ; for tests
    (home-page "https://github.com/YeoLab/clipper")
    (synopsis "CLIP peak enrichment recognition")
    (description
     "CLIPper is a tool to define peaks in CLIP-seq datasets.")
    (license license:gpl2)))

(define-public codingquarry
  (package
    (name "codingquarry")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/codingquarry/CodingQuarry_v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0115hkjflsnfzn36xppwf9h9avfxlavr43djqmshkkzbgjzsz60i"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;no "check" target
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin"))
                    (doc (string-append #$output "/share/doc/codingquarry")))
                (install-file "INSTRUCTIONS.pdf" doc)
                (copy-recursively "QuarryFiles"
                                  (string-append #$output
                                                 "/share/codingquarry/QuarryFiles"))
                (install-file "CodingQuarry" bin)
                (install-file "CufflinksGTF_to_CodingQuarryGFF3.py" bin)))))))
    ;; TODO: This package also needs a Python 2 variant of biopython
    (inputs (list openmpi python-2)) ;Only Python 2 is supported
    (native-search-paths
     (list (search-path-specification
            (variable "QUARRY_PATH")
            (files '("share/codingquarry/QuarryFiles")))))
    (home-page "https://sourceforge.net/projects/codingquarry/")
    (synopsis "Fungal gene predictor")
    (description "CodingQuarry is a highly accurate, self-training GHMM fungal
gene predictor designed to work with assembled, aligned RNA-seq transcripts.")
    (license license:gpl3+)))

(define-public clustal-omega
  (package
    (name "clustal-omega")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.clustal.org/omega/clustal-omega-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1vm30mzncwdv881vrcwg11vzvrsmwy4wg80j5i0lcfk6dlld50w6"))))
    (build-system gnu-build-system)
    (inputs
     (list argtable))
    (home-page "http://www.clustal.org/omega/")
    (synopsis "Multiple sequence aligner for protein and DNA/RNA")
    (description
     "Clustal-Omega is a general purpose multiple sequence alignment (MSA)
program for protein and DNA/RNA.  It produces high quality MSAs and is capable
of handling data-sets of hundreds of thousands of sequences in reasonable
time.")
    (license license:gpl2+)))

(define-public crossmap
  (package
    (name "crossmap")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "CrossMap" version))
              (sha256
               (base32
                "0hqminh5wn1p3x481jbyc7gmncp5xc196hpvki7k25vzbryhwcix"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Delete compiled Python files.
                  (for-each delete-file (find-files "." "\\.pyc$"))
                  (delete-file-recursively ".eggs")))))
    (build-system python-build-system)
    (inputs
     (list python-bx-python python-numpy python-pybigwig python-pysam
           zlib))
    (native-inputs
     (list python-cython python-nose))
    (home-page "https://crossmap.sourceforge.net/")
    (synopsis "Convert genome coordinates between assemblies")
    (description
     "CrossMap is a program for conversion of genome coordinates or annotation
files between different genome assemblies.  It supports most commonly used
file formats including SAM/BAM, Wiggle/BigWig, BED, GFF/GTF, VCF.")
    (license license:gpl2+)))

(define-public python-dnaio
  (package
    (name "python-dnaio")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dnaio" version))
       (sha256
        (base32
         "14v5yyasq2bz34j38wi3xfcp06jj7l35ppibjcn95l2n73hz3zwi"))))
    (build-system python-build-system)
    (native-inputs
     (list python-cython python-pytest python-xopen))
    (home-page "https://github.com/marcelm/dnaio/")
    (synopsis "Read FASTA and FASTQ files efficiently")
    (description
     "dnaio is a Python library for fast parsing of FASTQ and also FASTA
files.  The code was previously part of the cutadapt tool.")
    (license license:expat)))

(define-public python-deeptoolsintervals
  (package
    (name "python-deeptoolsintervals")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "deeptoolsintervals" version))
              (sha256
               (base32
                "1xnl80nblysj6dylj4683wgrfa425rkx4dp5k65hvwdns9pw753x"))))
    (build-system python-build-system)
    (inputs
     (list zlib))
    (home-page "https://github.com/deeptools/deeptools_intervals")
    (synopsis "Create GTF-based interval trees with associated meta-data")
    (description
     "This package provides a Python module creating/accessing GTF-based
interval trees with associated meta-data.  It is primarily used by the
@code{deeptools} package.")
    (license license:expat)))

(define-public python-deeptools
  (package
    (name "python-deeptools")
    (version "3.4.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/deeptools/deepTools")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0l09vyynz6s6w7fnyd94rpys4a6aja6kp4gli64pngdxdz3md1nl"))))
    (build-system python-build-system)
    (native-inputs
     (list python-mock python-nose))
    (propagated-inputs
     (list python-matplotlib
           python-numpy
           python-numpydoc
           python-py2bit
           python-pybigwig
           python-pysam
           python-scipy
           python-deeptoolsintervals
           python-plotly-2.4.1))
    (home-page "https://pypi.org/project/deepTools/")
    (synopsis "Useful tools for exploring deep sequencing data")
    (description "This package addresses the challenge of handling large amounts
of data that are now routinely generated from DNA sequencing centers.
@code{deepTools} contains useful modules to process the mapped reads data for
multiple quality checks, creating normalized coverage files in standard bedGraph
and bigWig file formats, that allow comparison between different files.  Finally,
using such normalized and standardized files, deepTools can create many
publication-ready visualizations to identify enrichments and for functional
annotations of the genome.")
    ;; The file deeptools/cm.py is licensed under the BSD license.  The
    ;; remainder of the code is licensed under the MIT license.
    (license (list license:bsd-3 license:expat))))

(define-public cutadapt
  (package
    (name "cutadapt")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "cutadapt" version))
              (sha256
               (base32
                "1vqmsfkm6llxzmsz9wcfcvzx9a9f8iabvwik2rbyn7nc4wm25z89"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'always-cythonize
           (lambda _
             (delete-file "src/cutadapt/_align.c")
             ;; If PKG-INFO exists, setup.py decides not to run Cython.
             (substitute* "setup.py"
               (("os.path.exists\\('PKG-INFO'\\):")
                "os.path.exists('totally-does-not-exist'):")))))))
    (inputs
     (list python-dnaio python-xopen))
    (native-inputs
     (list python-cython python-pytest python-setuptools-scm))
    (home-page "https://cutadapt.readthedocs.io/en/stable/")
    (synopsis "Remove adapter sequences from nucleotide sequencing reads")
    (description
     "Cutadapt finds and removes adapter sequences, primers, poly-A tails and
other types of unwanted sequence from high-throughput sequencing reads.")
    (license license:expat)))

(define-public libbigwig
  (package
    (name "libbigwig")
    (version "0.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dpryan79/libBigWig")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "09693dmf1scdac5pyq6qyn8b4mcipvnmc370k9a5z41z81m3dcsj"))))
    (build-system gnu-build-system)
    (arguments
     `(#:test-target "test"
       #:tests? #f ; tests require access to the web
       #:make-flags
       ,#~(list "CC=gcc"
                (string-append "prefix=" #$output))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))
    (inputs
     (list zlib curl))
    (native-inputs
     `(("doxygen" ,doxygen)
       ;; Need for tests
       ("python" ,python-2)))
    (home-page "https://github.com/dpryan79/libBigWig")
    (synopsis "C library for handling bigWig files")
    (description
     "This package provides a C library for parsing local and remote BigWig
files.")
    (license license:expat)))

(define-public python-pybigwig
  (package
    (name "python-pybigwig")
    (version "0.3.22")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyBigWig" version))
              (sha256
               (base32
                "0hr25lkp26mk0fp7irdjdrdsd5lann9kyv0xq9npyyxxakvjci2x"))
              (modules '((guix build utils)))
              (snippet
               ;; Delete bundled libBigWig sources
               '(delete-file-recursively "libBigWig"))))
    (build-system pyproject-build-system)
    (arguments
     '(#:tests? #false      ;only one test exists and it needs internet access
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'link-with-libBigWig
           (lambda _
             (substitute* "setup.py"
               (("libs=\\[") "libs=[\"BigWig\", ")))))))
    (propagated-inputs
     (list python-numpy))
    (inputs
     (list libbigwig zlib curl))
    (home-page "https://github.com/dpryan79/pyBigWig")
    (synopsis "Access bigWig files in Python using libBigWig")
    (description
     "This package provides Python bindings to the libBigWig library for
accessing bigWig files.")
    (license license:expat)))

(define-public python-schema-salad
  (package
    (name "python-schema-salad")
    (version "8.2.20211116214159")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "schema-salad" version))
        (sha256
         (base32
          "005dh2y45x92zl8sf2sqjmfvcqr4hrz8dfckgkckv87003v7lwqc"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'skip-failing-tests
           (lambda _
             ;; Skip tests that require network access.
             (substitute* "schema_salad/tests/test_cwl11.py"
               (("^def test_(secondaryFiles|outputBinding)" all)
                (string-append "@pytest.mark.skip(reason="
                               "\"test requires network access\")\n"
                               all))))))))
    (propagated-inputs
     (list python-cachecontrol
           python-lockfile
           python-mistune
           python-rdflib
           python-rdflib-jsonld
           python-requests
           python-ruamel.yaml
           python-typing-extensions))
    (native-inputs
     (list python-black python-pytest python-pytest-runner))
    (home-page "https://github.com/common-workflow-language/schema_salad")
    (synopsis "Schema Annotations for Linked Avro Data (SALAD)")
    (description
     "Salad is a schema language for describing JSON or YAML structured linked
data documents.  Salad schema describes rules for preprocessing, structural
validation, and hyperlink checking for documents described by a Salad schema.
Salad supports rich data modeling with inheritance, template specialization,
object identifiers, object references, documentation generation, code
generation, and transformation to RDF.  Salad provides a bridge between document
and record oriented data modeling and the Semantic Web.")
    (license license:asl2.0)))

(define-public python-scikit-bio
  (package
    (name "python-scikit-bio")
    (version "0.5.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "scikit-bio" version))
              (sha256
               (base32
                "1a8xbp3vrw8wfpm3pa2nb4rcar0643iqnb043ifwqbqyc86clhv3"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         ;; See https://github.com/biocore/scikit-bio/pull/1826
         (add-after 'unpack 'compatibility
           (lambda _
             (substitute* "skbio/sequence/tests/test_sequence.py"
               (("def test_concat_strict_many")
                "def _do_not_test_concat_strict_many"))
             (substitute* "skbio/stats/distance/_mantel.py"
               (("from scipy.stats import PearsonRConstantInputWarning")
                "from scipy.stats import ConstantInputWarning")
               (("from scipy.stats import PearsonRNearConstantInputWarning")
                "from scipy.stats import NearConstantInputWarning")
               (("from scipy.stats import SpearmanRConstantInputWarning") "")
               (("warnings.warn\\(PearsonRConstantInputWarning\\(\\)\\)")
                "warnings.warn(ConstantInputWarning())")
               (("warnings.warn\\(PearsonRNearConstantInputWarning\\(\\)\\)")
                "warnings.warn(NearConstantInputWarning())")
               (("warnings.warn\\(SpearmanRConstantInputWarning\\(\\)\\)")
                "warnings.warn(ConstantInputWarning())"))
             (substitute* "skbio/diversity/alpha/tests/test_base.py"
               (("self.assertEqual\\(pielou_e")
                "self.assertAlmostEqual(pielou_e"))))
         (add-before 'check 'build-extensions
           (lambda _
             ;; Cython extensions have to be built before running the tests.
             (invoke "python3" "setup.py" "build_ext" "--inplace")))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests? (invoke "python3" "-m" "skbio.test")))))))
    (propagated-inputs
     (list python-cachecontrol
           python-decorator
           python-h5py
           python-hdmedians
           python-ipython
           python-lockfile
           python-matplotlib
           python-natsort
           python-numpy
           python-pandas
           python-scikit-learn
           python-scipy))
    (native-inputs
     (list python-coverage python-pytest))
    (home-page "https://scikit-bio.org")
    (synopsis "Data structures, algorithms and educational resources for bioinformatics")
    (description
     "This package provides data structures, algorithms and educational
resources for bioinformatics.")
    (license license:bsd-3)))

(define-public python-scrublet
  (package
    (name "python-scrublet")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "scrublet" version))
              (sha256
               (base32
                "0fk5pwk12yz9wpvwkl6j2l2g28f3x35b9r9n5bw6f0i9f0qgd191"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #false)) ;there are none
    (propagated-inputs
     (list python-annoy
           python-cython
           python-matplotlib
           python-numba
           python-numpy
           python-pandas
           python-scikit-image
           python-scikit-learn
           python-scipy
           python-umap-learn))
    (home-page "https://github.com/swolock/scrublet")
    (synopsis "Tool to indentify and remove doublets in single-cell data")
    (description "This package provides a tool for identifying and removing
doublets in single-cell RNA-seq data.")
    (license license:expat)))

(define-public cwltool
  (package
    (name "cwltool")
    (version "3.1.20220119140128")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/common-workflow-language/cwltool")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1jmrm0qrqgka79avc1kq63fgh20gx6g07fc8p3iih4k85vhdyl3f"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'loosen-version-restrictions
           (lambda _
             (substitute* "setup.py"
               (("== 1.5.1") ">=1.5.1")))) ; prov
         (add-after 'unpack 'dont-use-git
           (lambda _
             (substitute* "gittaggers.py"
               (("self.git_timestamp_tag\\(\\)")
                (string-append "time.strftime('.%Y%m%d%H%M%S', time.gmtime(int("
                               (string-drop ,version 4) ")))")))))
         (add-after 'unpack 'modify-tests
           (lambda _
             ;; Tries to connect to the internet.
             (delete-file "tests/test_content_type.py")
             (delete-file "tests/test_udocker.py")
             (delete-file "tests/test_http_input.py")
             (substitute* "tests/test_load_tool.py"
               (("def test_load_graph_fragment_from_packed")
                (string-append "@pytest.mark.skip(reason=\"Disabled by Guix\")\n"
                               "def test_load_graph_fragment_from_packed")))
             (substitute* "tests/test_examples.py"
               (("def test_env_filtering")
                (string-append "@pytest.mark.skip(reason=\"Disabled by Guix\")\n"
                               "def test_env_filtering")))
             ;; Tries to use cwl-runners.
             (substitute* "tests/test_examples.py"
               (("def test_v1_0_arg_empty_prefix_separate_false")
                (string-append "@pytest.mark.skip(reason=\"Disabled by Guix\")\n"
                               "def test_v1_0_arg_empty_prefix_separate_false")))

             (substitute* '("cwltool/schemas/v1.1/tests/env-tool1.cwl"
                            "cwltool/schemas/v1.1/tests/env-tool2.cwl"
                            "cwltool/schemas/v1.1/tests/imported-hint.cwl"
                            "tests/subgraph/env-tool2.cwl"
                            "tests/subgraph/env-tool2_req.cwl"
                            "tests/subgraph/env-wf2_subwf-packed.cwl"
                            "tests/subgraph/env-tool2_no_env.cwl")
               (("\"/bin/sh\"") (string-append "\"" (which "sh") "\"")))
             ;; Pytest doesn't know what to do with "-n auto"
             (substitute* "tox.ini"
               (("-n auto") "")))))))
    (inputs
     (list python-argcomplete
           python-bagit
           python-coloredlogs
           python-mypy-extensions
           python-prov
           python-pydot
           python-psutil
           python-rdflib
           python-requests
           python-ruamel.yaml
           python-schema-salad
           python-shellescape
           python-typing-extensions
           ;; Not listed as needed but still necessary:
           node))
    (native-inputs
     (list python-arcp
           python-humanfriendly
           python-mock
           python-pytest
           python-pytest-cov
           python-pytest-mock
           python-pytest-runner))
    (home-page
     "https://github.com/common-workflow-language/common-workflow-language")
    (synopsis "Common Workflow Language reference implementation")
    (description
     "This is the reference implementation of the @acronym{CWL, Common Workflow
Language} standards.  The CWL open standards are for describing analysis
workflows and tools in a way that makes them portable and scalable across a
variety of software and hardware environments, from workstations to cluster,
cloud, and high performance computing (HPC) environments.  CWL is designed to
meet the needs of data-intensive science, such as Bioinformatics, Medical
Imaging, Astronomy, Physics, and Chemistry.  The @acronym{cwltool, CWL reference
implementation} is intended to be feature complete and to provide comprehensive
validation of CWL files as well as provide other tools related to working with
CWL descriptions.")
    (license license:asl2.0)))

(define-public python-dendropy
  (package
    (name "python-dendropy")
    (version "4.5.1")
    (source
     (origin
       (method git-fetch)
       ;; Source from GitHub so that tests are included.
       (uri (git-reference
             (url "https://github.com/jeetsukumaran/DendroPy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0lrfzjqzbpk1rrra9vd7z2j7q09jy9w1ss7wn2rd85i4k5y3xz8l"))))
    (build-system pyproject-build-system)
    (arguments
     (list
       #:test-flags
       '(list "-k"
              (string-join
               ;; These tests fail because we have no "paup" executable.
               (list "not test_group1"
                     "test_basic_split_counting_under_different_rootings"
                     "test_basic_split_count_with_incorrect_weight_treatment_raises_error"
                     "test_basic_split_count_with_incorrect_rootings_raises_error"

                     ;; Assert error for unknown reasons
                     "test_by_num_lineages")
               " and not "))
       #:phases
       '(modify-phases %standard-phases
          (add-after 'unpack 'python-compatibility
            (lambda _
              (substitute* "tests/test_datamodel_taxon.py"
                (("collections.Iterable")
                 "collections.abc.Iterable")))))))
    (native-inputs (list python-pytest))
    (home-page "https://dendropy.org/")
    (synopsis "Library for phylogenetics and phylogenetic computing")
    (description
     "DendroPy is a library for phylogenetics and phylogenetic computing: reading,
writing, simulation, processing and manipulation of phylogenetic
trees (phylogenies) and characters.")
    (license license:bsd-3)))

(define-public python-py2bit
  (package
    (name "python-py2bit")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "py2bit" version))
       (sha256
        (base32
         "1vw2nvw1yrl7ikkqsqs1pg239yr5nspvd969r1x9arms1k25a1a5"))))
    (build-system python-build-system)
    (home-page "https://github.com/dpryan79/py2bit")
    (synopsis "Access 2bit files using lib2bit")
    (description
     "This package provides Python bindings for lib2bit to access 2bit files
with Python.")
    (license license:expat)))

(define-public delly
  (package
    (name "delly")
    (version "0.8.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dellytools/delly")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1ibnplgfzj96w8glkx17v7sld3pm402fr5ybmf3h0rlcryabxrqy"))
              (modules '((guix build utils)))
              (snippet
               '(delete-file-recursively "src/htslib"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;There are no tests to run.
      #:make-flags
      #~(list "PARALLEL=1"             ; Allow parallel execution at run-time.
              (string-append "prefix=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)           ; There is no configure phase.
          (add-after 'install 'install-templates
            (lambda _
              (let ((templates (string-append #$output
                                              "/share/delly/templates")))
                (mkdir-p templates)
                (copy-recursively "excludeTemplates" templates)))))))
    (inputs
     (list boost bzip2 htslib zlib))
    (home-page "https://github.com/dellytools/delly")
    (synopsis "Integrated structural variant prediction method")
    (description "Delly is an integrated structural variant prediction method
that can discover and genotype deletions, tandem duplications, inversions and
translocations at single-nucleotide resolution in short-read massively parallel
sequencing data.  It uses paired-ends and split-reads to sensitively and
accurately delineate genomic rearrangements throughout the genome.")
    (license license:gpl3+)))

(define-public transanno
  (package
    (name "transanno")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/informationsea/transanno")
             ;; Corresponds to tag v0.3.0
             (commit "df49050c92644ea12d9d5c6fae2186ca436dbca3")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1jpn7s3cnd9ybk4lmfbhj2arhf6cmrv7jp74n7n87m3a3irkaif1"))
       (snippet
        '(with-output-to-file "liftover-rs/build.rs"
           (lambda _
             (format #true
                     "fn main() {~@
                        println!(\"cargo:rustc-link-lib=lzma\");~@
                        }~%"))))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:install-source? #false          ;fails
      #:tests? #false                   ;"cargo test" ignores build.rs
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'prepare-test-files
            (lambda _
              (delete-file "Cargo.lock")
              (substitute* "liftover-rs/Cargo.toml"
                (("anyhow = \"1\"") "anyhow = \"1.0.65\""))
              (substitute* "liftover-rs/prepare-test.sh"
                (("/bin/bash")
                 (string-append #$(this-package-native-input "bash")
                                "/bin/bash")))
              (invoke "bash" "prepare-test-files.sh")))
          (add-before 'patch-cargo-checksums 'do-not-build-xz
            (lambda _
              ;; Detection of liblzma (in rust-lzma-sys, pulled in by
              ;; rust-hts-sys) doesn't seem to work, or perhaps it really does
              ;; request a static build somewhere.
              (substitute* "guix-vendor/rust-lzma-sys-0.1.17.tar.xz/build.rs"
                (("if .want_static && .msvc && pkg_config::probe_library\\(\"liblzma\"\\).is_ok\\(\\)") ""))))
          (add-before 'install 'chdir
            (lambda _ (chdir "transanno"))))
      #:cargo-inputs
      `(("rust-anyhow" ,rust-anyhow-1)
        ("rust-autocompress" ,rust-autocompress-0.2)
        ("rust-bio" ,rust-bio-0.41)
        ("rust-clap" ,rust-clap-2)
        ("rust-csv" ,rust-csv-1)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-nom" ,rust-nom-5)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-pretty-env-logger" ,rust-pretty-env-logger-0.3)
        ("rust-regex" ,rust-regex-1)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1))
      #:cargo-development-inputs
      `(("rust-clap" ,rust-clap-2)
        ("rust-lazy-static" ,rust-lazy-static-1))))
    (native-inputs (list bash))
    (home-page "https://github.com/informationsea/transanno")
    (synopsis "LiftOver tool for new genome assemblies")
    (description "This package provides an accurate VCF/GFF3/GTF LiftOver tool
for new genome assemblies.")
    (license license:gpl3+)))

(define-public trf
  (package
    (name "trf")
    (version "4.09.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Benson-Genomics-Lab/TRF")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0fhwr4s1mf8nw8fr5imwjvjr42b59p97zr961ifm8xl1bajz4wpg"))))
    (build-system gnu-build-system)
    (home-page "https://github.com/Benson-Genomics-Lab/TRF")
    (synopsis "Tandem Repeats Finder: a program to analyze DNA sequences")
    (description "A tandem repeat in DNA is two or more adjacent, approximate
copies of a pattern of nucleotides.  Tandem Repeats Finder is a program to
locate and display tandem repeats in DNA sequences.  In order to use the
program, the user submits a sequence in FASTA format.  The output consists of
two files: a repeat table file and an alignment file.  Submitted sequences may
be of arbitrary length. Repeats with pattern size in the range from 1 to 2000
bases are detected.")
    (license license:agpl3+)))

(define-public repeat-masker
  (package
    (name "repeat-masker")
    (version "4.1.2-p1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.repeatmasker.org/"
                                  "RepeatMasker/RepeatMasker-"
                                  version ".tar.gz"))
              (sha256
               (base32 "15hfdfpzmdjcx7ng7rjfid69bmvgn3z9g9r43qhjnhjhq3v4prab"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #false ; there are none
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'build
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((share (string-append (assoc-ref outputs "out")
                                         "/share/RepeatMasker")))
               (mkdir-p share)
               (copy-recursively "." share)
               (with-directory-excursion share
                 (invoke "perl" "configure"
                         "--trf_prgm" (which "trf")
                         "--hmmer_dir"
                         (string-append (assoc-ref inputs "hmmer")
                                        "/bin"))))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out   (assoc-ref outputs "out"))
                    (share (string-append out "/share/RepeatMasker"))
                    (bin   (string-append out "/bin"))
                    (path  (getenv "PERL5LIB")))
               (install-file (string-append share "/RepeatMasker") bin)
               (wrap-program (string-append bin "/RepeatMasker")
                 `("PERL5LIB" ":" prefix (,path ,share)))))))))
    (inputs
     (list perl
           perl-text-soundex
           python
           python-h5py
           hmmer
           trf))
    (home-page "https://github.com/Benson-Genomics-Lab/TRF")
    (synopsis "Tandem Repeats Finder: a program to analyze DNA sequences")
    (description "A tandem repeat in DNA is two or more adjacent, approximate
copies of a pattern of nucleotides.  Tandem Repeats Finder is a program to
locate and display tandem repeats in DNA sequences.  In order to use the
program, the user submits a sequence in FASTA format.  The output consists of
two files: a repeat table file and an alignment file.  Submitted sequences may
be of arbitrary length. Repeats with pattern size in the range from 1 to 2000
bases are detected.")
    (license license:osl2.1)))

(define-public diamond
  (package
    (name "diamond")
    (version "2.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bbuchfink/diamond")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0kb17jwlsrvgswfahzznrffv1i6ybwwmq99qs7iga5yzbx64jp6q"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags '(list "-DX86=OFF"))) ;avoid SSE4 and AVX2
    (inputs (list zlib))
    (home-page "https://github.com/bbuchfink/diamond")
    (synopsis "Accelerated BLAST compatible local sequence aligner")
    (description
     "DIAMOND is a BLAST-compatible local aligner for mapping protein and
translated DNA query sequences against a protein reference database (BLASTP
and BLASTX alignment mode).  The speedup over BLAST is up to 20,000 on short
reads at a typical sensitivity of 90-99% relative to BLAST depending on the
data and settings.")
    (license license:gpl3+)))

(define-public discrover
  (package
    (name "discrover")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/maaskola/discrover")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "173fwi2vb6a5kp406hm3jj6j7v4whww796f2qcygp4rpvamh307y"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f                      ; there are no tests
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-force-source-date
           ;; for reproducible dates, texlive needs this to respect
           ;; SOURCE_DATE_EPOCH
           (lambda _
             (setenv "FORCE_SOURCE_DATE" "1")))
         (add-after 'unpack 'fix-latex-errors
           (lambda _
             (with-fluids ((%default-port-encoding #f))
               (substitute* "doc/references.bib"
                 (("\\{S\\}illanp[^,]+,")
                  "{S}illanp{\\\"a}{\\\"a},")))
             ;; XXX: I just can't get pdflatex to not complain about these
             ;; characters.  They end up in the manual via the generated
             ;; discrover-cli-help.txt.
             (substitute* "src/hmm/cli.cpp"
               (("µ") "mu")
               (("η") "eta")
               (("≤") "<="))
             ;; This seems to be a syntax error.
             (substitute* "doc/discrover-manual.tex"
               (("theverbbox\\[t\\]") "theverbbox"))))
         (add-after 'unpack 'add-missing-includes
           (lambda _
             (substitute* "src/executioninformation.hpp"
               (("#define EXECUTIONINFORMATION_HPP" line)
                (string-append line "\n#include <random>")))
             (substitute* "src/plasma/fasta.hpp"
               (("#define FASTA_HPP" line)
                (string-append line "\n#include <random>"))))))))
    (inputs
     (list boost cairo rmath-standalone))
    (native-inputs
     (list (texlive-updmap.cfg
            (list texlive-cm
                  texlive-amsfonts
                  texlive-doi
                  texlive-fonts-ec
                  texlive-latex-examplep
                  texlive-hyperref
                  texlive-ms
                  texlive-latex-natbib
                  texlive-bibtex        ;style files used by natbib
                  texlive-pgf           ;tikz
                  texlive-latex-verbatimbox))
           imagemagick))
    (home-page "https://dorina.mdc-berlin.de/public/rajewsky/discrover/")
    (synopsis "Discover discriminative nucleotide sequence motifs")
    (description "Discrover is a motif discovery method to find binding sites
of nucleic acid binding proteins.")
    (license license:gpl3+)))

(define-public eigensoft
  (package
    (name "eigensoft")
    (version "7.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DReichLab/EIG")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1c141fqvhnzibmnf22sv23vbmzm20kjjyrib44cfh75wyndp2d9k"))
       (modules '((guix build utils)))
       ;; Remove pre-built binaries.
       (snippet '(begin
                   (delete-file-recursively "bin")
                   (mkdir "bin")
                   #t))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                    ; There are no tests.
       #:make-flags '("CC=gcc")
       #:phases
       (modify-phases %standard-phases
         ;; There is no configure phase, but the Makefile is in a
         ;; sub-directory.
         (replace 'configure
           (lambda _ (chdir "src") #t))
         ;; The provided install target only copies executables to
         ;; the "bin" directory in the build root.
         (add-after 'install 'actually-install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin  (string-append out "/bin")))
               (for-each (lambda (file)
                           (install-file file bin))
                         (find-files "../bin" ".*"))
               #t))))))
    (inputs
     (list gsl lapack openblas perl
           `(,gfortran "lib")))
    (home-page "https://github.com/DReichLab/EIG")
    (synopsis "Tools for population genetics")
    (description "The EIGENSOFT package provides tools for population
genetics and stratification correction.  EIGENSOFT implements methods commonly
used in population genetics analyses such as PCA, computation of Tracy-Widom
statistics, and finding related individuals in structured populations.  It
comes with a built-in plotting script and supports multiple file formats and
quantitative phenotypes.")
    ;; The license of the eigensoft tools is Expat, but since it's
    ;; linking with the GNU Scientific Library (GSL) the effective
    ;; license is the GPL.
    (license license:gpl3+)))

(define-public edirect
  (package
    (name "edirect")
    (version "13.3.20200128")
    (source (origin
              (method url-fetch)
              (uri (string-append "ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect"
                                  "/versions/" version
                                  "/edirect-" version ".tar.gz"))
              (sha256
               (base32
                "093zp7klv81ph0y8mm8d78a9hnpfxbv2kdym70gzdf3vz176rw33"))
              (modules '((guix build utils)))
              (snippet
               '(begin (delete-file "Mozilla-CA.tar.gz")
                       (substitute* "rchive.go"
                         ;; This go library does not have any license.
                         (("github.com/fiam/gounidecode/unidecode")
                          "golang.org/rainycape/unidecode"))
                       #t))))
    (build-system perl-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (delete 'check)                ; simple check after install
         (add-after 'unpack 'patch-programs
           (lambda* (#:key inputs #:allow-other-keys)
             ;; Ignore errors about missing xtract.Linux and rchive.Linux.
              (substitute* "pm-refresh"
                (("cat \\\"\\$target")
                 "grep ^[[:digit:]] \"$target"))
              #t))
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin"))
                   (edirect-go (assoc-ref inputs "edirect-go-programs")))
               (for-each
                 (lambda (file)
                   (install-file file bin))
                 '("archive-pubmed" "asp-cp" "asp-ls" "download-ncbi-data"
                   "download-pubmed" "edirect.pl" "efetch" "epost" "esearch"
                   "fetch-pubmed" "ftp-cp" "ftp-ls" "has-asp" "index-pubmed"
                   "pm-prepare" "pm-refresh" "pm-stash" "pm-collect"
                   "pm-index" "pm-invert" "pm-merge" "pm-promote"))
               (symlink (string-append edirect-go "/bin/xtract.Linux")
                        (string-append bin "/xtract"))
               (symlink (string-append edirect-go "/bin/rchive.Linux")
                        (string-append bin "/rchive")))
             #t))
         (add-after 'install 'wrap-program
           (lambda* (#:key outputs #:allow-other-keys)
              ;; Make sure everything can run in a pure environment.
              (let ((out (assoc-ref outputs "out"))
                    (path (getenv "PERL5LIB")))
                (for-each
                  (lambda (file)
                    (wrap-program file
                      `("PERL5LIB" ":" prefix (,path)))
                    (wrap-program file
                      `("PATH" ":" prefix (,(string-append out "/bin")
                                           ,(dirname (which "sed"))
                                           ,(dirname (which "gzip"))
                                           ,(dirname (which "grep"))
                                           ,(dirname (which "perl"))
                                           ,(dirname (which "uname"))))))
                  (find-files out ".")))
              #t))
         (add-after 'wrap-program 'check
           (lambda* (#:key outputs #:allow-other-keys)
             (invoke (string-append (assoc-ref outputs "out")
                                    "/bin/edirect.pl")
                     "-filter" "-help")
             #t)))))
    (inputs
     (list edirect-go-programs
           perl-html-parser
           perl-encode-locale
           perl-file-listing
           perl-html-tagset
           perl-html-tree
           perl-http-cookies
           perl-http-date
           perl-http-message
           perl-http-negotiate
           perl-lwp-mediatypes
           perl-lwp-protocol-https
           perl-net-http
           perl-uri
           perl-www-robotrules
           perl-xml-simple
           perl))
    (home-page "https://www.ncbi.nlm.nih.gov/books/NBK179288/")
    (synopsis "Tools for accessing the NCBI's set of databases")
    (description
     "Entrez Direct (EDirect) is a method for accessing the National Center
for Biotechnology Information's (NCBI) set of interconnected
databases (publication, sequence, structure, gene, variation, expression,
etc.) from a terminal.  Functions take search terms from command-line
arguments.  Individual operations are combined to build multi-step queries.
Record retrieval and formatting normally complete the process.

EDirect also provides an argument-driven function that simplifies the
extraction of data from document summaries or other results that are returned
in structured XML format.  This can eliminate the need for writing custom
software to answer ad hoc questions.")
    (native-search-paths
     ;; Ideally this should be set for LWP somewhere.
     (list (search-path-specification
            (variable "PERL_LWP_SSL_CA_FILE")
            (file-type 'regular)
            (separator #f)
            (files '("/etc/ssl/certs/ca-certificates.crt")))))
    (license license:public-domain)))

(define-public edirect-go-programs
  (package
    (inherit edirect)
    (name "edirect-go-programs")
    (build-system go-build-system)
    (arguments
     `(#:install-source? #f
       #:tests? #f      ; No tests.
       #:import-path "ncbi.nlm.nih.gov/entrez/edirect"
       #:phases
       (modify-phases %standard-phases
         (replace 'build
           (lambda* (#:key import-path #:allow-other-keys)
             (with-directory-excursion (string-append "src/" import-path)
               (invoke "go" "build" "-v" "-x" "j2x.go")
               (invoke "go" "build" "-v" "-x" "t2x.go")
               (invoke "go" "build" "-v" "-x" "-o"
                       "xtract.Linux" "xtract.go" "common.go")
               (invoke "go" "build" "-v" "-x" "-o"
                       "rchive.Linux" "rchive.go" "common.go")
               (invoke "go" "build" "-v" "-x" "-o" "symbols.Linux" "s2p.go"))))
         (replace 'install
           (lambda* (#:key outputs import-path #:allow-other-keys)
             (let ((dest    (string-append (assoc-ref outputs "out") "/bin"))
                   (source  (string-append "src/" import-path "/")))
               (for-each (lambda (file)
                           (format #t "installing ~a~%" file)
                           (install-file (string-append source file) dest))
                         '("j2x" "t2x" "symbols.Linux" "xtract.Linux" "rchive.Linux"))
               #t))))))
    (native-inputs '())
    (propagated-inputs '())
    (inputs
     (list go-github-com-fatih-color
           go-github-com-fogleman-gg
           go-github-com-gedex-inflector
           go-github-com-golang-freetype
           go-github-com-klauspost-cpuid
           go-github-com-pbnjay-memory
           go-github-com-surgebase-porter2
           go-golang-org-rainycape-unidecode
           go-golang-org-x-image
           go-golang-org-x-text))))

(define-public python-bamnostic
  (package
    (name "python-bamnostic")
    (version "1.1.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "bamnostic" version))
              (sha256
               (base32
                "0cjpzyqz6r4lmiwry2gcxdczwpkhl3lyyjg4s8addln17691ysxk"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pytest))
    (home-page "https://github.com/betteridiot/bamnostic/")
    (synopsis "Tool for binary alignment map, random access and parsing")
    (description
     "Bamnostic is a pure Python @dfn{Binary Alignment Map} (BAM) file parser
and random access tool.")
    (license license:bsd-3)))

(define-public python-episcanpy
  (package
    (name "python-episcanpy")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "episcanpy" version))
              (sha256
               (base32
                "1qqcyhyzy6idpjmidfdpzwk02hbxm25rymz42h51nlk0vd4r2wwm"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      ;; The tests import episcanpy.api, but this is known to not work.
      ;; See https://github.com/colomemaria/epiScanpy/issues/133
      #:tests? #false
      #:phases
      '(modify-phases %standard-phases
         ;; Numba needs a writable dir to cache functions.
         (add-before 'build 'set-numba-cache-dir
           (lambda _
             (setenv "NUMBA_CACHE_DIR" "/tmp"))))))
    (propagated-inputs
     (list python-anndata
           python-bamnostic
           python-h5py
           python-intervaltree
           python-joblib
           python-kneed
           python-legacy-api-wrap
           python-matplotlib
           python-natsort
           python-networkx
           python-numba
           python-numpy
           python-packaging
           python-pandas
           python-scanpy
           python-scikit-learn
           python-scipy
           python-seaborn
           python-statsmodels
           python-tqdm
           python-pysam
           python-tbb
           python-umap-learn))
    (native-inputs (list python-pytest python-setuptools-scm))
    (home-page "https://github.com/colomemaria/epiScanpy")
    (synopsis "Tool for epigenomics single cell analysis")
    (description
     "EpiScanpy is a toolkit to analyse single-cell open
chromatin (scATAC-seq) and single-cell DNA methylation (for example scBS-seq)
data.  EpiScanpy is the epigenomic extension of the very popular scRNA-seq
analysis tool Scanpy (Genome Biology, 2018).")
    (license license:bsd-3)))

(define-public python-ete3
  (package
    (name "python-ete3")
    (version "3.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/etetoolkit/ete")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1i6533wsm06mz0sdrisqai929j744cnczwjgsmxl847q5k16kngd"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:test-flags
      '(list "-k"
             ;; This test crashes Python in the build container
             (string-append "not test_renderer"
                            ;; These all need internet access
                            " and not test_00_update_database"
                            " and not test_01tree_annotation"
                            " and not test_get_topology"
                            " and not test_merged_id"
                            " and not test_ncbi_compare"
                            " and not test_ncbiquery")
             "ete3/test/test_api.py")))
    (propagated-inputs
     (list python-lxml
           python-numpy
           python-pyqt
           python-scipy))
    (native-inputs
     (list python-pytest))
    (home-page "http://etetoolkit.org")
    (synopsis "Python environment for phylogenetic tree exploration")
    (description
     "This package provides a Python environment for phylogenetic tree
exploration.")
    (license license:gpl3+)))

(define-public python-illumina-utils
  (package
    (name "python-illumina-utils")
    (version "2.12")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "illumina-utils" version))
              (sha256
               (base32
                "0z9g0prj7pmgl5z4vdpxv3v30grzhc194801qnf0wqzgy7w3aj2s"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #false))  ;there are none
    (propagated-inputs (list python-matplotlib python-numpy python-levenshtein))
    (home-page "https://github.com/meren/illumina-utils")
    (synopsis "Library and scripts to work with Illumina paired-end data")
    (description
     "This package provides a library and collection of scripts to work with
Illumina paired-end data (for CASAVA 1.8+).")
    (license license:gpl2+)))

(define-public python-pyani
  (package
    (name "python-pyani")
    (version "0.2.12")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyani" version))
              (sha256
               (base32
                "124kdg7168nbh4a5wisfws1fgkd89dd4js9v6dml2lvgclbv4mjg"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-biopython python-matplotlib python-pandas
           python-scipy python-seaborn))
    (home-page "https://widdowquinn.github.io/pyani/")
    (synopsis "Calculate genome-scale average nucleotide identity")
    (description
     "Pyani provides a package and script for calculation of genome-scale
average nucleotide identity.")
    (license license:expat)))

(define-public exonerate
  (package
    (name "exonerate")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/exonerate/"
         "exonerate-" version ".tar.gz"))
       (sha256
        (base32
         "0hj0m9xygiqsdxvbg79wq579kbrx1mdrabi2bzqz2zn9qwfjcjgq"))))
    (build-system gnu-build-system)
    (arguments
     `(#:parallel-build? #f)) ; Building in parallel fails on some machines.
    (native-inputs
     (list pkg-config))
    (inputs
     (list glib))
    (home-page
     "https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate")
    (synopsis "Generic tool for biological sequence alignment")
    (description
     "Exonerate is a generic tool for pairwise sequence comparison.  It allows
the alignment of sequences using a many alignment models, either exhaustive
dynamic programming or a variety of heuristics.")
    (license license:gpl3)))

(define-public express
  (package
    (name "express")
    (version "1.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adarob/eXpress")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "18nb22n7x820fzjngf4qgyb3mspqkw7xyk7v7s5ps6wfrd8qwscb"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f                     ;no "check" target
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-shared-boost-libs-and-set-bamtools-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "CMakeLists.txt"
                (("set\\(Boost_USE_STATIC_LIBS ON\\)")
                 "set(Boost_USE_STATIC_LIBS OFF)")
                (("\\$\\{CMAKE_CURRENT_SOURCE_DIR\\}/bamtools/include")
                 (search-input-directory inputs "/include/bamtools"))
                (("\\$\\{PROJECT_SOURCE_DIR\\}/bamtools/lib/libbamtools.a")
                 (search-input-file inputs "/lib/libbamtools.so"))
                (("libbamtools.a") "libbamtools.so"))
              (substitute* "src/CMakeLists.txt"
                (("libprotobuf.a") "libprotobuf.so"))))
          (add-after 'unpack 'remove-update-check
            (lambda _
              (substitute* "src/main.cpp"
                (("#include \"update_check.h\"") "")
                (("check_version\\(PACKAGE_VERSION\\);") "")))))))
    (inputs
     (list boost bamtools protobuf zlib))
    (home-page "http://bio.math.berkeley.edu/eXpress")
    (synopsis "Streaming quantification for high-throughput genomic sequencing")
    (description
     "eXpress is a streaming tool for quantifying the abundances of a set of
target sequences from sampled subsequences.  Example applications include
transcript-level RNA-Seq quantification, allele-specific/haplotype expression
analysis (from RNA-Seq), transcription factor binding quantification in
ChIP-Seq, and analysis of metagenomic data.")
    (license license:artistic2.0)))

(define-public express-beta-diversity
  (package
   (name "express-beta-diversity")
   (version "1.0.8")
   (source (origin
             (method git-fetch)
             (uri (git-reference
                   (url "https://github.com/dparks1134/ExpressBetaDiversity")
                   (commit (string-append "v" version))))
             (file-name (git-file-name name version))
             (sha256
              (base32
               "0s0yzg5c21349rh7x4w9266jsvnp7j1hp9cf8sk32hz8nvrj745x"))))
   (build-system gnu-build-system)
   (arguments
    `(#:phases
      (modify-phases %standard-phases
        (delete 'configure)
        (add-before 'build 'enter-source (lambda _ (chdir "source") #t))
        (replace 'check
          (lambda _ (invoke "../bin/ExpressBetaDiversity" "-u") #t))
        (replace 'install
          (lambda* (#:key outputs #:allow-other-keys)
            (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
              (install-file "../scripts/convertToEBD.py" bin)
              (install-file "../bin/ExpressBetaDiversity" bin)
              #t))))))
   (inputs
    `(("python" ,python-2)))
   (home-page "https://github.com/dparks1134/ExpressBetaDiversity")
   (synopsis "Taxon- and phylogenetic-based beta diversity measures")
   (description
    "Express Beta Diversity (EBD) calculates ecological beta diversity
(dissimilarity) measures between biological communities.  EBD implements a
variety of diversity measures including those that make use of phylogenetic
similarity of community members.")
   (license license:gpl3+)))

(define-public fanc
  (let ((commit "354401e52ba2320e6b1ba0d3b5aab3541d31c9f3")
	(revision "1"))
    (package
      (name "fanc")
      (version (git-version "0" revision commit))
      (source (origin
		(method git-fetch)
		(uri (git-reference
		      (url "https://github.com/vaquerizaslab/fanc.git")
		      (commit commit)))
		(file-name (git-file-name name version))
		(sha256
		 (base32
		  "0vp2cak5snla4j2q23d3ixx016bwzvxfiv4z6yp7anl0xaksd5bl"))))
      (build-system pyproject-build-system)
      (arguments
       (list
        #:test-flags
        '(list "-m" "not longrunning"
               ;; XXX: some of the tests here just take forever
               "--ignore=fanc/test/test_matrix.py")))
      (propagated-inputs
       (list python-biopython
	     python-cooler
             python-deprecated
	     python-future
	     python-genomic-regions
	     python-gridmap
	     python-h5py
	     python-imageio
	     python-intervaltree
	     python-matplotlib
	     python-msgpack
	     python-msgpack-numpy
             python-numpy
	     python-pandas
	     python-pillow
	     python-progressbar2
	     python-pybedtools
	     python-pybigwig
	     python-pysam
	     python-pywavelets
	     python-pyyaml
	     python-scikit-image
	     python-scikit-learn
	     python-scipy
	     python-seaborn
	     python-tables
	     python-tifffile))
      (native-inputs
       (list python-cython python-pytest))
      (home-page "https://github.com/vaquerizaslab/fanc")
      (synopsis "Framework for the analysis of C-like data")
      (description "FAN-C provides a pipeline for analysing Hi-C data starting
at mapped paired-end sequencing reads.")
      (license license:gpl3+))))

(define-public fasttree
  (package
   (name "fasttree")
   (version "2.1.10")
   (source (origin
             (method url-fetch)
             (uri (string-append
                   "http://www.microbesonline.org/fasttree/FastTree-"
                   version ".c"))
             (sha256
              (base32
               "0vcjdvy1j4m702vmak4svbfkrpcw63k7wymfksjp9a982zy8kjsl"))))
   (build-system gnu-build-system)
   (arguments
    `(#:tests? #f ; no "check" target
      #:phases
      (modify-phases %standard-phases
        (delete 'unpack)
        (delete 'configure)
        (replace 'build
          (lambda* (#:key source #:allow-other-keys)
            (invoke "gcc"
                    "-O3"
                    "-finline-functions"
                    "-funroll-loops"
                    "-Wall"
                    "-o"
                    "FastTree"
                    source
                    "-lm")
            (invoke "gcc"
                    "-DOPENMP"
                    "-fopenmp"
                    "-O3"
                    "-finline-functions"
                    "-funroll-loops"
                    "-Wall"
                    "-o"
                    "FastTreeMP"
                    source
                    "-lm")
            #t))
        (replace 'install
          (lambda* (#:key outputs #:allow-other-keys)
            (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
              (install-file "FastTree" bin)
              (install-file "FastTreeMP" bin)
              #t))))))
   (home-page "http://www.microbesonline.org/fasttree")
   (synopsis "Infers approximately-maximum-likelihood phylogenetic trees")
   (description
    "FastTree can handle alignments with up to a million of sequences in a
reasonable amount of time and memory.  For large alignments, FastTree is
100-1,000 times faster than PhyML 3.0 or RAxML 7.")
   (license license:gpl2+)))

(define-public fastx-toolkit
  (package
    (name "fastx-toolkit")
    (version "0.0.14")
    (source (origin
              (method url-fetch)
              (uri
               (string-append
                "https://github.com/agordon/fastx_toolkit/releases/download/"
                version "/fastx_toolkit-" version ".tar.bz2"))
              (sha256
               (base32
                "01jqzw386873sr0pjp1wr4rn8fsga2vxs1qfmicvx1pjr72007wy"))))
    (build-system gnu-build-system)
    (inputs
     (list libgtextutils))
    (native-inputs
     (list gcc-6 ;; doesn't build with later versions
           pkg-config))
    (home-page "http://hannonlab.cshl.edu/fastx_toolkit/")
    (synopsis "Tools for FASTA/FASTQ file preprocessing")
    (description
     "The FASTX-Toolkit is a collection of command line tools for Short-Reads
FASTA/FASTQ files preprocessing.

Next-Generation sequencing machines usually produce FASTA or FASTQ files,
containing multiple short-reads sequences.  The main processing of such
FASTA/FASTQ files is mapping the sequences to reference genomes.  However, it
is sometimes more productive to preprocess the files before mapping the
sequences to the genome---manipulating the sequences to produce better mapping
results.  The FASTX-Toolkit tools perform some of these preprocessing tasks.")
    (license license:agpl3+)))

(define-public flexbar
  (package
    (name "flexbar")
    (version "3.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/seqan/flexbar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1pq9sxvdnldl14libk234m72dqhwgzs3acgl943wchwdqlcsi5r2"))))
    (build-system cmake-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'do-not-tune-to-CPU
           (lambda _
             (substitute* "src/CMakeLists.txt"
               ((" -march=native") ""))))
         (replace 'check
           (lambda* (#:key outputs #:allow-other-keys)
             (setenv "PATH" (string-append (getcwd) ":" (getenv "PATH")))
             (with-directory-excursion "../source/test"
               (invoke "bash" "flexbar_test.sh"))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (string-append (assoc-ref outputs "out")))
                    (bin (string-append out "/bin/")))
               (install-file "flexbar" bin)))))))
    (inputs
     (list tbb-2020 zlib))
    (native-inputs
     (list pkg-config seqan-2))
    (home-page "https://github.com/seqan/flexbar")
    (synopsis "Barcode and adapter removal tool for sequencing platforms")
    (description
     "Flexbar preprocesses high-throughput nucleotide sequencing data
efficiently.  It demultiplexes barcoded runs and removes adapter sequences.
Moreover, trimming and filtering features are provided.  Flexbar increases
read mapping rates and improves genome and transcriptome assemblies.  It
supports next-generation sequencing data in fasta/q and csfasta/q format from
Illumina, Roche 454, and the SOLiD platform.")
    (license license:bsd-3)))

(define-public fxtract
  (let ((util-commit "776ca85a18a47492af3794745efcb4a905113115"))
    (package
      (name "fxtract")
      (version "2.3")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ctSkennerton/fxtract")
               (commit version)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0hab3gpwf4w9s87qlbswq6ws1qqybh4dcqk79q1ahyldzai5fgp5"))))
      (build-system gnu-build-system)
      (arguments
       `(#:make-flags ,#~(list
                          (string-append "PREFIX=" #$output)
                          "CC=gcc")
         #:test-target "fxtract_test"
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (add-before 'build 'copy-util
             (lambda* (#:key inputs #:allow-other-keys)
               (rmdir "util")
               (copy-recursively (assoc-ref inputs "ctskennerton-util") "util")
               #t))
           ;; Do not use make install as this requires additional dependencies.
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (bin (string-append out"/bin")))
                 (install-file "fxtract" bin)
                 #t))))))
      (inputs
       (list pcre zlib))
      (native-inputs
       ;; ctskennerton-util is licensed under GPL2.
       `(("ctskennerton-util"
          ,(origin
             (method git-fetch)
             (uri (git-reference
                   (url "https://github.com/ctSkennerton/util")
                   (commit util-commit)))
             (file-name (string-append
                         "ctstennerton-util-" util-commit "-checkout"))
             (sha256
              (base32
               "0cls1hd4vgj3f36fpzzg4xc77d6f3hpc60cbpfmn2gdr7ykzzad7"))))))
      (home-page "https://github.com/ctSkennerton/fxtract")
      (synopsis "Extract sequences from FASTA and FASTQ files")
      (description
       "Fxtract extracts sequences from a protein or nucleotide fastx (FASTA
or FASTQ) file given a subsequence.  It uses a simple substring search for
basic tasks but can change to using POSIX regular expressions, PCRE, hash
lookups or multi-pattern searching as required.  By default fxtract looks in
the sequence of each record but can also be told to look in the header,
comment or quality sections.")
      ;; 'util' requires SSE instructions.
      (supported-systems '("x86_64-linux"))
      (license license:expat))))

(define-public gemma
  (package
    (name "gemma")
    (version "0.98.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/genetics-statistics/GEMMA")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1p8a7kkfn1mmrg017aziy544aha8i9h6wd1x2dk3w2794wl33qb7"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively "contrib")
                  #t))))
    (build-system gnu-build-system)
    (inputs
     (list gsl openblas zlib))
    (native-inputs
     `(("catch" ,catch2-1)
       ("perl" ,perl)
       ("shunit2" ,shunit2)
       ("which" ,which)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-after 'unpack 'prepare-build
           (lambda* (#:key inputs #:allow-other-keys)
             (mkdir-p "bin")
             (substitute* "Makefile"
               (("/usr/local/opt/openblas")
                (assoc-ref inputs "openblas")))
             #t))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               ;; 'make slow-check' expects shunit2-2.0.3.
               (with-directory-excursion "test"
                 (invoke "./test_suite.sh"))
               #t)))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (install-file "bin/gemma"
                           (string-append (assoc-ref outputs "out") "/bin"))
             #t)))))
    (home-page "https://github.com/genetics-statistics/GEMMA")
    (synopsis "Tool for genome-wide efficient mixed model association")
    (description
     "@acronym{GEMMA, Genome-wide Efficient Mixed Model Association} provides a
standard linear mixed model resolver with application in @acronym{GWAS,
genome-wide association studies}.")
    (license license:gpl3)))

(define-public hisat
  (package
    (name "hisat")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://ccb.jhu.edu/software/hisat/downloads/hisat-"
                    version "-beta-source.zip"))
              (sha256
               (base32
                "177z85vqp9b30vgxl5py5hz4mm37ila37nzhfam23ci9iyfxgyv9"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ;no check target
       #:make-flags '("allall"
                      ;; Disable unsupported `popcnt' instructions on
                      ;; architectures other than x86_64
                      ,@(if (string-prefix? "x86_64"
                                            (or (%current-target-system)
                                                (%current-system)))
                            '()
                            '("POPCNT_CAPABILITY=0")))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-sources
           (lambda _
             ;; XXX Cannot use snippet because zip files are not supported
             (substitute* "Makefile"
               (("^CC = .*$") "CC = gcc")
               (("^CPP = .*$") "CPP = g++")
               ;; replace BUILD_HOST and BUILD_TIME for deterministic build
               (("-DBUILD_HOST=.*") "-DBUILD_HOST=\"\\\"guix\\\"\"")
               (("-DBUILD_TIME=.*") "-DBUILD_TIME=\"\\\"0\\\"\""))
             (substitute* '("hisat-build" "hisat-inspect")
               (("/usr/bin/env") (which "env")))
             ;; This "extended character" is not considered valid.
             (substitute* "processor_support.h"
               (("“") "\"")
               (("”") "\""))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin/")))
               (for-each (lambda (file)
                           (install-file file bin))
                         (find-files
                          "."
                          "hisat(-(build|align|inspect)(-(s|l)(-debug)*)*)*$")))))
         (delete 'configure))))
    (native-inputs
     (list gcc-10 unzip))
    (inputs
     (list perl python zlib))
    ;; Non-portable SSE instructions are used so building fails on platforms
    ;; other than x86_64.
    (supported-systems '("x86_64-linux"))
    (home-page "https://ccb.jhu.edu/software/hisat/index.shtml")
    (synopsis "Hierarchical indexing for spliced alignment of transcripts")
    (description
     "HISAT is a fast and sensitive spliced alignment program for mapping
RNA-seq reads.  In addition to one global FM index that represents a whole
genome, HISAT uses a large set of small FM indexes that collectively cover the
whole genome.  These small indexes (called local indexes) combined with
several alignment strategies enable effective alignment of RNA-seq reads, in
particular, reads spanning multiple exons.")
    (license license:gpl3+)))

(define-public hisat2
  (package
    (name "hisat2")
    (version "2.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DaehwanKimLab/hisat2/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0lmzdhzjkvxw7n5w40pbv5fgzd4cz0f9pxczswn3d4cr0k10k754"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no check target
       #:make-flags (list "CC=gcc" "CXX=g++" "allall")
       #:modules ((guix build gnu-build-system)
                  (guix build utils)
                  (srfi srfi-26))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'make-deterministic
           (lambda _
             (substitute* "Makefile"
               (("`date`") "0"))))
         (delete 'configure)
         (add-before 'build 'build-manual
           (lambda _
             (mkdir-p "doc")
             (invoke "make" "doc")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin/"))
                    (doc (string-append out "/share/doc/hisat2/")))
               (for-each
                (cut install-file <> bin)
                (find-files "."
                            "hisat2(-(build|align|inspect)(-(s|l)(-debug)*)*)*$"))
               (mkdir-p doc)
               (install-file "doc/manual.inc.html" doc)))))))
    (native-inputs
     (list perl pandoc))             ; for documentation
    (inputs
     `(("python" ,python-wrapper)))
    (home-page "https://daehwankimlab.github.io/hisat2/")
    (synopsis "Graph-based alignment of genomic sequencing reads")
    (description "HISAT2 is a fast and sensitive alignment program for mapping
next-generation sequencing reads (both DNA and RNA) to a population of human
genomes (as well as to a single reference genome).  In addition to using one
global @dfn{graph FM} (GFM) index that represents a population of human
genomes, HISAT2 uses a large set of small GFM indexes that collectively cover
the whole genome.  These small indexes, combined with several alignment
strategies, enable rapid and accurate alignment of sequencing reads.  This new
indexing scheme is called a @dfn{Hierarchical Graph FM index} (HGFM).")
    ;; HISAT2 contains files from Bowtie2, which is released under
    ;; GPLv2 or later.  The HISAT2 source files are released under
    ;; GPLv3 or later.
    (license license:gpl3+)))

(define-public homer
  (package
    (name "homer")
    (version "4.11.1")
    (source
     (origin
       (method url-fetch/zipbomb)
       (uri (string-append "http://homer.ucsd.edu/homer/data/software/homer.v"
                           version ".zip"))
       (sha256
        (base32
         "0ay802swzq6ix9d8fkinpplcvyc1xyi3cjmj2x08jab7c40cvlc0"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda _
              (let ((share (string-append #$output "/share/homer")))
                (mkdir-p share)
                (substitute* "configureHomer.pl"
                  (("my \\$homeDir = \\$1;")
                   (string-append "my $homeDir = \"" share "\";"))))))
          (replace 'build
            (lambda _
              (let ((share (string-append #$output "/share/homer")))
                (copy-recursively "." share))
              (invoke "perl" "configureHomer.pl" "-local")))
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke (string-append #$output "/share/homer/bin/homer2")))))
          (replace 'install
            (lambda _
              (mkdir-p (string-append #$output "/bin"))
              (symlink (string-append #$output "/share/homer/bin/homer2")
                       (string-append #$output "/bin/homer2"))
              (for-each patch-shebang
                        (find-files (string-append #$output "/share/homer/bin")
                                    "\\.pl$")))))))
    (inputs
     (list perl))
    (native-inputs
     (list perl unzip))
    (home-page "http://homer.ucsd.edu/homer")
    (synopsis "Motif discovery and next generation sequencing analysis")
    (description
     "HOMER (Hypergeometric Optimization of Motif EnRichment) is a suite of
tools for Motif Discovery and next-gen sequencing analysis.  It is a
collection of command line programs written in Perl and C++.  HOMER was
primarily written as a de novo motif discovery algorithm and is well suited
for finding 8-20 bp motifs in large scale genomics data.  HOMER contains many
useful tools for analyzing ChIP-Seq, GRO-Seq, RNA-Seq, DNase-Seq, Hi-C and
numerous other types of functional genomics sequencing data sets.")
    (license license:gpl3+)))

(define-public hmmer
  (package
    (name "hmmer")
    (version "3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://eddylab.org/software/hmmer/hmmer-" version ".tar.gz"))
       (sha256
        (base32
         "0s9wf6n0qanbx8qs6igfl3vyjikwbrvh4d9d6mv54yp3xysykzlj"))))
    (build-system gnu-build-system)
    (native-inputs (list perl python)) ; for tests
    (home-page "http://hmmer.org/")
    (synopsis "Biosequence analysis using profile hidden Markov models")
    (description
     "HMMER is used for searching sequence databases for homologs of protein
sequences, and for making protein sequence alignments.  It implements methods
using probabilistic models called profile hidden Markov models (profile
HMMs).")
    ;; hmmer uses non-portable SSE intrinsics so building fails on other
    ;; platforms.
    (supported-systems '("x86_64-linux" "i686-linux"))
    (license license:bsd-3)))

(define-public htseq
  (package
    (name "htseq")
    (version "2.0.2")
    ;; Sources on pypi do not include everything needed to run the tests.
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/htseq/htseq")
                    (commit (string-append "release_" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1kbr4ydjjhizz6r5m3xd4f0wj7qnn8zs0vnzghhgaa0yhbya5r19"))))
    (build-system python-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         ;; Avoid rebuilding the extension.  Everything is built during the
         ;; 'install phase anyway.
         (delete 'build)
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "pytest" "-v")))))))
    (propagated-inputs
     (list python-matplotlib
           python-numpy
           python-pysam))
    (native-inputs
     (list python-cython
           python-pandas
           python-pytest
           python-scipy
           swig))
    (home-page "https://github.com/htseq")
    (synopsis "Framework for analyzing high-throughput sequencing data")
    (description
     "This package provides a framework to process and analyze data from
high-throughput sequencing (HTS) assays")
    (license license:gpl3+)))

(define-public python-genomepy
  (package
    (name "python-genomepy")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "genomepy" version))
              (sha256
               (base32
                "0jmyvnsn6w0djjmxh4fjspy1346337jzihxb276v3s275r6zjmln"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      ;; The tests require internet access.
      #:tests? #false
      #:phases
      '(modify-phases %standard-phases
         ;; Needed by tests
         (add-after 'unpack 'set-HOME
           (lambda _ (setenv "HOME" "/tmp"))))))
    (propagated-inputs (list python-appdirs
                             python-biopython
                             python-click
                             python-colorama
                             python-diskcache
                             ;; We cannot use an older filelock, because the
                             ;; @lock annotation is used here.
                             python-filelock-3.5
                             python-loguru
                             python-mygene
                             python-mysql-connector-python
                             python-norns
                             python-numpy
                             python-pandas
                             python-pyfaidx
                             python-requests
                             python-tqdm))
    (native-inputs (list python-hatchling python-pytest))
    (home-page "https://vanheeringen-lab.github.io/genomepy/")
    (synopsis "Genes and genomes at your fingertips")
    (description "genomepy is designed to provide a simple and straightforward
way to download and use genomic data.  This includes

@enumerate
@item searching available data,
@item showing the available metadata,
@item automatically downloading, preprocessing and matching data, and
@item generating optional aligner indexes.
@end enumerate

All with sensible, yet controllable defaults.")
    (license license:expat)))

(define-public java-htsjdk
  (package
    (name "java-htsjdk")
    (version "2.3.0") ; last version without build dependency on gradle
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/samtools/htsjdk")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1b178ixcabanm834ydjl3jiakpyxdmki32hqfv2abrzn3rcwa28i"))
              (modules '((guix build utils)))
              (snippet
               ;; Delete pre-built binaries
               '(begin
                  (delete-file-recursively "lib")
                  (mkdir-p "lib")
                  #t))))
    (build-system ant-build-system)
    (arguments
     `(#:tests? #f ; test require Internet access
       #:jdk ,icedtea-8
       #:make-flags
       ,#~(list (string-append "-Ddist=" #$output "/share/java/htsjdk/"))
       #:build-target "all"
       #:phases
       (modify-phases %standard-phases
         ;; The build phase also installs the jars
         (delete 'install))))
    (inputs
     `(("java-ngs" ,java-ngs)
       ("java-snappy-1" ,java-snappy-1)
       ("java-commons-compress" ,java-commons-compress)
       ("java-commons-logging-minimal" ,java-commons-logging-minimal)
       ("java-commons-jexl-2" ,java-commons-jexl-2)
       ("java-xz" ,java-xz)))
    (native-inputs
     (list java-testng))
    (home-page "https://samtools.github.io/htsjdk/")
    (synopsis "Java API for high-throughput sequencing data (HTS) formats")
    (description
     "HTSJDK is an implementation of a unified Java library for accessing
common file formats, such as SAM and VCF, used for high-throughput
sequencing (HTS) data.  There are also an number of useful utilities for
manipulating HTS data.")
    (license license:expat)))

(define-public java-htsjdk-latest
  (package
    (name "java-htsjdk")
    (version "2.14.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/samtools/htsjdk")
                    (commit version)))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "1lmya1fdjy03mz6zmdmd86j9v9vfhqb3952mqq075navx1i6g4bc"))))
    (build-system ant-build-system)
    (arguments
     `(#:tests? #f                      ; test require Scala
       #:jdk ,icedtea-8
       #:jar-name "htsjdk.jar"
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'remove-useless-build.xml
           (lambda _ (delete-file "build.xml") #t))
         ;; The tests require the scalatest package.
         (add-after 'unpack 'remove-tests
           (lambda _ (delete-file-recursively "src/test") #t)))))
    (inputs
     `(("java-ngs" ,java-ngs)
       ("java-snappy-1" ,java-snappy-1)
       ("java-commons-compress" ,java-commons-compress)
       ("java-commons-logging-minimal" ,java-commons-logging-minimal)
       ("java-commons-jexl-2" ,java-commons-jexl-2)
       ("java-xz" ,java-xz)))
    (native-inputs
     (list java-junit))
    (home-page "https://samtools.github.io/htsjdk/")
    (synopsis "Java API for high-throughput sequencing data (HTS) formats")
    (description
     "HTSJDK is an implementation of a unified Java library for accessing
common file formats, such as SAM and VCF, used for high-throughput
sequencing (HTS) data.  There are also an number of useful utilities for
manipulating HTS data.")
    (license license:expat)))

;; This is needed for picard 2.10.3
(define-public java-htsjdk-2.10.1
  (package (inherit java-htsjdk-latest)
    (name "java-htsjdk")
    (version "2.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/samtools/htsjdk")
                    (commit version)))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "1kxh7slm2pm3x9p6jxa1wqsq9a31dhiiflhxnxqcisan4k3rwia2"))))
    (build-system ant-build-system)
    (arguments
     `(#:tests? #f                      ; tests require Scala
       #:jdk ,icedtea-8
       #:jar-name "htsjdk.jar"
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'remove-useless-build.xml
           (lambda _ (delete-file "build.xml") #t))
         ;; The tests require the scalatest package.
         (add-after 'unpack 'remove-tests
           (lambda _ (delete-file-recursively "src/test") #t)))))))

(define-public java-maxent
  (package
    (name "java-maxent")
    (version "3.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mrmaxent/Maxent")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "12q7hhly76l77vm8w8v9icga2gn6xs0bw33a7wb7zikcmvizcyp0"))))
    (build-system ant-build-system)
    (arguments
     (list
      #:tests? #false                   ;there are none
      #:jdk icedtea-8
      #:phases
      #~(modify-phases %standard-phases
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              ;; See https://github.com/mrmaxent/Maxent/pull/11
              (substitute* "density/Extractor.java"
                (("float") "double"))
              (with-directory-excursion "gnu/getopt/"
                (invoke "make"))
              (mkdir-p "ptii")
              (with-directory-excursion "ptii"
                (invoke "tar" "xvf" (assoc-ref inputs "ptii")
                        "--strip-components=1")
                (copy-recursively "com" "../com"))
              (delete-file-recursively "ptii")
              (apply invoke "javac" "-cp" (getcwd) "-g"
                     (find-files "com/microstar/xml" "\\.java$"))
              (apply invoke "javac" "-cp" (getcwd) "-g"
                     (find-files "density" "\\.java$"))

              ;; This needs the proprietary com.sun.image.codec.jpeg module.
              (delete-file "ptolemy/plot/servlet/PlotServlet.java")
              (apply invoke "javac" "-cp"
                     (string-append (getcwd) ":" (getenv "CLASSPATH")) "-g"
                     (find-files "ptolemy/plot" "\\.java$"))
              (apply invoke "javac" "-cp" (getcwd) "-g"
                     (find-files "com" "\\.java$"))
              (apply invoke "javac" "-cp" (getcwd) "-g"
                     (find-files "gui" "\\.java$"))
              (apply invoke "jar" "cvfm" "maxent.jar"
                     (cons* "density/mc.mf"
                            "density/parameters.csv"
                            (append (find-files "density" "\\.class$")
                                    (find-files "density" "\\.html$")
                                    (find-files "gnu/getopt" ".*")
                                    (find-files "gui/layouts" "\\.class$")
                                    (find-files "com/macfaq/io" "\\.class$")
                                    (find-files "density/tools" "\\.class$")
                                    (find-files "ptolemy/plot" "\\.class$"))))))
          (replace 'install
            (lambda _
              (install-file "maxent.jar"
                            (string-append #$output "/share/java/maxent/")))))))
    (inputs
     (list java-classpathx-servletapi))
    (native-inputs
     `(("make" ,gnu-make)
       ;; For com.microstar.xml
       ("ptii"
        ,(let ((version "4.0.1"))
           (origin
             (method url-fetch)
             (uri (string-append "https://ptolemy.berkeley.edu/ptolemyII/ptII"
                                 (version-major+minor version)
                                 "/ptII" version ".src.tar.gz"))
             (sha256
              (base32
               "0ifmmvrcipcnd4b9im1g379ffrs7g7k99sw5vv9d9h3hzq6hqv21")))))))
    (home-page "http://biodiversityinformatics.amnh.org/open_source/maxent")
    (synopsis "Model species geographic distributions")
    (description
     "Maxent is a stand-alone Java application for modelling species
geographic distributions.")
    (license license:expat)))

;; This version matches java-htsjdk 2.3.0.  Later versions also require a more
;; recent version of java-htsjdk, which depends on gradle.
(define-public java-picard
  (package
    (name "java-picard")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/broadinstitute/picard")
                    (commit version)))
              (file-name (string-append "java-picard-" version "-checkout"))
              (sha256
               (base32
                "1ll7mf4r3by92w2nhlmpa591xd1f46xlkwh59mq6fvbb5pdwzvx6"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Delete pre-built binaries.
                  (delete-file-recursively "lib")
                  (mkdir-p "lib")
                  (substitute* "build.xml"
                    ;; Remove build-time dependency on git.
                    (("failifexecutionfails=\"true\"")
                     "failifexecutionfails=\"false\"")
                    ;; Use our htsjdk.
                    (("depends=\"compile-htsjdk, ")
                     "depends=\"")
                    (("depends=\"compile-htsjdk-tests, ")
                     "depends=\"")
                    ;; Build picard-lib.jar before building picard.jar
                    (("name=\"picard-jar\" depends=\"" line)
                     (string-append line "picard-lib-jar, ")))
                  #t))))
    (build-system ant-build-system)
    (arguments
     `(#:build-target "picard-jar"
       #:test-target "test"
       ;; Tests require jacoco:coverage.
       #:tests? #f
       #:make-flags
       ,#~(list (string-append "-Dhtsjdk_lib_dir="
                               #$(this-package-input "java-htsjdk")
                               "/share/java/htsjdk/")
                "-Dhtsjdk-classes=dist/tmp"
                (string-append "-Dhtsjdk-version="
                               #$(package-version java-htsjdk)))
       #:jdk ,icedtea-8
       #:phases
       (modify-phases %standard-phases
         ;; FIXME: this phase fails with "duplicate entry: htsjdk/samtools/AbstractBAMFileIndex$1.class"
         (delete 'generate-jar-indices)
         (add-after 'unpack 'use-our-htsjdk
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "build.xml"
               (("\\$\\{htsjdk\\}/lib")
                (search-input-directory inputs
                                        "share/java/htsjdk")))))
         (add-after 'unpack 'make-test-target-independent
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "build.xml"
               (("name=\"test\" depends=\"compile, ")
                "name=\"test\" depends=\""))
             #t))
         (replace 'install (install-jars "dist")))))
    (inputs
     (list java-htsjdk java-guava))
    (native-inputs
     (list java-testng))
    (home-page "https://broadinstitute.github.io/picard/")
    (synopsis "Tools for manipulating high-throughput sequencing data and formats")
    (description "Picard is a set of Java command line tools for manipulating
high-throughput sequencing (HTS) data and formats.  Picard is implemented
using the HTSJDK Java library to support accessing file formats that are
commonly used for high-throughput sequencing data such as SAM, BAM, CRAM and
VCF.")
    (license license:expat)))

;; This is needed for dropseq-tools
(define-public java-picard-2.10.3
  (package
    (name "java-picard")
    (version "2.10.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/broadinstitute/picard")
                    (commit version)))
              (file-name (string-append "java-picard-" version "-checkout"))
              (sha256
               (base32
                "1ajlx31l6i1k3y2rhnmgq07sz99g2czqfqgkr9mihmdjp3gwjhvi"))))
    (build-system ant-build-system)
    (arguments
     `(#:jar-name "picard.jar"
       ;; Tests require jacoco:coverage.
       #:tests? #f
       #:jdk ,icedtea-8
       #:main-class "picard.cmdline.PicardCommandLine"
       #:modules ((guix build ant-build-system)
                  (guix build utils)
                  (guix build java-utils)
                  (sxml simple)
                  (sxml transform)
                  (sxml xpath))
       #:phases
       (modify-phases %standard-phases
         ;; FIXME: this phase fails with "duplicate entry: htsjdk/samtools/AbstractBAMFileIndex$1.class"
         (delete 'generate-jar-indices)
         (add-after 'unpack 'remove-useless-build.xml
           (lambda _ (delete-file "build.xml") #t))
         ;; This is necessary to ensure that htsjdk is found when using
         ;; picard.jar as an executable.
         (add-before 'build 'edit-classpath-in-manifest
           (lambda* (#:key inputs #:allow-other-keys)
             (chmod "build.xml" #o664)
             (call-with-output-file "build.xml.new"
               (lambda (port)
                 (sxml->xml
                  (pre-post-order
                   (with-input-from-file "build.xml"
                     (lambda _ (xml->sxml #:trim-whitespace? #t)))
                   `((target    . ,(lambda (tag . kids)
                                     (let ((name ((sxpath '(name *text*))
                                                  (car kids)))
                                           ;; FIXME: We're breaking the line
                                           ;; early with a dummy path to
                                           ;; ensure that the store reference
                                           ;; isn't broken apart and can still
                                           ;; be found by the reference
                                           ;; scanner.
                                           (msg (format #f
                                                        "\
Class-Path: /~a \
 ~a/share/java/htsjdk.jar${line.separator}${line.separator}"
                                                        ;; maximum line length is 70
                                                        (string-tabulate (const #\b) 57)
                                                        (assoc-ref inputs "java-htsjdk"))))
                                       (if (member "manifest" name)
                                           `(,tag ,@kids
                                                  (replaceregexp
                                                   (@ (file "${manifest.file}")
                                                      (match "\\r\\n\\r\\n")
                                                      (replace "${line.separator}")))
                                                  (echo
                                                   (@ (message ,msg)
                                                      (file "${manifest.file}")
                                                      (append "true"))))
                                           `(,tag ,@kids)))))
                     (*default* . ,(lambda (tag . kids) `(,tag ,@kids)))
                     (*text*    . ,(lambda (_ txt) txt))))
                  port)))
             (rename-file "build.xml.new" "build.xml")
             #t)))))
    (propagated-inputs
     (list java-htsjdk-2.10.1))
    (native-inputs
     (list java-testng java-guava))
    (home-page "https://broadinstitute.github.io/picard/")
    (synopsis "Tools for manipulating high-throughput sequencing data and formats")
    (description "Picard is a set of Java command line tools for manipulating
high-throughput sequencing (HTS) data and formats.  Picard is implemented
using the HTSJDK Java library to support accessing file formats that are
commonly used for high-throughput sequencing data such as SAM, BAM, CRAM and
VCF.")
    (license license:expat)))

;; This is the last version of Picard to provide net.sf.samtools
(define-public java-picard-1.113
  (package (inherit java-picard)
    (name "java-picard")
    (version "1.113")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/broadinstitute/picard")
                    (commit version)))
              (file-name (string-append "java-picard-" version "-checkout"))
              (sha256
               (base32
                "0lkpvin2fz3hhly4l02kk56fqy8lmlgyzr9kmvljk6ry6l1hw973"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Delete pre-built binaries.
                  (delete-file-recursively "lib")
                  (mkdir-p "lib")))))
    (build-system ant-build-system)
    (arguments
     `(#:build-target "picard-jar"
       #:test-target "test"
       ;; FIXME: the class path at test time is wrong.
       ;; [testng] Error: A JNI error has occurred, please check your installation and try again
       ;; [testng] Exception in thread "main" java.lang.NoClassDefFoundError: com/beust/jcommander/ParameterException
       #:tests? #f
       #:jdk ,icedtea-8
       #:ant ,ant/java8
       ;; This is only used for tests.
       #:make-flags
       (list "-Dsamjdk.intel_deflater_so_path=lib/jni/libIntelDeflater.so")
       #:phases
       (modify-phases %standard-phases
         ;; FIXME: This phase fails.
         (delete 'generate-jar-indices)
         ;; Do not use bundled ant bzip2.
         (add-after 'unpack 'use-ant-bzip
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "build.xml"
               (("\\$\\{lib\\}/apache-ant-1.8.2-bzip2.jar")
                (search-input-file inputs "/lib/ant.jar")))))
         (add-after 'unpack 'make-test-target-independent
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "build.xml"
               (("name=\"test\" depends=\"compile, ")
                "name=\"test\" depends=\"compile-tests, ")
               (("name=\"compile\" depends=\"compile-src, compile-tests\"")
                "name=\"compile\" depends=\"compile-src\""))))
         (add-after 'unpack 'fix-deflater-path
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "src/java/net/sf/samtools/Defaults.java"
               (("getStringProperty\\(\"intel_deflater_so_path\", null\\)")
                (string-append "getStringProperty(\"intel_deflater_so_path\", \""
                               (assoc-ref outputs "out")
                               "/lib/jni/libIntelDeflater.so"
                               "\")")))))
         ;; Build the deflater library, because we've previously deleted the
         ;; pre-built one.  This can only be built with access to the JDK
         ;; sources.
         (add-after 'build 'build-jni
           (lambda* (#:key inputs #:allow-other-keys)
             (mkdir-p "lib/jni")
             (mkdir-p "jdk-src")
             (invoke "tar" "--strip-components=1" "-C" "jdk-src"
                     "-xf" (assoc-ref inputs "jdk-src"))
             (invoke "javah" "-jni"
                     "-classpath" "classes"
                     "-d" "lib/"
                     "net.sf.samtools.util.zip.IntelDeflater")
             (with-directory-excursion "src/c/inteldeflater"
               (invoke "gcc" "-I../../../lib" "-I."
                       (string-append "-I" (assoc-ref inputs "jdk")
                                      "/include/linux")
                       "-I../../../jdk-src/src/share/native/common/"
                       "-I../../../jdk-src/src/solaris/native/common/"
                       "-c" "-O3" "-fPIC" "IntelDeflater.c")
               (invoke "gcc" "-shared"
                       "-o" "../../../lib/jni/libIntelDeflater.so"
                       "IntelDeflater.o" "-lz" "-lstdc++"))))
         ;; We can only build everything else after building the JNI library.
         (add-after 'build-jni 'build-rest
           (lambda* (#:key make-flags #:allow-other-keys)
             (apply invoke `("ant" "all" ,@make-flags))))
         (add-before 'build 'set-JAVA6_HOME
           (lambda _
             (setenv "JAVA6_HOME" (getenv "JAVA_HOME"))))
         (replace 'install (install-jars "dist"))
         (add-after 'install 'install-jni-lib
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((jni (string-append (assoc-ref outputs "out")
                                       "/lib/jni")))
               (mkdir-p jni)
               (install-file "lib/jni/libIntelDeflater.so" jni)))))))
    (inputs
     (list java-snappy-1
           java-commons-jexl-2
           java-cofoja
           ant/java8                    ;for bzip2 support at runtime
           zlib))
    (native-inputs
     `(("ant-apache-bcel" ,ant-apache-bcel)
       ("ant-junit" ,ant-junit)
       ("java-testng" ,java-testng)
       ("java-commons-bcel" ,java-commons-bcel)
       ("java-jcommander" ,java-jcommander)
       ("jdk" ,icedtea-8 "jdk")
       ("jdk-src" ,(car (assoc-ref (package-native-inputs icedtea-8) "jdk-drop")))))))

(define-public fastqc
  (package
    (name "fastqc")
    (version "0.11.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/s-andrews/FastQC")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "00y9drm0bkpxw8xfl8ysss18jmnhj8blgqgr6fpa58rkpfcbg8qk"))
       (snippet
        '(for-each delete-file
                   '("cisd-jhdf5.jar"
                     "sam-1.103.jar"
                     "jbzip2-0.9.jar")))))
    (build-system ant-build-system)
    (arguments
     (list
      #:tests? #f                       ;there are no tests
      #:build-target "build"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-dependencies
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* '("build.xml" ".classpath")
                (("jbzip2-0.9.jar")
                 (search-input-file inputs "/share/java/jbzip2.jar"))
                (("sam-1.103.jar")
                 (search-input-file inputs "/share/java/sam-1.112.jar"))
                (("cisd-jhdf5.jar")
                 (search-input-file inputs "/share/java/sis-jhdf5.jar")))))
          ;; There is no installation target
          (replace 'install
            (lambda* (#:key inputs #:allow-other-keys)
              (let* ((bin   (string-append #$output "/bin"))
                     (share (string-append #$output "/share/fastqc/"))
                     (exe   (string-append share "/fastqc")))
                (for-each mkdir-p (list bin share))
                (copy-recursively "bin" share)
                (substitute* exe
                  (("my \\$java_bin = \"java\";")
                   (string-append "my $java_bin = \""
                                  ;; Use java from the JRE, not the JDK
                                  #$(this-package-input "icedtea") "/bin/java"
                                  "\";"))
                  (("\\$RealBin\\$delimiter\\$RealBin.*")
                   (string-append
                    (string-join
                     (list
                      share
                      (search-input-file inputs "/share/java/sam-1.112.jar")
                      (search-input-file inputs "/share/java/jbzip2.jar")
                      (search-input-file inputs "/share/java/sis-jhdf5.jar"))
                     "$delimiter")
                    "\";\n")))
                (chmod exe #o555)
                (symlink exe (string-append bin "/fastqc"))))))))
    (inputs
     (list icedtea
           java-cisd-jhdf5
           java-picard-1.113
           java-jbzip2
           perl))                       ;needed for the wrapper script
    (native-inputs
     (list unzip))
    (home-page "https://www.bioinformatics.babraham.ac.uk/projects/fastqc/")
    (synopsis "Quality control tool for high throughput sequence data")
    (description
     "FastQC aims to provide a simple way to do some quality control
checks on raw sequence data coming from high throughput sequencing
pipelines.  It provides a modular set of analyses which you can use to
give a quick impression of whether your data has any problems of which
you should be aware before doing any further analysis.

The main functions of FastQC are:

@itemize
@item Import of data from BAM, SAM or FastQ files (any variant);
@item Providing a quick overview to tell you in which areas there may
  be problems;
@item Summary graphs and tables to quickly assess your data;
@item Export of results to an HTML based permanent report;
@item Offline operation to allow automated generation of reports
  without running the interactive application.
@end itemize\n")
    (license license:gpl3+)))

(define-public fastp
  (package
    (name "fastp")
    (version "0.23.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenGene/fastp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "04nmrqpjc3qni0cbazlwvpg8rk1mkfmfma0n4q3zivs3zi6rfnav"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #false                   ;there are none
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-before 'install 'create-target-dir
            (lambda _
              (mkdir-p (string-append #$output "/bin")))))))
    (inputs
     (list isa-l libdeflate))
    (home-page "https://github.com/OpenGene/fastp/")
    (synopsis "All-in-one FastQ preprocessor")
    (description
     "Fastp is a tool designed to provide fast all-in-one preprocessing for
FastQ files.  This tool has multi-threading support to afford high
performance.")
    (license license:expat)))

(define-public htscodecs
  (package
    (name "htscodecs")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/samtools/htscodecs/"
                                  "releases/download/v"
                                  version "/htscodecs-" version ".tar.gz"))
              (sha256
               (base32
                "1cys6hp438m1rfmgq6xig3q0md7nh0m03jb17mc798q13lsggpil"))))
    (build-system gnu-build-system)
    (inputs (list bzip2 zlib))
    (home-page "https://github.com/samtools/htscodecs")
    (synopsis "Custom compression for CRAM and others")
    (description
     "This package implements the custom CRAM codecs used for \"EXTERNAL\"
block types.  These consist of two variants of the rANS codec (8-bit and
16-bit renormalisation, with run-length encoding and bit-packing also
supported in the latter), a dynamic arithmetic coder, and custom codecs for
name/ID compression and quality score compression derived from fqzcomp.")
    (license
     (list license:public-domain ;c_range_coder.h, rANS_byte.h, and rANS_word.h
           license:bsd-3))))     ;all the rest

(define-public htslib
  (package
    (name "htslib")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samtools/htslib/releases/download/"
                    version "/htslib-" version ".tar.bz2"))
              (sha256
               (base32
                "093r1n4s134k50m9a925yn95gyi90ps5dlgc6gq4qwvkzxx7qsv0"))))
    (build-system gnu-build-system)
    ;; Let htslib translate "gs://" and "s3://" to regular https links with
    ;; "--enable-gcs" and "--enable-s3". For these options to work, we also
    ;; need to set "--enable-libcurl".
    (arguments
     `(#:configure-flags '("--enable-gcs"
                           "--enable-libcurl"
                           "--enable-s3")))
    (inputs
     (list bzip2 curl openssl xz))
    ;; This is referred to in the pkg-config file as a required library.
    (propagated-inputs
     (list zlib))
    (native-inputs
     (list perl))
    (home-page "https://www.htslib.org")
    (synopsis "C library for reading/writing high-throughput sequencing data")
    (description
     "HTSlib is a C library for reading/writing high-throughput sequencing
data.  It also provides the @command{bgzip}, @command{htsfile}, and
@command{tabix} utilities.")
    ;; Files under cram/ are released under the modified BSD license;
    ;; the rest is released under the Expat license
    (license (list license:expat license:bsd-3))))

(define-public htslib-1.14
  (package/inherit htslib
    (version "1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samtools/htslib/releases/download/"
                    version "/htslib-" version ".tar.bz2"))
              (sha256
               (base32
                "0pwk8yhhvb85mi1d2qhwsb4samc3rmbcrq7b1s0jz0glaa7in8pd"))))))

(define-public htslib-1.12
  (package/inherit htslib
    (version "1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samtools/htslib/releases/download/"
                    version "/htslib-" version ".tar.bz2"))
              (sha256
               (base32
                "1jplnvizgr0fyyvvmkfmnsywrrpqhid3760vw15bllz98qdi9012"))))))

(define-public htslib-1.10
  (package/inherit htslib
    (version "1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samtools/htslib/releases/download/"
                    version "/htslib-" version ".tar.bz2"))
              (sha256
               (base32
                "0wm9ay7qgypj3mwx9zl1mrpnr36298b1aj5vx69l4k7bzbclvr3s"))))))

(define-public htslib-1.9
  (package/inherit htslib
    (version "1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samtools/htslib/releases/download/"
                    version "/htslib-" version ".tar.bz2"))
              (sha256
               (base32
                "16ljv43sc3fxmv63w7b2ff8m1s7h89xhazwmbm1bicz8axq8fjz0"))))))

;; This package should be removed once no packages rely upon it.
(define htslib-1.3
  (package/inherit htslib
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samtools/htslib/releases/download/"
                    version "/htslib-" version ".tar.bz2"))
              (sha256
               (base32
                "1rja282fwdc25ql6izkhdyh8ppw8x2fs0w0js78zgkmqjlikmma9"))))))

(define htslib-for-samtools-1.2
  (package/inherit htslib
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/samtools/htslib/releases/download/"
                    version "/htslib-" version ".tar.bz2"))
              (sha256
               (base32
                "1c32ssscbnjwfw3dra140fq7riarp2x990qxybh34nr1p5r17nxx"))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-tests
           (lambda _
             (substitute* "test/test.pl"
               (("/bin/bash") (which "bash"))))))))
    (inputs
     `(("zlib" ,zlib)))
    (native-inputs
     `(("perl" ,perl)))))

(define htslib-for-stringtie
  (package
    (inherit htslib-1.12)
    (source (origin
              (inherit (package-source htslib-1.12))
              (patches
               (search-patches "htslib-for-stringtie.patch"))))
    (arguments
     `(#:configure-flags '("--with-libdeflate")))
    (inputs
     (list bzip2 libdeflate openssl))))

(define-public idr
  (package
    (name "idr")
    (version "2.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nboley/idr")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "04j876h6z444v2q79drxx283d3k5snd72kj895wbalnl42206x9g"))
              ;; Delete generated C code.
              (snippet
               '(begin (delete-file "idr/inv_cdf.c") #t))))
    (build-system python-build-system)
    ;; There is only one test ("test_inv_cdf.py") and it tests features that
    ;; are no longer part of this package.  It also asserts False, which
    ;; causes the tests to always fail.
    (arguments `(#:tests? #f))
    (propagated-inputs
     (list python-scipy python-sympy python-numpy python-matplotlib))
    (native-inputs
     (list python-cython))
    (home-page "https://github.com/nboley/idr")
    (synopsis "Tool to measure the irreproducible discovery rate (IDR)")
    (description
     "The IDR (Irreproducible Discovery Rate) framework is a unified approach
to measure the reproducibility of findings identified from replicate
experiments and provide highly stable thresholds based on reproducibility.")
    (license license:gpl2+)))

(define-public jellyfish
  (package
    (name "jellyfish")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gmarcais/Jellyfish/"
                                  "releases/download/v" version
                                  "/jellyfish-" version ".tar.gz"))
              (sha256
               (base32
                "0npa62wzasdibas5zp3n8j3armsci4kyvh0jw7jr0am4gg7vg5g1"))))
    (build-system gnu-build-system)
    (outputs '("out"      ;for library
               "python")) ;for Python bindings
    (arguments
     (list
      #:configure-flags
      #~(list "--without-sse" ; configure script probes for CPU features when SSE is enabled.
              (string-append "--enable-python-binding=" #$output:python))
      #:phases
      '(modify-phases %standard-phases
         (add-before 'check 'set-SHELL-variable
           (lambda _
             ;; generator_manager.hpp either uses /bin/sh or $SHELL
             ;; to run tests.
             (setenv "SHELL" (which "bash")))))))
    (native-inputs
     (list bc
           time
           python-wrapper
           pkg-config))
    (inputs
     (list htslib))
    (synopsis "Tool for fast counting of k-mers in DNA")
    (description
     "Jellyfish is a tool for fast, memory-efficient counting of k-mers in
DNA.  A k-mer is a substring of length k, and counting the occurrences of all
such substrings is a central step in many analyses of DNA sequence.  Jellyfish
is a command-line program that reads FASTA and multi-FASTA files containing
DNA sequences.  It outputs its k-mer counts in a binary format, which can be
translated into a human-readable text format using the @code{jellyfish dump}
command, or queried for specific k-mers with @code{jellyfish query}.")
    (home-page "http://www.genome.umd.edu/jellyfish.html")
    ;; JELLYFISH seems to be 64-bit only.
    (supported-systems '("x86_64-linux" "aarch64-linux" "mips64el-linux"))
    ;; One of these licenses may be picked
    (license (list license:gpl3+ license:bsd-3))))

(define-public khmer
  (package
    (name "khmer")
    (version "3.0.0a3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dib-lab/khmer")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "01l4jczglkl7yfhgvzx8j0df7k54bk1r8sli9ll16i1mis0d8f37"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Delete bundled libraries.  We do not replace the bundled seqan
           ;; as it is a modified subset of the old version 1.4.1.
           ;;
           ;; We do not replace the bundled MurmurHash as the canonical
           ;; repository for this code 'SMHasher' is unsuitable for providing
           ;; a library.  See
           ;; https://lists.gnu.org/archive/html/guix-devel/2016-06/msg00977.html
           (delete-file-recursively "third-party/zlib")
           (delete-file-recursively "third-party/bzip2")
           (delete-file-recursively "third-party/seqan")
           (substitute* "setup.cfg"
             (("# libraries = z,bz2")
              "libraries = z,bz2")
             (("include:third-party/zlib:third-party/bzip2")
              "include:"))
           ;; Delete generated Cython CPP files.
           (for-each delete-file (find-files "khmer/_oxli/" "\\.cpp$"))))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-cc
           (lambda _ (setenv "CC" "gcc")))
         (add-after 'unpack 'python-3.8-compatibility
           (lambda _
             ;; Python 3.8 removed time.clock().
             (substitute* "sandbox/sweep-reads.py"
               (("time\\.clock")
                "time.process_time"))))
         (add-after 'unpack 'do-use-cython
           (lambda _
             (substitute* "setup.py"
               (("from setuptools import Extension as CyExtension")
                "from Cython.Distutils import Extension as CyExtension")
               (("from setuptools.command.build_ext import build_ext as _build_ext")
                "from Cython.Distutils import build_ext as _build_ext")
               (("HAS_CYTHON = False") "HAS_CYTHON = True")
               (("cy_ext = 'cpp'") "cy_ext = 'pyx'"))))
         (add-before 'build 'build-extensions
           (lambda _
             ;; Cython extensions have to be built before running the tests.
             (invoke "python" "setup.py" "build_ext" "--inplace")))
         (replace 'check
           (lambda* (#:key tests? inputs outputs #:allow-other-keys)
             (when tests?
               (add-installed-pythonpath inputs outputs)
               (invoke "pytest" "-v")))))))
    (native-inputs
     (list python-cython python-pytest python-pytest-runner))
    (inputs
     (list zlib bzip2 seqan-1 python-screed python-bz2file))
    (home-page "https://khmer.readthedocs.org/")
    (synopsis "K-mer counting, filtering and graph traversal library")
    (description "The khmer software is a set of command-line tools for
working with DNA shotgun sequencing data from genomes, transcriptomes,
metagenomes and single cells.  Khmer can make de novo assemblies faster, and
sometimes better.  Khmer can also identify and fix problems with shotgun
data.")
    ;; When building on i686, armhf and mips64el, we get the following error:
    ;; error: ['khmer', 'khmer.tests', 'oxli'] require 64-bit operating system
    (supported-systems '("x86_64-linux" "aarch64-linux"))
    (license license:bsd-3)))

(define-public kaiju
  (package
    (name "kaiju")
    (version "1.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bioinformatics-centre/kaiju")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1hfmadkfs6jjd7l3byly5xxb0ifm3dm1wis11sjbqfcv6l89snmg"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ; There are no tests.
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-before 'build 'move-to-src-dir
            (lambda _ (chdir "src")))
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (copy-recursively "../bin" bin)
                (let ((path (search-path-as-list '("bin")
                                                 '#$(match (package-inputs this-package)
                                                      (((_ pkg) ...) pkg)))))
                  (for-each (lambda (script)
                              (let ((exe (string-append bin "/" script)))
                                (chmod exe #o555)
                                (wrap-script exe
                                  #:guile #$(file-append guile-3.0 "/bin/guile")
                                  `("PATH" ":" prefix ,path))))
                            (list "kaiju-convertMAR.py"
                                  "kaiju-gbk2faa.pl"
                                  "kaiju-makedb")))))))))
    (inputs
     (list bzip2
           coreutils
           curl
           gawk
           guile-3.0 ;for wrap-script
           gzip
           perl
           python-wrapper
           tar
           wget
           zlib))
    (home-page "https://kaiju.binf.ku.dk/")
    (synopsis "Fast and sensitive taxonomic classification for metagenomics")
    (description "Kaiju is a program for sensitive taxonomic classification
of high-throughput sequencing reads from metagenomic whole genome sequencing
experiments.")
    (license license:gpl3+)))

(define-public macs
  (package
    (name "macs")
    (version "2.2.7.1")
    (source (origin
              ;; The PyPi tarball does not contain tests.
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/macs3-project/MACS")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "08zsgh65xbpv1md2s3wqmrk9g2mz6izmn59ryw5lbac54120p291"))
        (modules '((guix build utils)))
        ;; Remove files generated by Cython
        (snippet
         '(begin
            (for-each (lambda (file)
                        (let ((generated-file
                                (string-append (string-drop-right file 3) "c")))
                          (when (file-exists? generated-file)
                            (delete-file generated-file))))
                      (find-files "." "\\.pyx$"))
            (delete-file "MACS2/IO/CallPeakUnitPrecompiled.c")
            ;; Python 3.10 is in fact more recent than 3.6.
            (substitute* "setup.py"
              (("float\\(sys.version\\[:3\\]\\)<3.6") "False"))))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-HOME
           (lambda _ (setenv "HOME" "/tmp")))
         (replace 'check
           (lambda* (#:key tests? inputs outputs #:allow-other-keys)
             (when tests?
               (add-installed-pythonpath inputs outputs)
               (invoke "pytest" "-v")))))))
    (inputs
     (list python-numpy))
    (native-inputs
     (list python-cython python-pytest))
    (home-page "https://github.com/macs3-project/MACS")
    (synopsis "Model based analysis for ChIP-Seq data")
    (description
     "MACS is an implementation of a ChIP-Seq analysis algorithm for
identifying transcript factor binding sites named Model-based Analysis of
ChIP-Seq (MACS).  MACS captures the influence of genome complexity to evaluate
the significance of enriched ChIP regions and it improves the spatial
resolution of binding sites through combining the information of both
sequencing tag position and orientation.")
    (license license:bsd-3)))

(define-public maffilter
  (package
    (name "maffilter")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jydu/maffilter")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "196c16qw82niqqyzi7j1ga1n0zmir73bm26kg04m0i5aq2cpa0ml"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #false)) ;there are none
    (inputs
     (list boost
           bpp-core
           bpp-phyl
           bpp-phyl-omics
           bpp-seq
           bpp-seq-omics
           zlib))
    (home-page "https://jydu.github.io/maffilter/")
    (synopsis "Multiple alignment format file processor")
    (description
     "MafFilter is a program dedicated to the analysis of genome alignments.
It parses and manipulates @acronym{MAF, multiple alignment format} files as
well as more simple fasta files.  This package can be used to design a
pipeline as a series of consecutive filters, each performing a dedicated
analysis.  Many of the filters are available, from alignment cleaning to
phylogeny reconstruction and population genetics analysis.  Despite various
filtering options and format conversion tools, MafFilter can compute a wide
range of statistics (phylogenetic trees, nucleotide diversity, inferrence of
selection, etc.).")
    (license license:gpl3+)))

(define-public mafft
  (package
    (name "mafft")
    (version "7.475")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://mafft.cbrc.jp/alignment/software/mafft-" version
                    "-without-extensions-src.tgz"))
              (file-name (string-append name "-" version ".tgz"))
              (sha256
               (base32
                "0i2i2m3blh2xkbkdk48hxfssks30ny0v381gdl7zwhcvp0axs26r"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; no automated tests, though there are tests in the read me
       #:make-flags ,#~(list (string-append "PREFIX=" #$output)
                             (string-append "BINDIR="
                                            (string-append #$output "/bin")))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'enter-dir
           (lambda _ (chdir "core") #t))
         (add-after 'enter-dir 'patch-makefile
           (lambda _
             ;; on advice from the MAFFT authors, there is no need to
             ;; distribute mafft-profile, mafft-distance, or
             ;; mafft-homologs.rb as they are too "specialised".
             (substitute* "Makefile"
               ;; remove mafft-homologs.rb from SCRIPTS
               (("^SCRIPTS = mafft mafft-homologs.rb")
                "SCRIPTS = mafft")
               ;; remove mafft-homologs from MANPAGES
               (("^MANPAGES = mafft.1 mafft-homologs.1")
                "MANPAGES = mafft.1")
               ;; remove mafft-distance from PROGS
               (("^PROGS = dvtditr dndfast7 dndblast sextet5 mafft-distance")
                "PROGS = dvtditr dndfast7 dndblast sextet5")
               ;; remove mafft-profile from PROGS
               (("splittbfast disttbfast tbfast mafft-profile 2cl mccaskillwrap")
                "splittbfast disttbfast tbfast f2cl mccaskillwrap")
               (("^rm -f mafft-profile mafft-profile.exe") "#")
               (("^rm -f mafft-distance mafft-distance.exe") ")#")
               ;; do not install MAN pages in libexec folder
               (("^\t\\$\\(INSTALL\\) -m 644 \\$\\(MANPAGES\\) \
\\$\\(DESTDIR\\)\\$\\(LIBDIR\\)") "#"))
             #t))
         (add-after 'enter-dir 'patch-paths
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* '("pairash.c"
                            "mafft.tmpl")
               (("perl") (which "perl"))
               (("([\"`| ])awk" _ prefix)
                (string-append prefix (which "awk")))
               (("grep") (which "grep")))
             #t))
         (delete 'configure)
         (add-after 'install 'wrap-programs
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (path (string-append
                           (assoc-ref inputs "coreutils") "/bin:")))
               (for-each (lambda (file)
                           (wrap-program file
                             `("PATH" ":" prefix (,path))))
                         (find-files bin))))))))
    (inputs
     (list perl ruby gawk grep coreutils))
    (home-page "https://mafft.cbrc.jp/alignment/software/")
    (synopsis "Multiple sequence alignment program")
    (description
     "MAFFT offers a range of multiple alignment methods for nucleotide and
protein sequences.  For instance, it offers L-INS-i (accurate; for alignment
of <~200 sequences) and FFT-NS-2 (fast; for alignment of <~30,000
sequences).")
    (license (license:non-copyleft
              "https://mafft.cbrc.jp/alignment/software/license.txt"
              "BSD-3 with different formatting"))))

(define-public mash
  (package
    (name "mash")
    (version "2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/marbl/mash")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "049hwcc059p2fd9vwndn63laifvvsi0wmv84i6y1fr79k15dxwy6"))
              (modules '((guix build utils)))
              (snippet
               ;; Delete bundled kseq.
               ;; TODO: Also delete bundled murmurhash and open bloom filter.
               '(delete-file "src/mash/kseq.h"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; No tests.
       #:configure-flags
       ,#~(list
           (string-append "--with-capnp=" #$(this-package-input "capnproto"))
           (string-append "--with-gsl=" #$(this-package-input "gsl")))
       #:make-flags (list "CC=gcc")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-includes
           (lambda _
             (substitute* '("src/mash/Sketch.cpp"
                            "src/mash/CommandFind.cpp"
                            "src/mash/CommandScreen.cpp")
               (("^#include \"kseq\\.h\"")
                "#include \"htslib/kseq.h\""))
             #t))
         (add-after 'fix-includes 'use-c++14
           (lambda _
             ;; capnproto 0.7 requires c++14 to build
             (substitute* "configure.ac"
               (("c\\+\\+11") "c++14"))
             (substitute* "Makefile.in"
               (("c\\+\\+11") "c++14"))
             #t)))))
    (native-inputs
     (list autoconf))
    (inputs
     (list ;; Capnproto and htslib are statically embedded in the final
           ;; application. Therefore we also list their licenses, below.
           capnproto
           htslib
           gsl
           zlib))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mash.readthedocs.io")
    (synopsis "Fast genome and metagenome distance estimation using MinHash")
    (description "Mash is a fast sequence distance estimator that uses the
MinHash algorithm and is designed to work with genomes and metagenomes in the
form of assemblies or reads.")
    (license (list license:bsd-3          ; Mash
                   license:expat          ; HTSlib and capnproto
                   license:public-domain  ; MurmurHash 3
                   license:cpl1.0))))     ; Open Bloom Filter

(define-public metabat
  (package
    (name "metabat")
    (version "2.15")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://bitbucket.org/berkeleylab/metabat.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0v3gsps0ypani14102z2y1a2wignhpf7s1h45mxmj5f783rkhqd9"))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags
       ,#~(list (string-append "-Dzlib_LIB=" #$(this-package-input "zlib")
                               "/lib/libz.so")
                (string-append "-Dhtslib_LIB=" #$(this-package-input "htslib")
                               "/lib/libhts.so")
                (string-append "-DBOOST_ROOT=" #$(this-package-input "boost")))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'configure-version-file
           (lambda _
             (copy-file "metabat_version.h.in" "metabat_version.h")
             (substitute* "metabat_version.h"
               (("@_time_stamp@") "19700101")
               (("@GIT_IS_DIRTY@") "0")
               (("@GIT_RETRIEVED_STATE@") "0")
               (("@GIT_HEAD_SHA1@") (string-append "v" ,version)))))
         (add-after 'unpack 'do-not-use-bundled-libraries
           (lambda _
             (substitute* "CMakeLists.txt"
               (("include\\(cmake.*") ""))
             (substitute* "src/CMakeLists.txt"
               (("set\\(Boost.*") "")
               (("add_dependencies.*") "")))))))
    (inputs
     (list zlib perl samtools htslib boost))
    (home-page "https://bitbucket.org/berkeleylab/metabat")
    (synopsis
     "Reconstruction of single genomes from complex microbial communities")
    (description
     "Grouping large genomic fragments assembled from shotgun metagenomic
sequences to deconvolute complex microbial communities, or metagenome binning,
enables the study of individual organisms and their interactions.  MetaBAT is
an automated metagenome binning software, which integrates empirical
probabilistic distances of genome abundance and tetranucleotide frequency.")
    ;; The source code contains inline assembly.
    (supported-systems '("x86_64-linux" "i686-linux"))
    (license (license:non-copyleft "file://license.txt"
                                   "See license.txt in the distribution."))))

(define-public minced
  (package
    (name "minced")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ctSkennerton/minced")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1f5h9him0gd355cnx7p6pnxpknhckd4g0v62mg8zyhfbx9as25fv"))))
    (build-system gnu-build-system)
    (arguments
     `(#:test-target "test"
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-before 'check 'fix-test
           (lambda _
             ;; Fix test for latest version.
             (substitute* "t/Aquifex_aeolicus_VF5.expected"
               (("minced:0.1.6") "minced:0.2.0"))
             #t))
         (replace 'install ; No install target.
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (wrapper (string-append bin "/minced")))
               ;; Minced comes with a wrapper script that tries to figure out where
               ;; it is located before running the JAR. Since these paths are known
               ;; to us, we build our own wrapper to avoid coreutils dependency.
               (install-file "minced.jar" bin)
               (with-output-to-file wrapper
                 (lambda _
                   (display
                    (string-append
                     "#!" (assoc-ref inputs "bash") "/bin/sh\n\n"
                     (assoc-ref inputs "jre") "/bin/java -jar "
                     bin "/minced.jar \"$@\"\n"))))
               (chmod wrapper #o555))
             #t)))))
    (native-inputs
     `(("jdk" ,icedtea "jdk")))
    (inputs
     `(("bash" ,bash)
       ("jre" ,icedtea "out")))
    (home-page "https://github.com/ctSkennerton/minced")
    (synopsis "Mining CRISPRs in Environmental Datasets")
    (description
     "MinCED is a program to find Clustered Regularly Interspaced Short
Palindromic Repeats (CRISPRs) in DNA sequences.  It can be used for
unassembled metagenomic reads, but is mainly designed for full genomes and
assembled metagenomic sequence.")
    (license license:gpl3+)))

(define-public muscle
  (package
    (name "muscle")
    (version "3.8.1551")
    (source (origin
              (method url-fetch/tarbomb)
              (uri (string-append
                    "http://www.drive5.com/muscle/muscle_src_"
                    version ".tar.gz"))
              (sha256
               (base32
                "0bj8kj7sdizy3987zx6w7axihk40fk8rn76mpbqqjcnd64i5a367"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags (list "LDLIBS = -lm")
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'check
           ;; There are no tests, so just test if it runs.
           (lambda _ (invoke "./muscle" "-version") #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (install-file "muscle" bin)
               #t))))))
    (home-page "http://www.drive5.com/muscle")
    (synopsis "Multiple sequence alignment program")
    (description
     "MUSCLE aims to be a fast and accurate multiple sequence alignment
program for nucleotide and protein sequences.")
    ;; License information found in 'muscle -h' and usage.cpp.
    (license license:public-domain)))

(define-public newick-utils
  ;; There are no recent releases so we package from git.
  (let ((commit "da121155a977197cab9fbb15953ca1b40b11eb87"))
    (package
      (name "newick-utils")
      (version (string-append "1.6-1." (string-take commit 8)))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/tjunier/newick_utils")
                      (commit commit)))
                (file-name (string-append name "-" version "-checkout"))
                (sha256
                 (base32
                  "1hkw21rq1mwf7xp0rmbb2gqc0i6p11108m69i7mr7xcjl268pxnb"))))
      (build-system gnu-build-system)
      (arguments
       '(#:make-flags (list "CFLAGS=-O2 -g -fcommon")))
      (inputs
       ;; XXX: TODO: Enable Lua and Guile bindings.
       ;; https://github.com/tjunier/newick_utils/issues/13
       (list libxml2 flex bison))
      (native-inputs
       (list autoconf automake libtool))
      (synopsis "Programs for working with newick format phylogenetic trees")
      (description
       "Newick-utils is a suite of utilities for processing phylogenetic trees
in Newick format.  Functions include re-rooting, extracting subtrees,
trimming, pruning, condensing, drawing (ASCII graphics or SVG).")
      (home-page "https://github.com/tjunier/newick_utils")
      (license license:bsd-3))))

(define-public orfm
  (package
    (name "orfm")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wwood/OrfM/releases/download/v"
                    version "/orfm-" version ".tar.gz"))
              (sha256
               (base32
                "16iigyr2gd8x0imzkk1dr3k5xsds9bpmwg31ayvjg0f4pir9rwqr"))))
    (build-system gnu-build-system)
    (inputs (list zlib))
    (native-inputs
     (list ruby-bio-commandeer ruby-rspec ruby))
    (synopsis "Simple and not slow open reading frame (ORF) caller")
    (description
     "An ORF caller finds stretches of DNA that, when translated, are not
interrupted by stop codons.  OrfM finds and prints these ORFs.")
    (home-page "https://github.com/wwood/OrfM")
    (license license:lgpl3+)))

(define-public prank
  (package
    (name "prank")
    (version "170427")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://wasabiapp.org/download/prank/prank.source."
                    version ".tgz"))
              (sha256
               (base32
                "0nc8g9c5rkdxcir46s0in9ci1sxwzbjibxrvkksf22ybnplvagk2"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'enter-src-dir
           (lambda _ (chdir "src")))
         (add-after 'unpack 'remove-m64-flag
           ;; Prank will build with the correct 'bit-ness' without this flag
           ;; and this allows building on 32-bit machines.
           (lambda _
             (substitute* "src/Makefile"
               (("-m64") ""))))
         (delete 'configure)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (man (string-append out "/share/man/man1"))
                    (path (string-append
                           (assoc-ref inputs "mafft") "/bin:"
                           (assoc-ref inputs "exonerate") "/bin:"
                           (assoc-ref inputs "bppsuite") "/bin")))
               (install-file "prank" bin)
               (wrap-program (string-append bin "/prank")
                 `("PATH" ":" prefix (,path)))
               (install-file "prank.1" man)))))))
    (inputs
     (list mafft exonerate bppsuite))
    (home-page "http://wasabiapp.org/software/prank/")
    (synopsis "Probabilistic multiple sequence alignment program")
    (description
     "PRANK is a probabilistic multiple sequence alignment program for DNA,
codon and amino-acid sequences.  It is based on a novel algorithm that treats
insertions correctly and avoids over-estimation of the number of deletion
events.  In addition, PRANK borrows ideas from maximum likelihood methods used
in phylogenetics and correctly takes into account the evolutionary distances
between sequences.  Lastly, PRANK allows for defining a potential structure
for sequences to be aligned and then, simultaneously with the alignment,
predicts the locations of structural units in the sequences.")
    (license license:gpl2+)))

(define-public proteinortho
  (package
    (name "proteinortho")
    (version "6.0.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/paulklemm_PHD/proteinortho.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0pmy617zy2z2w6hjqxjhf3rzikf5n3mpia80ysq8233vfr7wrzff"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; remove pre-built scripts
                  (delete-file-recursively "src/BUILD/")
                  #t))))
    (build-system gnu-build-system)
    (arguments
     `(#:test-target "test"
       #:make-flags '("CC=gcc")
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           ;; There is no configure script, so we modify the Makefile directly.
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "Makefile"
               (("INSTALLDIR=.*")
                (string-append
                 "INSTALLDIR=" (assoc-ref outputs "out") "/bin\n")))
             #t))
         (add-before 'install 'make-install-directory
           ;; The install directory is not created during 'make install'.
           (lambda* (#:key outputs #:allow-other-keys)
             (mkdir-p (string-append (assoc-ref outputs "out") "/bin"))
             #t))
         (add-after 'install 'wrap-programs
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((path (getenv "PATH"))
                   (out (assoc-ref outputs "out"))
                   (guile (search-input-file inputs "bin/guile")))
               (for-each (lambda (script)
                           (wrap-script script #:guile guile
                                        `("PATH" ":" prefix (,path))))
                         (cons (string-append out "/bin/proteinortho")
                               (find-files out "\\.(pl|py)$"))))
             #t)))))
    (inputs
     `(("guile" ,guile-3.0) ; for wrap-script
       ("diamond" ,diamond)
       ("perl" ,perl)
       ("python" ,python-wrapper)
       ("blast+" ,blast+)
       ("lapack" ,lapack)
       ("openblas" ,openblas)))
    (native-inputs
     (list which))
    (home-page "https://www.bioinf.uni-leipzig.de/Software/proteinortho")
    (synopsis "Detect orthologous genes across species")
    (description
     "Proteinortho is a tool to detect orthologous genes across different
species.  For doing so, it compares similarities of given gene sequences and
clusters them to find significant groups.  The algorithm was designed to handle
large-scale data and can be applied to hundreds of species at once.")
    (license license:gpl3+)))

(define-public prodigal
  (package
    (name "prodigal")
    ;; Check for a new home page when updating this package:
    ;; https://github.com/hyattpd/Prodigal/issues/36#issuecomment-536617588
    (version "2.6.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyattpd/Prodigal")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1fs1hqk83qjbjhrvhw6ni75zakx5ki1ayy3v6wwkn3xvahc9hi5s"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no check target
       #:make-flags
       ,#~(list (string-append "INSTALLDIR=" #$output "/bin"))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))
    (home-page "https://github.com/hyattpd/Prodigal")
    (synopsis "Protein-coding gene prediction for Archaea and Bacteria")
    (description
     "Prodigal runs smoothly on finished genomes, draft genomes, and
metagenomes, providing gene predictions in GFF3, Genbank, or Sequin table
format.  It runs quickly, in an unsupervised fashion, handles gaps, handles
partial genes, and identifies translation initiation sites.")
    (license license:gpl3+)))

(define-public roary
  (package
    (name "roary")
    (version "3.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/A/AJ/AJPAGE/Bio-Roary-"
             version ".tar.gz"))
       (sha256
        (base32
         "0qxrds9wx7cfhlkihrp6697kx0flhhxymap9fwan0b3rbdhcnmff"))))
    (build-system perl-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (replace 'check
           (lambda _
             ;; The tests are not run by default, so we run each test file
             ;; directly.
             (setenv "PATH" (string-append (getcwd) "/bin" ":"
                                           (getenv "PATH")))
             (setenv "PERL5LIB" (string-append (getcwd) "/lib" ":"
                                               (getenv "PERL5LIB")))
             (for-each (lambda (file)
                         (display file)(display "\n")
                         (invoke "perl" file))
                       (find-files "t" ".*\\.t$"))
             #t))
         (replace 'install
           ;; There is no 'install' target in the Makefile.
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (perl (string-append out "/lib/perl5/site_perl"))
                    (roary-plots "contrib/roary_plots"))
               (mkdir-p bin)
               (mkdir-p perl)
               (copy-recursively "bin" bin)
               (copy-recursively "lib" perl)
               #t)))
         (add-after 'install 'wrap-programs
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (perl5lib (getenv "PERL5LIB"))
                    (path (getenv "PATH")))
               (for-each (lambda (prog)
                           (let ((binary (string-append out "/" prog)))
                             (wrap-program binary
                               `("PERL5LIB" ":" prefix
                                 (,(string-append perl5lib ":" out
                                                  "/lib/perl5/site_perl"))))
                             (wrap-program binary
                               `("PATH" ":" prefix
                                 (,(string-append path ":" out "/bin"))))))
                         (find-files "bin" ".*[^R]$"))
               (let ((file
                      (string-append out "/bin/roary-create_pan_genome_plots.R"))
                     (r-site-lib (getenv "R_LIBS_SITE"))
                     (coreutils-path
                      (dirname (search-input-file inputs "bin/chmod"))))
                 (wrap-program file
                   `("R_LIBS_SITE" ":" prefix
                     (,(string-append r-site-lib ":" out "/site-library/"))))
                 (wrap-program file
                   `("PATH" ":" prefix
                     (,(string-append coreutils-path ":" out "/bin"))))))
             #t)))))
    (native-inputs
     (list perl-env-path perl-test-files perl-test-most perl-test-output))
    (inputs
     `(("perl-array-utils" ,perl-array-utils)
       ("bioperl" ,bioperl-minimal)
       ("perl-digest-md5-file" ,perl-digest-md5-file)
       ("perl-exception-class" ,perl-exception-class)
       ("perl-file-find-rule" ,perl-file-find-rule)
       ("perl-file-grep" ,perl-file-grep)
       ("perl-file-slurper" ,perl-file-slurper)
       ("perl-file-which" ,perl-file-which)
       ("perl-graph" ,perl-graph)
       ("perl-graph-readwrite" ,perl-graph-readwrite)
       ("perl-log-log4perl" ,perl-log-log4perl)
       ("perl-moose" ,perl-moose)
       ("perl-perlio-utf8_strict" ,perl-perlio-utf8_strict)
       ("perl-text-csv" ,perl-text-csv)
       ("bedtools" ,bedtools)
       ("cd-hit" ,cd-hit)
       ("blast+" ,blast+)
       ("mcl" ,mcl)
       ("parallel" ,parallel)
       ("prank" ,prank)
       ("mafft" ,mafft)
       ("fasttree" ,fasttree)
       ("grep" ,grep)
       ("sed" ,sed)
       ("gawk" ,gawk)
       ("r-minimal" ,r-minimal)
       ("r-ggplot2" ,r-ggplot2)
       ("coreutils" ,coreutils)))
    (home-page "https://sanger-pathogens.github.io/Roary/")
    (synopsis "High speed stand-alone pan genome pipeline")
    (description
     "Roary is a high speed stand alone pan genome pipeline, which takes
annotated assemblies in GFF3 format (produced by the Prokka program) and
calculates the pan genome.  Using a standard desktop PC, it can analyse
datasets with thousands of samples, without compromising the quality of the
results.  128 samples can be analysed in under 1 hour using 1 GB of RAM and a
single processor.  Roary is not intended for metagenomics or for comparing
extremely diverse sets of genomes.")
    (license license:gpl3)))

(define-public raxml
  (package
    (name "raxml")
    (version "8.2.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stamatak/standard-RAxML")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1jqjzhch0rips0vp04prvb8vmc20c5pdmsqn8knadcf91yy859fh"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; There are no tests.
       ;; Use 'standard' Makefile rather than SSE or AVX ones.
       #:make-flags (list "-f" "Makefile.HYBRID.gcc")
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (executable "raxmlHPC-HYBRID"))
               (install-file executable bin)
               (symlink (string-append bin "/" executable) "raxml"))
             #t)))))
    (inputs
     (list openmpi))
    (home-page "https://cme.h-its.org/exelixis/web/software/raxml/index.html")
    (synopsis "Randomized Axelerated Maximum Likelihood phylogenetic trees")
    (description
     "RAxML is a tool for phylogenetic analysis and post-analysis of large
phylogenies.")
    ;; The source includes x86 specific code
    (supported-systems '("x86_64-linux" "i686-linux"))
    (license license:gpl2+)))

(define-public rsem
  (package
    (name "rsem")
    (version "1.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/deweylab/RSEM")
             (commit (string-append "v" version))))
       (sha256
        (base32 "1yl4i7z20n2p84j1lmk15aiak3yqc6fiw0q5a4pndw7pxfiq3rzp"))
       (file-name (git-file-name name version))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; remove bundled copy of boost and samtools
           (delete-file-recursively "boost")
           (delete-file-recursively "samtools-1.3")))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ;no "check" target
       #:make-flags
       ,#~(list (string-append "BOOST="
                               #$(this-package-input "boost")
                               "/include/")
                (string-append "SAMHEADERS="
                               #$(this-package-input "htslib")
                               "/include/htslib/sam.h")
                (string-append "SAMLIBS="
                               #$(this-package-input "htslib")
                               "/lib/libhts.so"))
       #:phases
       (modify-phases %standard-phases
         ;; No "configure" script.
         (replace 'configure
           (lambda _
             (substitute* "Makefile"
               (("^all : \\$\\(PROGRAMS\\).*") "all: $(PROGRAMS)\n")
               ;; Do not build bundled samtools library.
               (("^\\$\\(SAMLIBS\\).*") "")
               ;; Needed for Boost
               (("gnu\\+\\+98") "gnu++11"))
             ;; C++11 compatibility
             (substitute* "buildReadIndex.cpp"
               (("success = \\(getline")
                "success = (bool)(getline"))
             (substitute* '("PairedEndHit.h"
                            "SingleHit.h")
               (("return \\(in>>sid>>pos")
                "return (bool)(in>>sid>>pos"))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (string-append (assoc-ref outputs "out")))
                    (bin (string-append out "/bin/"))
                    (perl (string-append out "/lib/perl5/site_perl")))
               (mkdir-p bin)
               (mkdir-p perl)
               (for-each (lambda (file)
                           (install-file file bin))
                         (find-files "." "rsem-.*"))
               (install-file "rsem_perl_utils.pm" perl))))
         (add-after 'install 'wrap-program
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (for-each (lambda (prog)
                           (wrap-program (string-append out "/bin/" prog)
                             `("PERL5LIB" ":" prefix
                               (,(string-append out "/lib/perl5/site_perl")))))
                         '("rsem-calculate-expression"
                           "rsem-control-fdr"
                           "rsem-generate-data-matrix"
                           "rsem-generate-ngvector"
                           "rsem-plot-transcript-wiggles"
                           "rsem-prepare-reference"
                           "rsem-run-ebseq"
                           "rsem-run-prsem-testing-procedure"))))))))
    (inputs
     (list boost r-minimal perl htslib-1.3 zlib))
    (home-page "https://deweylab.biostat.wisc.edu/rsem/")
    (synopsis "Estimate gene expression levels from RNA-Seq data")
    (description
     "RSEM is a software package for estimating gene and isoform expression
levels from RNA-Seq data.  The RSEM package provides a user-friendly
interface, supports threads for parallel computation of the EM algorithm,
single-end and paired-end read data, quality scores, variable-length reads and
RSPD estimation.  In addition, it provides posterior mean and 95% credibility
interval estimates for expression levels.  For visualization, it can generate
BAM and Wiggle files in both transcript-coordinate and genomic-coordinate.")
    (license license:gpl3+)))

(define-public rseqc
  (package
    (name "rseqc")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://sourceforge/rseqc/"
                       "RSeQC-" version ".tar.gz"))
       (sha256
        (base32
         "0gbb9iyb7swiv5455fm5rg98r7l6qn27v564yllqjd574hncpx6m"))))
    (build-system python-build-system)
    (inputs
     (list python-cython
           python-bx-python
           python-pybigwig
           python-pysam
           python-numpy
           zlib))
    (native-inputs
     (list python-nose))
    (home-page "https://rseqc.sourceforge.net/")
    (synopsis "RNA-seq quality control package")
    (description
     "RSeQC provides a number of modules that can comprehensively evaluate
high throughput sequence data, especially RNA-seq data.  Some basic modules
inspect sequence quality, nucleotide composition bias, PCR bias and GC bias,
while RNA-seq specific modules evaluate sequencing saturation, mapped reads
distribution, coverage uniformity, strand specificity, etc.")
    (license license:gpl3+)))

(define-public seek
  ;; There are no release tarballs.  And the installation instructions at
  ;; http://seek.princeton.edu/installation.jsp only mention a mercurial
  ;; changeset ID.  This is a git repository, though.  So we just take the
  ;; most recent commit.
  (let ((commit "196ed4c7633246e9c628e4330d77577ccfd7f1e5")
        (revision "1"))
    (package
      (name "seek")
      (version (git-version "1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/FunctionLab/sleipnir.git")
                      (commit commit)
                      (recursive? #true)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0c658n8nz563a96dsi4gl2685vxph0yfmmqq5yjc6i4xin1jy1ab"))))
      (build-system cmake-build-system)
      (arguments
       `(#:configure-flags
         ,#~(list (string-append "-DSVM_LIBRARY="
                                 #$(this-package-input "libsvm")
                                 "/lib/libsvm.so.2")
                  (string-append "-DSVM_INCLUDE="
                                 #$(this-package-input "libsvm")
                                 "/include"))
         #:tests? #false ; tests only fail in the build container
         #:phases
         (modify-phases %standard-phases
           ;; The check phase expects to find the unit_tests executable in the
           ;; "build/bin" directory, but it is actually in "build/tests".
           (replace 'check
             (lambda* (#:key tests? #:allow-other-keys)
               (when tests?
                 (invoke "tests/unit_tests")))))))
      (inputs
       `(("apache-thrift:include" ,apache-thrift "include")
         ("apache-thrift:lib" ,apache-thrift "lib")
         ("gsl" ,gsl)
         ("boost" ,boost)
         ("gengetopt" ,gengetopt)
         ("libsvm" ,libsvm)
         ("log4cpp" ,log4cpp)
         ("python" ,python)
         ("readline" ,readline)))
      (native-inputs
       (list pkg-config))
      (home-page "https://seek.princeton.edu")
      (synopsis "Gene co-expression search engine")
      (description
       "SEEK is a computational gene co-expression search engine.  SEEK provides
biologists with a way to navigate the massive human expression compendium that
now contains thousands of expression datasets.  SEEK returns a robust ranking
of co-expressed genes in the biological area of interest defined by the user's
query genes.  It also prioritizes thousands of expression datasets according
to the user's query of interest.")
      (license license:cc-by3.0))))

(define-public samtools
  (package
    (name "samtools")
    (version "1.14")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://sourceforge/samtools/samtools/"
                       version "/samtools-" version ".tar.bz2"))
       (sha256
        (base32
         "0x3xdda78ac5vx66b3jdsv9sfhyz4npl4znl1zbaf3lbm6xdlhck"))
       (modules '((guix build utils)))
       (snippet '(begin
                   ;; Delete bundled htslib.
                   (delete-file-recursively "htslib-1.14")))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags (list "--with-ncurses")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-tests
           (lambda _
             (substitute* "test/test.pl"
               ;; The test script calls out to /bin/bash
               (("/bin/bash") (which "bash"))))))))
    (native-inputs (list pkg-config))
    (inputs
     (list htslib ncurses perl python zlib))
    (home-page "https://samtools.sourceforge.net")
    (synopsis "Utilities to efficiently manipulate nucleotide sequence alignments")
    (description
     "Samtools implements various utilities for post-processing nucleotide
sequence alignments in the SAM, BAM, and CRAM formats, including indexing,
variant calling (in conjunction with bcftools), and a simple alignment
viewer.")
    (license license:expat)))

(define-public samtools-1.12
  (package/inherit samtools
    (version "1.12")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://sourceforge/samtools/samtools/"
                       version "/samtools-" version ".tar.bz2"))
       (sha256
        (base32
         "1jrdj2idpma5ja9cg0rr73b565vdbr9wyy6zig54bidicc2pg8vd"))
       (modules '((guix build utils)))
       (snippet '(begin
                   ;; Delete bundled htslib.
                   (delete-file-recursively "htslib-1.12")))))
    (arguments
     (substitute-keyword-arguments (package-arguments samtools)
       ((#:modules _ #f)
        '((ice-9 ftw)
          (ice-9 regex)
          (guix build gnu-build-system)
          (guix build utils)))
       ((#:phases phases)
        `(modify-phases ,phases
           (add-after 'install 'install-library
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((lib (string-append (assoc-ref outputs "out") "/lib")))
                 (install-file "libbam.a" lib))))
           (add-after 'install 'install-headers
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((include (string-append (assoc-ref outputs "out")
                                             "/include/samtools/")))
                 (for-each (lambda (file)
                             (install-file file include))
                           (scandir "." (lambda (name)
                                          (string-match "\\.h$" name)))))))))))
    (native-inputs (list pkg-config))
    (inputs
     (list htslib-1.12 ncurses perl python zlib))))

(define-public samtools-1.10
  (package (inherit samtools)
    (name "samtools")
    (version "1.10")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://sourceforge/samtools/samtools/"
                       version "/samtools-" version ".tar.bz2"))
       (sha256
        (base32
         "119ms0dpydw8dkh3zc4yyw9zhdzgv12px4l2kayigv31bpqcb7kv"))
       (modules '((guix build utils)))
       (snippet '(begin
                   ;; Delete bundled htslib.
                   (delete-file-recursively "htslib-1.10")
                   #t))))
    (inputs
     (list htslib-1.10 ncurses perl python zlib))))

(define-public samtools-1.2
  (package (inherit samtools)
    (name "samtools")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://sourceforge/samtools/samtools/"
                       version "/samtools-" version ".tar.bz2"))
       (sha256
        (base32
         "1akdqb685pk9xk1nb6sa9aq8xssjjhvvc06kp4cpdqvz2157l3j2"))
       (modules '((guix build utils)))
       (snippet
        ;; Delete bundled htslib and Windows binaries
        '(for-each delete-file-recursively (list "win32" "htslib-1.2.1")))))
    (arguments
     `(#:make-flags
       ,#~(list (string-append "prefix=" #$output)
                (string-append "BGZIP="
                               #$(this-package-input "htslib")
                               "/bin/bgzip")
                (string-append "HTSLIB="
                               #$(this-package-input "htslib")
                               "/lib/libhts.so")
                (string-append "HTSDIR="
                               #$(this-package-input "htslib")
                               "/include"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-makefile-curses
           (lambda _
             (substitute* "Makefile"
               (("-lcurses") "-lncurses")
               (("include \\$\\(HTSDIR.*") ""))))
         (add-after 'unpack 'patch-tests
           (lambda _
             (substitute* "test/test.pl"
               ;; The test script calls out to /bin/bash
               (("/bin/bash") (which "bash"))
               ;; There are two failing tests upstream relating to the "stats"
               ;; subcommand in test_usage_subcommand ("did not have Usage"
               ;; and "usage did not mention samtools stats"), so we disable
               ;; them.
               (("(test_usage_subcommand\\(.*\\);)" cmd)
                (string-append "unless ($subcommand eq 'stats') {" cmd "};")))
             ;; This test fails because the grep output doesn't look as
             ;; expected; it is correct, though.
             (substitute* "test/mpileup/mpileup.reg"
               (("P 52.out.*") ""))))
         (delete 'configure))))
    (native-inputs
     (list grep gawk pkg-config))
    (inputs
     (list htslib-for-samtools-1.2 ncurses perl python zlib))))

(define-public samtools-0.1
  ;; This is the most recent version of the 0.1 line of samtools.  The input
  ;; and output formats differ greatly from that used and produced by samtools
  ;; 1.x and is still used in many bioinformatics pipelines.
  (package (inherit samtools)
    (version "0.1.19")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://sourceforge/samtools/samtools/"
                       version "/samtools-" version ".tar.bz2"))
       (sha256
        (base32 "1m33xsfwz0s8qi45lylagfllqg7fphf4dr0780rsvw75av9wk06h"))))
    (arguments
     `(#:tests? #f ;no "check" target
       #:make-flags
       (list "LIBCURSES=-lncurses")
       ,@(substitute-keyword-arguments (package-arguments samtools)
           ((#:modules _ #f)
            '((ice-9 ftw)
              (ice-9 regex)
              (guix build gnu-build-system)
              (guix build utils)))
           ((#:phases phases)
            `(modify-phases ,phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append
                               (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "samtools" bin)
                     #t)))
               (add-after 'install 'install-library
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((lib (string-append (assoc-ref outputs "out") "/lib")))
                     (install-file "libbam.a" lib))))
               (add-after 'install 'install-headers
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((include (string-append (assoc-ref outputs "out")
                                                 "/include/samtools/")))
                     (for-each (lambda (file)
                                 (install-file file include))
                               (scandir "." (lambda (name)
                                              (string-match "\\.h$" name)))))))
               (delete 'patch-tests)
               (delete 'configure))))))))

(define-public mosaik
  (let ((commit "5c25216d3522d6a33e53875cd76a6d65001e4e67"))
    (package
      (name "mosaik")
      (version "2.2.30")
      (source (origin
                ;; There are no release tarballs nor tags.
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/wanpinglee/MOSAIK")
                      (commit commit)))
                (file-name (string-append name "-" version))
                (sha256
                 (base32
                  "17gj3s07cm77r41z92awh0bim7w7q7fbn0sf5nkqmcm1vw052qgw"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f ; no tests
         #:make-flags (list "CC=gcc")
         #:phases
         (modify-phases %standard-phases
           (replace 'configure
                    (lambda _ (chdir "src") #t))
           (replace 'install
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let ((bin (string-append (assoc-ref outputs "out")
                                                "/bin")))
                        (mkdir-p bin)
                        (copy-recursively "../bin" bin)
                        #t))))))
      (inputs
       `(("perl" ,perl)
         ("zlib:static" ,zlib "static")
         ("zlib" ,zlib)))
      (supported-systems '("x86_64-linux"))
      (home-page "https://github.com/wanpinglee/MOSAIK")
      (synopsis "Map nucleotide sequence reads to reference genomes")
      (description
       "MOSAIK is a program for mapping second and third-generation sequencing
reads to a reference genome.  MOSAIK can align reads generated by all the
major sequencing technologies, including Illumina, Applied Biosystems SOLiD,
Roche 454, Ion Torrent and Pacific BioSciences SMRT.")
      ;; MOSAIK is released under the GPLv2+ with the exception of third-party
      ;; code released into the public domain:
      ;; 1. fastlz by Ariya Hidayat - http://www.fastlz.org/
      ;; 2. MD5 implementation - RSA Data Security, RFC 1321
      (license (list license:gpl2+ license:public-domain)))))

(define-public mosaicatcher
  (package
    (name "mosaicatcher")
    (version "0.3.1")
    (source (origin
              ;; There are no release tarballs nor tags.
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/friendsofstrandseq/mosaicatcher")
                    (commit (string-append version "-dev"))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1n2s5wvvj2y0vfgjkg1q11xahpbagxz7h2vf5q7qyy25s12kbzbd"))
              (patches (search-patches "mosaicatcher-unbundle-htslib.patch"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #false ; there are no tests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'chdir
           (lambda _ (chdir "src")))
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((target (assoc-ref outputs "out"))
                    (bin (string-append target "/bin"))
                    (share (string-append target "/share/mosaicatcher")))
               (install-file "mosaic" bin)
               (mkdir-p share)
               (copy-recursively "../R" share)))))))
    (inputs
     (list boost htslib))
    (home-page "https://github.com/friendsofstrandseq/mosaicatcher")
    (synopsis "Count and classify Strand-seq reads")
    (description
     "Mosaicatcher counts Strand-seq reads and classifies strand states of
each chromosome in each cell using a Hidden Markov Model.")
    (license license:expat)))

(define-public ngs-sdk
  (package
    (name "ngs-sdk")
    (version "2.10.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ncbi/ngs")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1ix51c25hjn57w93qmwzw80xh2i34wx8j2hn7szh8p6w8i3az5qa"))))
    (build-system gnu-build-system)
    (arguments
     `(#:parallel-build? #f ; not supported
       #:tests? #f ; no "check" target
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               ;; Allow 'konfigure.perl' to find 'package.prl'.
               (setenv "PERL5LIB"
                       (string-append ".:" (getenv "PERL5LIB")))

               ;; The 'configure' script doesn't recognize things like
               ;; '--enable-fast-install'.
               (invoke "./configure"
                       (string-append "--build-prefix=" (getcwd) "/build")
                       (string-append "--prefix=" out))
               #t)))
         (add-after 'unpack 'enter-dir
           (lambda _ (chdir "ngs-sdk") #t)))))
    (native-inputs (list perl))
    ;; According to the test
    ;;   unless ($MARCH =~ /x86_64/i || $MARCH =~ /i?86/i)
    ;; in ngs-sdk/setup/konfigure.perl
    (supported-systems '("i686-linux" "x86_64-linux"))
    (home-page "https://github.com/ncbi/ngs")
    (synopsis "API for accessing Next Generation Sequencing data")
    (description
     "NGS is a domain-specific API for accessing reads, alignments and pileups
produced from Next Generation Sequencing.  The API itself is independent from
any particular back-end implementation, and supports use of multiple back-ends
simultaneously.")
    (license license:public-domain)))

(define-public java-ngs
  (package (inherit ngs-sdk)
    (name "java-ngs")
    (arguments
     `(,@(substitute-keyword-arguments
             `(#:modules ((guix build gnu-build-system)
                          (guix build utils)
                          (srfi srfi-1)
                          (srfi srfi-26))
                         ,@(package-arguments ngs-sdk))
           ((#:phases phases)
            `(modify-phases ,phases
               (replace 'enter-dir (lambda _ (chdir "ngs-java") #t)))))))
    (inputs
     `(("jdk" ,icedtea "jdk")
       ("ngs-sdk" ,ngs-sdk)))
    (synopsis "Java bindings for NGS SDK")))

(define-public ncbi-vdb
  (package
    (name "ncbi-vdb")
    (version "2.10.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ncbi/ncbi-vdb")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0m8hlxscidsfqm9x9fyi62q6lpf1dv5115kgjjgnrkl49q9c27m6"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:parallel-build? #f              ; not supported
      #:tests? #f                       ; no "check" target
      #:make-flags '(list "HAVE_HDF5=1")
      #:phases
      #~(modify-phases %standard-phases
          #;
          (add-after 'unpack 'make-files-writable
            (lambda _ (for-each make-file-writable (find-files "." ".*"))))
          (add-before 'configure 'set-perl-search-path
            (lambda _
              ;; Work around "dotless @INC" build failure.
              (setenv "PERL5LIB"
                      (string-append (getcwd) "/setup:"
                                     (getenv "PERL5LIB")))))
          ;; See https://github.com/ncbi/ncbi-vdb/issues/14
          (add-after 'unpack 'patch-krypto-flags
            (lambda _
              (substitute* "libs/krypto/Makefile"
                (("-Wa,-march=generic64\\+aes") "")
                (("-Wa,-march=generic64\\+sse4") ""))))
          (replace 'configure
            (lambda _
              ;; Override include path for libmagic
              (substitute* "setup/package.prl"
                (("name => 'magic', Include => '/usr/include'")
                 (string-append "name=> 'magic', Include => '"
                                #$(this-package-input "file")
                                "/include" "'")))

              ;; Install kdf5 library (needed by sra-tools)
              (substitute* "build/Makefile.install"
                (("LIBRARIES_TO_INSTALL =")
                 "LIBRARIES_TO_INSTALL = kdf5.$(VERSION_LIBX) kdf5.$(VERSION_SHLX)"))

              (substitute* "build/Makefile.env"
                (("CFLAGS	=" prefix)
                 (string-append prefix "-msse2 ")))

              ;; Override search path for ngs-java
              (substitute* "setup/package.prl"
                (("/usr/local/ngs/ngs-java")
                 #$(this-package-input "java-ngs")))

              ;; The 'configure' script doesn't recognize things like
              ;; '--enable-fast-install'.
              (invoke "./configure"
                      (string-append "--build-prefix=" (getcwd) "/build")
                      (string-append "--prefix=" #$output)
                      (string-append "--debug")
                      (string-append "--with-xml2-prefix="
                                     #$(this-package-input "libxml2"))
                      (string-append "--with-ngs-sdk-prefix="
                                     #$(this-package-input "ngs-sdk"))
                      (string-append "--with-hdf5-prefix="
                                     #$(this-package-input "hdf5")))))
          (add-after 'install 'install-interfaces
            (lambda _
              ;; Install interface libraries.  On i686 the interface libraries
              ;; are installed to "linux/gcc/i386", so we need to use the Linux
              ;; architecture name ("i386") instead of the target system prefix
              ;; ("i686").
              (mkdir (string-append #$output "/ilib"))
              (copy-recursively (string-append
                                 "build/ncbi-vdb/linux/gcc/"
                                 #$(platform-linux-architecture
                                    (lookup-platform-by-target-or-system
                                     (or (%current-target-system)
                                         (%current-system))))
                                 "/rel/ilib")
                                (string-append #$output "/ilib"))
              ;; Install interface headers
              (copy-recursively "interfaces"
                                (string-append #$output "/include"))))
          (add-after 'install-interfaces 'install-libs
            (lambda _
              (copy-recursively (string-append
                                 "build/ncbi-vdb/linux/gcc/"
                                 #$(platform-linux-architecture
                                    (lookup-platform-by-target-or-system
                                     (or (%current-target-system)
                                         (%current-system))))
                                 "/rel/lib")
                                (string-append #$output "/lib"))))
          ;; These files are needed by sra-tools.
          (add-after 'install 'install-configuration-files
            (lambda _
              (let ((target (string-append #$output "/kfg")))
                (mkdir target)
                (install-file "libs/kfg/default.kfg" target)
                (install-file "libs/kfg/certs.kfg" target)))))))
    (inputs
     (list file hdf5 java-ngs libxml2 ngs-sdk ))
    (native-inputs (list perl))
    ;; NCBI-VDB requires SSE capability.
    (supported-systems '("i686-linux" "x86_64-linux"))
    (home-page "https://github.com/ncbi/ncbi-vdb")
    (synopsis "Database engine for genetic information")
    (description
     "The NCBI-VDB library implements a highly compressed columnar data
warehousing engine that is most often used to store genetic information.
Databases are stored in a portable image within the file system, and can be
accessed/downloaded on demand across HTTP.")
    (license license:public-domain)))

(define-public plink
  (package
    (name "plink")
    (version "1.07")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://zzz.bwh.harvard.edu/plink/dist/plink-"
             version "-src.zip"))
       (sha256
        (base32 "0as8gxm4pjyc8dxmm1sl873rrd7wn5qs0l29nqfnl31x8i467xaa"))
       (patches (search-patches "plink-1.07-unclobber-i.patch"
                                "plink-endian-detection.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ;no "check" target
       #:make-flags ,#~(list (string-append "LIB_LAPACK="
                                            #$(this-package-input "lapack")
                                            "/lib/liblapack.so")
                             "WITH_LAPACK=1"
                             "FORCE_DYNAMIC=1"
                             ;; disable phoning home
                             "WITH_WEBCHECK=")
       #:phases
       (modify-phases %standard-phases
         ;; no "configure" script
         (delete 'configure)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin/")))
               (install-file "plink" bin)))))))
    (inputs
     (list zlib lapack))
    (native-inputs
     (list unzip))
    (home-page "http://pngu.mgh.harvard.edu/~purcell/plink/")
    (synopsis "Whole genome association analysis toolset")
    (description
     "PLINK is a whole genome association analysis toolset, designed to
perform a range of basic, large-scale analyses in a computationally efficient
manner.  The focus of PLINK is purely on analysis of genotype/phenotype data,
so there is no support for steps prior to this (e.g. study design and
planning, generating genotype or CNV calls from raw data).  Through
integration with gPLINK and Haploview, there is some support for the
subsequent visualization, annotation and storage of results.")
    ;; Code is released under GPLv2, except for fisher.h, which is under
    ;; LGPLv2.1+
    (license (list license:gpl2 license:lgpl2.1+))))

(define-public plink-ng
  (package (inherit plink)
    (name "plink-ng")
    (version "2.00a3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chrchang/plink-ng")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0m8wkyvbgvcr5kzc284w8fbhpxwglh2c1xq0yc3yv00a53gs7rv0"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #false ;TEST_EXTRACT_CHR doesn't produce expected files
      #:make-flags
      #~(list "BLASFLAGS=-llapack -lopenblas"
              "NO_SSE42=1"
              "NO_AVX2=1"
              "STATIC_ZSTD="
              (string-append "CC=" #$(cc-for-target))
              (string-append "PREFIX=" #$output)
              "DESTDIR=")
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'chdir
           (lambda _ (chdir "2.0/build_dynamic")))
         (delete 'configure)            ; no "configure" script
         (replace 'check
           (lambda* (#:key tests? inputs #:allow-other-keys)
             (when tests?
               (setenv "PATH" (string-append (getcwd) ":" (getenv "PATH")))
               (with-directory-excursion "../Tests"
                 (substitute* "run_tests.sh"
                   (("^./run_tests" m)
                    (string-append (which "bash") " " m)))
                 (invoke "bash" "run_tests.sh")))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (install-file "plink2"
                           (string-append
                            (assoc-ref outputs "out") "/bin")))))))
    (inputs
     (list lapack openblas zlib `(,zstd "lib")))
    (native-inputs
     (list diffutils plink python simde)) ; for tests
    (home-page "https://www.cog-genomics.org/plink/")
    (license license:gpl3+)))

(define-public smithlab-cpp
  (let ((revision "1")
        (commit "728a097bec88c6f4b8528b685932049e660eff2e"))
    (package
      (name "smithlab-cpp")
      (version (string-append "0." revision "." (string-take commit 7)))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/smithlabcode/smithlab_cpp")
                      (commit commit)))
                (file-name (string-append name "-" version "-checkout"))
                (sha256
                 (base32
                  "0d476lmj312xk77kr9fzrv7z1bv96yfyx0w7y62ycmnfbx32ll74"))))
      (build-system gnu-build-system)
      (arguments
       `(#:modules ((guix build gnu-build-system)
                    (guix build utils)
                    (srfi srfi-26))
         #:tests? #f ;no "check" target
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'use-samtools-headers
            (lambda _
              (substitute* '("SAM.cpp"
                             "SAM.hpp")
                (("sam.h") "samtools/sam.h"))
              #t))
           (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out     (assoc-ref outputs "out"))
                     (lib     (string-append out "/lib"))
                     (include (string-append out "/include/smithlab-cpp")))
                (mkdir-p lib)
                (mkdir-p include)
                (for-each (cut install-file <> lib)
                          (find-files "." "\\.o$"))
                (for-each (cut install-file <> include)
                          (find-files "." "\\.hpp$")))
              #t))
           (delete 'configure))))
      (inputs
       (list samtools-0.1 zlib))
      (home-page "https://github.com/smithlabcode/smithlab_cpp")
      (synopsis "C++ helper library for functions used in Smith lab projects")
      (description
       "Smithlab CPP is a C++ library that includes functions used in many of
the Smith lab bioinformatics projects, such as a wrapper around Samtools data
structures, classes for genomic regions, mapped sequencing reads, etc.")
      (license license:gpl3+))))

(define-public preseq
  (package
    (name "preseq")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/smithlabcode/preseq/"
                                  "releases/download/v" version
                                  "/preseq_v" version ".tar.bz2"))
              (sha256
               (base32 "149x9xmk1wy1gff85325yfzqc0qk4sgp1w6gbyj9cnji4x1dszbl"))
              (modules '((guix build utils)))
              ;; Remove bundled samtools.
              (snippet '(delete-file-recursively "samtools"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ;no "check" target
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))
       #:make-flags
       ,#~(list (string-append "PREFIX=" #$output)
                (string-append "LIBBAM="
                               #$(this-package-input "samtools")
                               "/lib/libbam.a")
                (string-append "SMITHLAB_CPP="
                               #$(this-package-input "smithlab-cpp")
                               "/lib")
                "PROGS=preseq"
                "INCLUDEDIRS=$(SMITHLAB_CPP)/../include/smithlab-cpp $(SAMTOOLS_DIR)")))
    (inputs
     (list gsl samtools-0.1 smithlab-cpp zlib))
    (home-page "http://smithlabresearch.org/software/preseq/")
    (synopsis "Program for analyzing library complexity")
    (description
     "The preseq package is aimed at predicting and estimating the complexity
of a genomic sequencing library, equivalent to predicting and estimating the
number of redundant reads from a given sequencing depth and how many will be
expected from additional sequencing using an initial sequencing experiment.
The estimates can then be used to examine the utility of further sequencing,
optimize the sequencing depth, or to screen multiple libraries to avoid low
complexity samples.")
    (license license:gpl3+)))

(define-public python-screed
  (package
    (name "python-screed")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "screed" version))
       (sha256
        (base32 "0slva743xn93h4sl5zg2as4ricnnj5pp6nw9dm4qclk4i9xglkvk"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list python-pytest-cov
           python-pytest-runner))
    (home-page "https://github.com/dib-lab/screed/")
    (synopsis "Short read sequence database utilities")
    (description "Screed parses FASTA and FASTQ files and generates databases.
Values such as sequence name, sequence description, sequence quality and the
sequence itself can be retrieved from these databases.")
    (license license:bsd-3)))

(define-public python-slamdunk
  (package
    (name "python-slamdunk")
    (version "0.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/t-neumann/slamdunk")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0lv3h5k2pn1pz35kz0wk5xmricxzy8qscs2y7nwh0k6x4pn0m0s5"))))
    (build-system python-build-system)
    (propagated-inputs
     (list python-biopython
           python-intervaltree
           python-joblib
           python-pandas
           python-pybedtools
           python-pysam))
    (native-inputs
     (list python-cython python-pytest))
    (home-page "https://t-neumann.github.io/slamdunk/")
    (synopsis "Streamline SLAM-seq analysis with high sensitivity")
    (description "SlamDunk is a fully automated tool for automated, robust,
scalable and reproducible SLAMseq data analysis.  Diagnostic plotting features
and a MultiQC plugin will make your SLAMseq data ready for immediate QA and
interpretation.")
    (license license:agpl3+)))

(define-public python-taggd
  (package
    (name "python-taggd")
    (version "0.3.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SpatialTranscriptomicsResearch/taggd")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0j19ah81z7aqrdljah9hyarp91gvgbk63pz6fz3pdpksy1yqyi6k"))
              (modules '((guix build utils)))
              (snippet
               '(for-each delete-file
                          (find-files "taggd" "\\.c$")))))
    (build-system python-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'disable-broken-tests
           (lambda _
             (substitute* "tests/taggd_demultiplex_test.py"
               (("def test_normal_bam_run")
                "def _disabled_test_normal_bam_run")))))))
    (propagated-inputs
     (list python-numpy python-pysam python-setuptools))
    (native-inputs
     (list python-cython))
    (home-page "https://github.com/SpatialTranscriptomicsResearch/taggd")
    (synopsis "Genetic barcode demultiplexing")
    (description "This package provides TagGD barcode demultiplexing utilities
for Spatial Transcriptomics data.")
    (license license:bsd-3)))

(define-public stpipeline
  (package
    (name "stpipeline")
    (version "1.8.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "stpipeline" version))
              (sha256
               (base32
                "0har2g42fvaqpiz66lincy86aj1hvwzds26kxhxfamvyvv4721wk"))))
    (build-system python-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'relax-requirements
           (lambda _
             (substitute* "requirements.txt"
               (("argparse.*") "")))))))
    (propagated-inputs
     (list htseq
           python-cython
           python-invoke
           python-numpy
           python-pandas
           python-pympler
           python-pysam
           python-regex
           python-scikit-learn
           python-scipy
           python-seaborn
           python-setuptools
           python-sqlitedict
           python-taggd
           samtools
           star))
    (home-page "https://github.com/SpatialTranscriptomicsResearch/st_pipeline")
    (synopsis "Pipeline for spatial mapping of unique transcripts")
    (description
     "This package provides an automated pipeline for spatial mapping of
unique transcripts.")
    (license license:expat)))

(define-public sra-tools
  (package
    (name "sra-tools")
    (version "2.10.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ncbi/sra-tools")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1cr2mijkfs5sm35ffjs6861qsd1qkgnhnbavdv65zg5d655abbjf"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:parallel-build? #f             ; not supported
      #:tests? #f                      ; no "check" target
      #:make-flags
      #~(list (string-append "DEFAULT_CRT="
                             #$(this-package-input "ncbi-vdb")
                             "/kfg/certs.kfg")
              (string-append "DEFAULT_KFG="
                             #$(this-package-input "ncbi-vdb")
                             "/kfg/default.kfg")
              (string-append "VDB_LIBDIR="
                             #$(this-package-input "ncbi-vdb")
                             #$(if (string-prefix? "x86_64"
                                                   (or (%current-target-system)
                                                       (%current-system)))
                                   "/lib64"
                                   "/lib32")))
       #:phases
       #~(modify-phases %standard-phases
           (add-before 'configure 'set-perl-search-path
             (lambda _
               ;; Work around "dotless @INC" build failure.
               (setenv "PERL5LIB"
                       (string-append (getcwd) "/setup:"
                                      (getenv "PERL5LIB")))))
           (replace 'configure
             (lambda* (#:key inputs outputs #:allow-other-keys)
               ;; The build system expects a directory containing the sources and
               ;; raw build output of ncbi-vdb, including files that are not
               ;; installed.  Since we are building against an installed version of
               ;; ncbi-vdb, the following modifications are needed.
               (substitute* "setup/konfigure.perl"
                 ;; Make the configure script look for the "ilib" directory of
                 ;; "ncbi-vdb" without first checking for the existence of a
                 ;; matching library in its "lib" directory.
                 (("^            my \\$f = File::Spec->catdir\\(\\$libdir, \\$lib\\);")
                  "my $f = File::Spec->catdir($ilibdir, $ilib);")
                 ;; Look for interface libraries in ncbi-vdb's "ilib" directory.
                 (("my \\$ilibdir = File::Spec->catdir\\(\\$builddir, 'ilib'\\);")
                  "my $ilibdir = File::Spec->catdir($dir, 'ilib');"))

               ;; Dynamic linking
               (substitute* "tools/copycat/Makefile"
                 (("smagic-static") "lmagic"))
               (substitute* "tools/driver-tool/utf8proc/Makefile"
                 (("CC\\?=gcc") "myCC=gcc")
                 (("\\(CC\\)") "(myCC)"))

               ;; Don't link libxml2 statically
               (substitute* "build/ld.linux.exe.sh"
                 (("grep -q 'OS_DISTRIBUTOR = Ubuntu.*") "true\n"))

               ;; The 'configure' script doesn't recognize things like
               ;; '--enable-fast-install'.
               (invoke "./configure"
                       (string-append "--build-prefix=" (getcwd) "/build")
                       (string-append "--prefix=" #$output)
                       (string-append "--debug")
                       (string-append "--with-fuse-prefix="
                                      #$(this-package-input "fuse"))
                       (string-append "--with-magic-prefix="
                                      #$(this-package-input "file"))
                       (string-append "--with-xml2-prefix="
                                      #$(this-package-input "libxml2"))
                       (string-append "--with-ncbi-vdb-sources="
                                      #$(this-package-input "ncbi-vdb"))
                       (string-append "--with-ncbi-vdb-build="
                                      #$(this-package-input "ncbi-vdb"))
                       (string-append "--with-ngs-sdk-prefix="
                                      #$(this-package-input "ngs-sdk"))
                       (string-append "--with-hdf5-prefix="
                                      #$(this-package-input "hdf5"))))))))
    (native-inputs (list perl))
    (inputs
     (list ngs-sdk
           ncbi-vdb
           file
           fuse
           hdf5-1.10
           libxml2
           zlib
           python-wrapper))
    (home-page
     "https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software")
    (synopsis "Tools and libraries for reading and writing sequencing data")
    (description
     "The SRA Toolkit from NCBI is a collection of tools and libraries for
reading of sequencing files from the Sequence Read Archive (SRA) database and
writing files into the .sra format.")
    (license license:public-domain)))

(define-public seqan
  (package
    (name "seqan")
    (version "3.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/seqan/seqan3/releases/"
                                  "download/" version "/seqan3-"
                                  version "-Source.tar.xz"))
              (sha256
               (base32
                "1h2z0cvgidhkmh5xsbw75waqbrqbbv6kkrvb0b92xfh3gqpaiz22"))))
    (build-system cmake-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (invoke "ctest" "test" "--output-on-failure"))))))
    (native-inputs
     (list bzip2 cereal zlib))
    (home-page "https://www.seqan.de")
    (synopsis "Library for nucleotide sequence analysis")
    (description
     "SeqAn is a C++ library of efficient algorithms and data structures for
the analysis of sequences with the focus on biological data.  It contains
algorithms and data structures for string representation and their
manipulation, online and indexed string search, efficient I/O of
bioinformatics file formats, sequence alignment, and more.")
    (license license:bsd-3)))

(define-public seqan-2
  (package
    (inherit seqan)
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/seqan/seqan/releases/"
                                  "download/seqan-v" version
                                  "/seqan-library-" version ".tar.xz"))
              (sha256
               (base32
                "19a1rlxx03qy1i1iriicly68w64yjxbv24g9gdywnfmq998v35yx"))))
    ;; The documentation is 7.8MB and the includes are 3.6MB heavy, so it
    ;; makes sense to split the outputs.
    (outputs '("out" "doc"))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       ,#~(begin
            (use-modules (guix build utils))
            (let ((tar #$(this-package-native-input "tar"))
                  (xz  #$(this-package-native-input "xz"))
                  (out #$output)
                  (doc #$output:doc))
              (setenv "PATH" (string-append tar "/bin:" xz "/bin"))
              (invoke "tar" "xvf" #$(this-package-native-input "source"))
              (chdir (string-append "seqan-library-" #$version))
              (copy-recursively "include" (string-append out "/include"))
              (copy-recursively "share"  (string-append doc "/share"))))))
    (native-inputs
     `(("source" ,source)
       ("tar" ,tar)
       ("xz" ,xz)))))

(define-public seqan-1
  (package (inherit seqan)
    (name "seqan")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://packages.seqan.de/seqan-library/"
                                  "seqan-library-" version ".tar.bz2"))
              (sha256
               (base32
                "05s3wrrwn50f81aklfm65i4a749zag1vr8z03k21xm0pdxy47yvp"))))
    ;; The documentation is 7.8MB and the includes are 3.6MB heavy, so it
    ;; makes sense to split the outputs.
    (outputs '("out" "doc"))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       ,#~(begin
            (use-modules (guix build utils))
            (let ((tar  #$(this-package-native-input "tar"))
                  (bzip #$(this-package-native-input "bzip2"))
                  (out #$output)
                  (doc #$output:doc))
              (setenv "PATH" (string-append tar "/bin:" bzip "/bin"))
              (invoke "tar" "xvf" #$(this-package-native-input "source"))
              (chdir (string-append "seqan-library-" #$version))
              (copy-recursively "include" (string-append out "/include"))
              (copy-recursively "share"  (string-append doc "/share"))))))
    (native-inputs
     `(("source" ,source)
       ("tar" ,tar)
       ("bzip2" ,bzip2)))))

(define-public seqmagick
  (package
    (name "seqmagick")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "seqmagick" version))
       (sha256
        (base32
         "0c6skyig8fyylnbj4597pjj9h0dn36rkxrhwd34yrsc6k6f7r8a0"))))
    (build-system pyproject-build-system)
    (inputs
     (list python-biopython python-pygtrie))
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/fhcrc/seqmagick")
    (synopsis "Tools for converting and modifying sequence files")
    (description
     "Bioinformaticians often have to convert sequence files between formats
and do little manipulations on them, and it's not worth writing scripts for
that.  Seqmagick is a utility to expose the file format conversion in
BioPython in a convenient way.  Instead of having a big mess of scripts, there
is one that takes arguments.")
    (license license:gpl3)))

(define-public seqtk
  (package
    (name "seqtk")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lh3/seqtk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1bfzlqa84b5s1qi22blmmw2s8xdyp9h9ydcq22pfjhh5gab3yz6l"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'check
           ;; There are no tests, so we just run a sanity check.
           (lambda _ (invoke "./seqtk" "seq") #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin/")))
               (install-file "seqtk" bin)
               #t))))))
    (inputs
     (list zlib))
    (home-page "https://github.com/lh3/seqtk")
    (synopsis "Toolkit for processing biological sequences in FASTA/Q format")
    (description
     "Seqtk is a fast and lightweight tool for processing sequences in the
FASTA or FASTQ format.  It parses both FASTA and FASTQ files which can be
optionally compressed by gzip.")
      (license license:expat)))

(define-public snap-aligner
  (package
    (name "snap-aligner")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amplab/snap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0yag3jcazdqfxgmw0vbi91i98kj9sr0aqx83qqj6m5b45wxs7jms"))))
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests? (invoke "./unit_tests"))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (install-file "snap-aligner" bin)
               (install-file "SNAPCommand" bin)))))))
    (native-inputs
     (list zlib))
    (home-page "https://snap.cs.berkeley.edu/")
    (synopsis "Short read DNA sequence aligner")
    (description
     "SNAP is a fast and accurate aligner for short DNA reads.  It is
optimized for modern read lengths of 100 bases or higher, and takes advantage
of these reads to align data quickly through a hash-based indexing scheme.")
    ;; 32-bit systems are not supported by the unpatched code.
    ;; Following the bug reports https://github.com/amplab/snap/issues/68 and
    ;; https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=812378 we see that
    ;; systems without a lot of memory cannot make good use of this program.
    (supported-systems '("x86_64-linux"))
    (license license:asl2.0)))

(define-public sortmerna
  (package
    (name "sortmerna")
    (version "4.3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/biocore/sortmerna")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0f8jfc8vsq6llhbb92p9yv7nbp566yqwfcmq3g2hw0n7d8hyl3a8"))))
    (build-system cmake-build-system)
    (outputs '("out"      ;for binaries
               "db"))     ;for sequence databases
    (arguments
     (list
      #:tests? #false ;unclear how to run them
      #:configure-flags
      #~(list "-DWITH_TESTS=ON"
              "-DCMAKE_CXX_FLAGS=-pthread"
              "-DZLIB_STATIC=OFF"
              "-DROCKSDB_STATIC=OFF"
              "-DPORTABLE=OFF" ;do not use static linking
              (string-append "-DROCKSDB_HOME="
                             #$(this-package-input "rocksdb"))
              (string-append "-DRAPIDJSON_HOME="
                             #$(this-package-input "rapidjson"))
              (string-append "-DRapidJson_DIR="
                             #$(this-package-input "rapidjson")
                             "/lib/cmake/RapidJSON")
              (string-append "-DRapidJSON_INCLUDE_DIR="
                             #$(this-package-input "rapidjson")
                             "/include"))
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'find-concurrentqueue-headers
           (lambda* (#:key inputs #:allow-other-keys)
             ;; Ensure that headers can be found
             (setenv "CPLUS_INCLUDE_PATH"
                     (string-append (search-input-directory
                                     inputs "/include/concurrentqueue")
                                    ":"
                                    (or (getenv "CPLUS_INCLUDE_PATH") "")))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out   (assoc-ref outputs "out"))
                    (bin   (string-append out "/bin"))
                    (db    (assoc-ref outputs "db"))
                    (share
                     (string-append db "/share/sortmerna/rRNA_databases")))
               (install-file "src/sortmerna" bin)
               (for-each (lambda (file)
                           (install-file file share))
                         (find-files "../source/data/rRNA_databases" ".*fasta"))))))))
    (inputs
     (list concurrentqueue
           gflags ; because of rocksdb
           rapidjson rocksdb zlib))
    (native-inputs
     (list pkg-config))
    (home-page "https://bioinfo.lifl.fr/RNA/sortmerna/")
    (synopsis "Biological sequence analysis tool for NGS reads")
    (description
     "SortMeRNA is a biological sequence analysis tool for filtering, mapping
and @acronym{OTU, operational taxonomic unit} picking of @acronym{NGS, next
generation sequencing} reads.  The core algorithm is based on approximate seeds
and allows for fast and sensitive analyses of nucleotide sequences.  The main
application of SortMeRNA is filtering rRNA from metatranscriptomic data.")
    ;; The source includes x86 specific code
    (supported-systems '("x86_64-linux" "i686-linux"))
    (license license:lgpl3)))

(define-public star
  (package
    (name "star")
    (version "2.7.8a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexdobin/STAR")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0zc5biymja9zml9yizcj1h68fq9c6sxfcav8a0lbgvgsm44rvans"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (substitute* "source/Makefile"
                    (("/bin/rm") "rm"))
                  ;; Remove pre-built binaries and bundled htslib sources.
                  (delete-file-recursively "bin/MacOSX_x86_64")
                  (delete-file-recursively "bin/Linux_x86_64")
                  (delete-file-recursively "bin/Linux_x86_64_static")
                  (delete-file-recursively "source/htslib")
                  #t))))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f ;no check target
       #:make-flags '("STAR")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'enter-source-dir
           (lambda _ (chdir "source") #t))
         (add-after 'enter-source-dir 'make-reproducible
           (lambda _
             (substitute* "Makefile"
               (("(COMPILATION_TIME_PLACE=\")(.*)(\")" _ pre mid post)
                (string-append pre "Built with Guix" post)))
             #t))
         ;; See https://github.com/alexdobin/STAR/pull/562
         (add-after 'enter-source-dir 'add-missing-header
           (lambda _
             (substitute* "SoloReadFeature_inputRecords.cpp"
               (("#include \"binarySearch2.h\"" h)
                (string-append h "\n#include <math.h>")))
             #t))
         (add-after 'enter-source-dir 'do-not-use-bundled-htslib
           (lambda _
             (substitute* "Makefile"
               (("(Depend.list: \\$\\(SOURCES\\) parametersDefault\\.xxd) htslib"
                 _ prefix) prefix))
             (substitute* '("BAMfunctions.cpp"
                            "signalFromBAM.h"
                            "bam_cat.h"
                            "bam_cat.c"
                            "STAR.cpp"
                            "bamRemoveDuplicates.cpp")
               (("#include \"htslib/([^\"]+\\.h)\"" _ header)
                (string-append "#include <" header ">")))
             (substitute* "IncludeDefine.h"
               (("\"htslib/(htslib/[^\"]+.h)\"" _ header)
                (string-append "<" header ">")))
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin/")))
               (install-file "STAR" bin))
             #t))
         (delete 'configure))))
    (native-inputs
     (list xxd))
    (inputs
     (list htslib zlib))
    (home-page "https://github.com/alexdobin/STAR")
    (synopsis "Universal RNA-seq aligner")
    (description
     "The Spliced Transcripts Alignment to a Reference (STAR) software is
based on a previously undescribed RNA-seq alignment algorithm that uses
sequential maximum mappable seed search in uncompressed suffix arrays followed
by seed clustering and stitching procedure.  In addition to unbiased de novo
detection of canonical junctions, STAR can discover non-canonical splices and
chimeric (fusion) transcripts, and is also capable of mapping full-length RNA
sequences.")
    ;; Only 64-bit systems are supported according to the README.
    (supported-systems '("x86_64-linux" "mips64el-linux"))
    ;; STAR is licensed under GPLv3 or later; htslib is MIT-licensed.
    (license license:gpl3+)))

(define-public star-for-pigx
  (package
    (inherit star)
    (name "star")
    (version "2.7.3a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexdobin/STAR")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1hgiqw5qhs0pc1xazzihcfd92na02xyq2kb469z04y1v51kpvvjq"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (substitute* "source/Makefile"
                    (("/bin/rm") "rm"))
                  ;; Remove pre-built binaries and bundled htslib sources.
                  (delete-file-recursively "bin/MacOSX_x86_64")
                  (delete-file-recursively "bin/Linux_x86_64")
                  (delete-file-recursively "bin/Linux_x86_64_static")
                  (delete-file-recursively "source/htslib")
                  #t))))))

(define-public starlong
  (package (inherit star)
    (name "starlong")
    (arguments
     (substitute-keyword-arguments (package-arguments star)
       ((#:make-flags flags)
        `(list "STARlong"))
       ((#:phases phases)
        `(modify-phases ,phases
           ;; Allow extra long sequence reads.
           (add-after 'unpack 'make-extra-long
             (lambda _
               (substitute* "source/IncludeDefine.h"
                 (("(#define DEF_readNameLengthMax ).*" _ match)
                  (string-append match "900000\n")))
               #t))
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((bin (string-append (assoc-ref outputs "out") "/bin/")))
                 (install-file "STARlong" bin))
               #t))))))))

(define-public subread
  (package
    (name "subread")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/subread/subread-"
                                  version "/subread-" version "-source.tar.gz"))
              (sha256
               (base32
                "0szmllia7jl0annk5568xjhw6cc8yj1c5mb961qk5m0lz6ig7kjn"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ;no "check" target
      ;; The CC and CCFLAGS variables are set to contain a lot of x86_64
      ;; optimizations by default, so we override these flags such that x86_64
      ;; flags are only added when the build target is an x86_64 system.
       #:make-flags
       (list (let ((system ,(or (%current-target-system)
                                (%current-system)))
                   (flags '("-ggdb" "-fomit-frame-pointer"
                            "-ffast-math" "-funroll-loops"
                            "-fmessage-length=0" "-fcommon"
                            "-O9" "-Wall" "-DMAKE_FOR_EXON"
                            "-DMAKE_STANDALONE"
                            "-DSUBREAD_VERSION=\\\"${SUBREAD_VERSION}\\\""))
                   (flags64 '("-mmmx" "-msse" "-msse2" "-msse3")))
               (if (string-prefix? "x86_64" system)
                   (string-append "CCFLAGS=" (string-join (append flags flags64)))
                   (string-append "CCFLAGS=" (string-join flags))))
             "-f" "Makefile.Linux"
             "CC=gcc ${CCFLAGS}")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'enter-dir
           (lambda _ (chdir "src")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin/")))
               (mkdir-p bin)
               (copy-recursively "../bin" bin))))
         ;; no "configure" script
         (delete 'configure))))
    (inputs (list zlib))
    (home-page "https://subread.sourceforge.net/")
    (synopsis "Tool kit for processing next-gen sequencing data")
    (description
     "The subread package contains the following tools: subread aligner, a
general-purpose read aligner; subjunc aligner: detecting exon-exon junctions
and mapping RNA-seq reads; featureCounts: counting mapped reads for genomic
features; exactSNP: a SNP caller that discovers SNPs by testing signals
against local background noises.")
    (license license:gpl3+)))

(define-public stringtie
  (package
    (name "stringtie")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://ccb.jhu.edu/software/stringtie/dl/"
                                  "stringtie-" version ".tar.gz"))
              (sha256
               (base32
                "08w3ish4y9kf9acp7k38iwi8ixa6j51m6qyf0vvfj7yz78a3ai3x"))
              ;; This package bundles an annoying amount of third party source
              ;; code.
              (modules '((guix build utils)))
              (snippet
               '(delete-file-recursively "htslib"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ;no test suite
       #:make-flags '("LIBDEFLATE=-ldeflate"
                      "LIBBZ2=-lbz2"
                      "LIBLZMA=-llzma")
       #:phases
       (modify-phases %standard-phases
         ;; no configure script
         (delete 'configure)
         (add-before 'build 'use-system-samtools
           (lambda _
             (substitute* "Makefile"
               ((" -lm") " -lm -lhts")
               ((" \\$\\{HTSLIB\\}/libhts\\.a") " "))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin/")))
               (install-file "stringtie" bin)))))))
    (inputs
     (list bzip2 htslib-for-stringtie libdeflate zlib))
    (home-page "https://ccb.jhu.edu/software/stringtie/")
    (synopsis "Transcript assembly and quantification for RNA-Seq data")
    (description
     "StringTie is a fast and efficient assembler of RNA-Seq sequence
alignments into potential transcripts.  It uses a novel network flow algorithm
as well as an optional de novo assembly step to assemble and quantitate
full-length transcripts representing multiple splice variants for each gene
locus.  Its input can include not only the alignments of raw reads used by
other transcript assemblers, but also alignments of longer sequences that have
been assembled from those reads.  To identify differentially expressed genes
between experiments, StringTie's output can be processed either by the
Cuffdiff or Ballgown programs.")
    (license license:expat)))

(define-public taxtastic
  (package
    (name "taxtastic")
    (version "0.9.2")
    (source (origin
              ;; The Pypi version does not include tests.
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fhcrc/taxtastic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1k6wg9ych1j3srnhdny1y4470qlhfg730rb3rm3pq7l7gw62vmgb"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'prepare-directory
           (lambda _
             ;; This test fails, but the error is not caught by the test
             ;; framework, so the tests fail...
             (substitute* "tests/test_taxit.py"
               (("self.cmd_fails\\(''\\)")
                "self.cmd_fails('nothing')"))
             ;; This version file is expected to be created with git describe.
             (mkdir-p "taxtastic/data")
             (with-output-to-file "taxtastic/data/ver"
               (lambda () (display ,version)))))
         (replace 'check
           ;; Note, this fails to run with "-v" as it tries to write to a
           ;; closed output stream.
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "python" "-m" "unittest"))))
         ;; This fails because it cannot find psycopg2 even though it is
         ;; available.
         (delete 'sanity-check))))
    (propagated-inputs
     (list python-sqlalchemy
           python-decorator
           python-biopython
           python-pandas
           python-psycopg2
           python-fastalite
           python-pyyaml
           python-six
           python-jinja2
           python-dendropy))
    (home-page "https://github.com/fhcrc/taxtastic")
    (synopsis "Tools for taxonomic naming and annotation")
    (description
     "Taxtastic is software written in python used to build and maintain
reference packages i.e. collections of reference trees, reference alignments,
profiles, and associated taxonomic information.")
    (license license:gpl3+)))

(define-public vcftools
  (package
    (name "vcftools")
    (version "0.1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vcftools/vcftools/releases/download/v"
                    version "/vcftools-" version ".tar.gz"))
              (sha256
               (base32
                "1qqlx7flfv7axrjwkaz6njkscsl1d0jw98ns8d8bh1n1hd1pgz6v"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; no "check" target
       #:make-flags
       ,#~(list
           "CFLAGS=-O2"                 ; override "-m64" flag
           (string-append "PREFIX=" #$output)
           (string-append "MANDIR=" #$output "/share/man/man1"))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list perl zlib))
    (home-page "https://vcftools.github.io/")
    (synopsis "Tools for working with VCF files")
    (description
     "VCFtools is a program package designed for working with VCF files, such
as those generated by the 1000 Genomes Project.  The aim of VCFtools is to
provide easily accessible methods for working with complex genetic variation
data in the form of VCF files.")
    ;; The license is declared as LGPLv3 in the README and
    ;; at https://vcftools.github.io/license.html
    (license license:lgpl3)))

(define-public infernal
  (package
    (name "infernal")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://eddylab.org/software/infernal/"
                                  "infernal-" version ".tar.gz"))
              (sha256
               (base32
                "1z4mgwqg1j4n5ika08ai8mg9yjyjhf4821jp83v2bgwzxrykqjgr"))))
    (build-system gnu-build-system)
    (native-inputs
     (list perl python)) ; for tests
    (home-page "http://eddylab.org/infernal/")
    (synopsis "Inference of RNA alignments")
    (description "Infernal (\"INFERence of RNA ALignment\") is a tool for
searching DNA sequence databases for RNA structure and sequence similarities.
It is an implementation of a special case of profile stochastic context-free
grammars called @dfn{covariance models} (CMs).  A CM is like a sequence
profile, but it scores a combination of sequence consensus and RNA secondary
structure consensus, so in many cases, it is more capable of identifying RNA
homologs that conserve their secondary structure more than their primary
sequence.")
    ;; Infernal 1.1.3 requires VMX or SSE capability for parallel instructions.
    (supported-systems '("i686-linux" "x86_64-linux"))
    (license license:bsd-3)))

(define-public r-ggexpress
  (let ((commit "82f169385f87af328ff971195c2f64ff3c573a8a")
        (revision "1"))
    (package
      (name "r-ggexpress")
      (version (git-version "0.6.6" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vertesy/ggExpress")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "122hnw8xv33ngcd4fd7hmf817a06ih1knrxxi0cgklj1fwinm0z4"))))
      (properties `((upstream-name . "ggExpress")))
      (build-system r-build-system)
      (propagated-inputs (list r-cowplot
                               r-ggplot2
                               r-ggpubr
                               r-markdownhelpers
                               r-markdownreports
                               r-rcolorbrewer
                               r-sessioninfo
                               r-seurat
                               r-sm
                               r-stringendo
                               r-tidyverse))
      (home-page "https://github.com/vertesy/ggExpress")
      (synopsis
       "This is a fast tool to create, annotate and export plots in R")
      (description
       "This package is a set of R functions for generating precise figures.
This tool helps you to create clean markdown reports about what you just
discovered with your analysis script.")
      (license license:gpl3))))

(define-public r-gg3d
  (let ((commit "ffdd837d30c1671cd0895db94bdd7b1594dbfcb0")
        (revision "1"))
    (package
      (name "r-gg3d")
      (version (git-version "0.0.0.9000" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/AckerDWM/gg3D")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0vz5laj5vz9m1jzb7h7q9f37zjmxwhylhaidlsg61r57wpxvjr3p"))))
      (properties `((upstream-name . "gg3D")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-dplyr
             r-ggplot2
             r-magrittr
             r-plot3d
             r-plyr
             r-scales))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/AckerDWM/gg3D")
      (synopsis "3D perspective plots for ggplot2")
      (description
       "This package adds 3D perspective plotting of points, paths, and line,
3D perspective axes, 3D perspective annotations, and wireframe plots.")
      (license license:gpl3+))))

(define-public r-ggsankey
  (let ((commit "be08dd0f86eaee9f9ff9e7ff95d47930660a3c36")
        (revision "1"))
    (package
      (name "r-ggsankey")
      (version (git-version "0.0.99999" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/davidsjoberg/ggsankey")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0acpmydqqc91pq5p9wpkpmgqp3nhiljabd7d3i00kwhjxgm2bvba"))))
      (properties `((upstream-name . "ggsankey")))
      (build-system r-build-system)
      (propagated-inputs (list r-dplyr
                               r-ggplot2
                               r-magrittr
                               r-purrr
                               r-stringr
                               r-tidyr))
      (home-page "https://github.com/davidsjoberg/ggsankey")
      (synopsis "Sankey, Alluvial and Sankey bump plots")
      (description
       "This package provides a package that makes it easy to implement
sankey, alluvial and sankey bump plots in @code{ggplot2}.")
      (license license:expat))))

(define-public r-gutils
  (let ((commit "10e36c7b580aacb2d952140a3fdd82418aaddea6")
        (revision "1"))
    (package
      (name "r-gutils")
      (version (git-version "0.2.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/mskilab/gUtils")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1wq9kd1afzy7ii510r20c4n9fkykj6p15q5c85ws27h1q5w4ghxy"))))
      (properties `((upstream-name . "gUtils")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-biocgenerics
             r-data-table
             r-genomeinfodb
             r-genomicranges
             r-iranges
             r-matrix
             r-s4vectors
             r-stringr))
      (home-page "https://github.com/mskilab/gUtils")
      (synopsis "Additional capabilities and speed for GenomicRanges operations")
      (description
       "This is an R package providing additional capabilities and speed for
@code{GenomicRanges} operations.")
      (license license:gpl2))))

(define-public r-bamutils
  (let ((commit "639dba901f16944fa1b7a8d7048701ba86a2cdb8")
        (revision "1"))
    (package
      (name "r-bamutils")
      (version (git-version "0.0.0.9000" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/mskilab/bamutils/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0qwby2v5rydnipvf1iv1wz9nf02yq98k0xbc4inf9mqc54jwacs0"))))
      (properties `((upstream-name . "bamUtils")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-abind
             r-biocgenerics
             r-data-table
             r-genomicalignments
             r-genomicranges
             r-gutils
             r-rsamtools
             r-variantannotation))
      (home-page "https://github.com/mskilab/bamutils/")
      (synopsis "Utility functions for manipulating BAMs")
      (description "This package provides utility functions for manipulating
BAM files.")
      (license license:gpl2))))

(define-public r-gtrack
  (let ((commit "a694fa36cedafca2658da79fc8e5b673535b15e5")
        (revision "1"))
    (package
      (name "r-gtrack")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/mskilab/gTrack/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "070qlrbqsbj9max2vx740zigqh0ymvnw2pm1ia5la3wb4dbfwh2b"))))
      (properties `((upstream-name . "gTrack")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-biocgenerics
             r-data-table
             r-genomeinfodb
             r-genomicranges
             r-gutils
             r-iranges
             r-matrix
             r-rcolorbrewer
             r-rcpp
             r-rcurl
             r-rtracklayer
             r-s4vectors))
      (home-page "https://github.com/mskilab/gTrack/")
      (synopsis "Plot tracks of complex genomic data across multiple genomic windows")
      (description
       "This package provides an object for plotting GRanges, RleList, UCSC
file formats, and ffTrack objects in multi-track panels.")
      (license license:gpl2))))

(define-public r-gchain
  (let ((commit "dc393e8dd0d8efaf36270c04d7112db8553db36a")
        (revision "1"))
    (package
      (name "r-gchain")
      (version (git-version "0.2.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/mskilab/gChain/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "105wgi5w2fhwq1grsvj6zjigwg0sny3z7zr577q8ki3qffjwdkj0"))))
      (properties `((upstream-name . "gChain")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-bamutils
             r-biostrings
             r-data-table
             r-genomicalignments
             r-genomicranges
             r-gtrack
             r-gutils
             r-matrix
             r-rtracklayer))
      (home-page "https://github.com/mskilab/gChain/")
      (synopsis "Additional capabilities and speed for GenomicRanges operations")
      (description
       "This R package provides additional capabilities and speed for
GenomicRanges operations.")
      (license license:gpl2))))

(define-public r-skitools
  (let ((commit "22d107d32f063eb891eb5e7fb36996d1c0b0d2bc")
        (revision "1"))
    (package
      (name "r-skitools")
      (version (git-version "0.0.0.9000" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/mskilab/skitools/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1977d9bkdk9l2n6niahfj9vksh9l1ga4g7c3b3x27lj1gc0qgr4z"))))
      (properties `((upstream-name . "skitools")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-biostrings
             r-complexheatmap
             r-data-table
             r-devtools
             r-dt
             r-gchain
             r-genomeinfodb
             r-genomicranges
             r-ggplot2
             r-gplots
             r-gutils
             r-htmlwidgets
             r-hwriter
             r-igraph
             r-iranges
             r-plotly
             r-rcolorbrewer
             r-reshape2
             r-s4vectors
             r-stringr
             r-variantannotation))
      (home-page "https://github.com/mskilab/skitools/")
      (synopsis "Various mskilab R utilities")
      (description
       "This package provides R miscellaneous utilities for basic data
manipulation, debugging, visualization, lsf management, and common mskilab
tasks.")
      (license license:expat))))

(define-public r-chromunity
  (let ((commit "09fce8bc12cb84b45a6ea25bf8db6e5b75113d4f")
        (revision "1"))
    (package
      (name "r-chromunity")
      (version (git-version "0.0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/mskilab/chromunity")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0lp0h614k8fq6h9gpbylk4chh7q6w4qda8lx03ajrpppxmg7al2d"))))
      (properties `((upstream-name . "chromunity")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-arrow
             r-biocgenerics
             r-data-table
             r-gchain
             r-genomicranges
             r-gutils
             r-igraph
             r-magrittr
             r-mass
             r-matrix
             r-pbmcapply
             r-plyr
             r-r6
             r-skitools
             r-zoo))
      (home-page "https://github.com/mskilab/chromunity")
      (synopsis "Discovery of communities in Pore-C concatemers")
      (description "This is a package for the discovery of communities in
Pore-C concatemers.")
      (license license:gpl3))))

(define-public r-doubletcollection
  (let ((commit "c0d62f1853942ee6a087eaf7b000d9e4261e2dfd")
        (revision "1"))
    (package
      (name "r-doubletcollection")
      (version (git-version "1.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/xnnba1984/DoubletCollection")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "02cvibyc2nwc4037ramm5cskjwyrb9ib9hkrfhmvhbslkn5ixz1v"))))
      (properties `((upstream-name . "DoubletCollection")))
      (build-system r-build-system)
      (propagated-inputs (list r-biocgenerics
                               r-doubletfinder
                               r-gam
                               r-ggplot2
                               r-ggthemes
                               r-mast
                               r-mclust
                               r-prroc
                               r-reticulate
                               r-scales
                               r-scdblfinder
                               r-scds
                               r-seurat
                               r-singlecellexperiment
                               r-slingshot
                               r-summarizedexperiment
                               python
                               python-scrublet
                               python-doubletdetection))
      (home-page "https://github.com/xnnba1984/DoubletCollection")
      (synopsis "Tool for finding doublets in scRNA-seq data")
      (description
       "This is an R package that integrates the installation of
doublet-detection methods.  In addition, this tool is used for execution and
benchmark of those eight mentioned methods.")
      (license license:gpl3+))))

(define-public r-plsdabatch
  (let ((commit "4aadf3a99709afae462db310386b6cf5db20088c")
        (revision "1"))
    (package
      (name "r-plsdabatch")
      (version (git-version "0.2.3" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/EvaYiwenWang/PLSDAbatch")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "047l923lq2ji7rwybh9b9zkblzvvhkpli5gb2x8g2q9f2n5022nr"))))
      (properties `((upstream-name . "PLSDAbatch")))
      (build-system r-build-system)
      (propagated-inputs (list r-ggplot2
                               r-ggpubr
                               r-gridextra
                               r-lmertest
                               r-mixomics
                               r-mvtnorm
                               r-performance
                               r-rdpack
                               r-scales))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/EvaYiwenWang/PLSDAbatch")
      (synopsis "PLSDA-batch")
      (description
       "This package provides a new batch effect correction method based on
Projection to Latent Structures Discriminant Analysis named “PLSDA-batch” to
correct data prior to any downstream analysis.  PLSDA-batch estimates latent
components related to treatment and batch effects to remove batch variation.
The method is multivariate, non-parametric and performs dimension reduction.
Combined with centered log ratio transformation for addressing uneven library
sizes and compositional structure, PLSDA-batch addresses all characteristics
of microbiome data that existing correction methods have ignored so far.")
      (license license:gpl3))))

(define-public r-psupertime
  (let ((commit "73825a28d3bd9bc881c15ee0c4c218eec1c9c207")
        (revision "1"))
    (package
      (name "r-psupertime")
      (version (git-version "0.2.6" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/wmacnair/psupertime")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "00h1r3ffz6m9dwcgkvyki8405b059qn6mnjsd8d76a1rabaf2vfh"))))
      (properties `((upstream-name . "psupertime")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-cowplot
             r-data-table
             r-fastcluster
             r-forcats
             r-ggplot2
             r-glmnet
             r-knitr
             r-matrix
             r-rcolorbrewer
             r-scales
             r-scran
             r-singlecellexperiment
             r-stringr
             r-summarizedexperiment
             r-topgo))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/wmacnair/psupertime")
      (synopsis
       "Psupertime is supervised pseudotime for single cell RNAseq data")
      (description
       "Psupertime is supervised pseudotime for single cell RNAseq data.  It
uses single cell RNAseq data, where the cells have a known ordering.  This
ordering helps to identify a small number of genes which place cells in that
known order.  It can be used for discovery of relevant genes, for
identification of subpopulations, and characterization of further unknown or
differently labelled data.")
      (license license:gpl3))))

(define-public r-pando
  (package
    (name "r-pando")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/quadbiolab/Pando")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c83anzdrbvg47p9xns2bxpjlx5z328can3jmzilw6rygwp7hyii"))))
    (properties `((upstream-name . "Pando")))
    (build-system r-build-system)
    (propagated-inputs
     (list r-bayestestr
           r-brms
           r-foreach
           r-genomicranges
           r-ggplot2
           r-ggpointdensity
           r-ggraph
           r-glmnetutils
           r-iranges
           r-irlba
           r-matrix
           r-motifmatchr
           r-pals
           r-patchwork
           r-seurat
           r-signac
           r-sparsematrixstats
           r-tfbstools
           r-tidygraph
           r-tidyverse
           r-uwot
           r-xgboost))
    (native-inputs (list r-knitr))
    (home-page "https://github.com/quadbiolab/Pando")
    (synopsis "Infer regulomes from multi-modal single-cell genomics data")
    (description
     "Pando leverages multi-modal single-cell measurements to infer gene
regulatory networks using a flexible linear model-based framework.  By
modeling the relationship between TF-binding site pairs with the expression of
target genes, Pando simultaneously infers gene modules and sets of regulatory
regions for each transcription factor.")
    (license license:expat)))

(define-public r-premessa
  (let ((commit "68b42bb984637d0f3ad6a0ecc83e9278994afc85")
        (revision "1"))
    (package
      (name "r-premessa")
      (version (git-version "0.3.4" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/ParkerICI/premessa")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1l0q431zk0lvg22130nx84gdqi7cpl05yah4am63lbx6m4c769pb"))
                (snippet
                 '(delete-file "inst/normalizer_shinyGUI/www/d3.min.js"))))
      (properties `((upstream-name . "premessa")))
      (build-system r-build-system)
      (arguments
       (list
        #:phases
        '(modify-phases %standard-phases
           (add-after 'unpack 'process-javascript
             (lambda* (#:key inputs #:allow-other-keys)
               (with-directory-excursion "inst/normalizer_shinyGUI/www/"
                 (invoke "esbuild" (assoc-ref inputs "d3.v4.js")
                         "--minify" "--outfile=d3.min.js")))))))
      (propagated-inputs
       (list r-data-table
             r-flowcore
             r-ggplot2
             r-gridextra
             r-hexbin
             r-jsonlite
             r-reshape
             r-rhandsontable
             r-shiny
             r-shinyjqui))
      (native-inputs
       `(("esbuild" ,esbuild)
         ("d3.v4.js"
          ,(origin
             (method url-fetch)
             (uri "https://d3js.org/d3.v4.js")
             (sha256
              (base32
               "0y7byf6kcinfz9ac59jxc4v6kppdazmnyqfav0dm4h550fzfqqlg"))))))
      (home-page "https://github.com/ParkerICI/premessa")
      (synopsis "Pre-processing of flow and mass cytometry data")
      (description
       "This is an R package for pre-processing of flow and mass cytometry
data.  This package includes panel editing or renaming for FCS files,
bead-based normalization and debarcoding.")
      (license license:gpl3))))

(define-public r-presto
  (let ((commit "052085db9c88aa70a28d11cc58ebc807999bf0ad")
        (revision "0"))
    (package
      (name "r-presto")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/immunogenomics/presto")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1c3fmag4r4p2lvbvxlxyck9dvfw1prbwcl9665mmlx4a35750hk8"))))
      (properties `((upstream . "presto")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-data-table
             r-deseq2
             r-dplyr
             r-matrix
             r-rcpp
             r-rcpparmadillo
             r-reshape2
             r-rlang
             r-tidyr))
      (home-page "https://github.com/immunogenomics/presto")
      (synopsis "Fast Functions for Differential Expression using Wilcox and AUC")
      (description "This package performs a fast Wilcoxon rank sum test and
auROC analysis.")
      (license license:gpl3))))

(define-public r-sccustomize
  (let ((commit "8414d1f5fb32277855b0619191a568932b7baeb0")
        (revision "1"))
    (package
      (name "r-sccustomize")
      (version (git-version "0.7.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/samuel-marsh/scCustomize")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1wcgfq7lx83a2kf8pjbw524gdvxf351n08cwd5wzmmy57kf4knbj"))))
      (properties `((upstream-name . "scCustomize")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-circlize
             r-colorway
             r-cowplot
             r-data-table
             r-dittoseq
             r-dplyr
             r-forcats
             r-ggbeeswarm
             r-ggplot2
             r-ggprism
             r-ggpubr
             r-ggrastr
             r-ggrepel
             r-glue
             r-janitor
             r-magrittr
             r-matrix
             r-paletteer
             r-patchwork
             r-pbapply
             r-purrr
             r-remotes
             r-scales
             r-scattermore
             r-seurat
             r-seuratobject
             r-stringi
             r-stringr
             r-tibble
             r-tidyr
             r-tidyselect
             r-viridis))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/samuel-marsh/scCustomize")
      (synopsis "Custom visualization and analyses of single-cell sequencing")
      (description
       "This is a collection of functions created and/or curated to aid in the
visualization and analysis of single-cell data using R.")
      (license license:gpl3+))))

(define-public r-markdownhelpers
  (let ((commit "793372d28ebed607cc1d35f909a1caedb2b41ffe")
        (revision "1"))
    (package
      (name "r-markdownhelpers")
      (version (git-version "0.2.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vertesy/MarkdownHelpers")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1d18s2ydhfjm3hjkxz42dirhwrrv792m6mvkmypallaa2qnwrmkg"))))
      (properties `((upstream-name . "MarkdownHelpers")))
      (build-system r-build-system)
      (propagated-inputs (list r-devtools r-stringendo r-usethis))
      (home-page "https://github.com/vertesy/MarkdownHelpers")
      (synopsis "Helper functions for MarkdownReports and ggExpress")
      (description
       "This package provides a set of R functions to parse markdown and other
generic helpers.")
      (license license:gpl3))))

(define-public r-markdownreports
  (let ((commit "3ba1103e3ddc6df3a0c090eb884f5e65c461eb31")
        (revision "1"))
    (package
      (name "r-markdownreports")
      (version (git-version "4.5.9" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vertesy/MarkdownReports")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1xmasdb630b6nvxi5m1i8pyxiy49nxpzyxf9h8spdppx92rhdkc8"))))
      (properties `((upstream-name . "MarkdownReports")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-clipr
             r-codeandroll2
             r-colorramps
             r-devtools
             r-gplots
             r-markdownhelpers
             r-rcolorbrewer
             r-readwriter
             r-sessioninfo
             r-sm
             r-stringendo
             r-venndiagram
             r-vioplot))
      (home-page "https://github.com/vertesy/MarkdownReports")
      (synopsis "Tool for generating cientific figures and reports")
      (description
       "This is a set of R functions that allows you to generate precise
figures.  This tool will create clean markdown reports about what you just
discovered.")
      (license license:gpl3))))

(define-public r-snapatac
  (package
    (name "r-snapatac")
    (version "2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/r3fang/SnapATAC")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "037jzlbl436fi7lkpq7d83i2vd1crnrik3vac2x6xj75dbikb2av"))))
    (properties `((upstream-name . "SnapATAC")))
    (build-system r-build-system)
    (propagated-inputs
      (list r-bigmemory
            r-doparallel
            r-dosnow
            r-edger
            r-foreach
            r-genomicranges
            r-igraph
            r-iranges
            r-irlba
            r-matrix
            r-plyr
            r-plot3d
            r-rann
            r-raster
            r-rcolorbrewer
            r-rhdf5
            r-rtsne
            r-scales
            r-viridis))
    (home-page "https://github.com/r3fang/SnapATAC")
    (synopsis "Single nucleus analysis package for ATAC-Seq")
    (description
      "This package provides a fast and accurate analysis toolkit for single
cell ATAC-seq (Assay for transposase-accessible chromatin using sequencing).
Single cell ATAC-seq can resolve the heterogeneity of a complex tissue and
reveal cell-type specific regulatory landscapes.  However, the exceeding data
sparsity has posed unique challenges for the data analysis.  This package
@code{r-snapatac} is an end-to-end bioinformatics pipeline for analyzing large-
scale single cell ATAC-seq data which includes quality control, normalization,
clustering analysis, differential analysis, motif inference and exploration of
single cell ATAC-seq sequencing data.")
    (license license:gpl3)))

(define-public r-tictoc
  (package
    (name "r-tictoc")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "tictoc" version))
              (sha256
               (base32
                "037jbwb58mj5asf3kr6hpf3fy9c6fkinnd8hbpfb141a2jsa8pph"))))
    (properties `((upstream-name . "tictoc")))
    (build-system r-build-system)
    (home-page "https://github.com/jabiru/tictoc")
    (synopsis
     "Time R scripts and implementations of stack and list structures")
    (description
     "The tictoc package provides the timing functions @code{tic} and
@code{toc} that can be nested.  It provides an alternative to
@code{system.time()} with a different syntax similar to that in another
well-known software package.  @code{tic} and @code{toc} are easy to use, and
are especially useful when timing several sections in more than a few lines of
code.")
    (license license:asl2.0)))

(define-public r-tsis
  (let ((commit "24460298fbe1d26e4da390f6e4f3d4d9d62334dc")
        (revision "1"))
    (package
      (name "r-tsis")
      (version (git-version "0.2.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/wyguo/TSIS")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "17c8i25iwhldvs3c51m0wny40iffm8szzijalpwrxhzbv0xa94rb"))))
      (properties `((upstream-name . "TSIS")))
      (build-system r-build-system)
      (native-inputs (list r-knitr))
      (home-page "https://github.com/wyguo/TSIS")
      (synopsis "Time-series isoform switch of alternative splicing")
      (description
       "TSIS is used for detecting transcript isoform switches in time-series
data.  Transcript isoform switches occur when a pair of alternatively spliced
isoforms reverse the order of their relative expression levels.  TSIS
characterizes the transcript switch by defining the isoform switch time-points
for any pair of transcript isoforms within a gene.  In addition, this tool
describes the switch using five different features or metrics.  Also it
filters the results with user’s specifications and visualizes the results
using different plots for the user to examine further details of the
switches.")
      (license license:gpl3))))

(define-public r-umi4cpackage
  (let ((commit "88b07d896a137418ba6c31c2474b9dbe1d86fc20")
        (revision "1"))
    (package
      (name "r-umi4cpackage")
      (version (git-version "0.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tanaylab/umi4cpackage")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0bjzamdw2lcfhlbzc0vdva87c3wwnij8jsvnrpx4wyyxvpcz13m5"))))
      (properties `((upstream-name . "umi4cPackage")))
      (build-system r-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'fix-references
             (lambda _
               (substitute* "inst/conf/paths.conf"
                 (("TG3C\\.bowtie2_bin=.*")
                  (string-append "TG3C.bowtie2_bin="
                                 (which "bowtie2") "\n")))
               (substitute* "inst/perl/map3c/TG3C/import3C.pl"
                 (("\"perl")
                  (string-append "\"" (which "perl")))))))))
      (inputs
       (list perl bowtie))
      (propagated-inputs
       (list r-misha r-zoo))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/tanaylab/umi4cpackage")
      (synopsis "Processing and analysis of UMI-4C contact profiles")
      (description "This is a package that lets you process UMI-4C data from
scratch to produce nice plots.")
      (license license:expat))))

(define-public r-shinycell
  (let ((commit
         "aecbd56e66802f28e397f5ae1f19403aadd12163")
        (revision "1"))
    (package
      (name "r-shinycell")
      (version (git-version "2.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/SGDDNB/ShinyCell")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "13jn2ikmvljnzayk485g1mmq5abcp9m1b8n1djdb1agmn83zaki5"))))
      (properties `((upstream-name . "ShinyCell")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-data-table
             r-ggplot2
             r-glue
             r-gridextra
             r-hdf5r
             r-matrix
             r-r-utils
             r-rcolorbrewer
             r-readr
             r-reticulate))
      (home-page "https://github.com/SGDDNB/ShinyCell")
      (synopsis "Shiny interactive web apps for single-cell data")
      (description
       "This package provides Shiny apps for interactive exploration of
single-cell data.")
      (license license:gpl3))))

(define-public r-archr
  (let ((commit "92ab814f86be0cea75c661f9827a9549c2cf47f5")
        (revision "1"))
    (package
      (name "r-archr")
      (version (git-version "1.0.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/GreenleafLab/ArchR")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1m1vp3kkpvd0fcviv5vb3gcbm3w91ih6gm9ivg48swnbqny44kqb"))))
      (properties `((upstream-name . "ArchR")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-biocgenerics
             r-biostrings
             r-chromvar
             r-complexheatmap
             r-data-table
             r-genomicranges
             r-ggplot2
             r-ggrepel
             r-gridextra
             r-gtable
             r-gtools
             r-magrittr
             r-matrix
             r-matrixstats
             r-motifmatchr
             r-nabor
             r-plyr
             r-rcpp
             r-rhdf5
             r-rsamtools
             r-s4vectors
             r-stringr
             r-summarizedexperiment
             r-uwot))
      (home-page "https://github.com/GreenleafLab/ArchR")
      (synopsis "Analyze single-cell regulatory chromatin in R")
      (description
       "This package is designed to streamline scATAC analyses in R.")
      (license license:gpl2+))))

(define-public r-icellnet
  ;; v1.0 tagged in 2020, last commit contains many fixes.
  ;; DESCRIPTION says Version: 0.0.0.9000.
  (let ((commit "b9c05488fb8b5ea69bd560018966eaf4e25f82a")
        (revision "0"))
    (package
      (name "r-icellnet")
      (version (git-version "1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/soumelis-lab/ICELLNET")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0cld7d6xqnvd0zpcpg3sx73an6vdc9divzywgnn6zxnqcd987cnw"))))
      (build-system r-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'enter-dir
             (lambda _ (chdir "icellnet"))))))
      (propagated-inputs
       (list r-annotationdbi
             r-data-table
             r-dplyr
             r-ggplot2
             r-hgu133plus2-db
             r-jetset
             r-psych
             r-reshape2
             r-rlist))
      (home-page "https://github.com/soumelis-lab/ICELLNET")
      (synopsis "Transcriptomic-based framework to dissect cell communication")
      (description "This package provides a a transcriptomic-based framework
to dissect cell communication in a global manner.  It integrates an original
expert-curated database of ligand-receptor interactions taking into account
multiple subunits expression.  Based on transcriptomic profiles (gene
expression), this package computes communication scores between cells
and provides several visualization modes that can be helpful to dig into
cell-cell interaction mechanism and extend biological knowledge.")
      (license license:gpl3))))

(define-public r-scde
  (package
    (name "r-scde")
    (version "1.99.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hms-dbmi/scde")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "10na2gyka24mszdxf92wz9h2c13hdf1ww30c68gfsw53lvvhhhxb"))))
    (build-system r-build-system)
    (propagated-inputs
     (list r-rcpp
           r-rcpparmadillo
           r-mgcv
           r-rook
           r-rjson
           r-cairo
           r-rcolorbrewer
           r-edger
           r-quantreg
           r-nnet
           r-rmtstat
           r-extremes
           r-pcamethods
           r-biocparallel
           r-flexmix))
    (home-page "https://hms-dbmi.github.io/scde/")
    (synopsis "R package for analyzing single-cell RNA-seq data")
    (description "The SCDE package implements a set of statistical methods for
analyzing single-cell RNA-seq data.  SCDE fits individual error models for
single-cell RNA-seq measurements.  These models can then be used for
assessment of differential expression between groups of cells, as well as
other types of analysis.  The SCDE package also contains the pagoda framework
which applies pathway and gene set overdispersion analysis to identify aspects
of transcriptional heterogeneity among single cells.")
    ;; See https://github.com/hms-dbmi/scde/issues/38
    (license license:gpl2)))

(define-public r-millefy
  (package
    (name "r-millefy")
    (version "0.1.9-beta")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yuifu/millefy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0z2y0x99f761pxvg6n37cmnyrnj699jhjk43pvk05sa86iykgizl"))))
    (properties `((upstream-name . "millefy")))
    (build-system r-build-system)
    (propagated-inputs
     (list r-data-table
           r-destiny
           r-dplyr
           r-genomicranges
           r-iranges
           r-magrittr
           r-rsamtools
           r-rtracklayer
           r-tidyr))
    (home-page "https://github.com/yuifu/millefy")
    (synopsis "Make millefy plot with single-cell RNA-seq data")
    (description "@code{Millefy} is a tool for visualizing read coverage of
@dfn{scRNA-seq}(single-cell RNA sequencing) datasets in genomic contexts.  By
dynamically and automatically reorder single cells based on locus-specific
pseudo time, @code{Millefy} highlights cell-to-cell heterogeneity in read coverage
of scRNA-seq data.")
    (license license:expat)))

(define-public r-misha
  (package
    (name "r-misha")
    (version "4.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tanaylab/misha")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0bgivx3lzjh3173jsfrhb5kvhjsn53br0n4hmyx7i3dwy2cnnp2p"))
       ;; Delete bundled executable.
       (snippet
        '(delete-file "exec/bigWigToWig"))))
    (build-system r-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'do-not-use-bundled-bigWigToWig
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "R/misha.R"
               (("get\\(\".GLIBDIR\"\\), \"/exec/bigWigToWig")
                (string-append "\""
                               (assoc-ref inputs "kentutils")
                               "/bin/bigWigToWig"))))))))
    (inputs
     (list kentutils))
    (home-page "https://github.com/tanaylab/misha")
    (synopsis "Toolkit for analysis of genomic data")
    (description "This package is intended to help users to efficiently
analyze genomic data resulting from various experiments.")
    (license license:gpl2)))

(define-public r-scseqcomm
  (let ((commit "01076e703999f1a5aa76419d821b50aebe2b777a")
        (revision "0"))
    (package
      (name "r-scseqcomm")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://gitlab.com/sysbiobig/scseqcomm")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1fw5si47d6agnz5fibmp2b1sv08pbpwv1j71w57xbav9044i032q"))
         ;; Delete bundled dependency.
         (modules '((guix build utils)))
         (snippet
          '(delete-file-recursively "other_deps"))))
      (build-system r-build-system)
      (inputs
       (list r-add2ggplot
             r-chorddiag
             r-doparallel
             r-dplyr
             r-foreach
             ;;r-grid ;; listed in DESCRIPTION
             r-gridextra
             r-ggplot2
             r-gtable
             r-htmlwidgets
             r-igraph
             r-matrix
             ;;r-methods ;; listed in DESCRIPTION
             r-org-hs-eg-db
             r-psych
             r-rcolorbrewer
             r-rlang
             r-scico
             r-tidygraph
             r-topgo))
      (native-inputs
       (list r-knitr))
      (home-page "https://gitlab.com/sysbiobig/scseqcomm")
      (synopsis "Inter- and intra- cellular signaling from single cell RNA-seq")
      (description "This package is tools for analysing intercellular and
intracellular signaling from single cell RNA-seq (scRNA-seq) data.")
      (license license:gpl3))))

(define-public r-shaman
  (let ((commit "d6944e8ac7bd1dbd5c6cec646eafc1d19d0ca96f")
        (release "2.0")
        (revision "2"))
    (package
      (name "r-shaman")
      (version (git-version release revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/tanaylab/shaman")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "03sx138dzpfiq23j49z0m0s4j79855mrg64hpj9c83408wzphxi6"))
                (snippet
                 ;; This file will be generated.
                 '(delete-file "inst/doc/shaman-package.R"))))
      (build-system r-build-system)
      (propagated-inputs
       (list r-data-table
             r-domc
             r-ggplot2
             r-gviz
             r-misha
             r-plyr
             r-rann
             r-rcpp
             r-reshape2
             ;; For vignettes
             r-rmarkdown
             r-knitr))
      (home-page "https://github.com/tanaylab/shaman")
      (synopsis "Sampling HiC contact matrices for a-parametric normalization")
      (description "The Shaman package implements functions for
resampling Hi-C matrices in order to generate expected contact
distributions given constraints on marginal coverage and
contact-distance probability distributions.  The package also provides
support for visualizing normalized matrices and statistical analysis
of contact distributions around selected landmarks.")
      ;; Any version of the GPL
      (license license:gpl3+))))

(define-public r-centipede
  (package
    (name "r-centipede")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.r-forge.r-project.org/"
                                  "src/contrib/CENTIPEDE_" version ".tar.gz"))
              (sha256
               (base32
                "1hsx6qgwr0i67fhy9257zj7s0ppncph2hjgbia5nn6nfmj0ax6l9"))))
    (build-system r-build-system)
    (home-page "https://centipede.uchicago.edu/")
    (synopsis "Predict transcription factor binding sites")
    (description
     "CENTIPEDE applies a hierarchical Bayesian mixture model to infer regions
of the genome that are bound by particular transcription factors.  It starts
by identifying a set of candidate binding sites, and then aims to classify the
sites according to whether each site is bound or not bound by a transcription
factor.  CENTIPEDE is an unsupervised learning algorithm that discriminates
between two different types of motif instances using as much relevant
information as possible.")
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-demultiplex
  (let ((commit "6e2a1422c8e6f418cfb271997eebc91f9195f299")
        (revision "1"))
    (package
      (name "r-demultiplex")
      (version (git-version "1.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/chris-mcginnis-ucsf/MULTI-seq")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "01kv88wp8vdaq07sjk0d3d1cb553mq1xqg0war81pgmg63bgi38w"))))
      (properties `((upstream-name . "deMULTIplex")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-kernsmooth r-reshape2 r-rtsne r-shortread r-stringdist))
      (home-page "https://github.com/chris-mcginnis-ucsf/MULTI-seq")
      (synopsis "MULTI-seq pre-processing and classification tools")
      (description
       "deMULTIplex is an R package for analyzing single-cell RNA sequencing
data generated with the MULTI-seq sample multiplexing method.  The package
includes software to

@enumerate
@item Convert raw MULTI-seq sample barcode library FASTQs into a sample
  barcode UMI count matrix, and
@item Classify cell barcodes into sample barcode groups.
@end enumerate
")
      (license license:cc0))))

(define-public r-demultiplex2
  (let ((commit "e42bc8310c0ea035af100e6ccea59b46ad6385f5")
        (revision "1"))
    (package
      (name "r-demultiplex2")
      (version (git-version "1.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Gartner-Lab/deMULTIplex2")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "15f3kshsdvm97w24ql9b1wjlfbabimdsam0482hg7jivlvpl8j9w"))))
      (properties `((upstream-name . "deMULTIplex2")))
      (build-system r-build-system)
      (propagated-inputs (list r-data-table
                               r-devtools
                               r-dplyr
                               r-ggextra
                               r-ggplot2
                               r-gridextra
                               r-magrittr
                               r-mass
                               r-matrix
                               r-rcolorbrewer
                               r-shortread
                               r-stringdist
                               r-tidyr
                               r-uwot
                               r-viridis
                               r-xvector))
      (home-page "https://github.com/Gartner-Lab/deMULTIplex2")
      (synopsis "Robust sample demultiplexing for scRNA-seq")
      (description
       "This package implements a bioinformatics algorithm for demultiplexing
multiplexed single cell datasets.  It is built on a statistical model of tag
read counts derived from the physical mechanism of tag cross-contamination.")
      (license license:cc0))))

(define-public r-demuxmix
  (let ((commit "09a7918ca6e0cd23e6bbaed2b97388bc499e248e")
        (revision "1"))
    (package
      (name "r-demuxmix")
      (version (git-version "1.1.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/huklein/demuxmix")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "03kfnns7m2447jsc3xplyv9qx8hvvdjmii7j837g3bb6smyxss96"))))
      (properties `((upstream-name . "demuxmix")))
      (build-system r-build-system)
      (propagated-inputs (list r-ggplot2 r-gridextra r-mass r-matrix))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/huklein/demuxmix")
      (synopsis
       "Demultiplexing oligo-barcoded scRNA-seq data using regression mixture models")
      (description
       "This package is used for demultiplexing single-cell sequencing
experiments of pooled cells.  These cells are labeled with barcode
oligonucleotides.  The package implements methods to fit regression mixture
models for a probabilistic classification of cells, including multiplet
detection.  Demultiplexing error rates can be estimated, and methods for
quality control are provided.")
      (license license:artistic2.0))))

(define-public gdc-client
  (package
    (name "gdc-client")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/NCI-GDC/gdc-client.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0cagawlzjwj3wam10lv64xgbfx4zcnzxi5sjpsdhq7rn4z24mzc2"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'relax-requirements
           (lambda _
             (substitute* "requirements.txt"
               (("==") ">=")))))))
    (inputs
     (list python-cryptography
           python-intervaltree
           python-jsonschema
           python-lxml
           python-ndg-httpsclient
           python-progressbar2
           python-pyasn1
           python-pyopenssl
           python-pyyaml
           python-requests
           python-termcolor))
    (home-page "https://gdc.nci.nih.gov/access-data/gdc-data-transfer-tool")
    (synopsis "GDC data transfer tool")
    (description "The gdc-client provides several convenience functions over
the GDC API which provides general download/upload via HTTPS.")
    (license license:asl2.0)))

(define-public vsearch
  (package
    (name "vsearch")
    (version "2.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/torognes/vsearch")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0vhrpjfdf75ba04b24xknp41790cvcgwl0vgpy7qbzj5xh2521ss"))
       (patches (search-patches "vsearch-unbundle-cityhash.patch"))
       (snippet
        '(begin
           ;; Remove bundled cityhash sources.  The vsearch source is adjusted
           ;; for this in the patch.
           (delete-file "src/city.h")
           (delete-file "src/citycrc.h")
           (delete-file "src/city.cc")
           #t))))
    (build-system gnu-build-system)
    (inputs
     (list zlib bzip2 cityhash))
    (native-inputs
     (list autoconf automake))
    (synopsis "Sequence search tools for metagenomics")
    (description
     "VSEARCH supports DNA sequence searching, clustering, chimera detection,
dereplication, pairwise alignment, shuffling, subsampling, sorting and
masking.  The tool takes advantage of parallelism in the form of SIMD
vectorization as well as multiple threads to perform accurate alignments at
high speed.  VSEARCH uses an optimal global aligner (full dynamic programming
Needleman-Wunsch).")
    (home-page "https://github.com/torognes/vsearch")
    ;; vsearch uses non-portable SSE intrinsics so building fails on other
    ;; platforms.
    (supported-systems '("x86_64-linux"))
    ;; Dual licensed; also includes public domain source.
    (license (list license:gpl3 license:bsd-2))))

(define-public pardre
  (package
    (name "pardre")
    (version "2.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/pardre/ParDRe-rel"
                           version ".tar.gz"))
       (sha256
        (base32
         "105s4f8zs8hh0sc32r9p725n7idza9cj5jvp5z1m5pljjhgk3if5"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; tests require "prove"
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
               (install-file "ParDRe" bin)))))))
    (inputs
     (list openmpi-c++ zlib))
    (synopsis "Parallel tool to remove duplicate DNA reads")
    (description
     "ParDRe is a parallel tool to remove duplicate genetic sequence reads.
Duplicate reads can be seen as identical or nearly identical sequences with
some mismatches.  This tool lets users avoid the analysis of unnecessary
reads, reducing the time of subsequent procedures with the
dataset (e.g. assemblies, mappings, etc.).  The tool is implemented with MPI
in order to exploit the parallel capabilities of multicore clusters.  It is
faster than multithreaded counterparts (end of 2015) for the same number of
cores and, thanks to the message-passing technology, it can be executed on
clusters.")
    (home-page "https://sourceforge.net/projects/pardre/")
    (license license:gpl3+)))

(define-public ngshmmalign
  (package
    (name "ngshmmalign")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/cbg-ethz/ngshmmalign/"
                           "releases/download/" version
                           "/ngshmmalign-" version ".tar.bz2"))
       (sha256
        (base32
         "0jryvlssi2r2ii1dxnx39yk6bh4yqgq010fnxrgfgbaj3ykijlzv"))))
    (build-system cmake-build-system)
    (arguments '(#:tests? #false))      ; there are none
    (inputs
     (list boost))
    (home-page "https://github.com/cbg-ethz/ngshmmalign/")
    (synopsis "Profile HMM aligner for NGS reads")
    (description
     "ngshmmalign is a profile HMM aligner for NGS reads designed particularly
for small genomes (such as those of RNA viruses like HIV-1 and HCV) that
experience substantial biological insertions and deletions.")
    (license license:gpl2+)))

(define-public prinseq
  (package
    (name "prinseq")
    (version "0.20.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/prinseq/standalone/"
                           "prinseq-lite-" version ".tar.gz"))
       (sha256
        (base32
         "0vxmzvmm67whxrqdaaamwgjk7cf0fzfs5s673jgg00kz7g70splv"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #false                  ; no check target
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (scripts (find-files "." "prinseq.*.pl"))
                    (guile (search-input-file inputs "bin/guile")))
               (substitute* scripts
                 (("\"perl -pe")
                  (string-append "\"" (which "perl") " -pe")))
               (for-each (lambda (file)
                           (chmod file #o555)
                           (install-file file bin)
                           (wrap-script (string-append bin "/" (basename file))
                                        #:guile guile
                                        `("PERL5LIB" ":" prefix
                                          (,(getenv "PERL5LIB")))))
                         scripts)))))))
    (inputs
     (list guile-3.0 ; for wrapper scripts
           perl
           perl-cairo
           perl-data-dumper
           perl-digest-md5
           perl-getopt-long
           perl-json
           perl-statistics-pca))
    (home-page "https://prinseq.sourceforge.net/")
    (synopsis "Preprocess sequence data in FASTA or FASTQ formats")
    (description
     "PRINSEQ is a bioinformatics tool to help you preprocess your genomic or
metagenomic sequence data in FASTA or FASTQ formats.  The tool is written in
Perl and can be helpful if you want to filter, reformat, or trim your sequence
data.  It also generates basic statistics for your sequences.")
    (license license:gpl3+)))

(define-public shorah
  (package
    (name "shorah")
    (version "1.99.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/cbg-ethz/shorah"
                           "/releases/download/v" version
                           "/shorah-" version ".tar.xz"))
       (sha256
        (base32
         "158dir9qcqspknlnyfr9zwk41x48nrh5wcg10k2grh9cidp9daiq"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-test-wrapper
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
               (substitute* "examples/run_end2end_test"
                 (("\\$\\{interpreter\\} ../\\$\\{testscript\\}")
                  (string-append bin "/${testscript}"))))))
         (delete 'check)
         (add-after 'install 'wrap-programs
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (site (string-append
                           out "/lib/python"
                           ,(version-major+minor
                             (package-version python))
                           "/site-packages"))
                    (pythonpath (getenv "GUIX_PYTHONPATH"))
                    (script (string-append out "/bin/shorah")))
               (chmod script #o555)
               (wrap-program script `("GUIX_PYTHONPATH" ":" prefix (,site ,pythonpath))))))
         (add-after 'wrap-programs 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "make" "check")))))))
    (inputs
     (list boost
           htslib
           python
           python-biopython
           python-numpy
           zlib))
    (native-inputs
     (list pkg-config))
    (home-page "")
    (synopsis "Short reads assembly into haplotypes")
    (description
     "ShoRAH is a project for the analysis of next generation sequencing data.
It is designed to analyse genetically heterogeneous samples.  Its tools
provide error correction, haplotype reconstruction and estimation of the
frequency of the different genetic variants present in a mixed sample.")
    (license license:gpl3+)))

(define-public ruby-bio-kseq
  (package
    (name "ruby-bio-kseq")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "bio-kseq" version))
       (sha256
        (base32
         "1xyaha46khb5jc6wzkbf7040jagac49jbimn0vcrzid0j8jdikrz"))))
    (build-system ruby-build-system)
    (arguments
     `(#:test-target "spec"))
    (native-inputs
     (list bundler ruby-rspec ruby-rake-compiler))
    (inputs
     (list zlib))
    (synopsis "Ruby bindings for the kseq.h FASTA/Q parser")
    (description
     "@code{Bio::Kseq} provides ruby bindings to the @code{kseq.h} FASTA and
FASTQ parsing code.  It provides a fast iterator over sequences and their
quality scores.")
    (home-page "https://github.com/gusevfe/bio-kseq")
    (license license:expat)))

(define-public bio-locus
  (package
    (name "bio-locus")
    (version "0.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "bio-locus" version))
       (sha256
        (base32
         "02vmrxyimkj9sahsp4zhfhnmbvz6dbbqz1y01vglf8cbwvkajfl0"))))
    (build-system ruby-build-system)
    (native-inputs
     (list ruby-rspec))
    (synopsis "Tool for fast querying of genome locations")
    (description
     "Bio-locus is a tabix-like tool for fast querying of genome
locations.  Many file formats in bioinformatics contain records that
start with a chromosome name and a position for a SNP, or a start-end
position for indels.  Bio-locus allows users to store this chr+pos or
chr+pos+alt information in a database.")
    (home-page "https://github.com/pjotrp/bio-locus")
    (license license:expat)))

(define-public bio-blastxmlparser
  (package
    (name "bio-blastxmlparser")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "bio-blastxmlparser" version))
              (sha256
               (base32
                "1wf4qygcmdjgcqm6flmvsagfr1gs9lf63mj32qv3z1f481zc5692"))))
    (build-system ruby-build-system)
    (propagated-inputs
     (list ruby-bio-logger ruby-nokogiri))
    (inputs
     (list ruby-rspec))
    (synopsis "Fast big data BLAST XML parser and library")
    (description
     "Very fast parallel big-data BLAST XML file parser which can be used as
command line utility.  Use blastxmlparser to: Parse BLAST XML; filter output;
generate FASTA, JSON, YAML, RDF, JSON-LD, HTML, CSV, tabular output etc.")
    (home-page "https://github.com/pjotrp/blastxmlparser")
    (license license:expat)))

(define-public bioruby
  (package
    (name "bioruby")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "bio" version))
       (sha256
        (base32
         "08aknxk2ingwscwfqpw5vnax6jpk1sxfaialravladb63hcl8dx9"))))
    (build-system ruby-build-system)
    (propagated-inputs
     (list ruby-libxml))
    (native-inputs
     (list which))  ; required for test phase
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'patch-test-command
            (lambda _
              (substitute* '("test/functional/bio/test_command.rb")
                (("/bin/sh") (which "sh")))
              (substitute* '("test/functional/bio/test_command.rb")
                (("/bin/ls") (which "ls")))
              (substitute* '("test/functional/bio/test_command.rb")
                (("which") (which "which")))
              (substitute* '("test/functional/bio/test_command.rb"
                             "test/data/command/echoarg2.sh")
                (("/bin/echo") (which "echo"))))))))
    (synopsis "Ruby library, shell and utilities for bioinformatics")
    (description "BioRuby comes with a comprehensive set of Ruby development
tools and libraries for bioinformatics and molecular biology.  BioRuby has
components for sequence analysis, pathway analysis, protein modelling and
phylogenetic analysis; it supports many widely used data formats and provides
easy access to databases, external programs and public web services, including
BLAST, KEGG, GenBank, MEDLINE and GO.")
    (home-page "http://bioruby.org/")
    ;; Code is released under Ruby license, except for setup
    ;; (LGPLv2.1+) and scripts in samples (which have GPL2 and GPL2+)
    (license (list license:ruby license:lgpl2.1+ license:gpl2+ ))))

(define-public centrifuge
  (package
    (name "centrifuge")
    (version "1.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/DaehwanKimLab/centrifuge.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "167610gbz1rrh6ir3j7jcmhzg3x5msn7x7a3dpv7wmwdndnnqvg0"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #false                   ; no check target
      #:make-flags
      #~(list (string-append "prefix=" #$output))
      #:phases
      '(modify-phases %standard-phases
         (delete 'configure))))
    (inputs (list python-wrapper))
    (native-inputs
     (list pandoc perl                  ;for documentation
           which))
    (home-page "https://github.com/DaehwanKimLab/centrifuge/")
    (synopsis "Classifier for metagenomic sequences")
    (description "Centrifuge is a microbial classification engine that enables
rapid, accurate and sensitive labeling of reads and quantification of species
on desktop computers.  The system uses an indexing scheme based on the
@dfn{Burrows-Wheeler transform} (BWT) and the @dfn{Ferragina-Manzini} (FM)
index, optimized specifically for the metagenomic classification problem.
Centrifuge requires a relatively small index (4.7 GB for all complete
bacterial and viral genomes plus the human genome) and classifies sequences at
very high speed, allowing it to process the millions of reads from a typical
high-throughput DNA sequencing run within a few minutes.")
    (license license:gpl3+)))

(define-public bio-vcf
  (package
    (name "bio-vcf")
    (version "0.9.5")
    (source
      (origin
        (method url-fetch)
        (uri (rubygems-uri "bio-vcf" version))
        (sha256
         (base32
          "1glw5pn9s8z13spxk6yyfqaz80n9lga67f33w35nkpq9dwi2vg6g"))))
    (build-system ruby-build-system)
    (native-inputs
     (list ruby-cucumber))
    (synopsis "Smart VCF parser DSL")
    (description
     "Bio-vcf provides a @acronym{DSL, domain specific language} for processing
the VCF format.  Record named fields can be queried with regular expressions.
Bio-vcf is a new generation VCF parser, filter and converter.  Bio-vcf is not
only very fast for genome-wide (WGS) data, it also comes with a filtering,
evaluation and rewrite language and can output any type of textual data,
including VCF header and contents in RDF and JSON.")
    (home-page "https://github.com/vcflib/bio-vcf")
    (license license:expat)))

(define-public r-phantompeakqualtools
  (let ((commit "8d2b2d18c686d894ef5908b37da7adf72a07ef42")
        (revision "1"))
    (package
      (name "r-phantompeakqualtools")
      (version (git-version "1.2.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kundajelab/phantompeakqualtools")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "00anrvcwsp02d98qhj1xpj85644h2pp4kfzq6dgbmwmdr6jvy7p4"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f ; There are no tests.
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (delete 'build)
           (replace 'install
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let ((script (string-append (assoc-ref outputs "out")
                                            "/share/scripts")))
                 (install-file "run_spp.R" script)))))))
      (inputs
       `(("r" ,r-minimal)))
      (propagated-inputs
       (list r-catools
             r-snow
             r-snowfall
             r-bitops
             r-rsamtools
             r-spp
             gawk
             samtools
             boost
             gzip))
      (home-page "https://github.com/kundajelab/phantompeakqualtools")
      (synopsis "Informative enrichment for ChIP-seq data")
      (description "This package computes informative enrichment and quality
measures for ChIP-seq/DNase-seq/FAIRE-seq/MNase-seq data.  It can also be
used to obtain robust estimates of the predominant fragment length or
characteristic tag shift values in these assays.")
      (license license:bsd-3))))

(define-public r-r4rna
  (package
    (name "r-r4rna")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.e-rna.org/r-chie/files/R4RNA_"
                           version ".tar.gz"))
       (sha256
        (base32
         "1p0i78wh76jfgmn9jphbwwaz6yy6pipzfg08xs54cxavxg2j81p5"))))
    (build-system r-build-system)
    (propagated-inputs
     (list r-optparse r-rcolorbrewer))
    (home-page "https://www.e-rna.org/r-chie/index.cgi")
    (synopsis "Analysis framework for RNA secondary structure")
    (description
     "The R4RNA package aims to be a general framework for the analysis of RNA
secondary structure and comparative analysis in R.")
    (license license:gpl3+)))

(define-public rcas-web
  (package
    (name "rcas-web")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/BIMSBbioinfo/rcas-web/"
                           "releases/download/v" version
                           "/rcas-web-" version ".tar.gz"))
       (sha256
        (base32
         "0wq951aj45gqki1bickg876i993lmawkp8x24agg264br5x716db"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'configure 'find-RCAS
           ;; The configure script can't find non-1.3.x versions of RCAS because
           ;; its R expression ‘1.10.1 >= 1.3.4’ evaluates to false.
           (lambda _
             (substitute* "configure"
               (("1\\.3\\.4") "0.0.0"))
             #t))
         (add-after 'install 'wrap-executable
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (json   (assoc-ref inputs "guile-json"))
                    (redis  (assoc-ref inputs "guile-redis"))
                    (path   (string-append
                             json  "/share/guile/site/2.2:"
                             redis "/share/guile/site/2.2")))
               (wrap-program (string-append out "/bin/rcas-web")
                 `("GUILE_LOAD_PATH" ":" = (,path))
                 `("GUILE_LOAD_COMPILED_PATH" ":" = (,path))
                 `("R_LIBS_SITE" ":" = (,(getenv "R_LIBS_SITE")))))
             #t)))))
    (inputs
     `(("r-minimal" ,r-minimal)
       ("r-rcas" ,r-rcas)
       ("guile" ,guile-2.2)
       ("guile-json" ,guile-json-1)
       ("guile-redis" ,guile2.2-redis)))
    (native-inputs
     (list pkg-config))
    (home-page "https://github.com/BIMSBbioinfo/rcas-web")
    (synopsis "Web interface for RNA-centric annotation system (RCAS)")
    (description "This package provides a simple web interface for the
@dfn{RNA-centric annotation system} (RCAS).")
    (license license:agpl3+)))

(define-public r-chipkernels
  (let ((commit "c9cfcacb626b1221094fb3490ea7bac0fd625372")
        (revision "1"))
    (package
      (name "r-chipkernels")
      (version (git-version "1.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ManuSetty/ChIPKernels")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "14bj5qhjm1hsm9ay561nfbqi9wxsa7y487df2idsaaf6z10nw4v0"))))
      (build-system r-build-system)
      (propagated-inputs
       (list r-iranges
             r-xvector
             r-biostrings
             r-bsgenome
             r-gtools
             r-genomicranges
             r-sfsmisc
             r-kernlab
             r-s4vectors
             r-biocgenerics))
      (home-page "https://github.com/ManuSetty/ChIPKernels")
      (synopsis "Build string kernels for DNA Sequence analysis")
      (description "ChIPKernels is an R package for building different string
kernels used for DNA Sequence analysis.  A dictionary of the desired kernel
must be built and this dictionary can be used for determining kernels for DNA
Sequences.")
      (license license:gpl2+))))

(define-public r-seqgl
  (package
    (name "r-seqgl")
    (version "1.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ManuSetty/SeqGL")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1r6ywvhxl3ffv48lgj7sbd582mcc6dha3ksgc2qjlvjrnkbj3799"))))
    (build-system r-build-system)
    (propagated-inputs
     (list r-biostrings
           r-chipkernels
           r-genomicranges
           r-spams
           r-wgcna
           r-fastcluster))
    (home-page "https://github.com/ManuSetty/SeqGL")
    (synopsis "Group lasso for Dnase/ChIP-seq data")
    (description "SeqGL is a group lasso based algorithm to extract
transcription factor sequence signals from ChIP, DNase and ATAC-seq profiles.
This package presents a method which uses group lasso to discriminate between
bound and non bound genomic regions to accurately identify transcription
factors bound at the specific regions.")
    (license license:gpl2+)))

(define-public emboss
  (package
    (name "emboss")
    (version "6.5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "ftp://emboss.open-bio.org/pub/EMBOSS/old/"
                                  (version-major+minor version) ".0/"
                                  "EMBOSS-" version ".tar.gz"))
              (sha256
               (base32
                "0vsmz96gc411yj2iyzdrsmg4l2n1nhgmp7vrgzlxx3xixv9xbf0q"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       ,#~(list (string-append "--with-hpdf="
                               #$(this-package-input "libharu")))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-checks
           (lambda _
             ;; The PNGDRIVER tests check for the presence of libgd, libpng
             ;; and zlib, but assume that they are all found at the same
             ;; prefix.
             (substitute* "configure.in"
               (("CHECK_PNGDRIVER")
                "LIBS=\"$LIBS -lgd -lpng -lz -lm\"
AC_DEFINE([PLD_png], [1], [Define to 1 if PNG support is available])
AM_CONDITIONAL(AMPNG, true)"))
             #t))
         (add-after 'fix-checks 'disable-update-check
           (lambda _
             ;; At build time there is no connection to the Internet, so
             ;; looking for updates will not work.
             (substitute* "Makefile.am"
               (("\\$\\(bindir\\)/embossupdate") ""))
             #t))
         (add-after 'disable-update-check 'autogen
           (lambda _ (invoke "autoreconf" "-vif") #t)))))
    (inputs
     (list perl
           libpng
           gd
           libx11
           libharu
           zlib))
    (native-inputs
     (list autoconf automake libtool pkg-config))
    (home-page "https://emboss.sourceforge.net")
    (synopsis "Molecular biology analysis suite")
    (description "EMBOSS is the \"European Molecular Biology Open Software
Suite\".  EMBOSS is an analysis package specially developed for the needs of
the molecular biology (e.g. EMBnet) user community.  The software
automatically copes with data in a variety of formats and even allows
transparent retrieval of sequence data from the web.  It also provides a
number of libraries for the development of software in the field of molecular
biology.  EMBOSS also integrates a range of currently available packages and
tools for sequence analysis into a seamless whole.")
    (license license:gpl2+)))

(define-public bits
  (let ((revision "1")
        (commit "3cc4567896d9d6442923da944beb704750a08d2d"))
    (package
      (name "bits")
      ;; The version is 2.13.0 even though no release archives have been
      ;; published as yet.
      (version (git-version "2.13.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/arq5x/bits")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "17n2kffk4kmhivd8c98g2vr6y1s23vbg4sxlxs689wni66797hbs"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f ;no tests included
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (add-after 'unpack 'remove-cuda
             (lambda _
               (substitute* "Makefile"
                 ((".*_cuda") "")
                 (("(bits_test_intersections) \\\\" _ match) match))
               #t))
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (copy-recursively
                "bin" (string-append (assoc-ref outputs "out") "/bin"))
               #t)))))
      (inputs
       (list gsl zlib))
      (home-page "https://github.com/arq5x/bits")
      (synopsis "Implementation of binary interval search algorithm")
      (description "This package provides an implementation of the
BITS (Binary Interval Search) algorithm, an approach to interval set
intersection.  It is especially suited for the comparison of diverse genomic
datasets and the exploration of large datasets of genome
intervals (e.g. genes, sequence alignments).")
      (license license:gpl2))))

(define-public piranha
  ;; There is no release tarball for the latest version.  The latest commit is
  ;; older than one year at the time of this writing.
  (let ((revision "1")
        (commit   "0466d364b71117d01e4471b74c514436cc281233"))
    (package
      (name "piranha")
      (version (git-version "1.2.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/smithlabcode/piranha")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "117dc0zf20c61jam69sk4abl57ah6yi6i7qra7d7y5zrbgk12q5n"))))
      (build-system gnu-build-system)
      (arguments
       `(#:test-target "test"
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'copy-smithlab-cpp
             (lambda* (#:key inputs #:allow-other-keys)
               (for-each (lambda (file)
                           (install-file file "./src/smithlab_cpp/"))
                         (find-files (assoc-ref inputs "smithlab-cpp")))))
           (add-after 'install 'install-to-store
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (bin (string-append out "/bin")))
                 (for-each (lambda (file)
                             (install-file file bin))
                           (find-files "bin" ".*"))))))
         #:configure-flags
         ,#~(list (string-append "--with-bam_tools_headers="
                                 #$(this-package-input "bamtools") "/include/bamtools")
                  (string-append "--with-bam_tools_library="
                                 #$(this-package-input "bamtools") "/lib/bamtools"))))
      (inputs
       `(("bamtools" ,bamtools)
         ("samtools" ,samtools-0.1)
         ("gsl" ,gsl)
         ("smithlab-cpp"
          ,(let ((commit "3723e2db438c51501d0423429ff396c3035ba46a"))
             (origin
               (method git-fetch)
               (uri (git-reference
                     (url "https://github.com/smithlabcode/smithlab_cpp")
                     (commit commit)))
               (file-name (string-append "smithlab_cpp-" commit "-checkout"))
               (sha256
                (base32
                 "0l4gvbwslw5ngziskja41c00x1r06l3yidv7y0xw9djibhykzy0g")))))))
      (native-inputs
       `(("python" ,python-2)))
      (home-page "https://github.com/smithlabcode/piranha")
      (synopsis "Peak-caller for CLIP-seq and RIP-seq data")
      (description
       "Piranha is a peak-caller for genomic data produced by CLIP-seq and
RIP-seq experiments.  It takes input in BED or BAM format and identifies
regions of statistically significant read enrichment.  Additional covariates
may optionally be provided to further inform the peak-calling process.")
      (license license:gpl3+))))

(define-public filevercmp
  (let ((commit "1a9b779b93d0b244040274794d402106907b71b7")
        (revision "1"))
    (package
      (name "filevercmp")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/ekg/filevercmp")
                      (commit commit)))
                (file-name (git-file-name name commit))
                (sha256
                 (base32
                  "1j9vxsy0y050v59h0q1d6501fcw1kjvj0d18l1xk2zyg0jzj247c"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f ; There are no tests to run.
         #:phases
         (modify-phases %standard-phases
           (delete 'configure) ; There is no configure phase.
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (install-file "filevercmp" (string-append out "/bin"))
                 (install-file "filevercmp.h" (string-append out "/include"))
                 #t))))))
      (home-page "https://github.com/ekg/filevercmp")
      (synopsis "This program compares version strings")
      (description "This program compares version strings.  It intends to be a
replacement for strverscmp.")
      (license license:gpl3+))))

(define-public multiqc
  (package
    (name "multiqc")
    (version "1.14")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "multiqc" version))
       (sha256
        (base32
         "0qlk2h0765hxp1w9hqf925rh8hq642lzgs6ppg91wln9y02s9fyw"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key inputs tests? #:allow-other-keys)
             (when tests?
               (setenv "HOME" "/tmp")
               (let ((here (getcwd)))
                 (copy-recursively (assoc-ref inputs "tests") "/tmp/tests")
                 (with-directory-excursion "/tmp/tests"
                   (invoke "multiqc" "data" "--ignore" "data/modules")))))))))
    (propagated-inputs
     (list python-click
           python-coloredlogs
           python-future
           python-jinja2
           python-lzstring
           python-markdown
           python-matplotlib
           python-networkx
           python-numpy
           python-pyyaml
           python-requests
           python-rich
           python-rich-click
           python-simplejson
           python-spectra))
    (native-inputs
     `(("python-pytest" ,python-pytest)
       ("tests"
        ,(let ((commit "c3e7400affe3f3ca996973805797af61b93070ba"))
           (origin
             (method git-fetch)
             (uri (git-reference
                   (url "https://github.com/ewels/MultiQC_TestData")
                   (commit commit)))
             (file-name (git-file-name "multiqc-test-data" commit))
             (sha256
              (base32
               "0wwqbkbfnqj5ax6l0da4csbmv1sw7ya7mwvdwryckaiqmkxy80va")))))))
    (home-page "https://multiqc.info")
    (synopsis "Aggregate bioinformatics analysis reports")
    (description
     "MultiQC is a tool to aggregate bioinformatics results across many
samples into a single report.  It contains modules for a large number of
common bioinformatics tools.")
    (license license:gpl3+)))

(define-public variant-tools
  (package
    (name "variant-tools")
    (version "3.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vatlab/varianttools")
             ;; There is no tag corresponding to version 3.1.2
             (commit "813ae4a90d25b69abc8a40f4f70441fe09015249")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "12ibdmksj7icyqhks4xyvd61bygk4pjmxn618kp6vgk1af01y34g"))))
    (build-system python-build-system)
    (inputs
     (list boost
           c-blosc
           gsl
           hdf5
           hdf5-blosc
           python-cython
           zlib))
    (propagated-inputs
     (list python-numpy python-pycurl python-pyzmq python-scipy
           python-tables))
    (home-page "https://vatlab.github.io/vat-docs/")
    (synopsis "Analyze genetic variants from Next-Gen sequencing studies")
    (description
     "Variant tools is a tool for the manipulation, annotation,
selection, simulation, and analysis of variants in the context of next-gen
sequencing analysis.  Unlike some other tools used for next-gen sequencing
analysis, variant tools is project based and provides a whole set of tools to
manipulate and analyze genetic variants.")
    (license license:gpl3+)))

(define-public r-chromvarmotifs
  (let ((commit "38bed559c1f4770b6c91c80bf3f8ea965da26076")
        (revision "1"))
    (package
      (name "r-chromvarmotifs")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/GreenleafLab/chromVARmotifs")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0i9v1m1hrg1lkd2pnkj5nnrpks6vhhhpbdhsfl2lmjak4npxxr5q"))))
      (properties `((upstream-name . "chromVARmotifs")))
      (build-system r-build-system)
      (propagated-inputs
       `(("r-tfbstools" ,r-tfbstools)))
      (home-page "https://github.com/GreenleafLab/chromVARmotifs")
      (synopsis "Stores motif collections for use with motifmatchr or chromVAR")
      (description
       "This package stores motif collections as lists of @dfn{position
frequency matrix} (PWMatrixList) objects provided by the @code{TFBSTools}
package for use in R with packages like @code{motifmatchr} or
@code{chromVAR}.")
      (license license:expat))))

(define-public r-raremetals2
  (package
    (name "r-raremetals2")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://genome.sph.umich.edu/w/images/"
                           "b/b7/RareMETALS2_" version ".tar.gz"))
       (sha256
        (base32
         "0z5ljcgvnm06ja9lm85a3cniq7slxcy37aqqkxrdidr79an5fs4s"))))
    (properties `((upstream-name . "RareMETALS2")))
    (build-system r-build-system)
    (propagated-inputs
     (list r-seqminer r-mvtnorm r-mass r-compquadform r-getopt))
    (home-page "http://genome.sph.umich.edu/wiki/RareMETALS2")
    (synopsis "Analyze gene-level association tests for binary trait")
    (description
     "The R package rareMETALS2 is an extension of the R package rareMETALS.
It was designed to meta-analyze gene-level association tests for binary trait.
While rareMETALS offers a near-complete solution for meta-analysis of
gene-level tests for quantitative trait, it does not offer the optimal
solution for binary trait.  The package rareMETALS2 offers improved features
for analyzing gene-level association tests in meta-analyses for binary
trait.")
    (license license:gpl3)))

(define-public r-rnaseqdtu
  (let ((commit "5bee1e769d2e1dc6a3f1cecb78078050eeb5b9ac")
        (revision "1"))
    (package
      (name "r-rnaseqdtu")
      (version (git-version "2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mikelove/rnaseqDTU/")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jfi1ydsk8m5nadwnih48v87nnxdc7s3f0pny4axmnj40dd42as0"))))
      (properties `((upstream-name . "rnaseqDTU")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-deseq2
             r-devtools
             r-dexseq
             r-drimseq
             r-edger
             r-rafalib
             r-stager))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/mikelove/rnaseqDTU/")
      (synopsis "RNA-seq workflow for differential transcript usage")
      (description
       "This package provides an RNA-seq workflow for differential transcript
usage (DTU) following Salmon quantification.  This workflow performs a DTU
analysis on simulated data.  It also shows how to use stageR to perform
two-stage testing of DTU, a statistical framework to screen at the gene level
and then confirm which transcripts within the significant genes show evidence
of DTU.")
      (license license:artistic2.0))))

(define-public r-dropbead
  (let ((commit "d746c6f3b32110428ea56d6a0001ce52a251c247")
        (revision "2"))
    (package
      (name "r-dropbead")
      (version (string-append "0-" revision "." (string-take commit 7)))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rajewsky-lab/dropbead")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0sbzma49aiiyw8b0jpr7fnhzys9nsqmp4hy4hdz1gzyg1lhnca26"))))
      (build-system r-build-system)
      (propagated-inputs
       (list r-ggplot2 r-rcolorbrewer r-gridextra r-gplots r-plyr))
      (home-page "https://github.com/rajewsky-lab/dropbead")
      (synopsis "Basic exploration and analysis of Drop-seq data")
      (description "This package offers a quick and straight-forward way to
explore and perform basic analysis of single cell sequencing data coming from
droplet sequencing.  It has been particularly tailored for Drop-seq.")
      (license license:gpl3))))

(define-public r-cellchat
  (let ((commit
         "21edd226ca408e4c413408f98562d71ee0b54e5d")
        (revision "1"))
    (package
      (name "r-cellchat")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/sqjin/CellChat")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0cvzl9mi8jjznpql2gv67swnk1dndn3a2h22z5l84h7lwpwjmh53"))
         (snippet
          '(for-each delete-file '("src/CellChat.so"
                                   "src/CellChat_Rcpp.o"
                                   "src/RcppExports.o")))))
      (properties `((upstream-name . "CellChat")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-biocgenerics
             r-circlize
             r-colorspace
             r-complexheatmap
             r-cowplot
             r-dplyr
             r-expm
             r-fnn
             r-forcats
             r-future
             r-future-apply
             r-gg-gap
             r-ggalluvial
             r-ggplot2
             r-ggrepel
             r-igraph
             r-irlba
             r-magrittr
             r-matrix
             r-nmf
             r-patchwork
             r-pbapply
             r-rcolorbrewer
             r-rcpp
             r-rcppeigen
             r-reshape2
             r-reticulate
             r-rspectra
             r-rtsne
             r-scales
             r-shape
             r-sna
             r-stringr
             r-svglite))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/sqjin/CellChat")
      (synopsis "Analysis of cell-cell communication from single-cell transcriptomics data")
      (description
       "This package infers, visualizes and analyzes the cell-cell
communication networks from scRNA-seq data.")
      (license license:gpl3))))

(define-public r-copykat
  (let ((commit                         ;no tag
         "256de33dfc1b80a1a0ac9e098c5557f95a4e0d53")
        (revision "0"))
    (package
      (name "r-copykat")
      (version (git-version "1.0.8" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/navinlabcode/copykat")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ckyqnial3imcqlgd6xfgwk5w977l1i87sx4kdbwdvg40w0vh1j8"))))
      (properties `((upstream-name . "copykat")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-cluster
             r-dlm
             r-gplots
             r-mcmcpack
             r-mixtools
             r-paralleldist
             r-rcolorbrewer))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/navinlabcode/copykat")
      (synopsis "Inference of genomic copy number from single cell RNAseq data")
      (description
       "This package Copynumber KAryotyping of Tumors infers genomic copy
number and subclonal structure of human tumors using integrative Bayesian
approaches to identify genome-wide aneuploidy at 5MB resolution in single
cells data.  It separates tumor cells and tumor subclones from normal cells
using high-throughput sc-RNAseq data.")
      (license license:gpl2))))

(define-public sambamba
  (package
    (name "sambamba")
    (version "0.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/biod/sambamba")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1zdkd1md5wk4la71p82pbclqqcm55abk23fk087da6186i1bsihl"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; there is no test target
       #:parallel-build? #f             ; not supported
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-after 'unpack 'prepare-build-tools
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "Makefile"
               (("\\$\\(shell which ldmd2\\)") (which "ldmd2")))
             (setenv "CC" "gcc")
             (setenv "D_LD" (which "ld.gold"))))
         (add-after 'unpack 'unbundle-prerequisites
           (lambda _
             (substitute* "Makefile"
               (("= lz4/lib/liblz4.a") "= -L-llz4")
               (("ldc_version_info lz4-static") "ldc_version_info"))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
               (mkdir-p bin)
               (copy-file (string-append "bin/sambamba-" ,version)
                          (string-append bin "/sambamba"))))))))
    (native-inputs
     `(("ld-gold-wrapper"
        ;; Importing (gnu packages commencement) would introduce a cycle.
        ,(module-ref (resolve-interface
                      '(gnu packages commencement))
                     'ld-gold-wrapper))
       ("binutils-gold" ,binutils-gold)
       ("python" ,python)))
    (inputs
     (list ldc lz4 zlib))
    (home-page "https://github.com/biod/sambamba")
    (synopsis "Tools for working with SAM/BAM data")
    (description "Sambamba is a high performance modern robust and
fast tool (and library), written in the D programming language, for
working with SAM and BAM files.  Current parallelised functionality is
an important subset of samtools functionality, including view, index,
sort, markdup, and depth.")
    (license license:gpl2+)))

(define-public ritornello
  (package
    (name "ritornello")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KlugerLab/Ritornello")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1xahvq215qld7x1w8vpa5zbrsj6p9crb9shqa2x89sb0aaxa02jk"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; there are no tests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-samtools-references
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* '("src/SamStream.h"
                            "src/FLD.cpp")
               (("<sam.h>") "<samtools/sam.h>"))
             #t))
         (delete 'configure)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out    (assoc-ref outputs "out"))
                    (bin    (string-append out "/bin/")))
               (mkdir-p bin)
               (install-file "bin/Ritornello" bin)
               #t))))))
    (inputs
     (list samtools-0.1 fftw boost zlib))
    (home-page "https://github.com/KlugerLab/Ritornello")
    (synopsis "Control-free peak caller for ChIP-seq data")
    (description "Ritornello is a ChIP-seq peak calling algorithm based on
signal processing that can accurately call binding events without the need to
do a pair total DNA input or IgG control sample.  It has been tested for use
with narrow binding events such as transcription factor ChIP-seq.")
    (license license:gpl3+)))

(define-public trim-galore
  (package
    (name "trim-galore")
    (version "0.6.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FelixKrueger/TrimGalore")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0yrwg6325j4sb9vnplvl3jplzab0qdhp92wl480qjinpfq88j4rs"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda _
             ;; Trim Galore tries to figure out what version of Python
             ;; cutadapt is using by looking at the shebang.  Of course that
             ;; doesn't work, because cutadapt is wrapped in a shell script.
             (substitute* "trim_galore"
               (("my \\$python_return.*")
                "my $python_return = \"Python 3.999\";\n"))
             #t))
         (delete 'build)
         (add-after 'unpack 'hardcode-tool-references
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "trim_galore"
               (("\\$path_to_cutadapt = 'cutadapt'")
                (string-append "$path_to_cutadapt = '"
                               (assoc-ref inputs "cutadapt")
                               "/bin/cutadapt'"))
               (("\\$compression_path = \"gzip\"")
                (string-append "$compression_path = \""
                               (assoc-ref inputs "gzip")
                               "/bin/gzip\""))
               (("\"gunzip")
                (string-append "\""
                               (assoc-ref inputs "gzip")
                               "/bin/gunzip"))
               (("\"pigz")
                (string-append "\""
                               (assoc-ref inputs "pigz")
                               "/bin/pigz")))
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin")))
               (mkdir-p bin)
               (install-file "trim_galore" bin)
               #t))))))
    (inputs
     (list gzip perl pigz cutadapt))
    (native-inputs
     (list unzip))
    (home-page "https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/")
    (synopsis "Wrapper around Cutadapt and FastQC")
    (description "Trim Galore! is a wrapper script to automate quality and
adapter trimming as well as quality control, with some added functionality to
remove biased methylation positions for RRBS sequence files.")
    (license license:gpl3+)))

(define-public phylip
  (package
    (name "phylip")
    (version "3.697")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://evolution.gs.washington.edu/phylip/"
                           "download/phylip-" version ".tar.gz"))
       (sha256
        (base32
         "1h8h0nafnlbqryswxgplx80k2044yhfz97jh13vsgzlaifqdh9ls"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no check target
       #:make-flags (list "-f" "Makefile.unx" "CFLAGS=-fcommon" "install")
       #:parallel-build? #f             ; not supported
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'enter-dir
           (lambda _ (chdir "src")))
         (delete 'configure)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((target (string-append (assoc-ref outputs "out")
                                          "/bin")))
               (mkdir-p target)
               (for-each (lambda (file)
                           (install-file file target))
                         (find-files "../exe" ".*"))))))))
    (home-page "https://evolution.genetics.washington.edu/phylip/")
    (synopsis "Tools for inferring phylogenies")
    (description "PHYLIP (the PHYLogeny Inference Package) is a package of
programs for inferring phylogenies (evolutionary trees).")
    (license license:bsd-2)))

(define-public phyml
  (package
    (name "phyml")
    (version "3.3.20220408")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stephaneguindon/phyml")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "03hdqmnsgnzkcrp9r9ajdfkj33jgq4b86kra8ssjlrph65y344sa"))
              (snippet
               '(delete-file "doc/phyml-manual.pdf"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (let ((default-flags (list "--disable-native")))
       `(#:phases
         (let ((build (lambda (what)
                         (lambda args
                           (apply (assoc-ref %standard-phases 'configure)
                                  (append args
                                          (list #:configure-flags
                                                (cons (format #false "--enable-~a" what)
                                                      '() #;,default-flags))))
                           (apply (assoc-ref %standard-phases 'build) args)
                           (apply (assoc-ref %standard-phases 'install) args)))))
           (modify-phases %standard-phases
             ;; We cannot use --disable-native; see
             ;; https://github.com/stephaneguindon/phyml/issues/173 Instead we
             ;; patch the code to at least get rid of -march=native.
             (add-after 'unpack 'remove-march-native
               (lambda _
                 (substitute* "configure.ac"
                   (("DEFAULT_VECTOR_FLAG=\"-march=native\"")
                    "DEFAULT_VECTOR_FLAG=\"-march=athlon64-sse3\"\n"))))
             (add-after 'build 'build-manual
               (lambda _
                 (with-directory-excursion "doc"
                   (invoke "make" "phyml-manual.pdf"))))
             (add-after 'build-manual 'install-manual
               (lambda* (#:key outputs #:allow-other-keys)
                 (with-directory-excursion "doc"
                   (install-file "phyml-manual.pdf"
                                 (string-append (assoc-ref outputs "out")
                                                "/share/doc/phyml")))))
             (add-after 'install 'build-phyml-mpi
               (build "phyml-mpi"))
             (add-after 'build-phyml-mpi 'build-rf
               (build "rf"))
             (add-after 'build-rf 'build-phyrex
               (build "phyrex")))))))
    (native-inputs
     (list automake
           autoconf
           openmpi
           (texlive-updmap.cfg (list texlive-amsfonts
                                     texlive-caption
                                     texlive-cite
                                     texlive-fancyvrb
                                     texlive-fonts-ec
                                     texlive-graphics
                                     texlive-grfext
                                     texlive-hyperref
                                     texlive-latex-psfrag
                                     texlive-xcolor))))
    (home-page "https://github.com/stephaneguindon/phyml")
    (synopsis "Programs for working on SAM/BAM files")
    (description
     "@code{PhyML} is a software package that uses modern statistical
approaches to analyse alignments of nucleotide or amino acid sequences in a
phylogenetic framework.  The main tool in this package builds phylogenies
under the maximum likelihood criterion.  It implements a large number of
substitution models coupled with efficient options to search the space of
phylogenetic tree topologies.  code{PhyREX} fits the
spatial-Lambda-Fleming-Viot model to geo-referenced genetic data.  This model
is similar to the structured coalescent but assumes that individuals are
distributed along a spatial continuum rather than discrete demes.
@code{PhyREX} can be used to estimate population densities and rates of
dispersal.  Its output can be processed by treeannotator (from the
@code{BEAST} package) as well as @code{SPREAD}.")
    (license license:gpl3)))

(define-public imp
  (package
    (name "imp")
    (version "2.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://integrativemodeling.org/"
                           version "/download/imp-" version ".tar.gz"))
       (sha256
        (base32
         "05hsrnkpkajppa3f45x4qsarnkj616hlby749zxg4is3bv4i6b5y"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #false ; The test suite is notoriously fickle
       #:configure-flags
       (let ((disabled-tests
              '("expensive"                 ;exclude expensive tests
                "IMP.modeller"              ;fail to import its own modules
                "IMP.parallel-test_sge.py"  ;fail in build container
                ;; The following test fails non-reproducibly on
                ;; an inexact numbers assertion.
                "IMP.em-medium_test_local_fitting.py"
                ;; The following test fails for unknown reasons
                "IMP.foxs-add-missing-residues.py")))
         (list
          (string-append
           "-DCMAKE_CTEST_ARGUMENTS="
           (string-join
            (list "-L" "-tests?-"       ;select only tests
                  "-E" (format #f "'(~a)'" (string-join disabled-tests "|")))
            ";"))))))
    (native-inputs
     `(("python" ,python-wrapper)
       ("swig" ,swig)))
    (inputs
     (list boost
           cgal
           gsl
           hdf5
           fftw
           eigen
           ;; Enabling MPI causes the build to use all the available memory and
           ;; fail (tested on a machine with 32 GiB of RAM).
           ;;("mpi" ,openmpi)
           opencv))
    (propagated-inputs
     (list python-numpy python-scipy python-pandas python-scikit-learn
           python-networkx))
    (home-page "https://integrativemodeling.org")
    (synopsis "Integrative modeling platform")
    (description "IMP's broad goal is to contribute to a comprehensive
structural characterization of biomolecules ranging in size and complexity
from small peptides to large macromolecular assemblies, by integrating data
from diverse biochemical and biophysical experiments.  IMP provides a C++ and
Python toolbox for solving complex modeling problems, and a number of
applications for tackling some common problems in a user-friendly way.")
    ;; IMP is largely available under the GNU Lesser GPL; see the file
    ;; COPYING.LGPL for the full text of this license. Some IMP modules are
    ;; available under the GNU GPL (see the file COPYING.GPL).
    (license (list license:lgpl2.1+
                   license:gpl3+))))

;; We use this seemingly arbitrary commit because of
;; https://github.com/3DGenomes/TADbit/issues/371
(define-public tadbit
  (let ((commit "5c4c1ddaadfbaf7e6edc58173e46d801093bdc9b")
        (revision "1"))
    (package
      (name "tadbit")
      (version (git-version "1.0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/3DGenomes/TADbit")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "17nwlvjgqpa7x6jgh56m3di61ynaz34kl1jamyv7r2a5rhfcbkla"))))
      (build-system python-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'fix-problems-with-setup.py
             (lambda* (#:key outputs #:allow-other-keys)
               (substitute* "src/test/Makefile"
                 (("^CFLAGS=") "CFLAGS= -fcommon"))

               ;; Don't attempt to install the bash completions to
               ;; the home directory.
               (rename-file "extras/.bash_completion"
                            "extras/tadbit")
               (substitute* "setup.py"
                 (("\\(path.expanduser\\('~'\\)")
                  (string-append "(\""
                                 (assoc-ref outputs "out")
                                 "/etc/bash_completion.d\""))
                 (("extras/\\.bash_completion")
                  "extras/tadbit"))))
           (replace 'check
             (lambda* (#:key tests? inputs outputs #:allow-other-keys)
               (when tests?
                 (add-installed-pythonpath inputs outputs)
                 (invoke "python3" "test/test_all.py")))))))
      (native-inputs
       (list `(,glib "bin") ;for gtester
             pkg-config))
      (inputs
       ;; TODO: add Chimera for visualization
       (list imp
             mcl
             python-future
             python-h5py
             python-scipy
             python-numpy
             python-matplotlib
             python-pysam))
      (home-page "https://3dgenomes.github.io/TADbit/")
      (synopsis "Analyze, model, and explore 3C-based data")
      (description
       "TADbit is a complete Python library to deal with all steps to analyze,
model, and explore 3C-based data.  With TADbit the user can map FASTQ files to
obtain raw interaction binned matrices (Hi-C like matrices), normalize and
correct interaction matrices, identify and compare the so-called
@dfn{Topologically Associating Domains} (TADs), build 3D models from the
interaction matrices, and finally, extract structural properties from the
models.  TADbit is complemented by TADkit for visualizing 3D models.")
      (license license:gpl3+))))

(define-public kentutils
  (package
    (name "kentutils")
    ;; 302.1.0 is out, but the only difference is the inclusion of
    ;; pre-built binaries.
    (version "302.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ENCODE-DCC/kentUtils")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0n1wbyjpzii2b9qhyp9r1q76j623cggpg3y8fmw78ld3z4y7ivha"))
       (modules '((guix build utils)
                  (srfi srfi-26)
                  (ice-9 ftw)))
       (snippet
        '(begin
           ;; Only the contents of the specified directories are free
           ;; for all uses, so we remove the rest.  "hg/autoSql" and
           ;; "hg/autoXml" are nominally free, but they depend on a
           ;; library that is built from the sources in "hg/lib",
           ;; which is nonfree.
           (let ((free (list "." ".."
                             "utils" "lib" "inc" "tagStorm"
                             "parasol" "htslib"))
                 (directory? (lambda (file)
                               (eq? 'directory (stat:type (stat file))))))
             (for-each (lambda (file)
                         (and (directory? file)
                              (delete-file-recursively file)))
                       (map (cut string-append "src/" <>)
                            (scandir "src"
                                     (lambda (file)
                                       (not (member file free)))))))
           ;; Only make the utils target, not the userApps target,
           ;; because that requires libraries we won't build.
           (substitute* "Makefile"
             ((" userApps") " utils"))
           ;; Only build libraries that are free.
           (substitute* "src/makefile"
             (("DIRS =.*") "DIRS =\n")
             (("cd jkOwnLib.*") "")
             ((" hgLib") "")
             (("cd hg.*") ""))
           (substitute* "src/utils/makefile"
             ;; These tools depend on "jkhgap.a", which is part of the
             ;; nonfree "src/hg/lib" directory.
             (("raSqlQuery") "")
             (("pslLiftSubrangeBlat") "")

             ;; Do not build UCSC tools, which may require nonfree
             ;; components.
             (("ALL_APPS =.*") "ALL_APPS = $(UTILS_APPLIST)\n"))
           #t))))
    (build-system gnu-build-system)
    (arguments
     `( ;; There is no global test target and the test target for
       ;; individual tools depends on input files that are not
       ;; included.
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-permissions
           (lambda _ (make-file-writable "src/inc/localEnvironment.mk") #t))
         (add-after 'unpack 'fix-paths
           (lambda _
             (substitute* "Makefile"
               (("/bin/echo") (which "echo")))
             #t))
         (add-after 'unpack 'prepare-samtabix
           (lambda* (#:key inputs #:allow-other-keys)
             (copy-recursively (assoc-ref inputs "samtabix")
                               "samtabix")
             #t))
         (delete 'configure)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out")
                                       "/bin")))
               (copy-recursively "bin" bin))
             #t)))))
    (native-inputs
     `(("samtabix"
        ,(let ((commit "10fd107909c1ac4d679299908be4262a012965ba"))
           (origin
             (method git-fetch)
             (uri (git-reference
                   (url "http://genome-source.cse.ucsc.edu/samtabix.git")
                   (commit commit)))
             (file-name (git-file-name "samtabix" (string-take commit 7)))
             (sha256
              (base32
               "0c1nj64l42v395sa84n7az43xiap4i6f9n9dfz4058aqiwkhkmma")))))))
    (inputs
     `(("zlib" ,zlib)
       ("tcsh" ,tcsh)
       ("perl" ,perl)
       ("libpng" ,libpng)
       ("mariadb-dev" ,mariadb "dev")
       ("openssl" ,openssl)))
    (home-page "https://genome.cse.ucsc.edu/index.html")
    (synopsis "Assorted bioinformatics utilities")
    (description "This package provides the kentUtils, a selection of
bioinformatics utilities used in combination with the UCSC genome
browser.")
    ;; Only a subset of the sources are released under a non-copyleft
    ;; free software license.  All other sources are removed in a
    ;; snippet.  See this bug report for an explanation of how the
    ;; license statements apply:
    ;; https://github.com/ENCODE-DCC/kentUtils/issues/12
    (license (license:non-copyleft
              "http://genome.ucsc.edu/license/"
              "The contents of this package are free for all uses."))))

(define-public f-seq
  (let ((commit "6ccded34cff38cf432deed8503648b4a66953f9b")
        (revision "1"))
    (package
      (name "f-seq")
      (version (git-version "1.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/aboyle/F-seq")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1nk33k0yajg2id4g59bc4szr58r2q6pdq42vgcw054m8ip9wv26h"))
                (modules '((guix build utils)))
                ;; Remove bundled Java library archives.
                (snippet
                 '(for-each delete-file (find-files "lib" ".*")))))
      (build-system ant-build-system)
      (arguments
       `(#:tests? #f ; no tests included
         #:phases
         (modify-phases %standard-phases
           (replace 'install
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let* ((target (assoc-ref outputs "out"))
                      (bin (string-append target "/bin"))
                      (doc (string-append target "/share/doc/f-seq"))
                      (lib (string-append target "/lib")))
                 (mkdir-p target)
                 (mkdir-p doc)
                 (substitute* "bin/linux/fseq"
                   (("java") (which "java"))
                   (("\\$REALDIR/../lib/commons-cli-1.1.jar")
                    (search-input-file inputs
                                       (string-append "/lib/m2/commons-cli/commons-cli/"
                                                      ,(package-version java-commons-cli)
                                                      "/commons-cli-"
                                                      ,(package-version java-commons-cli)
                                                      ".jar")))
                   (("REALDIR=.*")
                    (string-append "REALDIR=" bin "\n")))
                 (install-file "README.txt" doc)
                 (install-file "bin/linux/fseq" bin)
                 (install-file "build~/fseq.jar" lib)
                 (copy-recursively "lib" lib)))))))
      (inputs
       (list perl java-commons-cli))
      (home-page "https://fureylab.web.unc.edu/software/fseq/")
      (synopsis "Feature density estimator for high-throughput sequence tags")
      (description
       "F-Seq is a software package that generates a continuous tag sequence
density estimation allowing identification of biologically meaningful sites
such as transcription factor binding sites (ChIP-seq) or regions of open
chromatin (DNase-seq).  Output can be displayed directly in the UCSC Genome
Browser.")
      (license license:gpl3+))))

(define-public bismark
  (package
    (name "bismark")
    (version "0.20.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FelixKrueger/Bismark")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0xchm3rgilj6vfjnyzfzzymfd7djr64sbrmrvs3njbwi66jqbzw9"))))
    (build-system perl-build-system)
    (arguments
     `(#:tests? #f                      ; there are no tests
       #:modules ((guix build utils)
                  (ice-9 popen)
                  (srfi srfi-26)
                  (guix build perl-build-system))
       #:phases
       (modify-phases %standard-phases
         ;; The bundled plotly.js is minified.
         (add-after 'unpack 'replace-plotly.js
           (lambda* (#:key inputs #:allow-other-keys)
             (let* ((file (assoc-ref inputs "plotly.js"))
                    (installed "plotly/plotly.js"))
               (let ((minified (open-pipe* OPEN_READ "uglifyjs" file)))
                 (call-with-output-file installed
                   (cut dump-port minified <>))))
             #t))
         (delete 'configure)
         (delete 'build)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (share   (string-append out "/share/bismark"))
                    (docdir  (string-append out "/share/doc/bismark"))
                    (docs    '("Docs/Bismark_User_Guide.html"))
                    (scripts '("bismark"
                               "bismark_genome_preparation"
                               "bismark_methylation_extractor"
                               "bismark2bedGraph"
                               "bismark2report"
                               "coverage2cytosine"
                               "deduplicate_bismark"
                               "filter_non_conversion"
                               "bam2nuc"
                               "bismark2summary"
                               "NOMe_filtering")))
               (substitute* "bismark2report"
                 (("\\$RealBin/plotly")
                  (string-append share "/plotly")))
               (mkdir-p share)
               (mkdir-p docdir)
               (mkdir-p bin)
               (for-each (lambda (file) (install-file file bin))
                         scripts)
               (for-each (lambda (file) (install-file file docdir))
                         docs)
               (copy-recursively "Docs/Images" (string-append docdir "/Images"))
               (copy-recursively "plotly"
                                 (string-append share "/plotly"))

               ;; Fix references to gunzip
               (substitute* (map (lambda (file)
                                   (string-append bin "/" file))
                                 scripts)
                 (("\"gunzip -c")
                  (string-append "\"" (assoc-ref inputs "gzip")
                                 "/bin/gunzip -c")))
               #t))))))
    (inputs
     (list gzip perl-carp perl-getopt-long))
    (native-inputs
     `(("plotly.js"
        ,(origin
           (method url-fetch)
           (uri (string-append "https://raw.githubusercontent.com/plotly/plotly.js/"
                               "v1.39.4/dist/plotly.js"))
           (sha256
            (base32 "138mwsr4nf5qif4mrxx286mpnagxd1xwl6k8aidrjgknaqg88zyr"))))
       ("uglifyjs" ,node-uglify-js)))
    (home-page "https://www.bioinformatics.babraham.ac.uk/projects/bismark/")
    (synopsis "Map bisulfite treated sequence reads and analyze methylation")
    (description "Bismark is a program to map bisulfite treated sequencing
reads to a genome of interest and perform methylation calls in a single step.
The output can be easily imported into a genome viewer, such as SeqMonk, and
enables a researcher to analyse the methylation levels of their samples
straight away.  Its main features are:

@itemize
@item Bisulfite mapping and methylation calling in one single step
@item Supports single-end and paired-end read alignments
@item Supports ungapped and gapped alignments
@item Alignment seed length, number of mismatches etc are adjustable
@item Output discriminates between cytosine methylation in CpG, CHG
  and CHH context
@end itemize\n")
    (license license:gpl3+)))

(define-public paml
  (package
    (name "paml")
    (version "4.9e")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://abacus.gene.ucl.ac.uk/software/"
                                  "paml" version ".tgz"))
              (sha256
               (base32
                "13zf6h9fiqghwhch2h06x1zdr6s42plsnqahflp5g7myr3han3s6"))
              (modules '((guix build utils)))
              ;; Remove Windows binaries
              (snippet
               '(begin
                  (for-each delete-file (find-files "." "\\.exe$"))
                  ;; Some files in the original tarball have restrictive
                  ;; permissions, which makes repackaging fail
                  (for-each (lambda (file) (chmod file #o644)) (find-files "."))
                  #t))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; there are no tests
       #:make-flags '("CC=gcc" "CFLAGS=-fcommon -O3")
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda _
             (substitute* "src/BFdriver.c"
               (("/bin/bash") (which "bash")))
             (chdir "src")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((tools '("baseml" "basemlg" "codeml"
                            "pamp" "evolver" "yn00" "chi2"))
                   (bin    (string-append (assoc-ref outputs "out") "/bin"))
                   (docdir (string-append (assoc-ref outputs "out")
                                           "/share/doc/paml")))
               (mkdir-p bin)
               (for-each (lambda (file) (install-file file bin)) tools)
               (copy-recursively "../doc" docdir)))))))
    (home-page "http://abacus.gene.ucl.ac.uk/software/paml.html")
    (synopsis "Phylogentic analysis by maximum likelihood")
    (description "PAML (for Phylogentic Analysis by Maximum Likelihood)
contains a few programs for model fitting and phylogenetic tree reconstruction
using nucleotide or amino-acid sequence data.")
    ;; GPLv3 only
    (license license:gpl3)))

(define-public segemehl
  (package
    (name "segemehl")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.bioinf.uni-leipzig.de/Software"
                                  "/segemehl/downloads/segemehl-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0lbzbb7i8zadsn9b99plairhq6s2h1z8qdn6n7djclfis01nycz4"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             "all")
       #:tests? #false ; there are none
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         ;; There is no installation target
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out  (assoc-ref outputs "out"))
                    (bin  (string-append out "/bin"))
                    (exes (list "segemehl.x" "haarz.x")))
               (mkdir-p bin)
               (for-each (lambda (exe)
                           (install-file exe bin))
                         exes)))))))
    (inputs
     (list htslib ncurses zlib))
    (native-inputs
     (list pkg-config))
    (home-page "https://www.bioinf.uni-leipzig.de/Software/segemehl")
    (synopsis "Map short sequencer reads to reference genomes")
    (description "Segemehl is software to map short sequencer reads to
reference genomes.  Segemehl implements a matching strategy based on enhanced
suffix arrays (ESA).  It accepts fasta and fastq queries (gzip'ed and
bgzip'ed).  In addition to the alignment of reads from standard DNA- and
RNA-seq protocols, it also allows the mapping of bisulfite converted
reads (Lister and Cokus) and implements a split read mapping strategy.  The
output of segemehl is a SAM or BAM formatted alignment file.")
    (license license:gpl3+)))

(define-public kallisto
  (package
    (name "kallisto")
    (version "0.48.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pachterlab/kallisto")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0wx1ndmhndsd60952piaa925lk8bjr59d2yr1m2hcsqcb6cdjwpn"))
              (modules '((guix build utils)))
              (snippet
               '(delete-file-recursively "ext/htslib/"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f          ; no "check" target
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'do-not-use-bundled-htslib
           (lambda _
             (substitute* "CMakeLists.txt"
               (("^ExternalProject_Add" m)
                (string-append "if (NEVER)\n" m))
               (("^\\)")
                (string-append ")\nendif(NEVER)"))
               (("include_directories\\(\\$\\{htslib_PREFIX.*" m)
                (string-append "# " m)))
             (substitute* "src/CMakeLists.txt"
               (("target_link_libraries\\(kallisto kallisto_core pthread \
\\$\\{CMAKE_CURRENT_SOURCE_DIR\\}/../ext/htslib/libhts.a\\)")
                "target_link_libraries(kallisto kallisto_core pthread hts)")
               (("include_directories\\(\\.\\./ext/htslib\\)") "")))))))
    (inputs
     (list hdf5 htslib-1.9 zlib))
    (home-page "https://pachterlab.github.io/kallisto/")
    (synopsis "Near-optimal RNA-Seq quantification")
    (description
     "Kallisto is a program for quantifying abundances of transcripts from
RNA-Seq data, or more generally of target sequences using high-throughput
sequencing reads.  It is based on the novel idea of pseudoalignment for
rapidly determining the compatibility of reads with targets, without the need
for alignment.  Pseudoalignment of reads preserves the key information needed
for quantification, and kallisto is therefore not only fast, but also as
accurate as existing quantification tools.")
    (license license:bsd-2)))

(define-public libgff
  (package
    (name "libgff")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/COMBINE-lab/libgff")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ds9r22y8bl1rj7bhl0003kgmm6aam7g8l41mnjfrzw15d9zf9k4"))))
    (build-system cmake-build-system)
    (arguments `(#:tests? #f))          ; no tests included
    (home-page "https://github.com/COMBINE-lab/libgff")
    (synopsis "Parser library for reading/writing GFF files")
    (description "This is a simple \"libraryfication\" of the GFF/GTF parsing
code that is used in the Cufflinks codebase.  The goal of this library is to
provide this functionality without the necessity of drawing in a heavy-weight
dependency like SeqAn.")
    (license (license:x11-style "https://www.boost.org/LICENSE_1_0.txt"))))

(define-public sailfish
  (package
    (name "sailfish")
    (version "0.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kingsfordgroup/sailfish")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1amcc5hqvsl42hg4x19bi9vy47cl874s0lw1fmi0hwsdk9i8c03v"))
              (modules '((guix build utils)))
              ;; Delete bundled headers for eigen3.
              (snippet
               '(delete-file-recursively "include/eigen3/"))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags
       ,#~(list (string-append "-DBOOST_INCLUDEDIR="
                               #$(this-package-input "boost")
                               "/include/")
                (string-append "-DBOOST_LIBRARYDIR="
                               #$(this-package-input "boost")
                               "/lib/")
                (string-append "-DBoost_LIBRARIES="
                               "-lboost_iostreams "
                               "-lboost_filesystem "
                               "-lboost_system "
                               "-lboost_thread "
                               "-lboost_timer "
                               "-lboost_chrono "
                               "-lboost_program_options")
                "-DBoost_FOUND=TRUE"
                ;; Don't download RapMap---we already have it!
                "-DFETCHED_RAPMAP=1")
       ;; Tests must be run after installation and the location of the test
       ;; data file must be overridden.  But the tests fail.  It looks like
       ;; they are not really meant to be run.
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         ;; Boost cannot be found, even though it's right there.
         (add-after 'unpack 'do-not-look-for-boost
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "CMakeLists.txt"
               (("find_package\\(Boost 1\\.53\\.0") "#"))))
         (add-after 'unpack 'do-not-assign-to-macro
           (lambda _
             (substitute* "include/spdlog/details/format.cc"
               (("const unsigned CHAR_WIDTH = 1;") ""))))
         (add-after 'unpack 'prepare-rapmap
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((src "external/install/src/rapmap/")
                   (include "external/install/include/rapmap/")
                   (rapmap (assoc-ref inputs "rapmap")))
               (mkdir-p src)
               (mkdir-p include)
               (for-each (lambda (file)
                           (install-file file src))
                         (find-files (string-append rapmap "/src") "\\.(c|cpp)"))
               (copy-recursively (string-append rapmap "/include") include))))
         (add-after 'unpack 'use-system-libraries
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* '("src/SailfishIndexer.cpp"
                            "src/SailfishUtils.cpp"
                            "src/SailfishQuantify.cpp"
                            "src/FASTAParser.cpp"
                            "include/PCA.hpp"
                            "include/SailfishUtils.hpp"
                            "include/SailfishIndex.hpp"
                            "include/CollapsedEMOptimizer.hpp"
                            "src/CollapsedEMOptimizer.cpp")
               (("#include \"jellyfish/config.h\"") ""))
             (substitute* "src/CMakeLists.txt"
               (("\\$\\{GAT_SOURCE_DIR\\}/external/install/include/jellyfish-2.2..")
                (search-input-directory
                 inputs
                 (string-append "/include/jellyfish-" ,(package-version jellyfish))))
               (("\\$\\{GAT_SOURCE_DIR\\}/external/install/lib/libjellyfish-2.0.a")
                (search-input-file inputs
                                   "/lib/libjellyfish-2.0.a"))
               (("\\$\\{GAT_SOURCE_DIR\\}/external/install/lib/libdivsufsort.a")
                (search-input-file inputs
                                   "/lib/libdivsufsort.so"))
               (("\\$\\{GAT_SOURCE_DIR\\}/external/install/lib/libdivsufsort64.a")
                (search-input-file inputs
                                   "/lib/libdivsufsort64.so")))
             (substitute* "CMakeLists.txt"
               ;; Don't prefer static libs
               (("SET\\(CMAKE_FIND_LIBRARY_SUFFIXES.*") "")
               (("find_package\\(Jellyfish.*") "")
               (("ExternalProject_Add\\(libjellyfish") "message(")
               (("ExternalProject_Add\\(libgff") "message(")
               (("ExternalProject_Add\\(libsparsehash") "message(")
               (("ExternalProject_Add\\(libdivsufsort") "message("))

             ;; Ensure that Eigen headers can be found
             (setenv "CPLUS_INCLUDE_PATH"
                     (string-append (search-input-directory
                                     inputs "/include/eigen3")
                                    ":"
                                    (or (getenv "CPLUS_INCLUDE_PATH") ""))))))))
    (inputs
     `(("boost" ,boost)
       ("eigen" ,eigen)
       ("jemalloc" ,jemalloc)
       ("jellyfish" ,jellyfish)
       ("sparsehash" ,sparsehash)
       ("rapmap" ,(origin
                    (method git-fetch)
                    (uri (git-reference
                          (url "https://github.com/COMBINE-lab/RapMap")
                          (commit (string-append "sf-v" version))))
                    (file-name (string-append "rapmap-sf-v" version "-checkout"))
                    (sha256
                     (base32
                      "1hv79l5i576ykv5a1srj2p0q36yvyl5966m0fcy2lbi169ipjakf"))
                    (modules '((guix build utils)))
                    ;; These files are expected to be excluded.
                    (snippet
                     '(begin (delete-file-recursively "include/spdlog")
                             (for-each delete-file '("include/xxhash.h"
                                                     "src/xxhash.c"))))))
       ("libdivsufsort" ,libdivsufsort)
       ("libgff" ,libgff)
       ("tbb" ,tbb-2020)
       ("zlib" ,zlib)))
    (native-inputs
     (list pkg-config))
    (home-page "https://www.cs.cmu.edu/~ckingsf/software/sailfish/")
    (synopsis "Mapping-based isoform quantification from RNA-Seq reads")
    (description "Sailfish is a tool for genomic transcript quantification
from RNA-seq data.  It requires a set of target transcripts (either from a
reference or de-novo assembly) to quantify.  All you need to run sailfish is a
fasta file containing your reference transcripts and a (set of) fasta/fastq
file(s) containing your reads.")
    (license license:gpl3+)))

(define libstadenio-for-salmon
  (package
    (name "libstadenio")
    (version "1.14.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/COMBINE-lab/staden-io_lib")
                    (commit (string-append "v" version))))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "1x8kxxqxl892vwfbprlbyfwkkv7c34ggkc94892x9x0g37x5nbwx"))))
    (build-system gnu-build-system)
    (arguments '(#:parallel-tests? #f)) ; not supported
    (inputs
     `(("zlib" ,zlib)))
    (native-inputs
     `(("perl" ,perl)))                 ; for tests
    (home-page "https://github.com/COMBINE-lab/staden-io_lib")
    (synopsis "General purpose trace and experiment file library")
    (description "This package provides a library of file reading and writing
code to provide a general purpose Trace file (and Experiment File) reading
interface.

The following file formats are supported:

@enumerate
@item SCF trace files
@item ABI trace files
@item ALF trace files
@item ZTR trace files
@item SFF trace archives
@item SRF trace archives
@item Experiment files
@item Plain text files
@item SAM/BAM sequence files
@item CRAM sequence files
@end enumerate\n")
    (license license:bsd-3)))

(define-public salmon
  (package
    (name "salmon")
    (version "1.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/COMBINE-lab/salmon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0grpcajxf2bch4b74zb66pdssda8yc7jvxj5ckaw0xvw1605rpcj"))
              (modules '((guix build utils)))
              (snippet
               ;; Delete bundled headers for eigen3.
               '(delete-file-recursively "include/eigen3/"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list (string-append "-Dlibgff_DIR="
                             #$(this-package-input "libgff") "/lib")
              "-DCMAKE_CXX_FLAGS=\"-DHAVE_NUMERIC_LIMITS128=1\""
              "-Dlibgff_FOUND=TRUE"
              "-DTBB_FOUND=TRUE"
              #$(string-append "-DTBB_VERSION=" (package-version tbb))
              "-DFETCHED_PUFFERFISH=TRUE"
              "-DUSE_SHARED_LIBS=TRUE")
       #:phases
       '(modify-phases %standard-phases
          (add-after 'unpack 'prepare-pufferfish
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-recursively (assoc-ref inputs "pufferfish")
                                "external/pufferfish")
              ;; This test isn't working correctly, so compilation aborts.
              (substitute* "external/pufferfish/include/string_view.hpp"
                (("#if __has_include\\(<string_view>\\)")
                 "#if 0"))
              (let ((headers "external/install/pufferfish/include/pufferfish")
                    (source "external/install/src/pufferfish"))
                (mkdir-p headers)
                (mkdir-p source)
                (for-each (lambda (file)
                            (install-file (string-append "external/pufferfish/include/" file)
                                          headers))
                          (list "ProgOpts.hpp" "BooPHF.hpp" "SpinLock.hpp"
                                "Kmer.hpp" "CanonicalKmer.hpp" "string_view.hpp"
                                "CanonicalKmerIterator.hpp"
                                "PufferfishBaseIndex.hpp"
                                "PufferfishIndex.hpp"
                                "PufferfishSparseIndex.hpp"
                                "PufferfishLossyIndex.hpp"
                                "PufferfishTypes.hpp"
                                "rank9b.hpp" "rank9sel.hpp" "macros.hpp"
                                "select.hpp" "Util.hpp"
                                "PairedAlignmentFormatter.hpp"
                                "SelectiveAlignmentUtils.hpp"
                                "PuffAligner.hpp" "MemCollector.hpp"
                                "MemChainer.hpp" "CommonTypes.hpp"
                                "SAMWriter.hpp" "PufferfishConfig.hpp"
                                "BulkChunk.hpp" "BinWriter.hpp"))

                (for-each (lambda (dir)
                            (copy-recursively
                             (string-append "external/pufferfish/include/" dir)
                             (string-append headers "/" dir)))
                          (list "libdivide"
                                "ksw2pp"
                                "compact_vector"
                                "itlib"
                                "metro"
                                "chobo"
                                "sparsepp"
                                "simde"
                                "tsl"))
                (copy-recursively
                 (string-append "external/pufferfish/src/metro/")
                 (string-append source "/metro"))
                (install-file
                 (string-append "external/pufferfish/src/rank9b.cpp")
                 source)

                ;; Do not complain about not having built libtbb
                (substitute* "external/pufferfish/external/twopaco/CMakeLists.txt"
                  (("add_dependencies.*") "")))))
          (add-after 'unpack 'do-not-phone-home
            (lambda _
              (substitute* "src/Salmon.cpp"
                (("getVersionMessage\\(\\)") "\"\""))))
          (add-after 'unpack 'use-system-libraries
            (lambda* (#:key inputs #:allow-other-keys)
              ;; Ensure that all headers can be found
              (setenv "CPLUS_INCLUDE_PATH"
                      (string-append (or (getenv "CPLUS_INCLUDE_PATH") "")
                                     ":"
                                     (getcwd) "/external/install/pufferfish/include:"
                                     (assoc-ref inputs "eigen")
                                     "/include/eigen3"))))
          (add-after 'unpack 'fix-error-message-in-tests
            (lambda _
              (substitute* "cmake/TestSalmonQuasi.cmake"
                (("SALMON_QUASI_INDEX_COMMAND")
                 "SALMON_QUASI_INDEX_CMD")))))))
    (inputs
     (list boost
           bzip2
           cereal
           curl
           eigen
           htscodecs
           jemalloc
           libgff
           tbb
           libstadenio-for-salmon
           xz
           zlib))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("pufferfish" ,(origin
                        (method git-fetch)
                        (uri (git-reference
                              (url "https://github.com/COMBINE-lab/pufferfish")
                              (commit (string-append "salmon-v" version))))
                        (file-name (git-file-name "pufferfish" version))
                        (sha256
                         (base32
                          "0fcv5rd2k4fabsg489sjfxgjisivhwk1w26gfc88rgpszdkcla36"))))))
    (home-page "https://github.com/COMBINE-lab/salmon")
    (synopsis "Quantification from RNA-seq reads using lightweight alignments")
    (description "Salmon is a program to produce highly-accurate,
transcript-level quantification estimates from RNA-seq data.  Salmon achieves
its accuracy and speed via a number of different innovations, including the
use of lightweight alignments (accurate but fast-to-compute proxies for
traditional read alignments) and massively-parallel stochastic collapsed
variational inference.")
    (license license:gpl3+)))

(define-public scallop
  (package
    (name "scallop")
    (version "0.10.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Kingsford-Group/scallop"
                                  "/releases/download/v" version
                                  "/scallop-" version ".tar.gz"))
              (sha256
               (base32
                "0ylkhr5hsmw7bsdszrjz9yqknsijh2fl5n6rjqmdmcdky5hkr7mh"))))
    (build-system gnu-build-system)
    (inputs
     (list boost htslib))
    (home-page "https://github.com/Kingsford-Group/scallop")
    (synopsis "Reference-based transcriptome assembler for RNA-seq")
    (description "Scallop is a reference-based transcript assembler.  Scallop
features its high accuracy in assembling multi-exon transcripts as well as
lowly expressed transcripts.")
    (license license:bsd-3)))

(define-public python-fanc
  (package
    (name "python-fanc")
    (version "0.9.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vaquerizaslab/fanc")
                    ;; There are no tags.  This commit corresponds to
                    ;; version 0.9.25.
                    (commit "e2205346c13ea5349681dff21adeb271d4ea5261")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0rxq24p852iiayi0083fyigvc30as695rha71q6xd4s2ij1k9mqi"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "pytest" "-vv"
                       "-k"
                       ;; XXX: These all fail because they fail to read
                       ;; the included test_{cooler,juicer}.hic files.
                       (string-append "not test_edges_iter"
                                      " and not test_get_edges_uncorrected"
                                      " and not test_get_edges"))))))))
    (propagated-inputs
     (list python-biopython
           python-cooler
           python-deprecated
           python-future
           python-genomic-regions
           python-gridmap
           python-h5py
           python-intervaltree
           python-matplotlib
           python-msgpack
           python-msgpack-numpy
           python-numpy
           python-pandas
           python-pillow
           python-progressbar2
           python-pybedtools
           python-pybigwig
           python-pysam
           python-pytest
           python-pyyaml
           python-scikit-image
           python-scikit-learn
           python-scipy
           python-seaborn
           python-tables))
    (native-inputs
     (list python-cython))
    (home-page "https://github.com/vaquerizaslab/fanc")
    (synopsis "Framework for the analysis of C-data")
    (description
     "FAN-C provides a pipeline for analysing Hi-C data starting at
mapped paired-end sequencing reads.")
    (license license:gpl3+)))

(define-public python-genomic-regions
  (package
    (name "python-genomic-regions")
    (version "0.0.10")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "genomic_regions" version))
              (sha256
               (base32
                "0hz811iyd1prml1r90qyzimmwyjwycwkjqw4vnl12bxy61rfzjz5"))))
    (build-system pyproject-build-system)
    (propagated-inputs
     (list python-future
           python-intervaltree
           python-numpy
           python-pandas
           python-pybedtools
           python-pybigwig
           python-pytest
           python-msgpack-numpy
           python-cython
           python-msgpack
           python-pysam))
    (home-page "https://pypi.org/project/genomic-regions/")
    (synopsis "Consistently handle genomic regions")
    (description "This package aims to simplify working with genomic region /
interval data by providing a common interface that lets you access a wide
selection of file types and formats for handling genomic region data---all
using the same syntax.")
    (license license:expat)))

(define-public python-goatools
  (package
    (name "python-goatools")
    (version "1.3.1")
    ;; Pypi tarball doesn't include test files.
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tanghaibao/goatools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0a295zk9jc8kny5vnka63q3gbksins42kcmgvskf8xy7hkca7cmq"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      ;; Almost all tests require access to the internet.
      #:tests? #false
      #:test-flags
      ;; These have syntax errors.
      '(list "--ignore=tests/test_i195_sgd_gaf.py"
             "--ignore=tests/test_i206.py"
             "--ignore=tests/test_setup_dirs.py")))
    (propagated-inputs (list python-docopt
                             python-numpy
                             python-openpyxl
                             python-pandas
                             python-pydot
                             python-requests
                             python-scipy
                             python-statsmodels
                             python-xlsxwriter))
    (native-inputs (list python-pytest))
    (home-page "https://github.com/tanghaibao/goatools")
    (synopsis "Python scripts to find enrichment of GO terms")
    (description "Python scripts to find enrichment of GO terms.  In addition,
this package is used for processing the obo-formatted file from Gene Ontology
website.  The data structure is a directed acyclic graph that allows easy
traversal from leaf to root.")
    (license license:bsd-2)))

(define-public python-loompy
  (package
    (name "python-loompy")
    (version "3.0.7")
    ;; The tarball on Pypi does not include the tests.
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linnarsson-lab/loompy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0xmw2yv1y3y7vh5jcbrmlkn43nmfs0pf6z78k1yxqs3qy248m9b0"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; See https://github.com/linnarsson-lab/loompy/issues/169
         (add-after 'unpack 'fix-h5py-error
           (lambda _
             (substitute* "tests/test_file_attribute_manager.py"
               (("h5py.File\\(f.name\\)")
                "h5py.File(f.name, 'a')"))))
         ;; Numba needs a writable dir to cache functions.
         (add-before 'check 'set-numba-cache-dir
           (lambda _
             (setenv "NUMBA_CACHE_DIR" "/tmp")))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "pytest" "tests")))))))
    (propagated-inputs
     (list python-click
           python-h5py
           python-numba
           python-numpy
           python-numpy-groupies
           python-pandas
           python-scipy))
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/linnarsson-lab/loompy")
    (synopsis "Work with .loom files for single-cell RNA-seq data")
    (description "The loom file format is an efficient format for very large
omics datasets, consisting of a main matrix, optional additional layers, a
variable number of row and column annotations.  Loom also supports sparse
graphs.  This library makes it easy to work with @file{.loom} files for
single-cell RNA-seq data.")
    (license license:bsd-3)))

(define-public python-biothings-client
  (package
    (name "python-biothings-client")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "biothings_client" version))
       (sha256
        (base32 "0bccs37d5saxn5xsd2rfpkrnc5a120xs3ibizai66fgvp1vxbnc4"))))
    (build-system python-build-system)
    (arguments `(#:tests? #false)) ; require internet access
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/biothings/biothings_client.py")
    (synopsis "Python client for BioThings API services")
    (description "This package provides a Python client for BioThings
API services.")
    (license license:bsd-3)))

(define-public python-mgatk
  (package
    (name "python-mgatk")
    (version "0.6.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/caleblareau/mgatk")
             ;; There is no tag for 0.6.7, but this is the commit
             ;; corresponding to the version bump.
             (commit "2633903acb1fb406bb58c787f320c3641f446ee7")))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "19iklfv1brwsfg1l5lrs3z8m343nskkn1998c1fs7fdn0lgrki2p"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; The md5 module has been removed in Python 3
          (add-after 'unpack 'python3-compatibility
            (lambda _
              (substitute* "tests/test_cli.py"
                (("import md5") "from hashlib import md5")
                (("md5.new") "md5")
                (("\\.digest") ".hexdigest")))))))
    (propagated-inputs
     (list python-biopython
           python-click
           python-numpy
           python-optparse-pretty
           python-pandas
           python-pysam
           python-regex
           python-ruamel.yaml
           snakemake))
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/caleblareau/mgatk")
    (synopsis "Mitochondrial genome analysis toolkit.")
    (description "This package is a Python-based command line interface for
processing .bam files with mitochondrial reads and generating high-quality
heteroplasmy estimation from sequencing data.  The mgatk package places a
special emphasis on mitochondrial genotypes generated from single-cell
genomics data, primarily @acronym{mtscATAC-seq, mitochondrial single-cell
ATAC-sequence}, but is generally applicable across other assays.")
    (license license:expat)))

(define-public python-multivelo
  (package
    (name "python-multivelo")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "multivelo" version))
              (sha256
               (base32
                "1b4qyngwagh5sc2ygyfqyirg63myzh1g1glk03a1ykxfii32cjlp"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f                       ;pypi source does not contain tests
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'sanity-check 'set-env
            (lambda _
              ;; numba RuntimeError: cannot cache function 'rdist'
              (setenv "NUMBA_CACHE_DIR" "/tmp"))))))
    (native-inputs (list python-pypa-build))
    (propagated-inputs
     (list python-anndata
           python-h5py
           python-ipywidgets
           python-joblib
           python-loompy
           python-matplotlib
           python-numba
           python-numpy
           python-pandas
           python-scanpy
           python-scikit-learn
           python-scipy
           python-seaborn
           python-tqdm
           python-umap-learn
           scvelo))
    (home-page "https://github.com/welch-lab/MultiVelo")
    (synopsis "Velocity inference from single-cell multi-omic data")
    (description "MultiVelo uses a probabilistic latent variable model to
estimate the switch time and rate parameters of gene regulation, providing a
quantitative summary of the temporal relationship between epigenomic and
transcriptomic changes.")
    (license license:bsd-3)))

(define-public python-mygene
  (package
    (name "python-mygene")
    (version "3.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mygene" version))
       (sha256
        (base32 "1snszwdgfygchxshcbry3b5pbcw3g1isp8dw46razxccqaxwlag7"))))
    (build-system python-build-system)
    (propagated-inputs
     (list python-biothings-client))
    (home-page "https://github.com/biothings/mygene.py")
    (synopsis "Python Client for MyGene.Info services")
    (description "MyGene.Info provides simple-to-use REST web services
to query/retrieve gene annotation data.  It's designed with simplicity
and performance emphasized.  Mygene is a Python wrapper to access
MyGene.Info services.")
    (license license:bsd-3)))

;; We cannot use the latest commit because it requires Java 9.
(define-public java-forester
  (let ((commit "86b07efe302d5094b42deed9260f719a4c4ac2e6")
        (revision "1"))
    (package
      (name "java-forester")
      (version (string-append "0-" revision "." (string-take commit 7)))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/cmzmasek/forester")
                      (commit commit)))
                (file-name (string-append name "-" version "-checkout"))
                (sha256
                 (base32
                  "0vxavc1yrf84yrnf20dq26hi0lglidk8d382xrxsy4qmlbjd276z"))
                (modules '((guix build utils)))
                (snippet
                 '(begin
                    ;; Delete bundled jars and pre-built classes
                    (delete-file-recursively "forester/java/resources")
                    (delete-file-recursively "forester/java/classes")
                    (for-each delete-file (find-files "forester/java/" "\\.jar$"))
                    ;; Delete bundled applications
                    (delete-file-recursively "forester_applications")
                    #t))))
      (build-system ant-build-system)
      (arguments
       `(#:tests? #f ; there are none
         #:jdk ,icedtea-8
         #:modules ((guix build ant-build-system)
                    (guix build utils)
                    (guix build java-utils)
                    (sxml simple)
                    (sxml transform))
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'chdir
             (lambda _ (chdir "forester/java") #t))
           (add-after 'chdir 'fix-dependencies
             (lambda _
               (chmod "build.xml" #o664)
               (call-with-output-file "build.xml.new"
                 (lambda (port)
                   (sxml->xml
                    (pre-post-order
                     (with-input-from-file "build.xml"
                       (lambda _ (xml->sxml #:trim-whitespace? #t)))
                     `(;; Remove all unjar tags to avoid repacking classes.
                       (unjar     . ,(lambda _ '()))
                       (*default* . ,(lambda (tag . kids) `(,tag ,@kids)))
                       (*text*    . ,(lambda (_ txt) txt))))
                    port)))
               (rename-file "build.xml.new" "build.xml")
               #t))
           ;; FIXME: itext is difficult to package as it depends on a few
           ;; unpackaged libraries.
           (add-after 'chdir 'remove-dependency-on-unpackaged-itext
             (lambda _
               (delete-file "src/org/forester/archaeopteryx/PdfExporter.java")
               (substitute* "src/org/forester/archaeopteryx/MainFrame.java"
                 (("pdf_written_to = PdfExporter.*")
                  "throw new IOException(\"PDF export is not available.\");"))
               #t))
           ;; There is no install target
           (replace 'install (install-jars ".")))))
      (propagated-inputs
       (list java-commons-codec java-openchart2))
      (home-page "https://sites.google.com/site/cmzmasek/home/software/forester")
      (synopsis "Phylogenomics libraries for Java")
      (description "Forester is a collection of Java libraries for
phylogenomics and evolutionary biology research.  It includes support for
reading, writing, and exporting phylogenetic trees.")
      (license license:lgpl2.1+))))

(define-public java-forester-1.005
  (package
    (name "java-forester")
    (version "1.005")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://repo1.maven.org/maven2/"
                                  "org/biojava/thirdparty/forester/"
                                  version "/forester-" version "-sources.jar"))
              (file-name (string-append name "-" version ".jar"))
              (sha256
               (base32
                "04r8qv4rk3p71z4ajrvp11py1z46qrx0047j3zzs79s6lnsm3lcv"))))
    (build-system ant-build-system)
    (arguments
     `(#:tests? #f ; there are none
       #:jdk ,icedtea-8
       #:modules ((guix build ant-build-system)
                  (guix build utils)
                  (guix build java-utils)
                  (sxml simple)
                  (sxml transform))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-dependencies
           (lambda* (#:key inputs #:allow-other-keys)
             (call-with-output-file "build.xml"
               (lambda (port)
                 (sxml->xml
                  (pre-post-order
                   (with-input-from-file "src/build.xml"
                     (lambda _ (xml->sxml #:trim-whitespace? #t)))
                   `(;; Remove all unjar tags to avoid repacking classes.
                     (unjar     . ,(lambda _ '()))
                     (*default* . ,(lambda (tag . kids) `(,tag ,@kids)))
                     (*text*    . ,(lambda (_ txt) txt))))
                  port)))
             (copy-file (assoc-ref inputs "synth_look_and_feel_1.xml")
                        "synth_look_and_feel_1.xml")
             (copy-file (assoc-ref inputs "phyloxml.xsd")
                        "phyloxml.xsd")
             (substitute* "build.xml"
               (("../resources/synth_laf/synth_look_and_feel_1.xml")
                "synth_look_and_feel_1.xml")
               (("../resources/phyloxml_schema/1.10/phyloxml.xsd")
                "phyloxml.xsd"))
             #t))
         ;; FIXME: itext is difficult to package as it depends on a few
         ;; unpackaged libraries.
         (add-after 'unpack 'remove-dependency-on-unpackaged-itext
           (lambda _
             (delete-file "src/org/forester/archaeopteryx/PdfExporter.java")
             (substitute* '("src/org/forester/archaeopteryx/MainFrame.java"
                            "src/org/forester/archaeopteryx/MainFrameApplication.java")
               (("pdf_written_to = PdfExporter.*")
                "throw new IOException(\"PDF export is not available.\"); /*")
               ((".getPrintSizeX\\(\\), getOptions\\(\\).getPrintSizeY\\(\\) \\);") "*/")
               (("getCurrentTreePanel\\(\\).getHeight\\(\\) \\);") "*/"))
             #t))
         (add-after 'unpack 'delete-pre-built-classes
           (lambda _ (delete-file-recursively "src/classes") #t))
         ;; There is no install target
         (replace 'install (install-jars ".")))))
    (propagated-inputs
     (list java-commons-codec java-openchart2))
    ;; The source archive does not contain the resources.
    (native-inputs
     `(("phyloxml.xsd"
        ,(origin
           (method url-fetch)
           (uri (string-append "https://raw.githubusercontent.com/cmzmasek/forester/"
                               "b61cc2dcede0bede317db362472333115756b8c6/"
                               "forester/resources/phyloxml_schema/1.10/phyloxml.xsd"))
           (file-name (string-append name "-phyloxml-" version ".xsd"))
           (sha256
            (base32
             "1zxc4m8sn4n389nqdnpxa8d0k17qnr3pm2y5y6g6vh4k0zm52npv"))))
       ("synth_look_and_feel_1.xml"
        ,(origin
           (method url-fetch)
           (uri (string-append "https://raw.githubusercontent.com/cmzmasek/forester/"
                               "29e04321615da6b35c1e15c60e52caf3f21d8e6a/"
                               "forester/java/classes/resources/"
                               "synth_look_and_feel_1.xml"))
           (file-name (string-append name "-synth-look-and-feel-" version ".xml"))
           (sha256
            (base32
             "1gv5602gv4k7y7713y75a4jvj7i9s7nildsbdl7n9q10sc2ikg8h"))))))
    (home-page "https://sites.google.com/site/cmzmasek/home/software/forester")
    (synopsis "Phylogenomics libraries for Java")
    (description "Forester is a collection of Java libraries for
phylogenomics and evolutionary biology research.  It includes support for
reading, writing, and exporting phylogenetic trees.")
    (license license:lgpl2.1+)))

(define-public java-biojava-core
  (package
    (name "java-biojava-core")
    (version "4.2.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/biojava/biojava")
                    (commit (string-append "biojava-" version))))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "1bvryh2bpsvash8ln79cmc9sqm8qw72hz4xzwqxcrjm8ssxszhqk"))))
    (build-system ant-build-system)
    (arguments
     `(#:jdk ,icedtea-8
       #:jar-name "biojava-core.jar"
       #:source-dir "biojava-core/src/main/java/"
       #:test-dir "biojava-core/src/test"
       ;; These tests seem to require internet access.
       #:test-exclude (list "**/SearchIOTest.java"
                            "**/BlastXMLParserTest.java"
                            "**/GenbankCookbookTest.java"
                            "**/GenbankProxySequenceReaderTest.java")
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'copy-resources
           (lambda _
             (copy-recursively "biojava-core/src/main/resources"
                               "build/classes")
             #t))
         (add-before 'check 'copy-test-resources
           (lambda _
             (copy-recursively "biojava-core/src/test/resources"
                               "build/test-classes")
             #t)))))
    (propagated-inputs
     (list java-log4j-api java-log4j-core java-slf4j-api
           java-slf4j-simple))
    (native-inputs
     (list java-junit java-hamcrest-core))
    (home-page "https://biojava.org")
    (synopsis "Core libraries of Java framework for processing biological data")
    (description "BioJava is a project dedicated to providing a Java framework
for processing biological data.  It provides analytical and statistical
routines, parsers for common file formats, reference implementations of
popular algorithms, and allows the manipulation of sequences and 3D
structures.  The goal of the biojava project is to facilitate rapid
application development for bioinformatics.

This package provides the core libraries.")
    (license license:lgpl2.1+)))

(define-public java-biojava-phylo
  (package (inherit java-biojava-core)
    (name "java-biojava-phylo")
    (build-system ant-build-system)
    (arguments
     `(#:jdk ,icedtea-8
       #:jar-name "biojava-phylo.jar"
       #:source-dir "biojava-phylo/src/main/java/"
       #:test-dir "biojava-phylo/src/test"
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'copy-resources
           (lambda _
             (copy-recursively "biojava-phylo/src/main/resources"
                               "build/classes")
             #t))
         (add-before 'check 'copy-test-resources
           (lambda _
             (copy-recursively "biojava-phylo/src/test/resources"
                               "build/test-classes")
             #t)))))
    (propagated-inputs
     (list java-log4j-api
           java-log4j-core
           java-slf4j-api
           java-slf4j-simple
           java-biojava-core
           java-forester))
    (native-inputs
     (list java-junit java-hamcrest-core))
    (home-page "https://biojava.org")
    (synopsis "Biojava interface to the forester phylogenomics library")
    (description "The phylo module provides a biojava interface layer to the
forester phylogenomics library for constructing phylogenetic trees.")))

(define-public java-biojava-alignment
  (package (inherit java-biojava-core)
    (name "java-biojava-alignment")
    (build-system ant-build-system)
    (arguments
     `(#:jdk ,icedtea-8
       #:jar-name "biojava-alignment.jar"
       #:source-dir "biojava-alignment/src/main/java/"
       #:test-dir "biojava-alignment/src/test"
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'copy-resources
           (lambda _
             (copy-recursively "biojava-alignment/src/main/resources"
                               "build/classes")
             #t))
         (add-before 'check 'copy-test-resources
           (lambda _
             (copy-recursively "biojava-alignment/src/test/resources"
                               "build/test-classes")
             #t)))))
    (propagated-inputs
     (list java-log4j-api
           java-log4j-core
           java-slf4j-api
           java-slf4j-simple
           java-biojava-core
           java-biojava-phylo
           java-forester))
    (native-inputs
     (list java-junit java-hamcrest-core))
    (home-page "https://biojava.org")
    (synopsis "Biojava API for genetic sequence alignment")
    (description "The alignment module of BioJava provides an API that
contains

@itemize
@item implementations of dynamic programming algorithms for sequence
  alignment;
@item reading and writing of popular alignment file formats;
@item a single-, or multi- threaded multiple sequence alignment algorithm.
@end itemize\n")))

(define-public java-biojava-core-4.0
  (package (inherit java-biojava-core)
    (name "java-biojava-core")
    (version "4.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/biojava/biojava")
                    (commit (string-append "biojava-" version))))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "13675f6y9aqi7bi2lk3s1z7a22ynccjiqwa8izh7p97xi9wsfmd8"))))))

(define-public java-biojava-phylo-4.0
  (package (inherit java-biojava-core-4.0)
    (name "java-biojava-phylo")
    (build-system ant-build-system)
    (arguments
     `(#:jdk ,icedtea-8
       #:jar-name "biojava-phylo.jar"
       #:source-dir "biojava-phylo/src/main/java/"
       #:test-dir "biojava-phylo/src/test"
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'copy-resources
           (lambda _
             (copy-recursively "biojava-phylo/src/main/resources"
                               "build/classes")
             #t))
         (add-before 'check 'copy-test-resources
           (lambda _
             (copy-recursively "biojava-phylo/src/test/resources"
                               "build/test-classes")
             #t)))))
    (propagated-inputs
     (list java-log4j-api
           java-log4j-core
           java-slf4j-api
           java-slf4j-simple
           java-biojava-core-4.0
           java-forester-1.005))
    (native-inputs
     (list java-junit java-hamcrest-core))
    (home-page "https://biojava.org")
    (synopsis "Biojava interface to the forester phylogenomics library")
    (description "The phylo module provides a biojava interface layer to the
forester phylogenomics library for constructing phylogenetic trees.")))

(define-public java-biojava-alignment-4.0
  (package (inherit java-biojava-core-4.0)
    (name "java-biojava-alignment")
    (build-system ant-build-system)
    (arguments
     `(#:jdk ,icedtea-8
       #:jar-name "biojava-alignment.jar"
       #:source-dir "biojava-alignment/src/main/java/"
       #:test-dir "biojava-alignment/src/test"
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'copy-resources
           (lambda _
             (copy-recursively "biojava-alignment/src/main/resources"
                               "build/classes")
             #t))
         (add-before 'check 'copy-test-resources
           (lambda _
             (copy-recursively "biojava-alignment/src/test/resources"
                               "build/test-classes")
             #t)))))
    (propagated-inputs
     (list java-log4j-api
           java-log4j-core
           java-slf4j-api
           java-slf4j-simple
           java-biojava-core-4.0
           java-biojava-phylo-4.0
           java-forester-1.005))
    (native-inputs
     (list java-junit java-hamcrest-core))
    (home-page "https://biojava.org")
    (synopsis "Biojava API for genetic sequence alignment")
    (description "The alignment module of BioJava provides an API that
contains

@itemize
@item implementations of dynamic programming algorithms for sequence
  alignment;
@item reading and writing of popular alignment file formats;
@item a single-, or multi- threaded multiple sequence alignment algorithm.
@end itemize\n")))

(define-public dropseq-tools
  (package
    (name "dropseq-tools")
    (version "1.13")
    (source
     (origin
       (method url-fetch)
       (uri "http://mccarrolllab.com/download/1276/")
       (file-name (string-append "dropseq-tools-" version ".zip"))
       (sha256
        (base32
         "0yrffckxqk5l8b5xb6z4laq157zd9mdypr2p4b4vq2bhjzi1sj0s"))
       ;; Delete bundled libraries
       (modules '((guix build utils)))
       (snippet
        '(begin
           (for-each delete-file (find-files "jar/lib" "\\.jar$"))
           (delete-file-recursively "3rdParty")))))
    (build-system ant-build-system)
    (arguments
     `(#:tests? #f                      ; test data are not included
       #:test-target "test"
       #:build-target "all"
       #:source-dir "public/src/"
       #:jdk ,icedtea-8
       #:make-flags
       (list ,#~(string-append "-Dpicard.executable.dir="
                               #$(this-package-input "java-picard")
                               "/share/java/"))
       #:modules ((ice-9 match)
                  (srfi srfi-1)
                  (guix build utils)
                  (guix build java-utils)
                  (guix build ant-build-system))
       #:phases
       (modify-phases %standard-phases
         ;; FIXME: fails with "java.io.FileNotFoundException:
         ;; /gnu/store/…-dropseq-tools-1.13/share/java/lib/biojava-alignment.jar"
         (delete 'generate-jar-indices)
         ;; All dependencies must be linked to "lib", because that's where
         ;; they will be searched for when the Class-Path property of the
         ;; manifest is computed.
         (add-after 'unpack 'record-references
	   (lambda* (#:key inputs #:allow-other-keys)
             (mkdir-p "jar/lib")
             (let ((dirs (filter-map (match-lambda
                                       ((name . dir)
                                        (if (and (string-prefix? "java-" name)
                                                 (not (string=? name "java-testng")))
                                            dir #f)))
                                     inputs)))
               (for-each (lambda (jar)
                           (symlink jar (string-append "jar/lib/" (basename jar))))
                         (append-map (lambda (dir) (find-files dir "\\.jar$"))
                                     dirs)))))
         ;; There is no installation target
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out     (assoc-ref outputs "out"))
                    (bin     (string-append out "/bin"))
                    (share   (string-append out "/share/java/"))
                    (lib     (string-append share "/lib/"))
                    (scripts (list "BAMTagHistogram"
                                   "BAMTagofTagCounts"
                                   "BaseDistributionAtReadPosition"
                                   "CollapseBarcodesInPlace"
                                   "CollapseTagWithContext"
                                   "ConvertToRefFlat"
                                   "CreateIntervalsFiles"
                                   "DetectBeadSynthesisErrors"
                                   "DigitalExpression"
                                   "Drop-seq_alignment.sh"
                                   "FilterBAM"
                                   "FilterBAMByTag"
                                   "GatherGeneGCLength"
                                   "GatherMolecularBarcodeDistributionByGene"
                                   "GatherReadQualityMetrics"
                                   "PolyATrimmer"
                                   "ReduceGTF"
                                   "SelectCellsByNumTranscripts"
                                   "SingleCellRnaSeqMetricsCollector"
                                   "TagBamWithReadSequenceExtended"
                                   "TagReadWithGeneExon"
                                   "TagReadWithInterval"
                                   "TrimStartingSequence"
                                   "ValidateReference")))
               (for-each mkdir-p (list bin share lib))
               (install-file "dist/dropseq.jar" share)
               (for-each (lambda (script)
                           (chmod script #o555)
                           (install-file script bin))
                         scripts)
               (substitute* (map (lambda (script)
                                   (string-append bin "/" script))
                                 scripts)
                 (("^java") (which "java"))
                 (("jar_deploy_dir=.*")
                  (string-append "jar_deploy_dir=" share "\n"))))))
         ;; FIXME: We do this after stripping jars because we don't want it to
         ;; copy all these jars and strip them.  We only want to install
         ;; links.  Arguably, this is a problem with the ant-build-system.
         (add-after 'strip-jar-timestamps 'install-links
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out     (assoc-ref outputs "out"))
                    (share   (string-append out "/share/java/"))
                    (lib     (string-append share "/lib/")))
               (for-each (lambda (jar)
                           (symlink (readlink jar)
                                    (string-append lib (basename jar))))
                         (find-files "jar/lib" "\\.jar$"))))))))
    (inputs
     `(("jdk" ,icedtea-8)
       ("java-picard" ,java-picard-2.10.3)
       ("java-log4j-1.2-api" ,java-log4j-1.2-api)
       ("java-commons-math3" ,java-commons-math3)
       ("java-commons-jexl2" ,java-commons-jexl-2)
       ("java-commons-collections4" ,java-commons-collections4)
       ("java-commons-lang2" ,java-commons-lang)
       ("java-commons-io" ,java-commons-io)
       ("java-snappy-1.0.3-rc3" ,java-snappy-1)
       ("java-guava" ,java-guava)
       ("java-la4j" ,java-la4j)
       ("java-biojava-core" ,java-biojava-core-4.0)
       ("java-biojava-alignment" ,java-biojava-alignment-4.0)
       ("java-jdistlib" ,java-jdistlib)
       ("java-simple-xml" ,java-simple-xml)
       ("java-snakeyaml" ,java-snakeyaml)))
    (native-inputs
     (list unzip java-testng))
    (home-page "http://mccarrolllab.com/dropseq/")
    (synopsis "Tools for Drop-seq analyses")
    (description "Drop-seq is a technology to enable biologists to
analyze RNA expression genome-wide in thousands of individual cells at
once.  This package provides tools to perform Drop-seq analyses.")
    (license license:expat)))

(define-public pigx-rnaseq
  (package
    (name "pigx-rnaseq")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/BIMSBbioinfo/pigx_rnaseq/"
                                  "releases/download/v" version
                                  "/pigx_rnaseq-" version ".tar.gz"))
              (sha256
               (base32
                "0acdjimfb9ywba8zsv7lavv436pmcmp8ra683h11wr4s3681pqk8"))))
    (build-system gnu-build-system)
    (arguments
     `(#:parallel-tests? #f             ; not supported
       #:phases
       (modify-phases %standard-phases
         ;; "test.sh" runs the whole pipeline, which takes a long time and
         ;; might fail due to OOM.  The MultiQC is also resource intensive.
         (add-after 'unpack 'disable-resource-intensive-test
           (lambda _
             (substitute* "Makefile.in"
               (("^  tests/test_multiqc/test.sh") "")
               (("^  test.sh") ""))))
         (add-before 'bootstrap 'autoreconf
           (lambda _
             (invoke "autoreconf" "-vif")))
         (add-before 'configure 'set-PYTHONPATH
           (lambda _
             (setenv "PYTHONPATH" (getenv "GUIX_PYTHONPATH"))))
         (add-before 'check 'set-timezone
           ;; The readr package is picky about timezones.
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "TZ" "UTC+1")
             (setenv "TZDIR"
                     (search-input-directory inputs
                                             "share/zoneinfo")))))))
    (inputs
     (list coreutils
           sed
           gzip
           snakemake
           megadepth
           multiqc
           star-for-pigx
           hisat2
           fastp
           htseq
           samtools
           r-minimal
           r-rmarkdown
           r-ggplot2
           r-ggpubr
           r-ggrepel
           r-gprofiler2
           r-deseq2
           r-dt
           r-knitr
           r-pheatmap
           r-corrplot
           r-reshape2
           r-plotly
           r-scales
           r-summarizedexperiment
           r-crosstalk
           r-tximport
           r-rtracklayer
           r-rjson
           salmon
           pandoc
           python-wrapper
           python-deeptools
           python-pyyaml))
    (native-inputs
     (list tzdata automake autoconf))
    (home-page "https://bioinformatics.mdc-berlin.de/pigx/")
    (synopsis "Analysis pipeline for RNA sequencing experiments")
    (description "PiGX RNAseq is an analysis pipeline for preprocessing and
reporting for RNA sequencing experiments.  It is easy to use and produces high
quality reports.  The inputs are reads files from the sequencing experiment,
and a configuration file which describes the experiment.  In addition to
quality control of the experiment, the pipeline produces a differential
expression report comparing samples in an easily configurable manner.")
    (license license:gpl3+)))

(define-public pigx-chipseq
  (package
    (name "pigx-chipseq")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/BIMSBbioinfo/pigx_chipseq/"
                                  "releases/download/v" version
                                  "/pigx_chipseq-" version ".tar.gz"))
              (sha256
               (base32
                "008n6drj9q5av86xihxlj4py2c9p3c5z5ld89c3bksrp77zxiy67"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; parts of the tests rely on access to the network
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'set-PYTHONPATH
           (lambda _
             (setenv "PYTHONPATH" (getenv "GUIX_PYTHONPATH")))))))
    (inputs
     (list grep
           coreutils
           r-minimal
           r-argparser
           r-biocparallel
           r-biostrings
           r-chipseq
           r-corrplot
           r-data-table
           r-deseq2
           r-dplyr
           r-dt
           r-genomation
           r-genomicalignments
           r-genomicranges
           r-ggplot2
           r-ggrepel
           r-gprofiler2
           r-heatmaply
           r-hexbin
           r-htmlwidgets
           r-jsonlite
           r-pheatmap
           r-plotly
           r-rmarkdown
           r-rsamtools
           r-rsubread
           r-rtracklayer
           r-s4vectors
           r-stringr
           r-tibble
           r-tidyr
           python-wrapper
           python-pyyaml
           python-magic
           python-xlrd
           trim-galore
           macs
           multiqc
           perl
           pandoc
           fastqc
           bowtie
           idr
           snakemake
           samtools
           bedtools
           kentutils))
    (native-inputs
     (list python-pytest))
    (home-page "https://bioinformatics.mdc-berlin.de/pigx/")
    (synopsis "Analysis pipeline for ChIP sequencing experiments")
    (description "PiGX ChIPseq is an analysis pipeline for preprocessing, peak
calling and reporting for ChIP sequencing experiments.  It is easy to use and
produces high quality reports.  The inputs are reads files from the sequencing
experiment, and a configuration file which describes the experiment.  In
addition to quality control of the experiment, the pipeline enables to set up
multiple peak calling analysis and allows the generation of a UCSC track hub
in an easily configurable manner.")
    (license license:gpl3+)))

(define-public pigx-bsseq
  (package
    (name "pigx-bsseq")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/BIMSBbioinfo/pigx_bsseq/"
                                  "releases/download/v" version
                                  "/pigx_bsseq-" version ".tar.gz"))
              (sha256
               (base32
                "1s8zgrqxabrawrgkga5rmgb0gyzj7ck47p3rkicjkfv7r2yjy0d7"))))
    (build-system gnu-build-system)
    (arguments
     `(;; TODO: tests currently require 12+GB of RAM.  See
       ;; https://github.com/BIMSBbioinfo/pigx_bsseq/issues/164
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'set-PYTHONPATH
           (lambda _
             (setenv "PYTHONPATH" (getenv "GUIX_PYTHONPATH"))))
         (add-before 'check 'set-timezone
           ;; The readr package is picky about timezones.
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "TZ" "UTC+1")
             (setenv "TZDIR"
                     (search-input-directory inputs
                                             "share/zoneinfo")))))))
    (native-inputs
     (list tzdata))
    (inputs
     (list coreutils
           sed
           grep
           r-minimal
           r-annotationhub
           r-dt
           r-genomation
           r-ggbio
           r-ggrepel
           r-matrixstats
           r-methylkit
           r-reshape2
           r-rtracklayer
           r-rmarkdown
           r-bookdown
           r-ggplot2
           r-ggbio
           pandoc
           python-wrapper
           python-pyyaml
           snakemake
           bismark
           bowtie
           bwa-meth
           fastqc
           methyldackel
           multiqc
           trim-galore
           cutadapt
           samblaster
           samtools))
    (home-page "https://bioinformatics.mdc-berlin.de/pigx/")
    (synopsis "Bisulfite sequencing pipeline from fastq to methylation reports")
    (description "PiGx BSseq is a data processing pipeline for raw fastq read
data of bisulfite experiments; it produces reports on aggregate methylation
and coverage and can be used to produce information on differential
methylation and segmentation.")
    (license license:gpl3+)))

(define-public pigx-scrnaseq
  (package
    (name "pigx-scrnaseq")
    (version "1.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/BIMSBbioinfo/pigx_scrnaseq/"
                                  "releases/download/v" version
                                  "/pigx_scrnaseq-" version ".tar.gz"))
              (sha256
               (base32
                "0adx7877c3lhlrzfid76i8bc829wcmzvrm0jx47gyid8mxqb7vqs"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'configure 'set-additional-environment-variables
           (lambda _
             ;; Needed because of loompy
             (setenv "NUMBA_CACHE_DIR" "/tmp")
             ;; Needed to capture environment
             (setenv "PYTHONPATH" (getenv "GUIX_PYTHONPATH")))))))
    (inputs
     (list coreutils
           perl
           fastqc
           flexbar
           icedtea-8
           jellyfish
           python-wrapper
           python-pyyaml
           python-pandas
           python-magic
           python-numpy
           python-loompy
           pandoc
           samtools
           snakemake
           star-for-pigx
           r-minimal
           r-argparser
           r-cowplot
           r-data-table
           r-delayedarray
           r-delayedmatrixstats
           r-dplyr
           r-dropbead
           r-dt
           r-genomicalignments
           r-genomicfiles
           r-genomicranges
           r-ggplot2
           r-hdf5array
           r-pheatmap
           r-rmarkdown
           r-rsamtools
           r-rtracklayer
           r-rtsne
           r-scater
           r-scran
           r-seurat
           r-singlecellexperiment
           r-stringr
           r-yaml))
    (home-page "https://bioinformatics.mdc-berlin.de/pigx/")
    (synopsis "Analysis pipeline for single-cell RNA sequencing experiments")
    (description
     "PiGX scRNAseq is an analysis pipeline for preprocessing and
quality control for single cell RNA sequencing experiments.  The inputs are
read files from the sequencing experiment, and a configuration file which
describes the experiment.  It produces processed files for downstream analysis
and interactive quality reports.  The pipeline is designed to work with UMI
based methods.")
    (license license:gpl3+)))

(define-public pigx-sars-cov-2
  (package
    (name "pigx-sars-cov-2")
    (version "0.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/BIMSBbioinfo/pigx_sars-cov-2"
                                  "/releases/download/v" version
                                  "/pigx_sars-cov-2-" version ".tar.gz"))
              (sha256
               (base32
                "168hrafgsn165q3hcdn916vlbl0zbzri1lckaqapbrcqk00izxma"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'unpack-databases
           (lambda* (#:key inputs #:allow-other-keys)
             ;; The tests need to be able to write caches to HOME.
             ;; They also default to reading the databases from there.
             (setenv "HOME" "/tmp")
             ;; Unpack the three databases in the expected location.
             (let ((root "/tmp/.local/share/pigx/databases")
                   (use-underscore (lambda (c) (if (equal? c #\-) #\_ c))))
               (for-each (lambda (db)
                           (let ((where (string-append root "/"
                                                       (string-map use-underscore db))))
                             (mkdir-p where)
                             (invoke "tar" "-C" where
                                     "-xf" (assoc-ref inputs db))))
                         '("kraken-db" "krona-db" "vep-db")))))
         (add-before 'configure 'set-PYTHONPATH
           (lambda _
             (setenv "PYTHONPATH" (getenv "GUIX_PYTHONPATH")))))))
    (native-inputs
     (let ((bimsb-origin
            (lambda (name hash)
              (origin
                (method url-fetch)
                (uri
                 (string-append "https://bimsbstatic.mdc-berlin.de/akalin/AAkalin_pathogenomics"
                                "/databases_small-20221006/" name))
                (sha256 (base32 hash))))))
       `(("kraken-db"
          ,(bimsb-origin
            "kraken_db.tar.gz"
            "0sdm4xh5npg6c3y2pz8xgphim4qpglm8wdid6rlaaqsn6iikv0mz"))
         ("krona-db"
          ,(bimsb-origin
            "krona_db.tar.gz"
            "1rwy4gd3vw1gdjldrgf44c1xaa3vq8i3pgisjhrac81yx63x8f2h"))
         ("vep-db"
          ,(bimsb-origin
            "vep_db.tar.gz"
            "0d8hhi43zsw3wqm7gd0z0gpcdsc6h6ra0imn87hifl9a64jxqzxz")))))
    (inputs
     (list bash-minimal
           bedtools
           bwa
           ensembl-vep
           fastp
           fastqc
           ivar
           kraken2
           krona-tools
           lofreq
           multiqc
           python-pyyaml
           python-wrapper
           r-base64url
           r-data-table
           r-deconvr
           r-dplyr
           r-dt
           r-ggplot2
           r-htmltools
           r-jsonlite
           r-knitr
           r-magrittr
           r-mass
           r-minimal
           r-plotly
           r-qpcr
           r-r-utils
           r-reshape2
           r-rmarkdown
           r-stringr
           r-tidyr
           r-viridis
           samtools
           snakemake
           wget))
    (home-page "https://bioinformatics.mdc-berlin.de/pigx/")
    (synopsis "Analysis pipeline for wastewater sequencing")
    (description "PiGx SARS-CoV-2 is a pipeline for analysing data from
sequenced wastewater samples and identifying given variants-of-concern of
SARS-CoV-2.  The pipeline can be used for continuous sampling.  The output
report will provide an intuitive visual overview about the development of
variant abundance over time and location.")
    (license license:gpl3+)))

(define-public pigx-sars-cov2-ww
  (deprecated-package "pigx-sars-cov2-ww" pigx-sars-cov-2))

(define-public pigx
  (package
    (name "pigx")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/BIMSBbioinfo/pigx/"
                                  "releases/download/v" version
                                  "/pigx-" version ".tar.gz"))
              (sha256
               (base32
                "1i5njdy1clj5ncw45d16p7mwmqvb1ilikl9n797pxklc3f4s7mq7"))))
    (build-system gnu-build-system)
    (inputs
     (list python pigx-bsseq pigx-chipseq pigx-rnaseq pigx-scrnaseq))
    (home-page "https://bioinformatics.mdc-berlin.de/pigx/")
    (synopsis "Analysis pipelines for genomics")
    (description "PiGx is a collection of genomics pipelines.  It includes the
following pipelines:

@itemize
@item PiGx BSseq for raw fastq read data of bisulfite experiments
@item PiGx RNAseq for RNAseq samples
@item PiGx scRNAseq for single cell dropseq analysis
@item PiGx ChIPseq for reads from ChIPseq experiments
@end itemize

All pipelines are easily configured with a simple sample sheet and a
descriptive settings file.  The result is a set of comprehensive, interactive
HTML reports with interesting findings about your samples.")
    (license license:gpl3+)))

(define-public genrich
  (package
    (name "genrich")
    (version "0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jsh58/Genrich")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0x0q6z0208n3cxzqjla4rgjqpyqgwpmz27852lcvzkzaigymq4zp"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; there are none
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (install-file "Genrich" (string-append (assoc-ref outputs "out") "/bin"))
             #t)))))
    (inputs
     (list zlib))
    (home-page "https://github.com/jsh58/Genrich")
    (synopsis "Detecting sites of genomic enrichment")
    (description "Genrich is a peak-caller for genomic enrichment
assays (e.g. ChIP-seq, ATAC-seq).  It analyzes alignment files generated
following the assay and produces a file detailing peaks of significant
enrichment.")
    (license license:expat)))

(define-public mantis
  ;; This is an arbitrary commit as a year has passed since 0.1 was tagged.
  (let ((commit "b6979a269172a45201c8366680d8b889f889432b")
        (revision "2"))
    (package
      (name "mantis")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/splatlab/mantis")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0dq8a785hnaxx5kq757m5czs8xpcjpcph1inq2nm8h6zfvqyj8xs"))))
      (build-system cmake-build-system)
      (arguments
       '(#:tests? #f ; there are none
         #:configure-flags (list "-DNH=ON"))) ; do not use SSE4.2 instructions
      (inputs
       (list sdsl-lite openssl zlib))
      (native-inputs
       (list gcc-7))
      (home-page "https://github.com/splatlab/mantis")
      (synopsis "Large-scale sequence-search index data structure")
      (description "Mantis is a space-efficient data structure that can be
used to index thousands of raw-read genomics experiments and facilitate
large-scale sequence searches on those experiments.  Mantis uses counting
quotient filters instead of Bloom filters, enabling rapid index builds and
queries, small indexes, and exact results, i.e., no false positives or
negatives.  Furthermore, Mantis is also a colored de Bruijn graph
representation, so it supports fast graph traversal and other topological
analyses in addition to large-scale sequence-level searches.")
      ;; uses __uint128_t and inline assembly
      (supported-systems '("x86_64-linux"))
      (license license:bsd-3))))

(define-public sjcount
  ;; There is no tag for version 3.2, nor is there a release archive.
  (let ((commit "292d3917cadb3f6834c81e509c30e61cd7ead6e5")
        (revision "1"))
    (package
      (name "sjcount")
      (version (git-version "3.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/pervouchine/sjcount-full")
                      (commit commit)))
                (file-name (string-append name "-" version "-checkout"))
                (sha256
                 (base32
                  "0gdgj35j249f04rqgq8ymcc1xg1vi9kzbajnjqpaq2wpbh8bl234"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f                    ; requires a 1.4G test file
         #:make-flags
         ,#~(list (string-append "SAMTOOLS_DIR="
                                 #$(this-package-input "samtools")
                                 "/lib/"))
         #:phases
         (modify-phases %standard-phases
           (replace 'configure
             (lambda* (#:key inputs #:allow-other-keys)
               (substitute* "makefile"
                 (("-I \\$\\{SAMTOOLS_DIR\\}")
                  (string-append "-I" (assoc-ref inputs "samtools")
                                 "/include/samtools"))
                 (("-lz ") "-lz -lpthread "))))
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (for-each (lambda (tool)
                           (install-file tool
                                         (string-append (assoc-ref outputs "out")
                                                        "/bin")))
                         '("j_count" "b_count" "sjcount")))))))
      (inputs
       (list samtools-0.1 zlib))
      (home-page "https://github.com/pervouchine/sjcount-full/")
      (synopsis "Annotation-agnostic splice junction counting pipeline")
      (description "Sjcount is a utility for fast quantification of splice
junctions in RNA-seq data.  It is annotation-agnostic and offset-aware.  This
version does count multisplits.")
      (license license:gpl3+))))

(define-public minimap2
  (package
    (name "minimap2")
    (version "2.24")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/lh3/minimap2/"
                           "releases/download/v" version "/"
                           "minimap2-" version ".tar.bz2"))
       (sha256
        (base32
         "05d6h2c1h95s5vblf1fijn9g0r4g69nsvkabji42j642y0gw7m4x"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; there are none
       #:modules ((guix build utils)
                  (guix build gnu-build-system)
                  (srfi srfi-26))
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (let ((system ,(or (%current-target-system)
                                (%current-system))))
               (cond
                 ((string-prefix? "x86_64" system)
                  "all")
                 ((or (string-prefix? "i586" system)
                      (string-prefix? "i686" system))
                  "sse2only=1")
                 ((string-prefix? "armhf" system)
                  "arm_neon=1")
                 ((string-prefix? "aarch64" system)
                  "aarch64=1")
                 (else ""))))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (lib (string-append out "/lib"))
                    (inc (string-append out "/include"))
                    (man (string-append out "/share/man/man1")))
               (install-file "minimap2" bin)
               (install-file "libminimap2.a" lib)
               (install-file "minimap2.1" man)
               (map (cut install-file <> inc)
                    (find-files "." "\\.h$"))
               ;; Not this file.
               (delete-file (string-append inc "/emmintrin.h"))
               (mkdir-p (string-append lib "/pkgconfig"))
               (with-output-to-file (string-append lib "/pkgconfig/minimap2.pc")
                (lambda _
                  (format #t "prefix=~a~@
                          exec_prefix=${prefix}~@
                          libdir=${exec_prefix}/lib~@
                          includedir=${prefix}/include~@
                          ~@
                          Name: libminimap2~@
                          Version: ~a~@
                          Description: A versatile pairwise aligner for genomic and spliced nucleotide sequence~@
                          Libs: -L${libdir} -lminimap2~@
                          Cflags: -I${includedir}~%"
                          out ,version))))
             #t)))))
    (inputs
     (list zlib))
    (home-page "https://lh3.github.io/minimap2/")
    (synopsis "Pairwise aligner for genomic and spliced nucleotide sequences")
    (description "Minimap2 is a versatile sequence alignment program that
aligns DNA or mRNA sequences against a large reference database.  Typical use
cases include:

@enumerate
@item mapping PacBio or Oxford Nanopore genomic reads to the human genome;
@item finding overlaps between long reads with error rate up to ~15%;
@item splice-aware alignment of PacBio Iso-Seq or Nanopore cDNA or Direct RNA
  reads against a reference genome;
@item aligning Illumina single- or paired-end reads;
@item assembly-to-assembly alignment;
@item full-genome alignment between two closely related species with
  divergence below ~15%.
@end enumerate\n")
    (license license:expat)))

(define-public python-mappy
  (package
   (name "python-mappy")
   (version "2.24")
   (source (origin
            (method url-fetch)
            (uri (pypi-uri "mappy" version))
            (sha256
             (base32
              "1ycszza87p9qvx8mis9v1hry0ac465x1xcxbsn1k45qlxxrzp8im"))))
   (build-system python-build-system)
   (native-inputs
    (list python-cython))
   (inputs
    (list zlib))
   (home-page "https://github.com/lh3/minimap2")
   (synopsis "Python binding for minimap2")
   (description "This package provides a convenient interface to minimap2,
a fast and accurate C program to align genomic and transcribe nucleotide
sequences.")
   (license license:expat)))

(define-public miniasm
  (package
   (name "miniasm")
   (version "0.3")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/lh3/miniasm")
                   (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "04dv5wv8bhsw1imxwyd438bnn9kby7svp44nbcz8lsadzjjci5gs"))))
   (build-system gnu-build-system)
   (inputs
    (list zlib))
   (arguments
    `(#:tests? #f ; There are no tests.
      #:phases
      (modify-phases %standard-phases
        (delete 'configure)
        (replace 'install
          (lambda* (#:key inputs outputs #:allow-other-keys)
            (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
              (install-file "miniasm" bin)
              (install-file "minidot" bin)
              #t))))))
   (home-page "https://github.com/lh3/miniasm")
   (synopsis "Ultrafast de novo assembly for long noisy reads")
   (description "Miniasm is a very fast OLC-based de novo assembler for noisy
long reads.  It takes all-vs-all read self-mappings (typically by minimap) as
input and outputs an assembly graph in the GFA format.  Different from
mainstream assemblers, miniasm does not have a consensus step.  It simply
concatenates pieces of read sequences to generate the final unitig sequences.
Thus the per-base error rate is similar to the raw input reads.")
   (license license:expat)))

(define-public bandage
  (package
    (name "bandage")
    (version "0.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rrwick/Bandage")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bbsn5f5x8wlspg4pbibqz6m5vin8c19nl224f3z3km0pkc97rwv"))))
    (build-system qt-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda _
             (invoke "qmake" "Bandage.pro")))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (substitute* "tests/bandage_command_line_tests.sh"
                 (("^bandagepath=.*")
                  (string-append "bandagepath=" (getcwd) "/Bandage\n")))
               (with-directory-excursion "tests"
                 (setenv "XDG_RUNTIME_DIR" (getcwd))
                 (invoke "./bandage_command_line_tests.sh")))
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (install-file "Bandage" (string-append out "/bin"))
               #t))))))
    (inputs
     (list qtbase-5 qtsvg-5))
    (native-inputs
     (list imagemagick))
    (home-page "https://rrwick.github.io/Bandage/")
    (synopsis
     "Bioinformatics Application for Navigating De novo Assembly Graphs Easily")
    (description "Bandage is a program for visualising de novo assembly graphs.
It allows users to interact with the assembly graphs made by de novo assemblers
such as Velvet, SPAdes, MEGAHIT and others.  De novo assembly graphs contain not
only assembled contigs but also the connections between those contigs, which
were previously not easily accessible.  Bandage visualises assembly graphs, with
connections, using graph layout algorithms.  Nodes in the drawn graph, which
represent contigs, can be automatically labelled with their ID, length or depth.
Users can interact with the graph by moving, labelling and colouring nodes.
Sequence information can also be extracted directly from the graph viewer.  By
displaying connections between contigs, Bandage opens up new possibilities for
analysing and improving de novo assemblies that are not possible by looking at
contigs alone.")
    (license (list license:gpl2+        ; bundled ogdf
                   license:gpl3+))))

(define-public libmaus2
  (package
    (name "libmaus2")
    (version "2.0.786")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/german.tischler/libmaus2")
                    (commit (string-append version "-release-20210531143054"))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1rxakmwjcx2yq5sjh3v849f7dfw4xzc2fyzf6s28s3p95z84w564"))))
    (build-system gnu-build-system)
    ;; The test suite attempts to execute ../test-driver, which does not exist.
    (arguments '(#:tests? #false))
    (propagated-inputs
     (list zlib))
    (native-inputs
     (list pkg-config))
    (home-page "https://gitlab.com/german.tischler/libmaus2")
    (synopsis "Collection of data structures and algorithms useful for bioinformatics")
    (description "libmaus2 is a collection of data structures and
algorithms.  It contains:

@itemize
@item I/O classes (single byte and UTF-8);
@item @code{bitio} classes (input, output and various forms of bit level
  manipulation);
@item text indexing classes (suffix and LCP array, fulltext and minute (FM),
  etc.);
@item BAM sequence alignment files input/output (simple and collating);
and many lower level support classes.
@end itemize\n")
    ;; The code is explicitly available under the terms of either GPLv2 or
    ;; GPLv3 according to the AUTHORS file, though most files have a GPLv3+
    ;; license header.
    (license (list license:gpl2+ license:gpl3+))))

(define-public biobambam2
  (package
    (name "biobambam2")
    (version "2.0.182")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/german.tischler/biobambam2")
                    (commit (string-append version "-release-20210412001032"))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0b7w7a2a7hpkgrdn0n7hy4pilzrj82zqrh7q4bg1l0cd6bqr60m5"))))
    (build-system gnu-build-system)
    (arguments
     ;; The test suite attempts to execute ../test-driver, which does not exist.
     `(#:tests? #false
       #:configure-flags
       ,#~(list (string-append "--with-libmaus2="
                               #$(this-package-input "libmaus2")))))
    (inputs
     (list libmaus2 xerces-c))
    (native-inputs
     (list pkg-config))
    (home-page "https://gitlab.com/german.tischler/biobambam2")
    (synopsis "Tools for processing BAM files")
    (description "This package contains some tools for processing BAM files
including:

@itemize
@item bamsormadup: parallel sorting and duplicate marking
@item bamcollate2: reads BAM and writes BAM reordered such that alignment or
  collated by query name
@item bammarkduplicates: reads BAM and writes BAM with duplicate alignments
  marked using the BAM flags field
@item bammaskflags: reads BAM and writes BAM while masking (removing) bits
  from the flags column
@item bamrecompress: reads BAM and writes BAM with a defined compression
  setting.  This tool is capable of multi-threading.
@item bamsort: reads BAM and writes BAM resorted by coordinates or query name
@item bamtofastq: reads BAM and writes FastQ; output can be collated or
  uncollated by query name.
@end itemize
")
    ;; The COPYING file states that the code is distributed under version 3 of
    ;; the GPL, but the license headers include the "or later" clause.
    (license license:gpl3+)))

(define-public r-disgenet2r
  (let ((commit "8d8ce37da7384004038b25e784b9f7cfe2353de1")
        (revision "1"))
    (package
      (name "r-disgenet2r")
      (version (git-version "0.99.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://bitbucket.org/ibi_group/disgenet2r")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0dvk75s6wqssdyfn5iczldb8krvrz2s0dslxns4571cb2pr09b84"))))
      (properties `((upstream-name . "disgenet2r")))
      (build-system r-build-system)
      (propagated-inputs (list r-data-table
                               r-ggplot2
                               r-gtable
                               r-httr
                               r-igraph
                               r-jsonlite
                               r-purrr
                               r-reshape
                               r-reshape2
                               r-sparql
                               r-stringr
                               r-tidyr
                               r-tidyverse
                               r-venndiagram))
      (native-inputs (list r-knitr))
      (home-page "https://bitbucket.org/ibi_group/disgenet2r")
      (synopsis "Query, visualize, and expand DisGeNET data")
      (description
       "This is an R package to query and expand DisGeNET data, and to
visualize the results within R framework.  The disgenet2r package is designed
to retrieve data from DisGeNET v6.0 (Jan, 2019).")
      (license license:expat))))

(define-public r-dyngen
  (package
    (name "r-dyngen")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dyngen" version))
       (sha256
        (base32
         "095jqn1rd83qm3ayca9hmv6bhlaa2c338020l46vniq8n38kbnra"))))
    (properties `((upstream-name . "dyngen")))
    (build-system r-build-system)
    (propagated-inputs
     (list r-assertthat
           r-dplyr
           r-dynutils
           r-ggplot2
           r-ggraph
           r-ggrepel
           r-gillespiessa2
           r-igraph
           r-lmds
           r-matrix
           r-patchwork
           r-pbapply
           r-purrr
           r-rlang
           r-tibble
           r-tidygraph
           r-tidyr
           r-viridis))
    (home-page "https://github.com/dynverse/dyngen")
    (synopsis "Multi-Modal simulator for single-cell omics analyses")
    (description
     "This package provides a multi-modal simulation engine for studying
dynamic cellular processes at single-cell resolution.")
    (license license:expat)))

;; Needed for r-liana
(define-public r-omnipathr/devel
  (let ((commit "679bb79e319af246a16968d27d64d8d6937a331a")
        (revision "1"))
    (package
      (name "r-omnipathr")
      (version (git-version "3.5.5" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/saezlab/omnipathr")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "10h6lyapyx4ik8r4kx5z2dly46jlf2v57caq4g6i0hzifyz2vgjq"))))
      (properties `((upstream-name . "OmnipathR")))
      (build-system r-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'set-HOME
             (lambda _ (setenv "HOME" "/tmp"))))))
      (propagated-inputs
       (list r-checkmate
             r-crayon
             r-curl
             r-digest
             r-dplyr
             r-httr
             r-igraph
             r-jsonlite
             r-later
             r-logger
             r-magrittr
             r-progress
             r-purrr
             r-rappdirs
             r-readr
             r-readxl
             r-rlang
             r-rvest
             r-stringr
             r-tibble
             r-tidyr
             r-tidyselect
             r-withr
             r-xml2
             r-yaml))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/saezlab/omnipathr")
      (synopsis "OmniPath web service client and more")
      (description
       "This package provides a client for the OmniPath web service and many
other resources.  It also includes functions to transform and pretty print
some of the downloaded data, functions to access a number of other resources
such as BioPlex, ConsensusPathDB, EVEX, Gene Ontology, Guide to
Pharmacology (IUPHAR/BPS), Harmonizome, HTRIdb, Human Phenotype Ontology,
InWeb InBioMap, KEGG Pathway, Pathway Commons, Ramilowski et al. 2015,
RegNetwork, ReMap, TF census, TRRUST and Vinayagam et al. 2011.  Furthermore,
OmnipathR features a close integration with the NicheNet method for ligand
activity prediction from transcriptomics data, and its R implementation
@code{nichenetr}.")
      (license license:expat))))

(define-public r-liana
  (let ((commit "efb1249af46f576d1d620956053cfa93b2cee961")
        (revision "1"))
    (package
      (name "r-liana")
      (version (git-version "0.1.5" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/saezlab/liana/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0z645k26kqrfj5f1s412vwclw1q47h1zfxxrh9ijr30pxhpv6cv0"))))
      (properties `((upstream-name . "liana")))
      (build-system r-build-system)
      (arguments
       (list
        #:phases
        `(modify-phases %standard-phases
           ;; This is needed to find ~/.config/OmnipathR/omnipathr.yml
           (add-after 'unpack 'set-HOME
             (lambda _ (setenv "HOME" "/tmp"))))))
      (propagated-inputs
       (list r-complexheatmap
             r-dplyr
             r-ggplot2
             r-magrittr
             r-omnipathr/devel
             r-purrr
             r-rcolorbrewer
             r-readr
             r-reticulate
             r-rlang
             r-scater
             r-scran
             r-scuttle
             r-seuratobject
             r-singlecellexperiment
             r-stringr
             r-tibble
             r-tidyr
             r-tidyselect))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/saezlab/liana/")
      (synopsis "LIANA: a LIgand-receptor ANalysis frAmework")
      (description
       "LIANA provides a number of methods and resource for ligand-receptor
interaction inference from scRNA-seq data.")
      (license license:gpl3))))

(define-public r-circus
  (package
    (name "r-circus")
    (version "0.1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BIMSBbioinfo/ciRcus")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0d1jz7r81zbcy1gkppggkjmgjxyjhva69s3cdb01m3f0790m4fv0"))))
    (properties `((upstream-name . "ciRcus")))
    (build-system r-build-system)
    (propagated-inputs
     (list r-annotationdbi
           r-annotationhub
           r-biocgenerics
           r-biomart
           r-data-table
           r-dbi
           r-genomeinfodb
           r-genomicfeatures
           r-genomicranges
           r-ggplot2
           r-hash
           r-iranges
           r-rcolorbrewer
           r-rmysql
           r-rtracklayer
           r-s4vectors
           r-stringr
           r-summarizedexperiment))
    (native-inputs
     (list r-knitr))
    (home-page "https://github.com/BIMSBbioinfo/ciRcus")
    (synopsis "Annotation, analysis and visualization of circRNA data")
    (description "Circus is an R package for annotation, analysis and
visualization of circRNA data.  Users can annotate their circRNA candidates
with host genes, gene featrues they are spliced from, and discriminate between
known and yet unknown splice junctions.  Circular-to-linear ratios of circRNAs
can be calculated, and a number of descriptive plots easily generated.")
    (license license:artistic2.0)))

(define-public r-domultibarheatmap
  (let ((commit "9e65afa0aa69fee631c61b7bf3e7742632c9cb95")
        (revision "1"))
    (package
      (name "r-domultibarheatmap")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/elliefewings/DoMultiBarHeatmap")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0q9mrc6md08aff6hhzlw3igvv3w7pr1wildzm8i0km9xvbi9iyy9"))))
      (properties `((upstream-name . "DoMultiBarHeatmap")))
      (build-system r-build-system)
      (propagated-inputs (list r-ggplot2 r-magrittr r-rlang r-seurat))
      (home-page "https://github.com/elliefewings/DoMultiBarHeatmap")
      (synopsis "Produce heatmap from a Seurat object with multiple annotation bars")
      (description "This package builds on Seurat's @code{Doheatmap} function
code to produce a heatmap from a Seurat object with multiple annotation
bars.")
      (license license:cc0))))

(define-public r-doubletfinder
  (let ((commit "554097ba4e2c0ed7c28dc7f0b5b75277f3a50551")
        (revision "1"))
    (package
      (name "r-doubletfinder")
      (version (git-version "2.0.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/chris-mcginnis-ucsf/DoubletFinder")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1q1pnqw7ry4syp04wjmvz5bws6z4vg4c340ky07lk0vp577x2773"))))
      (properties `((upstream-name . "DoubletFinder")))
      (build-system r-build-system)
      (propagated-inputs (list r-fields r-kernsmooth r-rocr))
      (home-page "https://github.com/chris-mcginnis-ucsf/DoubletFinder")
      (synopsis "Identify doublets in single-cell RNA sequencing data")
      (description
       "DoubletFinder identifies doublets by generating artificial doublets
from existing scRNA-seq data and defining which real cells preferentially
co-localize with artificial doublets in gene expression space.  Other
DoubletFinder package functions are used for fitting DoubletFinder to
different scRNA-seq datasets.  For example, ideal DoubletFinder performance in
real-world contexts requires optimal pK selection and homotypic doublet
proportion estimation.  pK selection is achieved using pN-pK parameter sweeps
and maxima identification in mean-variance-normalized bimodality coefficient
distributions.  Homotypic doublet proportion estimation is achieved by finding
the sum of squared cell annotation frequencies.")
      (license license:cc0))))

;; There have been no releases.
(define-public r-cytobackbone
  (let ((commit "4c1a0a35cc5ae1f8f516127cec92351d96fe26e7")
        (revision "1"))
    (package
      (name "r-cytobackbone")
      (version (git-version "1.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/tchitchek-lab/CytoBackBone")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0ahiad14zcgdk42xzw5xryic2ibn2l8lkrcdvl2b5sz2js028yb3"))))
      (properties `((upstream-name . "CytoBackBone")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-flowcore
             r-flowutils
             r-fnn
             r-ggplot2
             r-preprocesscore))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/tchitchek-lab/CytoBackBone")
      (synopsis "Merge phenotype information from different cytometric profiles")
      (description
       "This package implements an algorithm which increases the number of
simultaneously measurable markers and in this way helps with study of the
immune responses.  Thus, the present algorithm, named @code{CytoBackBone},
allows combining phenotypic information of cells from different cytometric
profiles obtained from different cytometry panels.  This computational
approach is based on the principle that each cell has its own phenotypic and
functional characteristics that can be used as an identification card.
@code{CytoBackBone} uses a set of predefined markers, that we call the
backbone, to define this identification card.  The phenotypic information of
cells with similar identification cards in the different cytometric profiles
is then merged.")
      (license license:gpl2))))

(define-public r-cytoexplorer
  (let ((commit "0efb1cc19fc701ae03905cf1b8484c1dfeb387df")
        (revision "1"))
    (package
      (name "r-cytoexplorer")
      (version (git-version "1.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/DillonHammill/CytoExploreR")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1y7dadsy15i47rjmdq6ns80jzm6p0zmixll37q68ba2c7xn5pq3v"))
         (snippet
          '(delete-file
            "docs/articles/CytoExploreR_files/vis-4.20.1/vis.min.js"))))
      (properties `((upstream-name . "CytoExploreR")))
      (build-system r-build-system)
      (arguments
       (list
        #:phases
        '(modify-phases %standard-phases
           (add-after 'unpack 'process-javascript
             (lambda* (#:key inputs #:allow-other-keys)
               (with-directory-excursion "docs/articles/CytoExploreR_files/"
                 (let ((source (search-input-file inputs "/dist/vis.js"))
                       (target "vis-4.20.1/vis.min.js"))
                   (invoke "esbuild" source "--minify"
                           (string-append "--outfile=" target)))))))))
      (propagated-inputs
       (list r-biocgenerics
             r-bslib
             r-data-table
             r-dplyr
             r-embedsom
             r-flowai
             r-flowcore
             r-flowworkspace
             r-gtools
             r-magrittr
             r-mass
             r-opencyto
             r-purrr
             r-rhandsontable
             r-robustbase
             r-rsvd
             r-rtsne
             r-shiny
             r-superheat
             r-tibble
             r-tidyr
             r-umap
             r-visnetwork))
      (native-inputs
       `(("esbuild" ,esbuild)
         ("r-knitr" ,r-knitr)
         ("js-vis"
          ,(let ((version "4.20.1"))
             (origin
               (method git-fetch)
               (uri (git-reference
                     (url "https://github.com/almende/vis")
                     (commit (string-append "v" version))))
               (file-name (git-file-name "js-vis" version))
               (sha256
                (base32
                 "09ldcqzzki5c0jlwas5992qjffqxnx6j5sl703qccfw7rg1hn469")))))))
      (home-page "https://github.com/DillonHammill/CytoExploreR")
      (synopsis "Interactive analysis of cytometry data")
      (description
       "This package has been developed under ROpenSci gudelines to integrate
conventional and cutting edge cytometry analysis tools under a unified
framework.  It aims to represent an intuitive and interactive approach to
analysing cytometry data in R.")
      (license license:gpl2))))

(define-public r-giotto
  (let ((commit "3c8067cedbf6e3112edcac2ae796de05fd9d6fe4")
        (revision "1"))
    (package
      (name "r-giotto")
      (version (git-version "1.1.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/RubD/Giotto/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1nbbqs0jk07wafshvqsdp8ds3kr9bwq88aafc5m0kdiqs7winb0d"))))
      (properties `((upstream-name . "Giotto")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-clusterr
             r-complexheatmap
             r-cowplot
             r-data-table
             r-dbscan
             r-deldir
             r-farver
             r-fitdistrplus
             r-ggdendro
             r-ggplot2
             r-ggraph
             r-ggrepel
             r-igraph
             r-irlba
             r-lfa
             r-limma
             r-magick
             r-magrittr
             r-matrix
             r-matrixstats
             r-plotly
             r-qvalue
             r-r-utils
             r-rcolorbrewer
             r-rcpp
             r-reshape2
             r-reticulate
             r-rfast
             r-rlang
             r-rtsne
             r-scales
             r-uwot))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/RubD/Giotto/")
      (synopsis "Spatial single-cell transcriptomics toolbox")
      (description
       "This package provides a toolbox to process, analyze and visualize
spatial single-cell expression data.")
      (license license:expat))))

(define-public r-illuminahumanmethylationepicanno-ilm10b5-hg38
  (let ((commit "3db06910e27f626e0cc8b335ff45cf9a4050a36a")
        (revision "1"))
    (package
      (name "r-illuminahumanmethylationepicanno-ilm10b5-hg38")
      (version (git-version "0.0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url
                       "https://github.com/achilleasNP/IlluminaHumanMethylationEPICanno.ilm10b5.hg38")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0y8fhiwmkldi57f8nq64njfgljw68cm6pb1vh44hjwcc12k48sqr"))))
      (properties `((upstream-name . "IlluminaHumanMethylationEPICanno.ilm10b5.hg38")))
      (build-system r-build-system)
      (propagated-inputs (list r-minfi))
      (home-page
       "https://github.com/achilleasNP/IlluminaHumanMethylationEPICanno.ilm10b5.hg38")
      (synopsis "Illumina Human Methylation EPIC Annotation version 1.0B5")
      (description
       "This package provides a companion annotation file to the
@code{IlluminaHumanMethylationEPICmanifest} package based on the same
annotation 1.0B5.")
      (license license:artistic2.0))))

(define-public r-maxprobes
  (let ((commit "c2120dba972e12115280ef274ff80550cee5b264")
        (revision "1"))
    (package
      (name "r-maxprobes")
      (version (git-version "0.0.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/markgene/maxprobes")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1kij9bds2l9mwm519bzyd2608563qjlmbrayhva1s0vgml5iq9wh"))))
      (properties `((upstream-name . "maxprobes")))
      (build-system r-build-system)
      (propagated-inputs (list r-minfi r-minfidata))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/markgene/maxprobes")
      (synopsis "Methylation array cross-reactive probes")
      (description
       "The Maxprobes package collects cross-reactive probes of Illumina
methylation array 450K and EPIC/850K.")
      (license license:gpl2+))))

(define-public gffread
  ;; We cannot use the tagged release because it is not in sync with gclib.
  ;; See https://github.com/gpertea/gffread/issues/26
  (let ((commit "ba7535fcb3cea55a6e5a491d916e93b454e87fd0")
        (revision "1"))
    (package
      (name "gffread")
      (version (git-version "0.9.12" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/gpertea/gffread")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1dl2nbcg96lxpd0drg48ssa8343nf7pw9s9mkrc4mjjmfwsin3ki"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f ; no check target
         #:make-flags
         (list "GCLDIR=gclib")
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (add-after 'unpack 'copy-gclib-source
             (lambda* (#:key inputs #:allow-other-keys)
               (mkdir-p "gclib")
               (copy-recursively (assoc-ref inputs "gclib-source") "gclib")
               #t))
           ;; There is no install target
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (bin (string-append out "/bin")))
                 (install-file "gffread" bin))
               #t)))))
      (native-inputs
       `(("gclib-source"
          ,(let ((version "0.10.3")
                 (commit "54917d0849c1e83cfb057b5f712e5cb6a35d948f")
                 (revision "1"))
             (origin
               (method git-fetch)
               (uri (git-reference
                     (url "https://github.com/gpertea/gclib")
                     (commit commit)))
               (file-name (git-file-name "gclib" version))
               (sha256
                (base32
                 "0b51lc0b8syrv7186fd7n8f15rwnf264qgfmm2palrwks1px24mr")))))))
      (home-page "https://github.com/gpertea/gffread/")
      (synopsis "Parse and convert GFF/GTF files")
      (description
       "This package provides a GFF/GTF file parsing utility providing format
conversions, region filtering, FASTA sequence extraction and more.")
      ;; gffread is under Expat, but gclib is under Artistic 2.0
      (license (list license:expat
                     license:artistic2.0)))))

(define-public fit-sne
  (package
    (name "fit-sne")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/KlugerLab/FIt-SNE")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1imq4577awc226wvygf94kpz156qdfw8xl0w0f7ss4w10lhmpmf5"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #false ; there are none
       #:phases
       ;; There is no build system.
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'build
           (lambda _
             (invoke "g++" "-std=c++11" "-O3"
                     "src/sptree.cpp"
                     "src/tsne.cpp"
                     "src/nbodyfft.cpp"
                     "-o" "bin/fast_tsne"
                     "-pthread" "-lfftw3" "-lm"
                     "-Wno-address-of-packed-member")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (share (string-append out "/share/fit-sne")))
               (for-each (lambda (file) (install-file file bin))
                         (find-files "bin"))

               (substitute* "fast_tsne.R"
                 (("^FAST_TSNE_SCRIPT_DIR.*")
                  (string-append "FAST_TSNE_SCRIPT_DIR = \"" out "\"\n")))
               (install-file "fast_tsne.R" share)))))))
    (inputs
     (list fftw))
    (home-page "https://github.com/KlugerLab/FIt-SNE")
    (synopsis "Fast Fourier Transform-accelerated interpolation-based t-SNE")
    (description "@dfn{t-Stochastic Neighborhood Embedding} (t-SNE) is a
method for dimensionality reduction and visualization of high dimensional
datasets.  A popular implementation of t-SNE uses the Barnes-Hut algorithm to
approximate the gradient at each iteration of gradient descent.  This
implementation differs in these ways:

@itemize
@item Instead of approximating the N-body simulation using Barnes-Hut, we
  interpolate onto an equispaced grid and use FFT to perform the convolution.
@item Instead of computing nearest neighbors using vantage-point trees, we
  approximate nearest neighbors using the Annoy library.  The neighbor lookups
  are multithreaded to take advantage of machines with multiple cores.
@end itemize
")
    ;; See LICENSE.txt for details on what license applies to what files.
    (license (list license:bsd-4 license:expat license:asl2.0))))

(define-public python-scanpy
  (package
    (name "python-scanpy")
    (version "1.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/theislab/scanpy")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0k524xnx3dvpz5yx65p316wghvi01zs17is8w2m3w2qywiswk0sl"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:test-flags
      '(list "-k"
             ;; Plot tests that fail.
             (string-append "not test_dotplot_matrixplot_stacked_violin"
                            " and not test_violin_without_raw"
                            " and not test_correlation"
                            " and not test_scatterplots"
                            " and not test_scatter_embedding_add_outline_vmin_vmax_norm"
                            " and not test_paga"
                            " and not test_paga_compare"
                            " and not test_clustermap"

                            ;; These try to connect to the network
                            " and not test_scrublet_plots"
                            " and not test_plot_rank_genes_groups_gene_symbols"
                            " and not test_pca_n_pcs"
                            " and not test_pca_chunked"
                            " and not test_pca_sparse"
                            " and not test_pca_reproducible"))
       #:phases
       #~(modify-phases %standard-phases
           (add-after 'unpack 'pretend-version
             (lambda _
               (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version)))
           (add-after 'unpack 'delete-bad-tests
             (lambda _
               ;; These tests require Internet access.
               (delete-file-recursively "scanpy/tests/notebooks")
               (delete-file "scanpy/tests/test_clustering.py")
               (delete-file "scanpy/tests/test_datasets.py")
               (delete-file "scanpy/tests/test_normalization.py")
               (delete-file "scanpy/tests/test_score_genes.py")
               (delete-file "scanpy/tests/test_highly_variable_genes.py")

               ;; TODO: I can't get the plotting tests to work, even with Xvfb.
               (delete-file "scanpy/tests/test_embedding_plots.py")
               (delete-file "scanpy/tests/test_preprocessing.py")
               (delete-file "scanpy/tests/test_read_10x.py")

               ;; These two fail with "ValueError: I/O operation on closed file."
               (delete-file "scanpy/tests/test_neighbors_key_added.py")

               ;; TODO: these fail with TypingError and "Use of unsupported
               ;; NumPy function 'numpy.split'".
               (delete-file "scanpy/tests/test_metrics.py")

               ;; The following tests requires 'scanorama', which isn't
               ;; packaged yet.
               (delete-file "scanpy/tests/external/test_scanorama_integrate.py")

               (setenv "PYTHONPATH"
                       (string-append (getcwd) ":"
                                      #$(this-package-native-input "python-anndata:source") ":"
                                      (getenv "GUIX_PYTHONPATH")))))
           ;; Numba needs a writable dir to cache functions.
           (add-before 'check 'set-numba-cache-dir
             (lambda _ (setenv "NUMBA_CACHE_DIR" "/tmp"))))))
    (propagated-inputs
     (list python-anndata
           python-dask
           python-h5py
           python-igraph
           python-joblib
           python-legacy-api-wrap
           python-louvain
           python-matplotlib
           python-natsort
           python-networkx
           python-numba
           python-packaging
           python-pandas
           python-patsy
           python-scikit-learn
           python-scipy
           python-seaborn
           python-session-info
           python-sinfo
           python-statsmodels
           python-tables
           python-pytoml
           python-tqdm
           python-umap-learn))
    (native-inputs
     `(;; This package needs anndata.tests, which is not installed.
       ("python-anndata:source" ,(package-source python-anndata))
       ("python-flit" ,python-flit)
       ("python-leidenalg" ,python-leidenalg)
       ("python-pytest" ,python-pytest)
       ("python-setuptools-scm" ,python-setuptools-scm)))
    (home-page "https://github.com/theislab/scanpy")
    (synopsis "Single-Cell Analysis in Python")
    (description "Scanpy is a scalable toolkit for analyzing single-cell gene
expression data.  It includes preprocessing, visualization, clustering,
pseudotime and trajectory inference and differential expression testing.  The
Python-based implementation efficiently deals with datasets of more than one
million cells.")
    (license license:bsd-3)))

(define-public python-bbknn
  (package
    (name "python-bbknn")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bbknn" version))
       (sha256
        (base32
         "0q11xdmjr2kf6f179a6kjizj3lllfrq743gslgw67qyzimvrrnhn"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f ; no tests are included
       #:phases
       (modify-phases %standard-phases
         ;; Numba needs a writable dir to cache functions.
         (add-before 'check 'set-numba-cache-dir
           (lambda _
             (setenv "NUMBA_CACHE_DIR" "/tmp")))
         (add-after 'unpack 'do-not-fail-to-find-sklearn
           (lambda _
             ;; XXX: I have no idea why it cannot seem to find sklearn.
             (substitute* "setup.py"
               (("'sklearn'") "")))))))
    (propagated-inputs
     (list python-annoy
           python-cython
           python-numpy
           python-pandas
           python-scikit-learn
           python-scipy
           python-umap-learn))
    (home-page "https://github.com/Teichlab/bbknn")
    (synopsis "Batch balanced KNN")
    (description "BBKNN is a batch effect removal tool that can be directly
used in the Scanpy workflow.  It serves as an alternative to
@code{scanpy.api.pp.neighbors()}, with both functions creating a neighbour
graph for subsequent use in clustering, pseudotime and UMAP visualisation.  If
technical artifacts are present in the data, they will make it challenging to
link corresponding cell types across different batches.  BBKNN actively
combats this effect by splitting your data into batches and finding a smaller
number of neighbours for each cell within each of the groups.  This helps
create connections between analogous cells in different batches without
altering the counts or PCA space.")
    (license license:expat)))

(define-public python-drep
  (package
    (name "python-drep")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "drep" version))
       (sha256
        (base32
         "08vk0x6v5c5n7afgd5pcjhsvb424absypxy22hw1cm1n9kirbi77"))))
    (build-system python-build-system)
    (propagated-inputs
     (list python-biopython
           python-matplotlib
           python-numpy
           python-pandas
           python-pytest
           python-scikit-learn
           python-seaborn
           python-tqdm))
    (home-page "https://github.com/MrOlm/drep")
    (synopsis "De-replication of microbial genomes assembled from multiple samples")
    (description
     "dRep is a Python program for rapidly comparing large numbers of genomes.
dRep can also \"de-replicate\" a genome set by identifying groups of highly
similar genomes and choosing the best representative genome for each genome
set.")
    (license license:expat)))

(define-public instrain
  (package
    (name "instrain")
    (version "1.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "inStrain" version))
       (sha256
        (base32
         "05w1lw75x4lwkzg4qpi055g7hdjp9rnc4ksbxg2hfgksq9djk0hx"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-relative-imports
           (lambda _
             (substitute* "docker/run_instrain.py"
               (("from s3_utils")
                "from .s3_utils")
               (("from job_utils")
                "from .job_utils")))))))
    (inputs
     (list python-biopython-1.73
           python-boto3
           python-h5py
           python-lmfit
           python-matplotlib
           python-networkx
           python-numba
           python-numpy
           python-pandas
           python-psutil
           python-pysam
           python-scikit-learn
           python-seaborn
           python-tqdm
           ;; drep is needed for deprecated plot utilities
           python-drep))
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/MrOlm/inStrain")
    (synopsis "Calculation of strain-level metrics")
    (description
     "inStrain is a Python program for analysis of co-occurring genome
populations from metagenomes that allows highly accurate genome comparisons,
analysis of coverage, microdiversity, and linkage, and sensitive SNP detection
with gene localization and synonymous non-synonymous identification.")
    ;; The tool itself says that the license is "MIT", but the repository
    ;; contains a LICENSE file with the GPLv3.
    ;; See https://github.com/MrOlm/inStrain/issues/51
    (license license:expat)))

(define-public gffcompare
  (let ((commit "be56ef4349ea3966c12c6397f85e49e047361c41")
        (revision "1"))
    (package
      (name "gffcompare")
      (version (git-version "0.10.15" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/gpertea/gffcompare/")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0cp5qpxdhw4mxpya5dld8wi3jk00zyklm6rcri426wydinrnfmkg"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f                    ; no check target
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (add-before 'build 'copy-gclib-source
             (lambda* (#:key inputs #:allow-other-keys)
               (mkdir "../gclib")
               (copy-recursively
                (assoc-ref inputs "gclib-source") "../gclib")
               #t))
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                 (install-file "gffcompare" bin)
                 #t))))))
      (native-inputs
       `(("gclib-source" ; see 'README.md' of gffcompare
          ,(let ((commit "54917d0849c1e83cfb057b5f712e5cb6a35d948f")
                 (revision "1")
                 (name "gclib")
                 (version (git-version "0.10.3" revision commit)))
             (origin
               (method git-fetch)
               (uri (git-reference
                     (url "https://github.com/gpertea/gclib/")
                     (commit commit)))
               (file-name (git-file-name name version))
               (sha256
                (base32 "0b51lc0b8syrv7186fd7n8f15rwnf264qgfmm2palrwks1px24mr")))))))
      (home-page "https://github.com/gpertea/gffcompare/")
      (synopsis "Tool for comparing or classifing transcripts of RNA-Seq")
      (description
       "@code{gffcompare} is a tool that can:
@enumerate
@item compare and evaluate the accuracy of RNA-Seq transcript assemblers
(Cufflinks, Stringtie);
@item collapse (merge) duplicate transcripts from multiple GTF/GFF3 files (e.g.
resulted from assembly of different samples);
@item classify transcripts from one or multiple GTF/GFF3 files as they relate to
reference transcripts provided in a annotation file (also in GTF/GFF3 format).
@end enumerate")
      (license
       (list
        license:expat                   ;license for gffcompare
        license:artistic2.0)))))        ;license for gclib

(define-public intervaltree
  (let ((commit "b90527f9e6d51cd36ecbb50429e4524d3a418ea5"))
    (package
      (name "intervaltree")
      (version (git-version "0.0.0" "1" commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/ekg/intervaltree/")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32 "0rgv6q5fl4x5d74n6p5wvdna6zmbdbqpb4jqqh6vq3670gn08xad"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f                    ; No tests.
         #:make-flags
         ,#~(list (string-append "PREFIX=" #$output) "DESTDIR=\"\"")
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)))) ; There is no configure phase.
      (home-page "https://github.com/ekg/intervaltree")
      (synopsis "Minimal C++ interval tree implementation")
      (description "An interval tree can be used to efficiently find a set of
numeric intervals overlapping or containing another interval.  This library
provides a basic implementation of an interval tree using C++ templates,
allowing the insertion of arbitrary types into the tree.")
      (license license:expat))))

(define-public python-intervaltree
  (package
    (name "python-intervaltree")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "intervaltree" version))
       (sha256
        (base32
         "0bcm6c6r4ck9nfj9xwz4rm2swc5lrjvmw3lyl6rgj639jf41nawh"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; pytest seems to have a check to make sure the user is testing
         ;; their checked-out code and not an installed, potentially
         ;; out-of-date copy. This is harmless here, since we just installed
         ;; the package, so we disable the check to avoid skipping tests
         ;; entirely.
         (add-before 'check 'import-mismatch-error-workaround
           (lambda _
             (setenv "PY_IGNORE_IMPORTMISMATCH" "1")
             #t)))))
    (propagated-inputs
     (list python-sortedcontainers))
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/chaimleib/intervaltree")
    (synopsis "Editable interval tree data structure")
    (description
     "This package provides a mutable, self-balancing interval tree
implementation for Python.  Queries may be by point, by range overlap, or by
range envelopment.  This library was designed to allow tagging text and time
intervals, where the intervals include the lower bound but not the upper
bound.")
    (license license:asl2.0)))

(define-public python-pypairix
  (package
    (name "python-pypairix")
    (version "0.3.7")
    ;; The tarball on pypi does not include the makefile to build the
    ;; programs.
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/4dn-dcic/pairix")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1snr3lrmsld8sy77ng6ba6wcmd33xjccf1l2f3m6pi29xis9nd6p"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'build-programs
           (lambda _ (invoke "make")))
         (add-after 'install 'install-programs
           (lambda* (#:key outputs #:allow-other-keys)
             (copy-recursively "bin" (string-append
                                      (assoc-ref outputs "out")
                                      "/bin"))
             #t)))))
    (inputs
     (list zlib))
    (home-page "https://github.com/4dn-dcic/pairix")
    (synopsis "Support for querying pairix-indexed bgzipped text files")
    (description
     "Pypairix is a Python module for fast querying on a pairix-indexed
bgzipped text file that contains a pair of genomic coordinates per line.")
    (license license:expat)))

(define-public python-pyfaidx
  (package
    (name "python-pyfaidx")
    (version "0.7.2.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyfaidx" version))
              (sha256
               (base32
                "182ia2zg026lgphv68agxm9imw7649z9pdhfn8zkalrxkq5d5w1h"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:test-flags
      ;; These tests require the download of large fasta.gz files.
      '(list "--ignore=tests/test_Fasta_bgzip.py")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-version
            (lambda _
              (substitute* "pyproject.toml"
                (("dynamic = \\[\"version\"\\]")
                 (string-append "version = \"" #$version "\""))))))))
    (native-inputs
     (list python-fsspec
           python-mock
           python-numpy
           python-pytest
           python-pytest-cov))
    (home-page "http://mattshirley.com")
    (synopsis "Random access to fasta subsequences")
    (description
     "This package provides procedures for efficient pythonic random access to
fasta subsequences.")
    (license license:bsd-3)))

(define-public python-cooler
  (package
    (name "python-cooler")
    (version "0.8.11")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "cooler" version))
       (sha256
        (base32
         "1i96fmpsimj4wrx51rxn8lw2gqxf5a2pvrj5rwdd6ivnm3pmhyrn"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; cooler requests cytoolz<0.11.  It only uses cytoolz for "compose",
         ;; which composes two functions.
         (add-after 'unpack 'use-recent-cytoolz
           (lambda _
             (substitute* '("requirements.txt"
                            "cooler.egg-info/requires.txt")
               (("cytoolz.*<.*0.11") "cytoolz"))))
         ;; This version of flake8 just won't work with this version of
         ;; pytest, because of dependency pinning.
         (add-after 'unpack 'do-not-use-flake8
           (lambda _
             (substitute* "setup.cfg"
               (("addopts = --flake8") "addopts = "))))
         (add-after 'unpack 'patch-tests
           (lambda _
             (substitute* "tests/test_create.py"
              (("def test_roundtrip")
                 (string-append "@pytest.mark.skip(reason=\"requires network "
                                "access to genome.ucsc.edu\")\n"
                                "def test_roundtrip")))
             (substitute* "tests/test_util.py"
               (("def test_fetch_chromsizes")
                (string-append "@pytest.mark.skip(reason=\"requires network "
                               "access to genome.ucsc.edu\")\n"
                               "def test_fetch_chromsizes"))
               ;; See https://github.com/open2c/cooler/issues/287
               (("skipif\\(six.PY2, reason=\"Scipy on Py2 is too old\"")
                "skip(reason=\"Scipy is too new\""))
             ;; This test depends on ipytree, which contains a lot of minified
             ;; JavaScript.
             (substitute* "tests/test_fileops.py"
               (("def test_print_trees")
                "def _test_print_trees"))))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "python" "-m" "pytest" "-v")))))))
    (propagated-inputs
     (list python-asciitree
           python-biopython
           python-click
           python-cytoolz
           python-dask
           python-h5py
           python-multiprocess
           python-numpy
           python-pandas
           python-pyfaidx
           python-pypairix
           python-pysam
           python-pyyaml
           python-scipy
           python-simplejson
           python-six
           python-sparse))
    (native-inputs
     (list python-codecov python-mock python-pytest python-pytest-cov
           python-pytest-flake8))
    ;; Almost all the projects of the Mirnylab are moved under Open2C umbrella
    (home-page "https://github.com/open2c/cooler")
    (synopsis "Sparse binary format for genomic interaction matrices")
    (description
     "Cooler is a support library for a sparse, compressed, binary persistent
storage format, called @code{cool}, used to store genomic interaction data,
such as Hi-C contact matrices.")
    (license license:bsd-3)))

(define-public python-cooltools
  (package
    (name "python-cooltools")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "cooltools" version))
              (sha256
               (base32
                "08hyzd3kazr87nvv6rwp5i1g9rwj7jmrly925lqnvippz4wp7k4g"))))
    (build-system python-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke "pytest" "-v")))))))
    (native-inputs
     (list python-cython
           python-pytest))
    (propagated-inputs
     (list python-bioframe
           python-click
           python-cooler
           python-joblib
           python-matplotlib
           python-multiprocess
           python-numba
           python-numpy
           python-pandas
           python-scikit-image
           python-scikit-learn
           python-scipy))
    (home-page "https://github.com/open2c/cooltools")
    (synopsis
     "Analysis tools for genomic interaction data stored in .cool format")
    (description
     "This package provides necessary tools for the analysis of the genomic
interaction data stored in @code{.cool} format.  This collection of tools
includes operations like compartment, insulation or peak calling.")
    (license license:expat)))

(define-public python-hicmatrix
  (package
    (name "python-hicmatrix")
    (version "16")
      (source
        (origin
          ;;Pypi sources do not contain any test
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/deeptools/HiCMatrix")
                 (commit version)))
          (file-name (git-file-name name version))
          (sha256
            (base32
             "00b9l62j4knrsdp7l3pawi9cqcsl09diycbhmmnar850bzssmq4f"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "python" "-m" "pytest" "-v")))))))
    (propagated-inputs
     (list python-cooler
           python-intervaltree
           python-numpy
           python-pandas
           python-scipy
           python-tables))
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/deeptools/HiCMatrix/")
    (synopsis "HiCMatrix class for HiCExplorer and pyGenomeTracks")
    (description
     "This helper package implements the @code{HiCMatrix} class for
the HiCExplorer and pyGenomeTracks packages.")
    (license license:gpl3+)))

(define-public python-hicexplorer
  (package
    (name "python-hicexplorer")
    (version "3.7.2")
    (source
     (origin
       ;; The latest version is not available on Pypi.
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/deeptools/HiCExplorer")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1yavgxry38g326z10bclvdf8glmma05fxj5m73h15m1r2l9xmw3v"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:test-flags
      '(list "hicexplorer/test/general/"
             "--ignore" "hicexplorer/test/general/test_hicTADClassifier.py"
             "--ignore" "hicexplorer/test/general/test_hicTrainTADClassifier.py"
             "-k"
             (string-append
              ;; Unknown chromosome: ChrX
              "not test_build_matrix_restrictionCutFile_two"
              ;; fixture 'keepSelfLigation' not found
              " and not test_build_matrix_restrictionCutFile_six"
              ;; ValueError: object dtype is not supported by sparse matrices
              " and not test_hic_transfer_obs_exp_perChromosome"

              ;; No KR balancing available
              " and not test_correct_matrix_KR_partial_cool"
              " and not test_correct_matrix_KR_cool"
              " and not test_correct_matrix_KR_H5"))
      #:phases
      #~(modify-phases %standard-phases
          ;; See https://github.com/deeptools/Knight-Ruiz-Matrix-balancing-algorithm/issues/23
          (add-after 'unpack 'remove-dependency-on-krbalancing
            (lambda _
              (substitute* "hicexplorer/hicCorrectMatrix.py"
                (("from krbalancing import.*") "")
                (("( *)assert\\(args.correctionMethod == 'KR'\\)" m indent)
                 (string-append m "\n"
                                indent "log.error('krbalancing not available')\n"
                                indent "exit(1)")))
              (substitute* "setup.py"
                (("\"krbalancing >= 0.0.5\",") ""))
              (substitute* "requirements.txt"
                (("krbalancing >= 0.0.5") ""))))
          (add-after 'unpack 'fix-references
            (lambda _
              (let ((site (string-append #$output "/lib/python"
                                         #$(version-major+minor
                                            (package-version python))
                                         "/site-packages")))
                (substitute* "hicexplorer/lib/tadClassifier.py"
                  (("model_location = site.getsitepackages\\(\\)\\[0\\]")
                   (string-append "model_location = \"" site "\""))))
              (substitute* "hicexplorer/hicFindRestSite.py"
                (("subprocess.check_output\\(\\[\"cat\"")
                 (string-append "subprocess.check_output([\""
                                (which "cat") "\""))
                (("cmd = 'sort -k1")
                 (string-append "cmd = '" (which "sort") " -k1")))))
          ;; The tests aim to detect available memory and run more tests when
          ;; there is more available memory.  Let's run them deterministically
          ;; instead and don't run any tests that require more than 1GB of
          ;; RAM.
          (add-after 'unpack 'run-only-low-mem-tests
            (lambda _
              (with-directory-excursion "hicexplorer/test"
                (substitute* '("trivial_runs/test_hicBuildMatrix_trivial_runs_2.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs_five.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs_four.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs_two_1.py"
                               "trivial_runs/test_hicBuildMatrix_trivial_runs.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs_two_3.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs_three.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs_two.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs_two_2.py"
                               "trivial_runs/test_hicAggregateContacts_trivial_runs_six.py"
                               "general/test_hicDifferentialTAD.py"
                               "general/test_hicDetectLoops.py"
                               "general/test_hicPlotMatrix.py"
                               "general/test_hicHyperoptDetectLoops.py"
                               "general/test_hicCreateThresholdFile.py"
                               "general/test_hicMergeDomains.py"
                               "general/test_hicHyperoptDetectLoopsHiCCUPS.py"
                               "general/test_hicAggregateContacts.py"
                               "general/test_hicInterIntraTAD.py")
                  (("^memory =.*") "memory = 1\n"))))))))
    (propagated-inputs
     (list python-biopython
           python-cleanlab-1
           python-cooler
           python-fit-nbinom
           python-future
           python-graphviz
           python-hic2cool
           python-hicmatrix
           python-hyperopt
           python-imbalanced-learn
           python-intervaltree
           python-ipykernel
           python-jinja2
           python-matplotlib
           python-numpy
           python-pandas
           python-psutil
           python-pybedtools
           python-pybigwig
           python-pygenometracks
           python-pysam
           python-scikit-learn
           python-scipy
           python-tables
           python-tqdm
           python-unidecode))
    (native-inputs
     (list graphviz)) ;for hicexplorer/test/test_compute_function.py
    (home-page "https://hicexplorer.readthedocs.io")
    (synopsis "Process, analyze and visualize Hi-C data")
    (description
     "HiCExplorer is a powerful and easy to use set of tools to process,
normalize and visualize Hi-C data.  HiCExplorer facilitates the creation of
contact matrices, correction of contacts, TAD detection, A/B compartments,
merging, reordering or chromosomes, conversion from different formats
including cooler and detection of long-range contacts.  Moreover, it allows
the visualization of multiple contact matrices along with other types of data
like genes, compartments, ChIP-seq coverage tracks (and in general any type of
genomic scores), long range contacts and the visualization of viewpoints.")
    (license license:gpl3)))

(define-public python-pygenometracks
  (package
    (name "python-pygenometracks")
    (version "3.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyGenomeTracks" version))
       (sha256
        (base32
         "1l7smg2gc1vm2181lzmdnywb11gp6s6z6j444dbsigv65car8z8p"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f                       ;there are none
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'relax-requirements
           (lambda _
             (substitute* "setup.py"
               (("matplotlib ==3.1.1")
                "matplotlib >=3.1.1")))))))
    (propagated-inputs
     (list python-future
           python-gffutils
           python-hicmatrix
           python-intervaltree
           python-matplotlib
           python-numpy
           python-pybigwig
           python-pysam
           python-tqdm))
    (native-inputs
     (list python-pytest))
    (home-page "https://pygenometracks.readthedocs.io")
    (synopsis "Program and library to plot beautiful genome browser tracks")
    (description
     "This package aims to produce high-quality genome browser tracks that
are highly customizable.  Currently, it is possible to plot: bigwig, bed (many
options), bedgraph, links (represented as arcs), and Hi-C matrices.
pyGenomeTracks can make plots with or without Hi-C data.")
    (license license:gpl3+)))

(define-public python-iced
  (package
    (name "python-iced")
    (version "0.5.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "iced" version))
       (sha256
        (base32
         "1avcjmpyyvhgbj5qca4l70ipiz7j3xmcw9p6rd9c06j99faa0r71"))))
    (build-system python-build-system)
    (arguments `(#:tests? #false)) ; there are none
    (propagated-inputs
     (list python-numpy python-pandas python-scipy python-scikit-learn))
    (home-page "https://github.com/hiclib/iced")
    (synopsis "ICE normalization")
    (description "This is a package for normalizing Hi-C contact counts
efficiently.")
    (license license:bsd-3)))

(define-public python-hic2cool
  (package
    (name "python-hic2cool")
    (version "0.8.3")
    ;; pypi sources do not contain the test_data directory and no test can be
    ;; run
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/4dn-dcic/hic2cool")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0dlnf0qfcp4jrc1nyya32a035c13xicyq16bwfnwhbb9s47mz7gl"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; Two of the test-data files need to be writable.
         (add-after 'unpack 'make-test-data-writable
           (lambda _
             (for-each make-file-writable
                       (list "test_data/hic2cool_0.4.2_single_res.cool"
                             "test_data/hic2cool_0.7.0_multi_res.mcool"))))
         ;; See https://github.com/4dn-dcic/hic2cool/issues/58
         (add-after 'unpack 'fix-incompatibility-with-h5py-3
           (lambda _
             (substitute* "test.py"
               (("h5py.File\\(fname\\)") "h5py.File(fname, 'r')"))
             (substitute* "hic2cool/hic2cool_updates.py"
               (("h5py.File\\(writefile\\)")
                "h5py.File(writefile, 'a')"))))
         ;; These two tests fail for unknown reasons.
         (add-after 'unpack 'disable-broken-tests
           (lambda _
             (substitute* "test.py"
               (("def test_convert") "def _test_convert")))))))
    (propagated-inputs
     (list python-cooler python-h5py python-numpy python-pandas
           python-scipy))
    (home-page "https://github.com/4dn-dcic/hic2cool")
    (synopsis "Converter for .hic and .cool files")
    (description
     "This package provides a converter between @code{.hic} files (from
juicer) and single-resolution or multi-resolution @code{.cool} files (for
cooler).  Both @code{hic} and @code{cool} files describe Hi-C contact
matrices.")
    (license license:expat)))

(define-public python-scanorama
  (package
    (name "python-scanorama")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "scanorama" version))
              (sha256
               (base32
                "0il7bf4c7vli2dm2jx7dskh3ymgv8nmk0y90jzgfrnqjzh250x5w"))))
    (build-system python-build-system)
    (propagated-inputs
     (list python-annoy
           python-fbpca
           python-geosketch
           python-intervaltree
           python-matplotlib
           python-numpy
           python-scikit-learn
           python-scipy))
    (home-page "https://github.com/brianhie/scanorama")
    (synopsis "Panoramic stitching of heterogeneous single cell transcriptomic data")
    (description
     "Scanorama enables batch-correction and integration of heterogeneous
scRNA-seq datasets, which is described in the paper \"Efficient integration of
heterogeneous single-cell transcriptomes using Scanorama\" by Brian Hie, Bryan
Bryson, and Bonnie Berger.")
    (license license:expat)))

(define-public r-pore
  (package
    (name "r-pore")
    (version "0.24")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://sourceforge/rpore/" version
                       "/poRe_" version ".tar.gz"))
       (sha256
        (base32 "0pih9nljbv8g4x8rkk29i7aqq681b782r5s5ynp4nw9yzqnmmksv"))))
    (properties `((upstream-name . "poRe")))
    (build-system r-build-system)
    (propagated-inputs
     (list r-bit64 r-data-table r-rhdf5 r-shiny r-svdialogs))
    (home-page "https://sourceforge.net/projects/rpore/")
    (synopsis "Visualize Nanopore sequencing data")
    (description
     "This package provides graphical user interfaces to organize and visualize Nanopore
sequencing data.")
    ;; This is free software but the license variant is unclear:
    ;; <https://github.com/mw55309/poRe_docs/issues/10>.
    (license license:bsd-3)))

(define-public r-xbioc
  (let ((revision "1")
        (commit "6ff0670a37ab3036aaf1d94aa4b208310946b0b5"))
    (package
      (name "r-xbioc")
      (version (git-version "0.1.16" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/renozao/xbioc")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0w8bsq5myiwkfhh83nm6is5ichiyvwa1axx2szvxnzq39x6knf66"))))
      (build-system r-build-system)
      (propagated-inputs
       (list r-annotationdbi
             r-assertthat
             r-biobase
             r-biocmanager
             r-digest
             r-pkgmaker
             r-plyr
             r-reshape2
             r-stringr))
      (home-page "https://github.com/renozao/xbioc/")
      (synopsis "Extra base functions for Bioconductor")
      (description "This package provides extra utility functions to perform
common tasks in the analysis of omics data, leveraging and enhancing features
provided by Bioconductor packages.")
      (license license:gpl3+))))

(define-public r-cssam
  (let ((revision "1")
        (commit "9ec58c982fa551af0d80b1a266890d92954833f2"))
    (package
      (name "r-cssam")
      (version (git-version "1.4" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/shenorrLab/csSAM")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "128syf9v39gk0z3ip000qpsjbg6l1siyq6c8b0hz41dzg5achyb3"))))
      (build-system r-build-system)
      (propagated-inputs
       (list r-formula
             r-ggplot2
             r-pkgmaker
             r-plyr
             r-rngtools
             r-scales))
      (home-page "https://github.com/shenorrLab/csSAM/")
      (synopsis "Cell type-specific statistical analysis of microarray")
      (description "This package implements the method csSAM that computes
cell-specific differential expression from measured cell proportions using
SAM.")
      ;; Any version
      (license license:lgpl2.1+))))

(define-public r-bseqsc
  (let ((revision "1")
        (commit "fef3f3e38dcf3df37103348b5780937982b43b98"))
    (package
      (name "r-bseqsc")
      (version (git-version "1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/shenorrLab/bseqsc")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1prw13wa20f7wlc3gkkls66n1kxz8d28qrb8icfqdwdnnv8w5qg8"))))
      (build-system r-build-system)
      (propagated-inputs
       (list r-abind
             r-annotationdbi
             r-biobase
             r-cssam
             r-dplyr
             r-e1071
             r-edger
             r-ggplot2
             r-nmf
             r-openxlsx
             r-pkgmaker
             r-plyr
             r-preprocesscore
             r-rngtools
             r-scales
             r-stringr
             r-xbioc))
      (home-page "https://github.com/shenorrLab/bseqsc")
      (synopsis "Deconvolution of bulk sequencing experiments using single cell data")
      (description "BSeq-sc is a bioinformatics analysis pipeline that
leverages single-cell sequencing data to estimate cell type proportion and
cell type-specific gene expression differences from RNA-seq data from bulk
tissue samples.  This is a companion package to the publication \"A
single-cell transcriptomic map of the human and mouse pancreas reveals inter-
and intra-cell population structure.\" Baron et al. Cell Systems (2016)
@url{https://www.ncbi.nlm.nih.gov/pubmed/27667365}.")
      (license license:gpl2+))))

(define-public porechop
  ;; The recommended way to install is to clone the git repository
  ;; https://github.com/rrwick/Porechop#installation
  (let ((commit "289d5dca4a5fc327f97b3f8cecb68ecaf1014861")
        (revision "1"))
    (package
      (name "porechop")
      (version (git-version "0.2.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rrwick/Porechop")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "05ps43gig0d3ia9x5lj84lb00hbsl6ba9n7y7jz927npxbr2ym23"))))
      (build-system python-build-system)
      (home-page "https://github.com/rrwick/porechop")
      (synopsis "Finding, trimming or splitting adapters, in Oxford Nanopore reads")
      (description
       "The porechop package is a tool for finding and removing adapters from Oxford
Nanopore reads.  Adapters on the ends of reads are trimmed off, and when a read
has an adapter in its middle, it is treated as chimeric and chopped into
separate reads.  Porechop performs thorough alignments to effectively find
adapters, even at low sequence identity.  Porechop also supports demultiplexing
of Nanopore reads that were barcoded with the Native Barcoding Kit, PCR
Barcoding Kit or Rapid Barcoding Kit.")
      (license license:gpl3+))))

(define-public jamm
  (package
    (name "jamm")
    (version "1.0.7.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mahmoudibrahim/JAMM")
             (commit (string-append "JAMMv" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0bsa5mf9n9q5jz7mmacrra41l7r8rac5vgsn6wv1fb52ya58b970"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;there are none
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (let ((libexec (string-append #$output "/libexec/jamm"))
                    (bin (string-append #$output "/bin")))
                (substitute* '("JAMM.sh"
                               "SignalGenerator.sh")
                  (("^sPath=.*")
                   (string-append "sPath=\"" libexec "\"\n")))
                (for-each (lambda (file)
                            (install-file file libexec))
                          (list "bincalculator.r"
                                "peakfinder.r"
                                "peakhelper.r"
                                "signalmaker.r"
                                "xcorr.r"
                                "xcorrhelper.r"
                                ;; Perl scripts
                                "peakfilter.pl"
                                "readshifter.pl"))

                (for-each
                 (lambda (script)
                   (chmod script #o555)
                   (install-file script bin)
                   (wrap-program (string-append bin "/" script)
                     `("PATH" ":" prefix
                       (,(string-append #$(this-package-input "coreutils") "/bin")
                        ,(string-append #$(this-package-input "gawk") "/bin")
                        ,(string-append #$(this-package-input "perl") "/bin")
                        ,(string-append #$(this-package-input "r-minimal") "/bin")))
                     `("PERL5LIB" ":" prefix (,(getenv "PERL5LIB")))
                     `("R_LIBS_SITE" ":" prefix (,(getenv "R_LIBS_SITE")))))
                 (list "JAMM.sh" "SignalGenerator.sh"))))))))
    (inputs
     (list bash
           coreutils
           gawk
           perl
           r-minimal
           ;;("r-parallel" ,r-parallel)
           r-signal
           r-mclust))
    (home-page "https://github.com/mahmoudibrahim/JAMM")
    (synopsis "Peak finder for NGS datasets")
    (description
     "JAMM is a peak finder for next generation sequencing datasets (ChIP-Seq,
ATAC-Seq, DNase-Seq, etc.) that can integrate replicates and assign peak
boundaries accurately.  JAMM is applicable to both broad and narrow
datasets.")
    (license license:gpl3+)))

(define-public ngless
  (package
    (name "ngless")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (hackage-uri "NGLess" version))
              (sha256
               (base32
                "0pljyrlpr9r3cl5311dhgxdl8y40szyi4vprn34i3piy0qrldymi"))))
    (build-system haskell-build-system)
    (arguments
     `(#:haddock? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'update-constraints
           (lambda _
             (substitute* "NGLess.cabal"
               (("\\b(base)\\s+[^,]+" all dep)
                dep))))
         (add-after 'unpack 'create-Versions.hs
           (lambda _
             (substitute* "NGLess/Dependencies/Versions.hs"
               (("bwaVersion = .+")
                (string-append "bwaVersion = \""
                               ,(package-version bwa) "\""))
               (("samtoolsVersion = .+")
                (string-append "samtoolsVersion = \""
                               ,(package-version samtools) "\""))
               (("prodigalVersion = .+")
                (string-append "prodigalVersion = \""
                               ,(package-version prodigal) "\""))
               (("megahitVersion = .+")
                (string-append "megahitVersion = \""
                               ,(package-version megahit) "\""))
               (("minimap2Version = .+")
                (string-append "minimap2Version = \""
                               ,(package-version minimap2) "\"")))))
         ;; See NGLess/FileManagement.hs.
         (add-after 'install 'wrap-program
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (bwa (search-input-file inputs "/bin/bwa"))
                      (samtools (search-input-file inputs "/bin/samtools"))
                      (prodigal (search-input-file inputs "/bin/prodigal"))
                      (minimap2 (search-input-file inputs "/bin/minimap2"))
                      (megahit (search-input-file inputs "/bin/megahit")))
                 (wrap-program (string-append out "/bin/ngless")
                   `("NGLESS_BWA_BIN" " " = (,bwa))
                   `("NGLESS_SAMTOOLS_BIN" " " = (,samtools))
                   `("NGLESS_PRODIGAL_BIN" " " = (,prodigal))
                   `("NGLESS_MINIMAP2_BIN" " " = (,minimap2))
                   `("NGLESS_MEGAHIT_BIN" " " = (,megahit))))))
          ;; Sanity check.
          (add-after 'wrap-program 'check-install
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((ngless (string-append (assoc-ref outputs "out") "/bin/ngless")))
                 (invoke ngless "--check-install"))))
          (add-after 'register 'remove-libraries
            (lambda* (#:key outputs #:allow-other-keys)
              (delete-file-recursively (string-append (assoc-ref outputs "out") "/lib")))))))
    (inputs (list prodigal
                  bwa
                  samtools
                  minimap2
                  megahit
                  ghc-missingh
                  ghc-aeson
                  ghc-ansi-terminal
                  ghc-async
                  ghc-atomic-write
                  ghc-bytestring-lexing
                  ghc-conduit
                  ghc-conduit-algorithms
                  ghc-conduit-extra
                  ghc-configurator
                  ghc-convertible
                  ghc-data-default
                  ghc-edit-distance
                  ghc-either
                  ghc-errors
                  ghc-extra
                  ghc-file-embed
                  ghc-filemanip
                  ghc-hashable
                  ghc-hashtables
                  ghc-hostname
                  ghc-http-client
                  ghc-http-conduit
                  ghc-inline-c
                  ghc-inline-c-cpp
                  ghc-int-interval-map
                  ghc-network
                  ghc-optparse-applicative
                  ghc-primitive
                  ghc-random-shuffle
                  ghc-regex
                  ghc-resourcet
                  ghc-safe
                  ghc-stm-chans
                  ghc-stm-conduit
                  ghc-strict
                  ghc-tar
                  ghc-tar-conduit
                  ghc-unix-compat
                  ghc-unliftio
                  ghc-unliftio-core
                  ghc-vector
                  ghc-vector-algorithms
                  ghc-yaml
                  ghc-zlib
                  ghc-bzlib-conduit
                  ghc-double-conversion
                  ghc-safeio))
    (propagated-inputs
     (list r-r6 r-hdf5r r-iterators r-itertools r-matrix))
    (native-inputs (list ghc-hunit
                         ghc-quickcheck
                         ghc-tasty
                         ghc-tasty-hunit
                         ghc-tasty-quickcheck
                         ghc-tasty-th))
    (home-page "https://ngless.embl.de/")
    (synopsis "DSL for processing next-generation sequencing data")
    (description "Ngless is a domain-specific language for
@dfn{next-generation sequencing} (NGS) data processing.")
    (license license:expat)))

(define-public ghc-int-interval-map
  (let ((commit "678763de7fe6d7fa3f1c44b32d18ce58670270f4")
        (revision "1"))
    (package
      (name "ghc-int-interval-map")
      (version "0.0.0.0")
      (source
        (origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/ngless-toolkit/interval-to-int.git")
                 (commit commit)))
           (file-name (git-file-name name version))
          (sha256 (base32 "0fd728b5if89vj5j4f9y7k0b2xv2ycz5a21iy15wbdcf5bhim7i8"))))
      (build-system haskell-build-system)
      (inputs
        (list ghc-either ghc-primitive ghc-vector ghc-vector-algorithms))
      (native-inputs
        (list ghc-hedgehog
              ghc-tasty
              ghc-tasty-hedgehog
              ghc-tasty-hunit
              ghc-tasty-quickcheck
              ghc-tasty-th))
      (home-page "https://github.com/luispedro/interval-to-int#readme")
      (synopsis "Interval map structure in Haskell")
      (description "An interval map structure that is optimized for low
memory (each interval is represented by about 3 words + whatever the
cargo is) and has semantics that are appropriate for genomic intervals
(namely, intervals can overlap and queries will return all matches
together). It also designed to be used in two phases: a construction
phase + query phase).")
      (license license:expat))))

(define-public filtlong
  ;; The recommended way to install is to clone the git repository
  ;; https://github.com/rrwick/Filtlong#installation
  ;; and the lastest release is more than nine months old
  (let ((commit "d1bb46dfe8bc7efe6257b5ce222c04bfe8aedaab")
        (revision "1"))
    (package
      (name "filtlong")
      (version (git-version "0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/rrwick/Filtlong")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1xr92r820x8qlkcr3b57iw223yq8vjgyi42jr79w2xgw47qzr575"))))
      (build-system gnu-build-system)
      (arguments
       (list
        #:tests? #f                    ; no check target
        #:phases
        #~(modify-phases %standard-phases
            (delete 'configure)
            (replace 'install
              (lambda _
                (let ((bin (string-append #$output "/bin"))
                      (scripts (string-append #$output "/share/filtlong/scripts")))
                  (install-file "bin/filtlong" bin)
                  (install-file "scripts/histogram.py" scripts)
                  (install-file "scripts/read_info_histograms.sh" scripts))))
            (add-after 'install 'wrap-program
              (lambda _
                (let ((path (getenv "GUIX_PYTHONPATH")))
                  (wrap-program (string-append #$output
                                               "/share/filtlong/scripts/histogram.py")
                    `("GUIX_PYTHONPATH" ":" prefix (,path))))))
            (add-before 'check 'patch-tests
              (lambda _
                (substitute* "scripts/read_info_histograms.sh"
                  (("awk") (which "gawk"))))))))
      (inputs
       (list gawk                     ;for read_info_histograms.sh
             python-wrapper           ;required for histogram.py
             zlib))
      (home-page "https://github.com/rrwick/Filtlong/")
      (synopsis "Tool for quality filtering of Nanopore and PacBio data")
      (description
       "The Filtlong package is a tool for filtering long reads by quality.
It can take a set of long reads and produce a smaller, better subset.  It uses
both read length (longer is better) and read identity (higher is better) when
choosing which reads pass the filter.")
      (license (list license:gpl3       ;filtlong
                     license:asl2.0))))) ;histogram.py

(define-public nanopolish
  (package
    (name "nanopolish")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jts/nanopolish")
             (commit (string-append "v" version))
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ha9v5ia0qrwgav0956cfc7n64wjm9a9w3rvkg21g37a994yixg5"))
       (modules '((guix build utils)))
       (snippet
        ;; TODO: unbundle slow5lib
        '(begin (for-each delete-file-recursively
                          '("htslib" "minimap2"))))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags
      #~(list "HDF5=noinstall"
              "EIGEN=noinstall"
              "HTS=noinstall"
              "MINIMAP2=noinstall"
              (string-append "CC=" #$(cc-for-target)))
      #:tests? #f                    ; no check target
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'find-eigen
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "CPATH"
                      (string-append
                       (search-input-directory inputs "/include/eigen3")
                       ":" (or (getenv "CPATH") "")))))
          (delete 'configure)
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin"))
                    (scripts (string-append #$output "/share/nanopolish/scripts")))

                (install-file "nanopolish" bin)
                (for-each (lambda (file) (install-file file scripts))
                          (find-files "scripts" ".*")))))
          (add-after 'install 'wrap-programs
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((pythonpath (getenv "GUIX_PYTHONPATH"))
                    (perl5lib (getenv "PERL5LIB"))
                    (scripts (string-append #$output "/share/nanopolish/scripts"))
                    (guile (search-input-file inputs "bin/guile")))
                (for-each (lambda (file)
                            (wrap-program file `("GUIX_PYTHONPATH" ":" prefix (,pythonpath))))
                          (find-files scripts "\\.py"))
                (for-each (lambda (file)
                            (wrap-script file #:guile guile
                                         `("PERL5LIB" ":" prefix (,perl5lib))))
                          (find-files scripts "\\.pl"))))))))
    (inputs
     (list guile-3.0                    ;for wrappers
           eigen
           hdf5
           htslib
           minimap2
           perl
           bioperl-minimal
           perl-getopt-long
           python-wrapper
           python-biopython
           python-numpy
           python-pysam
           python-scikit-learn
           python-scipy
           zlib))
    (native-inputs (list cmake-minimal))
    (home-page "https://github.com/jts/nanopolish")
    (synopsis "Signal-level analysis of Oxford Nanopore sequencing data")
    (description
     "This package analyses the Oxford Nanopore sequencing data at signal-level.
Nanopolish can calculate an improved consensus sequence for a draft genome
assembly, detect base modifications, call SNPs (Single nucleotide
polymorphisms) and indels with respect to a reference genome and more.")
    (license license:expat)))

(define-public cnvkit
  (package
    (name "cnvkit")
    (version "0.9.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/etal/cnvkit")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1q4l7jhr1k135an3n9aa9wsid5lk6fwxb0hcldrr6v6y76zi4gj1"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         ;; See upstream commit eee0f6eaec57d5c6e58142d661979f3aacc5f76a
         (add-after 'unpack 'compatibility
           (lambda _
             (substitute* "setup.py"
               (("'joblib.*") "")))))))
    (propagated-inputs
     (list python-biopython
           python-future
           python-matplotlib
           python-numpy
           python-pandas
           python-pomegranate
           python-pyfaidx
           python-pysam
           python-reportlab
           python-scikit-learn
           python-scipy
           ;; R packages
           r-dnacopy))
    (home-page "https://cnvkit.readthedocs.org/")
    (synopsis "Copy number variant detection from targeted DNA sequencing")
    (description
     "CNVkit is a Python library and command-line software toolkit to infer
and visualize copy number from high-throughput DNA sequencing data.  It is
designed for use with hybrid capture, including both whole-exome and custom
target panels, and short-read sequencing platforms such as Illumina and Ion
Torrent.")
    (license license:asl2.0)))

(define-public python-pyfit-sne
  (package
    (name "python-pyfit-sne")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/KlugerLab/pyFIt-SNE")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0f3n7wcmxbnqiisgimhpa6p5chqpb1hj69i6rpg2hv2671i8nn68"))))
    (build-system python-build-system)
    (arguments '(#:tests? #false)) ; there are none
    (propagated-inputs
     (list python-numpy))
    (inputs
     (list fftw))
    (native-inputs
     (list python-cython))
    (home-page "https://github.com/KlugerLab/pyFIt-SNE")
    (synopsis "FFT-accelerated Interpolation-based t-SNE")
    (description
     "t-Stochastic Neighborhood Embedding (t-SNE) is a highly successful
method for dimensionality reduction and visualization of high dimensional
datasets.  A popular implementation of t-SNE uses the Barnes-Hut algorithm to
approximate the gradient at each iteration of gradient descent.  This package
is a Cython wrapper for FIt-SNE.")
    (license license:bsd-4)))

(define-public bbmap
  (package
    (name "bbmap")
    (version "39.01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/bbmap/BBMap_" version ".tar.gz"))
              (sha256
               (base32
                "1rlkw2mlkn699dk9n5lnigmvwq3zr2f8hnq9plx7zi1h06jqsq4q"))))
    (build-system ant-build-system)
    (arguments
     (list
      #:build-target "dist"
      #:tests? #f ; there are none
      #:make-flags
      #~(list (string-append "-Dmpijar="
                             #$(this-package-input "java-openmpi")
                             "/lib/mpi.jar"))
      #:modules '((guix build ant-build-system)
                  (guix build utils)
                  (guix build java-utils))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'build 'build-jni-library
            (lambda _
              (with-directory-excursion "jni"
                (invoke "make" "-f" "makefile.linux"))))
          ;; There is no install target
          (replace 'install (install-jars "dist"))
          (add-after 'install 'install-scripts-and-documentation
            (lambda _
              (substitute* "calcmem.sh"
                (("\\| awk ") (string-append "| " (which "awk") " ")))
              (let* ((scripts (find-files "." "\\.sh$"))
                     (bin (string-append #$output "/bin"))
                     (doc (string-append #$output "/share/doc/bbmap"))
                     (jni (string-append #$output "/lib/jni")))
                (substitute* scripts
                  (("\\$DIR\"\"docs") doc)
                  (("^CP=.*")
                   (string-append "CP=" #$output "/share/java/BBTools.jar\n"))
                  (("^NATIVELIBDIR.*")
                   (string-append "NATIVELIBDIR=" jni "\n"))
                  (("CMD=\"java")
                   (string-append "CMD=\"" (which "java"))))
                (for-each (lambda (script) (install-file script bin)) scripts)

                ;; Install JNI library
                (install-file "jni/libbbtoolsjni.so" jni)

                ;; Install documentation
                (install-file "docs/readme.txt" doc)
                (copy-recursively "docs/guides" doc)))))
       #:jdk openjdk11))
    (inputs
     (list gawk java-eclipse-jdt-core java-eclipse-jdt-compiler-apt
           java-openmpi))
    (home-page "https://sourceforge.net/projects/bbmap/")
    (synopsis "Aligner and other tools for short sequencing reads")
    (description
     "This package provides bioinformatic tools to align, deduplicate,
reformat, filter and normalize DNA and RNA-seq data.  It includes the
following tools: BBMap, a short read aligner for DNA and RNA-seq data; BBNorm,
a kmer-based error-correction and normalization tool; Dedupe, a tool to
simplify assemblies by removing duplicate or contained subsequences that share
a target percent identity; Reformat, to convert reads between
fasta/fastq/scarf/fasta+qual/sam, interleaved/paired, and ASCII-33/64, at over
500 MB/s; and BBDuk, a tool to filter, trim, or mask reads with kmer matches
to an artifact/contaminant file.")
    (license license:bsd-3)))

(define-public velvet
  (package
    (name "velvet")
    (version "1.2.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ebi.ac.uk/~zerbino/velvet/"
                                  "velvet_" version ".tgz"))
              (sha256
               (base32
                "0h3njwy66p6bx14r3ar1byb0ccaxmxka4c65rn4iybyiqa4d8kc8"))
              ;; Delete bundled libraries
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file "Manual.pdf")
                  (delete-file-recursively "third-party")))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags '("OPENMP=t")
       #:test-target "test"
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-after 'unpack 'fix-zlib-include
           (lambda _
             (substitute* "src/binarySequences.c"
               (("../third-party/zlib-1.2.3/zlib.h") "zlib.h"))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (doc (string-append out "/share/doc/velvet")))
               (mkdir-p bin)
               (mkdir-p doc)
               (install-file "velveth" bin)
               (install-file "velvetg" bin)
               (install-file "Manual.pdf" doc)
               (install-file "Columbus_manual.pdf" doc)))))))
    (inputs
     (list openmpi zlib))
    (native-inputs
     `(("texlive" ,(texlive-updmap.cfg (list texlive-graphics
                                             texlive-fonts-ec
                                             texlive-hyperref)))))
    (home-page "https://www.ebi.ac.uk/~zerbino/velvet/")
    (synopsis "Nucleic acid sequence assembler for very short reads")
    (description
     "Velvet is a de novo genomic assembler specially designed for short read
sequencing technologies, such as Solexa or 454.  Velvet currently takes in
short read sequences, removes errors then produces high quality unique
contigs.  It then uses paired read information, if available, to retrieve the
repeated areas between contigs.")
    (license license:gpl2+)))

(define-public vembrane
  (package
    (name "vembrane")
    (version "0.13.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vembrane/vembrane")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1gdih56gpqd8ks3sd4ah844kac09hi3g073k9gvazb32ah50900w"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'relax-requirements
           (lambda _
             (substitute* "pyproject.toml"
               (("pysam = \"\\^0.19\"") "pysam = \"^0.20\"")
               (("numpy = \\{ version = \"\\^1.23\"")
                "numpy = { version = \"^1\"")))))))
    (inputs
     (list python-asttokens python-intervaltree python-numpy
           python-pysam python-pyyaml))
    (native-inputs
     (list poetry python-pytest))
    (home-page "https://github.com/vembrane/vembrane")
    (synopsis "Filter VCF/BCF files with Python expressions.")
    (description "Vembrane allows to simultaneously filter variants based on
any INFO or FORMAT field, CHROM, POS, ID, REF, ALT, QUAL, FILTER, and the
annotation field ANN.  When filtering based on ANN, annotation entries are
filtered first.  If no annotation entry remains, the entire variant is
deleted.")
    (license license:expat)))

(define-public python-velocyto
  (package
    (name "python-velocyto")
    (version "0.17.17")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "velocyto" version))
       (sha256
        (base32
         "0fgygyzqgrq32dv6a00biq1p1cwi6kbl5iqblxq1kklj6b2mzmhs"))
       (modules '((guix build utils)))
       ;; Delete generated C files.
       (snippet
        '(for-each delete-file (find-files "." "\\.c")))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         ;; Numba needs a writable dir to cache functions.
         (add-before 'check 'set-numba-cache-dir
           (lambda _
             (setenv "NUMBA_CACHE_DIR" "/tmp"))))))
    (native-inputs
     (list python-joblib))
    (propagated-inputs
     (list python-click
           python-cython
           python-h5py
           python-loompy
           python-matplotlib
           python-numba
           python-numpy
           python-pandas
           python-pysam
           python-scikit-learn
           python-scipy))
    (home-page "https://github.com/velocyto-team/velocyto.py")
    (synopsis "RNA velocity analysis for single cell RNA-seq data")
    (description
     "Velocyto is a library for the analysis of RNA velocity.  Velocyto
includes a command line tool and an analysis pipeline.")
    (license license:bsd-2)))

(define-public arriba
  (package
    (name "arriba")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/suhrig/arriba/releases/"
                           "download/v" version "/arriba_v" version ".tar.gz"))
       (sha256
        (base32
         "0jx9656ry766vb8z08m1c3im87b0c82qpnjby9wz4kcz8vn87dx2"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;there are none
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "Makefile"
                (("-I\\$\\(HTSLIB\\)/htslib")
                 (string-append "-I"
                                (search-input-directory inputs "/include/htslib")))
                ((" \\$\\(HTSLIB\\)/libhts.a")
                 (string-append " " (search-input-file inputs "/lib/libhts.so"))))
              (let ((samtools (search-input-file inputs "/bin/samtools")))
                (substitute* "run_arriba.sh"
                  (("^STAR ")
                   (string-append (search-input-file inputs "/bin/STAR") " "))
                  (("samtools --version-only")
                   (string-append samtools " --version-only"))
                  (("samtools index")
                   (string-append samtools " index"))
                  (("samtools sort")
                   (string-append samtools " sort"))))))
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin")))
                (install-file "arriba" bin)
                (install-file "run_arriba.sh" bin)
                (install-file "draw_fusions.R" bin)
                (wrap-program (string-append bin "/draw_fusions.R")
                  `("R_LIBS_SITE" ":" prefix (,(getenv "R_LIBS_SITE"))))))))))
    (inputs
     (list htslib
           r-minimal
           r-circlize
           r-genomicalignments
           r-genomicranges
           samtools
           star
           zlib))
    (home-page "https://github.com/suhrig/arriba")
    (synopsis "Gene fusion detection from RNA-Seq data")
    (description
     "Arriba is a command-line tool for the detection of gene fusions from
RNA-Seq data.  It was developed for the use in a clinical research setting.
Therefore, short runtimes and high sensitivity were important design criteria.
It is based on the fast STAR aligner and the post-alignment runtime is
typically just around two minutes.  In contrast to many other fusion detection
tools which build on STAR, Arriba does not require to reduce the
@code{alignIntronMax} parameter of STAR to detect small deletions.")
    ;; All code is under the Expat license with the exception of
    ;; "draw_fusions.R", which is under GPLv3.
    (license (list license:expat license:gpl3))))

(define-public adapterremoval
  (package
    (name "adapterremoval")
    (version "2.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MikkelSchubert/adapterremoval")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0wyr182667wqdmzhwwa6f7dddr8kk0scgzb8lsm23wim544mvn6i"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags
      #~(list "COLOR_BUILD=no"
              (string-append "PREFIX=" #$output))
      #:test-target "test"
      #:phases
      '(modify-phases %standard-phases
         (delete 'configure))))
    (inputs (list zlib))
    (home-page "https://adapterremoval.readthedocs.io/")
    (synopsis "Rapid sequence adapter trimming, identification, and read merging")
    (description
     "This program searches for and removes remnant adapter sequences from
@dfn{High-Throughput Sequencing} (HTS) data and (optionally) trims low quality
bases from the 3' end of reads following adapter removal.  AdapterRemoval can
analyze both single end and paired end data, and can be used to merge
overlapping paired-ended reads into (longer) consensus sequences.
Additionally, the AdapterRemoval may be used to recover a consensus adapter
sequence for paired-ended data, for which this information is not available.")
    (license license:gpl3+)))

(define-public checkm
  (package
    (name "checkm")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "checkm-genome" version))
       (sha256
        (base32
         "0i2nnki639hgjag17wlva2x0ymn37b4krqsf6akxddykhfbkdnkz"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f ; Some tests fail for unknown reasons.
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'set-HOME
           (lambda _
             (setenv "HOME" "/tmp"))))))
    (inputs
     (list python-dendropy python-matplotlib python-numpy python-pysam
           python-scipy))
    (home-page "https://ecogenomics.github.io/CheckM/")
    (synopsis "Assess the quality of putative genome bins")
    (description
     "CheckM provides a set of tools for assessing the quality of genomes
recovered from isolates, single cells, or metagenomes.  It provides robust
estimates of genome completeness and contamination by using collocated sets of
genes that are ubiquitous and single-copy within a phylogenetic lineage.
Assessment of genome quality can also be examined using plots depicting key
genomic characteristics (e.g., GC, coding density) which highlight sequences
outside the expected distributions of a typical genome.  CheckM also provides
tools for identifying genome bins that are likely candidates for merging based
on marker set compatibility, similarity in genomic characteristics, and
proximity within a reference genome.")
    (license license:gpl3+)))

(define-public umi-tools
  (package
    (name "umi-tools")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "umi_tools" version))
       (sha256
        (base32
         "08y3vz1vcx09whmbsn722lcs6jl9wyrh9i4p3k8j4cb1i32bij4a"))))
    (build-system python-build-system)
    (inputs
     (list python-pandas
           python-future
           python-scipy
           python-matplotlib
           python-regex
           python-pysam))
    (native-inputs
     (list python-cython))
    (home-page "https://github.com/CGATOxford/UMI-tools")
    (synopsis "Tools for analyzing unique modular identifiers")
    (description "This package provides tools for dealing with @dfn{Unique
Molecular Identifiers} (UMIs) and @dfn{Random Molecular Tags} (RMTs) in
genetic sequences.  There are six tools: the @code{extract} and
@code{whitelist} commands are used to prepare a fastq containing UMIs @code{+/-}
cell barcodes for alignment.  The remaining commands, @code{group},
@code{dedup}, and @{count}/@code{count_tab}, are used to identify PCR
duplicates using the UMIs and perform different levels of analysis depending
on the needs of the user.")
    (license license:expat)))

(define-public ataqv
  (package
    (name "ataqv")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ParkerLab/ataqv")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "031xr6jx1aprh26y5b1lv3gzrlmzg4alfl73vvshymx8cq8asrqi"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags
       ,#~(list (string-append "prefix=" #$output)
                (string-append "BOOST_ROOT="
                               #$(this-package-input "boost"))
                (string-append "HTSLIB_ROOT="
                               #$(this-package-input "htslib")))
       #:test-target "test"
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))
    (inputs
     (list boost htslib ncurses zlib))
    (native-inputs
     (list lcov))
    (home-page "https://github.com/ParkerLab/ataqv")
    (synopsis "Toolkit for quality control and visualization of ATAC-seq data")
    (description "This package provides a toolkit for measuring and comparing
ATAC-seq results.  It was written to make it easier to spot differences that
might be caused by ATAC-seq library prep or sequencing.  The main program,
@code{ataqv}, examines aligned reads and reports some basic metrics.")
    (license license:gpl3+)))

(define-public r-psiplot
  (package
    (name "r-psiplot")
    (version "2.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kcha/psiplot")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08438h16cfry5kqh3y9hs8q1b1a8bxhblsm75knviz5r6q0n1jxh"))))
    (build-system r-build-system)
    (propagated-inputs
     (list r-mass
           r-dplyr
           r-tidyr
           r-purrr
           r-readr
           r-magrittr
           r-ggplot2))
    (home-page "https://github.com/kcha/psiplot")
    (synopsis "Plot percent spliced-in values of alternatively-spliced exons")
    (description
     "PSIplot is an R package for generating plots of @dfn{percent
spliced-in} (PSI) values of alternatively-spliced exons that were computed by
vast-tools, an RNA-Seq pipeline for alternative splicing analysis.  The plots
are generated using @code{ggplot2}.")
    (license license:expat)))

(define-public r-scopeloomr
  (let ((commit "99726f5f7da794042036b73924b6a10d6e7b4d5d")
        (revision "1"))
    (package
      (name "r-scopeloomr")
      (version (git-version "0.13.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/aertslab/SCopeLoomR")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1ci17ms0c0hf7yfp9ckcg7a2y1s0nm19jj3cifsd55hwc0gdglmz"))))
      (properties `((upstream-name . "SCopeLoomR")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-base64enc r-hdf5r r-igraph r-matrix r-plyr r-rjson r-rlist))
      (home-page "https://github.com/aertslab/SCopeLoomR")
      (synopsis "Build .loom files and extract data from them")
      (description
       "This is an R package to build generic @code{.loom} files aligning with
the default naming convention of the @code{.loom} format and to integrate
other data types e.g.: regulons (SCENIC), clusters from Seurat, trajectory
information...  The package can also be used to extract data from @code{.loom}
files.")
      (license license:expat))))

(define-public r-seurat-utils
  (let ((commit "0b6f5b548a49148cfbeaa654e8a618c0a020afa5")
        (revision "1"))
    (package
      (name "r-seurat-utils")
      (version (git-version "1.6.5" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/vertesy/Seurat.utils")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1mn64h375mkj6x4ix5493z32gqg96yc507j5jr0lx9g5wk1bf762"))))
      (properties `((upstream-name . "Seurat.utils")))
      (build-system r-build-system)
      (propagated-inputs (list r-codeandroll2
                               r-cowplot
                               r-dplyr
                               r-ggcorrplot
                               r-ggexpress
                               r-ggplot2
                               r-ggpubr
                               r-ggrepel
                               r-hgnchelper
                               r-htmlwidgets
                               r-markdownhelpers
                               r-markdownreports
                               r-matrix
                               r-matrixstats
                               r-princurve
                               r-r-utils
                               r-readr
                               r-readwriter
                               r-reshape2
                               r-scales
                               r-seurat
                               r-soupx
                               r-sparsematrixstats
                               r-stringendo
                               r-stringr
                               r-tibble
                               r-tictoc
                               r-vroom))
      (home-page "https://github.com/vertesy/Seurat.utils")
      (synopsis "Collection of utility functions for Seurat")
      (description
       "This is a collection of utility functions for Seurat.  These functions
allow the automation and multiplexing of plotting, 3D plotting, visualization
of statistics & QC, interaction with the Seurat object.  Some functionalities
require functions from CodeAndRoll and MarkdownReports libraries.")
      (license license:gpl3))))

(define-public r-seuratwrappers
  ;; There are no releases or tags.
  (let ((commit "d28512f804d5fe05e6d68900ca9221020d52cf1d")
        (revision "1"))
    (package
      (name "r-seuratwrappers")
      (version (git-version "0.3.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/satijalab/seurat-wrappers")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0rm74y2fj3cmiqn7jz1ald8jbw53c2qxkj3mgl4pxih9vx39jhgy"))))
      (properties `((upstream-name . "SeuratWrappers")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-biocmanager
             r-cowplot
             r-ggplot2
             r-igraph
             r-matrix
             r-remotes
             r-rlang
             r-rsvd
             r-r-utils
             r-seurat))
      (home-page "https://github.com/satijalab/seurat-wrappers")
      (synopsis "Community-provided methods and extensions for the Seurat object")
      (description
       "SeuratWrappers is a collection of community-provided methods and
extensions for Seurat, curated by the Satija Lab at NYGC.  These methods
comprise functionality not presently found in Seurat, and are able to be
updated much more frequently.")
      (license license:gpl3))))

(define-public python-ctxcore
  (package
    (name "python-ctxcore")
    (version "0.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aertslab/ctxcore")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "16nlj7z8pirgjad7vlgm7226b3hpw4a7n967vyfg26dsf5n8k70d"))))
    (build-system python-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'pretend-version
            ;; The version string is usually derived via setuptools-scm, but
            ;; it doesn't work without the .git directory.
            (lambda _
              (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version))))))
    (propagated-inputs
     (list python-cytoolz
           python-numba
           python-frozendict
           python-numpy
           python-pandas
           python-pyyaml
           python-pyarrow-0.16
           python-tqdm))
    (native-inputs
     (list python-pytest
           python-setuptools-scm))
    (home-page "https://github.com/aertslab/ctxcore")
    (synopsis "Core functions for pycisTarget and the SCENIC tool suite")
    (description
     "ctxcore is part of the SCENIC suite of tools.  It provides core functions for
pycisTarget and SCENIC.")
    (license license:gpl3+)))

(define-public python-arboreto
  (package
    (name "python-arboreto")
    (version "0.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aertslab/arboreto")
                    (commit "2f475dca08f47a60acc2beb8dd897e77b7495ca4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0l0im8ay7l2d24f7vaha454vsaha9s36bfqhbijg3b8ir8apsd7l"))))
    (build-system python-build-system)
    ;; Lots of tests fail because python-distributed fails to start the
    ;; "Nanny" process.
    (arguments '(#:tests? #false))
    (propagated-inputs
     (list python-bokeh
           python-dask
           python-distributed
           python-numpy
           python-pandas
           python-scikit-learn
           python-scipy
           python-tornado-6))
    (home-page "https://github.com/aertslab/arboreto")
    (synopsis "Gene regulatory network inference using tree-based ensemble regressors")
    (description
     "This package implements scalable gene regulatory network inference using
tree-based ensemble regressors.")
    (license license:bsd-3)))

(define-public pyscenic
  (package
    (name "pyscenic")
    (version "0.11.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aertslab/pySCENIC")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0pbmmr1zdb1vbbs6wx357s59d13pna6x03wq8blj6ckjws8bbq73"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; Numba needs a writable dir to cache functions.
         (add-before 'check 'set-numba-cache-dir
           (lambda _
             (setenv "NUMBA_CACHE_DIR" "/tmp")))
         (replace 'check
           (lambda _
             (invoke "pytest" "-v"))))))
    (propagated-inputs
     (list python-ctxcore
           python-cytoolz
           python-multiprocessing-on-dill
           python-llvmlite
           python-numba
           python-attrs
           python-frozendict
           python-numpy
           python-pandas
           python-cloudpickle
           python-dask
           python-distributed
           python-arboreto
           python-boltons
           python-setuptools
           python-pyyaml
           python-tqdm
           python-interlap
           python-umap-learn
           python-loompy
           python-networkx
           python-scipy
           python-fsspec
           python-requests
           python-aiohttp
           python-scikit-learn))
    (native-inputs
     (list python-pytest))
    (home-page "https://scenic.aertslab.org/")
    (synopsis "Single-Cell regulatory network inference and clustering")
    (description
     "pySCENIC is a Python implementation of the SCENIC pipeline (Single-Cell
rEgulatory Network Inference and Clustering) which enables biologists to infer
transcription factors, gene regulatory networks and cell types from
single-cell RNA-seq data.")
    (license license:gpl3+)))

(define-public python-ikarus
  (package
    (name "python-ikarus")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ikarus" version))
       (sha256
        (base32
         "086czpvj4yafz4vrq5rx2gy0bj2l8nzwnkk0gw8qvy4w133xjysy"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #false
       #:phases
       (modify-phases %standard-phases
         ;; See https://github.com/BIMSBbioinfo/ikarus/issues/12
         (add-after 'unpack 'fix-issue-12
           (lambda _
             (substitute* "ikarus/classifier.py"
               (("pyscenic.genesig") "ctxcore.genesig"))))
         ;; Numba needs a writable dir to cache functions.
         (add-before 'check 'set-numba-cache-dir
           (lambda _
             (setenv "NUMBA_CACHE_DIR" "/tmp"))))))
    (propagated-inputs
     (list python-numpy
           python-pandas
           python-scipy
           python-scanpy
           python-anndata
           python-ctxcore ;because of issue 12
           pyscenic))
    (home-page "https://github.com/BIMSBbioinfo/ikarus")
    (synopsis "Machine learning classifier of tumor cells")
    (description
     "ikarus is a stepwise machine learning pipeline that tries to cope with a task
of distinguishing tumor cells from normal cells.  Leveraging multiple
annotated single cell datasets it can be used to define a gene set specific to
tumor cells.  First, the latter gene set is used to rank cells and then to
train a logistic classifier for the robust classification of tumor and normal
cells.  Finally, sensitivity is increased by propagating the cell labels based
on a custom cell-cell network.  ikarus is tested on multiple single cell
datasets to ascertain that it achieves high sensitivity and specificity in
multiple experimental contexts.")
    (license license:expat)))

(define-public vbz-compression
  (package
    (name "vbz-compression")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nanoporetech/vbz_compression/")
             (commit (string-append "v" version))
             ;; We include the streamvbyte sources
             (recursive? #true)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1c6wsrnw03vsc5cfp2rdakly5xy55m9chjmy6v685yapdwirdky0"))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags
       '("-DENABLE_CONAN=OFF"
         ;; Python things aren't even installed, so we might as well
         ;; disable building them.
         "-DENABLE_PYTHON=OFF")))
    (inputs
     (list ;("hdf5" ,hdf5-1.10)
           `(,zstd "lib")))
    (native-inputs
     (list googlebenchmark))
    (home-page "https://github.com/nanoporetech/vbz_compression/")
    (synopsis "VBZ compression plugin for nanopore signal data")
    (description
     "VBZ Compression uses variable byte integer encoding to compress
nanopore signal data.  The performance of VBZ is achieved by taking
advantage of the properties of the raw signal and therefore is most
effective when applied to the signal dataset.")
    (license license:mpl2.0)))

(define-public python-ont-fast5-api
  (package
    (name "python-ont-fast5-api")
    (version "4.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nanoporetech/ont_fast5_api")
             (commit (string-append "release_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "01hj4751j424lzic2sc4bz1f8w7i7fpkjpy3rgghdyl5lyfyb4s4"))
       (modules '((guix build utils)))
       (snippet
        '(delete-file-recursively "ont_fast5_api/vbz_plugin"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'copy-plugin
           (lambda* (#:key inputs #:allow-other-keys)
             (mkdir-p "ont_fast5_api/vbz_plugin/")
             (install-file (string-append
                            (assoc-ref inputs "vbz-compression")
                            "/hdf5/lib/plugin/libvbz_hdf_plugin.so")
                           "ont_fast5_api/vbz_plugin/"))))))
    (inputs
     (list vbz-compression))
    (propagated-inputs
     (list python-numpy python-h5py python-packaging python-progressbar33))
    (home-page "https://github.com/nanoporetech/ont_fast5_api")
    (synopsis "Interface to HDF5 files of the Oxford Nanopore fast5 file format")
    (description
     "This package provides a concrete implementation of the fast5 file schema
using the generic @code{h5py} library, plain-named methods to interact with
and reflect the fast5 file schema, and tools to convert between
@code{multi_read} and @code{single_read} formats.")
    (license license:mpl2.0)))

(define-public tbsp
  (let ((commit "dc30c03868233c5504299c9cb0d7b2064ba9cb41")
        (revision "2"))
    (package
      (name "tbsp")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/phoenixding/tbsp")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1im0bik2hxkcb7jzkcxp5nqb30hd8lfraxml6i5ik52j6z3qqln1"))))
      (build-system python-build-system)
      (arguments
       '(#:tests? #f         ; no tests included
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'relax-requirements
             (lambda _
               (substitute* "setup.py"
                 ((", <3.0") ""))))))) ; matplotlib
      (inputs
       (list python-matplotlib
             python-networkx
             python-numpy
             python-pybigwig
             python-biopython-1.73
             python-scikit-learn
             python-scipy))
      (home-page "https://github.com/phoenixding/tbsp/")
      (synopsis "SNP-based trajectory inference")
      (description
       "Several studies focus on the inference of developmental and response
trajectories from single cell RNA-Seq (scRNA-Seq) data.  A number of
computational methods, often referred to as pseudo-time ordering, have been
developed for this task.  CRISPR has also been used to reconstruct lineage
trees by inserting random mutations.  The tbsp package implements an
alternative method to detect significant, cell type specific sequence
mutations from scRNA-Seq data.")
      (license license:expat))))

(define-public tabixpp
  (package
   (name "tabixpp")
   (version "1.1.2")
   (source (origin
             (method git-fetch)
             (uri (git-reference
                   (url "https://github.com/ekg/tabixpp")
                   (commit (string-append "v" version))))
             (file-name (git-file-name name version))
             (sha256
              (base32 "00aqs147yn8zcvxims5njwxqsbnlbjv7lnmiwqy80bfdcbhljkqf"))
             (modules '((guix build utils)))
             (snippet
              '(delete-file-recursively "htslib"))))
   (build-system gnu-build-system)
   (inputs
    (list bzip2 curl htslib xz zlib))
   (arguments
    (list #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                               (string-append "CXX=" #$(cxx-for-target))
                               "HTS_HEADERS="
                               (string-append "HTS_LIB="
                                              (search-input-file %build-inputs
                                                                 "/lib/libhts.a"))
                               "INCLUDES=")
          #:tests? #f ; There are no tests to run.
          #:phases
          #~(modify-phases %standard-phases
              (delete 'configure) ; There is no configure phase.
              ;; Build shared and static libraries.
              (add-after 'build 'build-libraries
                (lambda* (#:key inputs #:allow-other-keys)
                  (invoke #$(cxx-for-target)
                          "-shared" "-o" "libtabixpp.so" "tabix.o" "-lhts")
                  (invoke #$(ar-for-target) "rcs" "libtabixpp.a" "tabix.o")))
              (replace 'install
                (lambda _
                  (let ((lib (string-append #$output "/lib"))
                        (bin (string-append #$output "/bin")))
                    (install-file "tabix++" bin)
                    (install-file "libtabixpp.so" lib)
                    (install-file "libtabixpp.a" lib)
                    (install-file "tabix.hpp" (string-append #$output "/include"))
                    (mkdir-p (string-append lib "/pkgconfig"))
                    (with-output-to-file (string-append lib "/pkgconfig/tabixpp.pc")
                      (lambda _
                        (format #t "\
prefix=~a~@
exec_prefix=${prefix}~@
libdir=${exec_prefix}/lib~@
includedir=${prefix}/include~@
~@
~@
Name: libtabixpp~@
Version: ~a~@
Description: C++ wrapper around tabix project~@
Libs: -L${libdir} -ltabixpp~@
Cflags: -I${includedir}~%"
                                #$output #$version)))))))))
   (home-page "https://github.com/ekg/tabixpp")
   (synopsis "C++ wrapper around tabix project")
   (description "This is a C++ wrapper around the Tabix project which abstracts
some of the details of opening and jumping in tabix-indexed files.")
   (license license:expat)))

(define-public smithwaterman
  (let ((commit "2610e259611ae4cde8f03c72499d28f03f6d38a7"))
    (package
      (name "smithwaterman")
      (version (git-version "0.0.0" "2" commit))
      (source (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/ekg/smithwaterman/")
              (commit commit)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "0i9d8zrxpiracw3mxzd9siybpy62p06rqz9mc2w93arajgbk45bs"))))
      (build-system gnu-build-system)
      (arguments
       (list
         #:tests? #f ; There are no tests to run.
         #:make-flags
         #~(list (string-append "CXX=" #$(cxx-for-target))
                 "libsw.a" "all")
         #:phases
         #~(modify-phases %standard-phases
             (delete 'configure) ; There is no configure phase.
             (add-after 'unpack 'patch-source
               (lambda _
                 (substitute* "Makefile"
                   (("-c ") "-c -fPIC "))
                 #$@(if (%current-target-system)
                     #~((substitute* "Makefile"
                          (("\tld")
                           (string-append "\t" #$(%current-target-system) "-ld"))
                          (("\tar")
                           (string-append "\t" #$(%current-target-system) "-ar"))))
                     '())))
             (add-after 'build 'build-dynamic
               (lambda _
                 (invoke #$(cxx-for-target)
                         "-shared" "-o" "libsmithwaterman.so"
                         "smithwaterman.o" "SmithWatermanGotoh.o"
                         "disorder.o" "BandedSmithWaterman.o"
                         "LeftAlign.o" "Repeats.o" "IndelAllele.o")))
             (replace 'install
               (lambda* (#:key outputs #:allow-other-keys)
                 (let* ((out (assoc-ref outputs "out"))
                        (bin (string-append out "/bin"))
                        (lib (string-append out "/lib")))
                   (install-file "smithwaterman" bin)
                   (for-each
                     (lambda (file)
                       (install-file file (string-append out "/include/smithwaterman")))
                     (find-files "." "\\.h$"))
                   (install-file "libsmithwaterman.so" lib)
                   (install-file "libsw.a" lib)
                   (mkdir-p (string-append lib "/pkgconfig"))
                   (with-output-to-file (string-append lib "/pkgconfig/smithwaterman.pc")
                     (lambda _
                       (format #t "prefix=~a~@
                               exec_prefix=${prefix}~@
                               libdir=${exec_prefix}/lib~@
                               includedir=${prefix}/include/smithwaterman~@
                               ~@
                               ~@
                               Name: smithwaterman~@
                               Version: ~a~@
                               Description: smith-waterman-gotoh alignment algorithm~@
                               Libs: -L${libdir} -lsmithwaterman~@
                               Cflags: -I${includedir}~%"
                               out #$version)))))))))
      (home-page "https://github.com/ekg/smithwaterman")
      (synopsis "Implementation of the Smith-Waterman algorithm")
      (description "Implementation of the Smith-Waterman algorithm.")
      ;; The licensing terms are unclear: https://github.com/ekg/smithwaterman/issues/9.
      (license (list license:gpl2 license:expat)))))

(define-public sylamer
  (package
    (name "sylamer")
    (version "18-131")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/micans/sylamer/")
                    (commit "aa75c3584797c0c15f860addb645f7bc1dd7627d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1ddiwlrdghhb4574rvfw0brjp9gs5l6nfsy82h0m4mvz1dr3gkj5"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ; no test target
      #:make-flags
      #~(list (string-append "GSLPREFIX=" #$(this-package-input "gsl")))
      #:phases
      '(modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "Makefile"
               (("cp sylamer \\$\\(HOME\\)/local/bin")
                (string-append "install -D -t " (assoc-ref outputs "out")
                               "/bin sylamer")))
             (install-file "Makefile" "src")
             (chdir "src"))))))
    (inputs (list gsl zlib))
    (home-page "https://www.ebi.ac.uk/research/enright/software/sylamer")
    (synopsis "Asses microRNA binding and siRNA off-target effects")
    (description "Sylamer is a system for finding significantly over or
under-represented words in sequences according to a sorted gene list.
Typically it is used to find significant enrichment or depletion of microRNA
or siRNA seed sequences from microarray expression data.  Sylamer is extremely
fast and can be applied to genome-wide datasets with ease.  Results are
plotted in terms of a significance landscape plot.  These plots show
significance profiles for each word studied across the sorted genelist.")
    (license license:gpl3+)))

(define-public multichoose
  (package
    (name "multichoose")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ekg/multichoose/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ci5fqvmpamwgxvmyd79ygj6n3bnbl3vc7b6h1sxz58186sm3pfs"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;Tests require node.
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)           ;There is no configure phase.
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin"))
                    (include (string-append #$output "/include")))
                ;; TODO: There are Python modules for these programs too.
                (install-file "multichoose" bin)
                (install-file "multipermute" bin)
                (install-file "multichoose.h" include)
                (install-file "multipermute.h" include)))))))
    (home-page "https://github.com/ekg/multichoose")
    (synopsis "Efficient loopless multiset combination generation algorithm")
    (description "This library implements an efficient loopless multiset
combination generation algorithm which is (approximately) described in
\"Loopless algorithms for generating permutations, combinations, and other
combinatorial configurations.\", G. Ehrlich - Journal of the ACM (JACM),
1973. (Algorithm 7.)")
    (license license:expat)))

(define-public fsom
  (let ((commit "a6ef318fbd347c53189384aef7f670c0e6ce89a3"))
    (package
      (name "fsom")
      (version (git-version "0.0.0" "1" commit))
      (source (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/ekg/fsom/")
              (commit commit)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "0gw1lpvr812pywg9y546x0h1hhj261xwls41r6kqhddjlrcjc0pi"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f ; There are no tests to run.
         #:phases
         (modify-phases %standard-phases
           (delete 'configure) ; There is no configure phase.
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                 (install-file "fsom" bin)))))))
      (native-inputs
       (list gcc-6))
      (home-page "https://github.com/ekg/fsom")
      (synopsis "Manage SOM (Self-Organizing Maps) neural networks")
      (description "A tiny C library for managing SOM (Self-Organizing Maps)
neural networks.")
      (license license:gpl3))))

(define-public fastahack
  (package
    (name "fastahack")
    (version "1.0.0")
    (source (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ekg/fastahack/")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0rp1blskhzxf7vbh253ibpxbgl9wwgyzf1wbkxndi08d3j4vcss9"))))
    (build-system gnu-build-system)
    (arguments
     (list #:make-flags #~(list (string-append "CXX=" #$(cxx-for-target)))
           ;; Unclear how to run tests: https://github.com/ekg/fastahack/issues/15
           #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure) ; There is no configure phase.
               (add-after 'unpack 'patch-source
                 (lambda _
                   (substitute* "Makefile"
                     (("-c ") "-c -fPIC "))))
               (add-after 'build 'build-dynamic
                 (lambda _
                   (invoke #$(cxx-for-target)
                           "-shared" "-o" "libfastahack.so"
                           "Fasta.o" "FastaHack.o" "split.o" "disorder.o")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (lib (string-append out "/lib"))
                          (bin (string-append out "/bin")))
                     (mkdir-p (string-append out "/include/fastahack"))
                     (for-each
                      (lambda (file)
                        (install-file file (string-append out "/include/fastahack")))
                      (find-files "." "\\.h$"))
                     (install-file "fastahack" bin)
                     (install-file "libfastahack.so" lib)
                     (mkdir-p (string-append lib "/pkgconfig"))
                     (with-output-to-file (string-append lib "/pkgconfig/fastahack.pc")
                       (lambda _
                         (format #t "prefix=~a~@
                           exec_prefix=${prefix}~@
                           libdir=${exec_prefix}/lib~@
                           includedir=${prefix}/include/fastahack~@
                           ~@
                           ~@
                           Name: fastahack~@
                           Version: ~a~@
                           Description: Indexing and sequence extraction from FASTA files~@
                           Libs: -L${libdir} -lfastahack~@
                           Cflags: -I${includedir}~%"
                                 out #$version)))))))))
    (home-page "https://github.com/ekg/fastahack")
    (synopsis "Indexing and sequence extraction from FASTA files")
    (description "Fastahack is a small application for indexing and
extracting sequences and subsequences from FASTA files.  The included library
provides a FASTA reader and indexer that can be embedded into applications
which would benefit from directly reading subsequences from FASTA files.  The
library automatically handles index file generation and use.")
    (license (list license:expat license:gpl2))))

(define-public wfa2-lib
  (package
    (name "wfa2-lib")
    (version "2.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/smarco/WFA2-lib")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "110s1s79z8ndjs4qdgmrj708iiaqyagia3gi2fxak101lg263diw"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; This pkg-config file is provided by other distributions.
          (add-after 'install 'install-pkg-config-file
            (lambda _
              (let ((pkgconfig (string-append #$output "/lib/pkgconfig")))
                (mkdir-p pkgconfig)
                (with-output-to-file (string-append pkgconfig "/libwfa2.pc")
                  (lambda _
                    (format #t "\
prefix=~a~@
exec_prefix=${prefix}~@
libdir=${exec_prefix}/lib~@
includedir=${prefix}/include/wfa2lib~@
~@
Name: libwfa2~@
Version: ~a~@
Description: Wavefront alignment algorithm library~@
Libs: -L${libdir} -lwfa2 -lwfa2cpp~@
Cflags: -I${includedir}~%"
                            #$output #$version)))))))))
    (native-inputs
     (list pkg-config))
    (home-page "https://github.com/smarco/WFA2-lib")
    (synopsis "Wavefront alignment algorithm library")
    (description "The wavefront alignment (WFA) algorithm is an exact
gap-affine algorithm that takes advantage of homologous regions between the
sequences to accelerate the alignment process.")
    (license license:expat)))

(define-public vcflib
  (package
    (name "vcflib")
    (version "1.0.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vcflib/vcflib")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cmznzq7hl5vr504ww262rwz5lfdfrca5ksbcvwh3cgp44fiwykv"))
       (modules '((guix build utils)))
       (snippet
        #~(begin
            (substitute* "CMakeLists.txt"
              ((".*fastahack.*") "")
              ((".*smithwaterman.*") "")
              (("(pkg_check_modules\\(TABIXPP)" text)
               (string-append
                "pkg_check_modules(WFA2 REQUIRED libwfa2)\n"
                "pkg_check_modules(FASTAHACK REQUIRED fastahack)\n"
                "pkg_check_modules(SMITHWATERMAN REQUIRED smithwaterman)\n"
                text))
              (("\\$\\{TABIXPP_LIBRARIES\\}" text)
               (string-append "${FASTAHACK_LIBRARIES} "
                              "${WFA2_LIBRARIES} "
                              "${SMITHWATERMAN_LIBRARIES} "
                              text)))
            (substitute* (find-files "." "\\.(h|c)(pp)?$")
              (("\"SmithWatermanGotoh.h\"") "<smithwaterman/SmithWatermanGotoh.h>")
              (("\"convert.h\"") "<smithwaterman/convert.h>")
              (("\"disorder.h\"") "<smithwaterman/disorder.h>")
              (("\"wavefront/wfa.hpp\"") "<wavefront/wfa.hpp>")
              (("Fasta.h") "fastahack/Fasta.h"))))))
    (build-system cmake-build-system)
    (inputs
     (list bzip2
           curl
           htslib
           fastahack
           perl
           python
           pybind11
           smithwaterman
           tabixpp
           xz
           zlib))
    (propagated-inputs
     (list wfa2-lib))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ;; Submodules.
       ;; This package builds against the .o files so we need to extract the source.
       ("filevercmp-src" ,(package-source filevercmp))
       ("fsom-src" ,(package-source fsom))
       ("intervaltree-src" ,(package-source intervaltree))
       ("multichoose-src" ,(package-source multichoose))))
    (arguments
     (list
      #:configure-flags
      #~(list "-DZIG=OFF"
              "-DTABIXPP_LOCAL=OFF"
              "-DTABIX_FOUND=ON"
              "-DWFA_GITMODULE=OFF"
              (string-append "-DPKG_CONFIG_EXECUTABLE="
                             (search-input-file
                              %build-inputs (string-append
                                             "/bin/" #$(pkg-config-for-target)))))
      #:tests? #f                       ; no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'find-wfa2lib-headers
            (lambda _
              (setenv "CPLUS_INCLUDE_PATH"
                      (string-append
                       #$(this-package-input "wfa2-lib")
                       "/include/wfa2lib:"
                       (or (getenv "CPLUS_INCLUDE_PATH") "")))))
          (add-after 'unpack 'build-shared-library
            (lambda _
              (substitute* "CMakeLists.txt"
                (("vcflib STATIC") "vcflib SHARED"))))
          (add-after 'unpack 'unpack-submodule-sources
            (lambda* (#:key inputs native-inputs #:allow-other-keys)
              (let ((unpack (lambda (source target)
                              (mkdir-p target)
                              (with-directory-excursion target
                                (let ((source (or (assoc-ref inputs source)
                                                  (assoc-ref native-inputs source))))
                                  (if (file-is-directory? source)
                                      (copy-recursively source ".")
                                      (invoke "tar" "xvf"
                                              source
                                              "--strip-components=1")))))))
                (and
                 (unpack "filevercmp-src" "contrib/filevercmp")
                 (unpack "fsom-src" "contrib/fsom")
                 (unpack "intervaltree-src" "contrib/intervaltree")
                 (unpack "multichoose-src" "contrib/multichoose"))

                ;; This is needed for downstream packages to allow building
                ;; with GCC 11+.
                (substitute* "contrib/intervaltree/IntervalTree.h"
                  (("#include <vector>" m)
                   (string-append m "
#include <limits> /* std::numeric_limits */"))))))
          ;; This pkg-config file is provided by other distributions.
          (add-after 'install 'install-pkg-config-file
            (lambda _
              (let ((pkgconfig (string-append #$output "/lib/pkgconfig")))
                (mkdir-p pkgconfig)
                (with-output-to-file (string-append pkgconfig "/vcflib.pc")
                  (lambda _
                    (format #t "\
prefix=~a~@
exec_prefix=${prefix}~@
libdir=${exec_prefix}/lib~@
includedir=${prefix}/include~@
~@
Name: vcflib~@
Version: ~a~@
Requires: libwfa2, smithwaterman, fastahack, tabixpp~@
Description: C++ library for parsing and manipulating VCF files~@
Libs: -L${libdir} -lvcflib~@
Cflags: -I${includedir}~%"
                            #$output #$version)))))))))
    (home-page "https://github.com/vcflib/vcflib/")
    (synopsis "Library for parsing and manipulating VCF files")
    (description "Vcflib provides methods to manipulate and interpret
sequence variation as it can be described by VCF.  It is both an API for parsing
and operating on records of genomic variation as it can be described by the VCF
format, and a collection of command-line utilities for executing complex
manipulations on VCF files.")
    (license license:expat)))

(define-public freebayes
  (package
    (name "freebayes")
    (version "1.3.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/freebayes/freebayes")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "163nd1xkq547za80khlys4qkgal64f3sgl6ap3yvik68r0rgyisv"))))
    (build-system meson-build-system)
    (inputs
     (list fastahack htslib smithwaterman tabixpp vcflib))
    (native-inputs
     `(("bash-tap" ,bash-tap)
       ("bc" ,bc)
       ("grep" ,grep)   ; Built with perl support.
       ("parallel" ,parallel)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python" ,python)
       ("samtools" ,samtools)
       ("simde" ,simde)
       ;; This submodule is needed to run the tests.
       ("test-simple-bash-src"
        ,(origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/ingydotnet/test-simple-bash/")
                 (commit "124673ff204b01c8e96b7fc9f9b32ee35d898acc")))
           (file-name "test-simple-bash-src-checkout")
           (sha256
            (base32 "043plp6z0x9yf7mdpky1fw7zcpwn1p47px95w9mh16603zqqqpga"))))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-source
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((bash-tap (assoc-ref inputs "bash-tap")))
               (substitute* (find-files "test/t")
                 (("BASH_TAP_ROOT=bash-tap")
                  (string-append "BASH_TAP_ROOT=" bash-tap "/bin"))
                 (("bash-tap/bash-tap-bootstrap")
                  (string-append bash-tap "/bin/bash-tap-bootstrap"))
                 (("source.*bash-tap-bootstrap")
                  (string-append "source " bash-tap "/bin/bash-tap-bootstrap")))
               (substitute* '("src/BedReader.cpp"
                              "src/BedReader.h")
                 (("../intervaltree/IntervalTree.h") "IntervalTree.h"))
               ;; We don't have Perl support in grep -E.
               (substitute* '("test/t/01_call_variants.t"
                              "test/t/01b_call_variants.t")
                 (("grep -P") "grep -E")
                 (("\\\\t") "	"))
               (substitute* "meson.build"
                 ;; Our pkg-config file is vcflib.pc
                 (("libvcflib") "vcflib")
                 (("vcflib_inc,") "")))))
         (add-after 'unpack 'unpack-submodule-sources
           (lambda* (#:key inputs #:allow-other-keys)
             (mkdir-p "test/test-simple-bash")
             (copy-recursively (assoc-ref inputs "test-simple-bash-src")
                               "test/test-simple-bash")))
        ;; The slow tests take longer than the specified timeout.
        ,@(if (any (cute string=? <> (%current-system))
                   '("armhf-linux" "aarch64-linux"))
            '((replace 'check
                (lambda* (#:key tests? #:allow-other-keys)
                  (when tests?
                    (invoke "meson" "test" "--timeout-multiplier" "5")))))
            '()))))
    (home-page "https://github.com/freebayes/freebayes")
    (synopsis "Haplotype-based variant detector")
    (description "FreeBayes is a Bayesian genetic variant detector designed to
find small polymorphisms, specifically SNPs (single-nucleotide polymorphisms),
indels (insertions and deletions), MNPs (multi-nucleotide polymorphisms), and
complex events (composite insertion and substitution events) smaller than the
length of a short-read sequencing alignment.")
    (license license:expat)))

(define-public samblaster
  (package
    (name "samblaster")
    (version "0.1.26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GregoryFaust/samblaster")
                    (commit (string-append "v." version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0g24fq5hplnfgqkh3xqpg3lgx3wmxwnh9c7m6yw7pbi40lmgl1jv"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;there are none
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)           ;There is no configure phase.
          (replace 'install
            (lambda _
              (install-file "samblaster" (string-append #$output "/bin")))))))
    (home-page "https://github.com/GregoryFaust/samblaster")
    (synopsis "Mark duplicates in paired-end SAM files")
    (description "Samblaster is a fast and flexible program for marking
duplicates in read-id grouped paired-end SAM files.  It can also optionally
output discordant read pairs and/or split read mappings to separate SAM files,
and/or unmapped/clipped reads to a separate FASTQ file.  When marking
duplicates, samblaster will require approximately 20MB of memory per 1M read
pairs.")
    (license license:expat)))

(define-public r-velocyto
  (let ((commit "d7790346cb99f49ab9c2b23ba70dcf9d2c9fc350")
        (revision "1"))
    (package
      (name "r-velocyto")
      (version (git-version "0.6" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/velocyto-team/velocyto.R")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "16wqf70j7rd7pay2q513iyz12i8n9vrpg1bisah4lddbcpx5dz1n"))))
      (build-system r-build-system)
      (inputs
       (list boost))
      (propagated-inputs
       (list r-hdf5r
             r-mass
             r-mgcv
             r-pcamethods
             r-rcpp
             r-rcpparmadillo
             ;; Suggested packages
             r-rtsne
             r-cluster
             r-abind
             r-h5
             r-biocgenerics
             r-genomicalignments
             r-rsamtools
             r-edger
             r-igraph))
      (home-page "https://velocyto.org")
      (synopsis "RNA velocity estimation in R")
      (description
       "This package provides basic routines for estimation of gene-specific
transcriptional derivatives and visualization of the resulting velocity
patterns.")
      (license license:gpl3))))

(define-public methyldackel
  (package
    (name "methyldackel")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dpryan79/MethylDackel")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "06kj76pyhzxfcjcpm840a3km3fa9994kfq4asglnb228pwak326z"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:test-target "test"
      #:make-flags
      #~(list "CC=gcc"
              "CFLAGS=-fcommon"
              "LIBBIGWIG=-lBigWig"
              (string-append "prefix=" #$output "/bin/"))
      #:phases
      '(modify-phases %standard-phases
         (replace 'configure
           (lambda _
             (substitute* "Makefile"
               (("install MethylDackel \\$\\(prefix\\)" match)
                (string-append "install -d $(prefix); " match))))))))
    (inputs
     (list curl htslib libbigwig zlib))
    ;; Needed for tests
    (native-inputs
     (list python-wrapper))
    (home-page "https://github.com/dpryan79/MethylDackel")
    (synopsis "Universal methylation extractor for BS-seq experiments")
    (description
     "MethylDackel will process a coordinate-sorted and indexed BAM or CRAM
file containing some form of BS-seq alignments and extract per-base
methylation metrics from them.  MethylDackel requires an indexed fasta file
containing the reference genome as well.")
    ;; See https://github.com/dpryan79/MethylDackel/issues/85
    (license license:expat)))

;; This package bundles PCRE 8.02 and cannot be built with the current
;; version.
(define-public phast
  (package
    (name "phast")
    (version "1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CshlSiepelLab/phast")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "10lpbllvny923jjbbyrpxahhd1m5h7sbj9gx7rd123rg10mlidki"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags
      #~(list "CC=gcc" (string-append "DESTDIR=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key inputs outputs #:allow-other-keys)
              ;; Fix syntax
              (substitute* "test/Makefile"
                (("        ") "	"))
              (substitute* "Makefile"
                (("CLAPACKPATH=/usr/lib")
                 (string-append "CLAPACKPATH="
                                #$(this-package-input "clapack") "/lib")))
              ;; Renaming the libraries is not necessary with our version of
              ;; CLAPACK.
              (substitute* "src/lib/Makefile"
                (("ifdef CLAPACKPATH") "ifdef UNNECESSARY"))
              (substitute* "src/make-include.mk"
                (("-lblaswr") "-lblas")
                (("-ltmg") "-ltmglib")
                (("liblapack.a") "liblapack.so")
                (("libblas.a") "libblas.so")
                (("libf2c.a") "libf2c.so"))
              (substitute* "src/Makefile"
                (("/opt") "/share")
                (("/usr/") "/"))))
          (replace 'check
            (lambda _
              (setenv "PATH"
                      (string-append (getcwd) "/bin:" (getenv "PATH")))
              ;; Disable broken test
              (substitute* "test/Makefile"
                ((".*if.*hmrc_summary" m) (string-append "#" m)))
              ;; Only run the msa_view tests because the others fail for
              ;; unknown reasons.
              (invoke "make" "-C" "test" "msa_view"))))))
    (inputs
     (list clapack))
    (native-inputs
     (list perl))
    (home-page "http://compgen.cshl.edu/phast/")
    (synopsis "Phylogenetic analysis with space/time models")
    (description
     "Phylogenetic Analysis with Space/Time models (PHAST) is a collection of
command-line programs and supporting libraries for comparative and
evolutionary genomics.  Best known as the search engine behind the
Conservation tracks in the University of California, Santa Cruz (UCSC) Genome
Browser, PHAST also includes several tools for phylogenetic modeling,
functional element identification, as well as utilities for manipulating
alignments, trees and genomic annotations.")
    (license license:bsd-3)))

(define-public python-gffutils
  (package
    (name "python-gffutils")
    (version "0.10.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/daler/gffutils")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1gkzk7ps6w3ai2r81js9s9bzpba0jmxychnd2da6n9ggdnf2xzqz"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               ;; Tests need to access the HOME directory
               (setenv "HOME" "/tmp")
               (invoke "nosetests" "-a" "!slow")))))))
    (propagated-inputs
     (list python-argcomplete
           python-argh
           python-biopython
           python-pybedtools
           python-pyfaidx
           python-simplejson
           python-six))
    (native-inputs
     (list python-nose))
    (home-page "https://github.com/daler/gffutils")
    (synopsis "Tool for manipulation of GFF and GTF files")
    (description
     "python-gffutils is a Python package for working with and manipulating
the GFF and GTF format files typically used for genomic annotations.  The
files are loaded into a SQLite database, allowing much more complex
manipulation of hierarchical features (e.g., genes, transcripts, and exons)
than is possible with plain-text methods alone.")
    (license license:expat)))

(define-public indelfixer
  (package
    (name "indelfixer")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cbg-ethz/InDelFixer/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "10ak05x8i1bx2p7rriv2rglqg1wr7c8wrhjrqlq1wm7ka99w8i79"))))
    (build-system ant-build-system)
    (arguments
     `(#:jar-name "InDelFixer.jar"
       #:source-dir "src/main/java"
       #:test-dir "src/test"))
    (inputs
     `(("java-commons-lang2" ,java-commons-lang)
       ("java-args4j" ,java-args4j)))
    (native-inputs
     (list java-junit))
    (home-page "https://github.com/cbg-ethz/InDelFixer/")
    (synopsis "Iterative and sensitive NGS sequence aligner")
    (description "InDelFixer is a sensitive aligner for 454, Illumina and
PacBio data, employing a full Smith-Waterman alignment against a reference.
This Java command line application aligns Next-Generation Sequencing (NGS) and
third-generation reads to a set of reference sequences, by a prior fast k-mer
matching and removes indels, causing frame shifts.  In addition, only a
specific region can be considered.  An iterative refinement of the alignment
can be performed, by alignment against the consensus sequence with wobbles.
The output is in SAM format.")
    (license license:gpl3+)))

(define-public libsbml
  (package
    (name "libsbml")
    (version "5.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/sbml/libsbml/"
                                  version "/stable/libSBML-"
                                  version "-core-src.tar.gz"))
              (sha256
               (base32
                "0slkagrk3nfi2qsksv6b1brj6zhx4bj4bkib2sdycvrcd10ql2lh"))))
    (build-system cmake-build-system)
    (arguments
     `(#:test-target "test"
       #:configure-flags
       ,#~(list "-DWITH_CHECK=ON"
                (string-append "-DLIBXML_LIBRARY="
                               #$(this-package-input "libxml2")
                               "/lib/libxml2.so")
                (string-append "-DLIBXML_INCLUDE_DIR="
                               #$(this-package-input "libxml2")
                               "/include/libxml2"))))
    (propagated-inputs
     (list libxml2))
    (native-inputs
     (list check swig))
    (home-page "https://sbml.org/Software/libSBML")
    (synopsis "Process SBML files and data streams")
    (description "LibSBML is a library to help you read, write, manipulate,
translate, and validate SBML files and data streams.  The @dfn{Systems Biology
Markup Language} (SBML) is an interchange format for computer models of
biological processes.  SBML is useful for models of metabolism, cell
signaling, and more.  It continues to be evolved and expanded by an
international community.")
    (license license:lgpl2.1+)))

(define-public kraken2
  (package
    (name "kraken2")
    (version "2.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DerrickWood/kraken2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1pl6ml1ldg2hnhy8ps56q0fl1wq3g91qkhinj6pb4yjjhv1rxsjf"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #false                  ; there are none
       #:make-flags
       ,#~(list "-C" "src"
                (string-append "KRAKEN2_DIR=" #$output "/bin"))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-before 'install 'install-scripts
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((bin (string-append (assoc-ref outputs "out") "/bin"))
                    (replacements `(("KRAKEN2_DIR" . ,bin)
                                    ("VERSION" . ,,version))))
               (mkdir-p bin)

               (with-directory-excursion "scripts"
                 (let ((scripts (find-files "." ".*")))
                   (substitute* scripts
                     (("#####=([^=]+)=#####" _ key)
                      (or (assoc-ref replacements key)
                          (error (format #false "unknown key: ~a~%" key)))))
                   (substitute* "kraken2"
                     (("compression_program = \"bzip2\"")
                      (string-append "compression_program = \""
                                     (which "bzip2")
                                     "\""))
                     (("compression_program = \"gzip\"")
                      (string-append "compression_program = \""
                                     (which "gzip")
                                     "\"")))
                   (substitute* '("download_genomic_library.sh"
                                  "download_taxonomy.sh"
                                  "16S_gg_installation.sh"
                                  "16S_silva_installation.sh"
                                  "16S_rdp_installation.sh")
                     (("wget") (which "wget")))
                   (substitute* '("download_taxonomy.sh"
			          "download_genomic_library.sh"
			          "rsync_from_ncbi.pl")
		     (("rsync -")
                      (string-append (which "rsync") " -")))
                   (substitute* "mask_low_complexity.sh"
                     (("which") (which "which")))
                   (substitute* '("mask_low_complexity.sh"
                                  "download_genomic_library.sh"
                                  "16S_silva_installation.sh")
                     (("sed -e ")
                      (string-append (which "sed") " -e ")))
                   (substitute* '("rsync_from_ncbi.pl"
                                  "16S_rdp_installation.sh"
                                  "16S_silva_installation.sh"
                                  "16S_gg_installation.sh"
                                  "download_taxonomy.sh"
                                  "download_genomic_library.sh")
                     (("gunzip") (which "gunzip")))
                   (for-each (lambda (script)
                               (chmod script #o555)
                               (install-file script bin))
                             scripts)))))))))
    (inputs
     (list gzip
           perl
           rsync
           sed
           wget
           which))
  (home-page "https://github.com/DerrickWood/kraken2")
  (synopsis "Taxonomic sequence classification system")
  (description "Kraken is a taxonomic sequence classifier that assigns
taxonomic labels to DNA sequences.  Kraken examines the k-mers within a query
sequence and uses the information within those k-mers to query a
database. That database maps k-mers to the lowest common ancestor (LCA) of all
genomes known to contain a given k-mer.")
  (license license:expat)))

(define-public lofreq
  (package
    (name "lofreq")
    (version "2.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CSB5/lofreq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0qssrn3mgjak7df6iqc1rljqd3g3a5syvg0lsv4vds43s3fq23bl"))))
    (build-system gnu-build-system)
    (arguments
     '(#:test-target "bug-tests"
       #:tests? #false ;test data are not included
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-source-file-times-to-1980
           (lambda _
             (let ((circa-1980 (* 10 366 24 60 60)))
               (for-each (lambda (file)
                           (let ((s (lstat file)))
                             (unless (eq? (stat:type s) 'symlink)
                               (utime file circa-1980 circa-1980))))
                         (find-files "." #:directories? #t))))))))
    (inputs
     (list htslib python-wrapper zlib))
    (native-inputs
     (list autoconf automake which))
    (home-page "https://csb5.github.io/lofreq/")
    (synopsis "Sensitive variant calling from sequencing data")
    (description "LoFreq is a fast and sensitive variant-caller for inferring
SNVs and indels from next-generation sequencing data.  It makes full use of
base-call qualities and other sources of errors inherent in
sequencing (e.g. mapping or base/indel alignment uncertainty), which are
usually ignored by other methods or only used for filtering.")
    (license license:expat)))

(define-public louvain
  (package
    (name "louvain")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri "mirror://sourceforge/louvain/louvain_latest.tar.gz")
              (sha256
               (base32
                "0hqlv5jqc889nbv7j1bchrx4zhh69hgr2mqvfdygc7kwrywn22lb"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #false                   ;there are none
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-after 'unpack 'patch-includes
            (lambda _
              (substitute* "main_community.cpp"
                (("using namespace std;" m)
                 (string-append "#include <unistd.h> /* for getpid */\n" m)))))
          (replace 'install
            (lambda _
              (for-each
               (lambda (exe)
                 (install-file exe (string-append #$output "/bin")))
               '("convert" "community" "hierarchy")))))))
    (home-page "https://sourceforge.net/projects/louvain/")
    (synopsis "Multi-criteria community detection")
    (description "This package offers a set of functions to use in order to
compute communities on graphs weighted or unweighted.")
    (license license:gpl3+)))

(define-public ivar
  (package
    (name "ivar")
    (version "1.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/andersen-lab/ivar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0v3rsak84ilg4iaynwpmmkj507vham5rjk2pfsmylpaqylgc69yx"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:parallel-tests? #false          ;not supported
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'patch-CXXFLAGS
           (lambda _
             (substitute* '("src/Makefile.am"
                            "tests/Makefile.am")
               (("-Werror") "")))))))
    (inputs
     (list htslib zlib))
    (native-inputs
     (list autoconf automake))
    (home-page "https://andersen-lab.github.io/ivar/html/")
    (synopsis "Tools for amplicon-based sequencing")
    (description "iVar is a computational package that contains functions
broadly useful for viral amplicon-based sequencing.")
    (license license:gpl3+)))

(define-public python-pyliftover
  (package
    (name "python-pyliftover")
    (version "0.4")
    ;; The version of pypi does not include test data.
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/konstantint/pyliftover")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1j8jp9iynv2l3jv5pr0pn0p3azlama1bqg233piglzm6bqh3m2m3"))))
    (build-system python-build-system)
    (arguments `(#:tests? #false)) ; the tests access the web
    (native-inputs
     (list python-pytest))
    (home-page "https://github.com/konstantint/pyliftover")
    (synopsis "Python implementation of UCSC liftOver genome coordinate conversion")
    (description
     "PyLiftover is a library for quick and easy conversion of genomic (point)
coordinates between different assemblies.")
    (license license:expat)))

(define-public python-cgatcore
  (package
    (name "python-cgatcore")
    (version "0.6.14")
    ;; The version of pypi does not include test data.
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cgat-developers/cgat-core")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0fjjaski39j8b7v21wldmbwwsfhicngajah7n4skafi56kdck33p"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:test-flags
      '(list "-k"
             (string-append
              ;; This test actually does what it should, but the check fails with
              ;; TypeError: cannot unpack non-iterable Namespace object
              "not test_start_and_stop_are_logged_with_argparse"
              ;; These all attempt to connect to localhost with SSH
              " and not test_job_should_use_TMPDIR_and_clean_up"
              " and not test_job_should_use_TMPDIR_and_clean_up_after_fail"
              " and not test_job_should_write_to_explicit_temp_and_not_clean_up"))
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'fix-references
           (lambda _
             (substitute* "cgatcore/pipeline/execution.py"
               (("#!/bin/bash") (string-append "#!" (which "bash")))
               (("executable=\"/bin/bash\"")
                (string-append "executable=\"" (which "bash") "\""))
               (("\\\\time") (which "time")))))
         (add-after 'unpack 'sqlite-compatibility
           (lambda _
             ;; Load apsw (and thus newer sqlite3) before importing Python's
             ;; older sqlite3 library.
             (substitute* "cgatcore/pipeline/__init__.py"
               (("import os")
                (string-append "import os\nimport apsw")))
             (substitute* "tests/template_pipeline.py"
               (("import sys" m)
                (string-append "import apsw\n" m))))))))
    (native-inputs
     (list python-pytest
           lsof
           inetutils
           openssl))
    (inputs (list time))
    (propagated-inputs
     (list python-apsw
           python-gevent
           python-pandas
           python-paramiko
           python-pyyaml
           python-ruffus
           python-sqlalchemy))
    (home-page "https://github.com/cgat-developers/cgat-core")
    (synopsis "Computational genomics analysis toolkit")
    (description
     "CGAT-core is a set of libraries and helper functions used to enable
researchers to design and build computational workflows for the analysis of
large-scale data-analysis.")
    (license license:expat)))

(define-public perl-cworld-dekker
  (package
    (name "perl-cworld-dekker")
    (version "1.01")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dekkerlab/cworld-dekker.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1dvh23fx52m59y6304xi2j2pl2hiqadlqg8jyv2pm14j1hy71ych"))))
    (build-system perl-build-system)
    (arguments
     `(#:modules ((guix build perl-build-system)
                  (guix build utils)
                  (srfi srfi-26))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'hardcode-references
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((bedtools (assoc-ref inputs "bedtools"))
                   (r (assoc-ref inputs "r-minimal")))
               (substitute* '("scripts/python/getEigenVectors.py"
                              "scripts/python/matrix2EigenVectors.py")
                 (("bedtools intersect")
                  (string-append bedtools "/bin/bedtools intersect")))
               (substitute* "lib/cworld/dekker.pm"
                 (("bedtools --version")
                  (string-append bedtools "/bin/bedtools --version")))
               (substitute* '("scripts/perl/correlateMatrices.pl"
                              "scripts/perl/matrix2scaling.pl"
                              "scripts/perl/matrix2distance.pl"
                              "scripts/perl/coverageCorrect.pl"
                              "scripts/perl/matrix2anchorPlot.pl"
                              "scripts/python/matrix2EigenVectors.py"
                              "scripts/python/matrix2insulation-lite.py"
                              "scripts/perl/matrix2compartment.pl"
                              "scripts/perl/anchorPurge.pl"
                              "scripts/perl/applyCorrection.pl"
                              "scripts/perl/compareInsulation.pl"
                              "scripts/perl/fillMissingData.pl"
                              "scripts/perl/matrix2loess.pl"
                              "scripts/python/getEigenVectors.py"
                              "scripts/perl/aggregateBED.pl"
                              "scripts/perl/collapseMatrix.pl"
                              "scripts/perl/matrix2direction.pl"
                              "scripts/perl/singletonRemoval.pl"
                              "lib/cworld/dekker.pm"
                              "scripts/perl/matrix2insulation.pl")
                 (("(`|\")Rscript" _ pre)
                  (string-append pre r "/bin/Rscript"))))))
         (add-after 'install 'install-scripts
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out   (assoc-ref outputs "out"))
                    (share (string-append out "/share/cworld-dekker")))
               (mkdir-p share)
               (copy-recursively "scripts" share)

               ;; Make all scripts executable and wrap them.
               (let ((r     (find-files share "\\.R$"))
                     (py    (find-files share "\\.py$"))
                     (pl    (find-files share "\\.pl$"))
                     (wrap  (lambda* (script var #:optional (extra ""))
                              (let ((path (string-append (getenv var)
                                                         extra)))
                                (wrap-program script
                                  `(,var ":" prefix (,path)))))))
                 (for-each (cut chmod <> #o555) (append r py pl))
                 (for-each (cut wrap <> "PERL5LIB"
                                (string-append ":" out
                                               "/lib/perl5/site_perl"))
                           pl)
                 (for-each (cut wrap <> "GUIX_PYTHONPATH") py))))))))
    (inputs
     `(("libgd" ,gd)
       ("perl-gd" ,perl-gd)
       ("bedtools" ,bedtools)
       ("python" ,python-wrapper)
       ("python-scipy" ,python-scipy)
       ("python-numpy" ,python-numpy)
       ("python-matplotlib" ,python-matplotlib)
       ("python-h5py" ,python-h5py)
       ("python-scikit-learn" ,python-scikit-learn)
       ("r-minimal" ,r-minimal)))
    (native-inputs
     (list perl-module-build))
    (home-page "https://github.com/dekkerlab/cworld-dekker")
    (synopsis "Utility and analysis scripts for 3C, 4C, 5C, and Hi-C data")
    (description "This package is a collection of Perl, Python, and R
scripts for manipulating 3C/4C/5C/Hi-C data.")
    (license license:asl2.0)))

(define-public ensembl-vep
  (let* ((api-version "103")
         (api-module
          (lambda (name hash)
            (origin (method git-fetch)
                    (uri (git-reference
                          (url (string-append "https://github.com/Ensembl/"
                                              name ".git"))
                          (commit (string-append "release/" api-version))))
                    (file-name (string-append name "-" api-version "-checkout"))
                    (sha256 (base32 hash))))))
    (package
      (name "ensembl-vep")
      (version (string-append api-version ".1"))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Ensembl/ensembl-vep.git")
               (commit (string-append "release/" version))))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1iq7p72cv9b38jz2v8a4slzy2n8y0md487943180ym9xc8qvw09c"))))
      (build-system gnu-build-system)
      (arguments
       `(#:modules ((guix build gnu-build-system)
                    (guix build utils)
                    (ice-9 match))
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (delete 'build)
           ;; Tests need to run after installation
           (delete 'check)
           (replace 'install
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let* ((modules '(("ensembl" "/")
                                 ("ensembl-variation" "/Variation")
                                 ("ensembl-funcgen"   "/Funcgen")
                                 ("ensembl-io"        "/")))
                      (scripts '(("convert_cache.pl" "vep_convert_cache.pl")
                                 ("INSTALL.pl"       "vep_install.pl")
                                 ("haplo"            #f)
                                 ("variant_recoder"  #f)
                                 ("filter_vep"       #f)
                                 ("vep"              #f)))
                      (out  (assoc-ref outputs "out"))
                      (bin  (string-append out "/bin"))
                      (perl (string-append out "/lib/perl5/site_perl")))
                 (for-each
                  (match-lambda
                    ((name path)
                     (let ((dir (string-append perl "/Bio/EnsEMBL" path)))
                       (mkdir-p dir)
                       (copy-recursively
                        (string-append (assoc-ref inputs (string-append "api-module-" name))
                                       "/modules/Bio/EnsEMBL" path)
                        dir))))
                  modules)
                 (copy-recursively "modules/" perl)
                 (mkdir-p bin)
                 (for-each
                  (match-lambda
                    ((script new-name)
                     (let ((location (string-append bin "/"
                                                    (or new-name (basename script)))))
                       (copy-file script location)
                       (chmod location #o555)
                       (wrap-program location
                         `("PERL5LIB" ":" prefix (,(getenv "PERL5LIB")
                                                  ,perl))))))
                  scripts)

                 ;; Fix path to tools
                 (with-directory-excursion (string-append perl "/Bio/EnsEMBL")
                   (substitute* '("Funcgen/RunnableDB/ProbeMapping/PrePipelineChecks.pm"
                                  "VEP/BaseRunner.pm"
                                  "VEP/Utils.pm"
                                  "VEP/AnnotationSource/Cache/VariationTabix.pm"
                                  "VEP/AnnotationSource/Cache/BaseSerialized.pm"
                                  "Variation/Utils/BaseVepTabixPlugin.pm"
                                  "Variation/Utils/VEP.pm"
                                  "Variation/Pipeline/ReleaseDataDumps/PreRunChecks.pm")
                     (("`which")
                      (string-append "`"
                                     (assoc-ref inputs "which")
                                     "/bin/which")))))))
           (add-after 'install 'check
             (lambda* (#:key tests? inputs outputs #:allow-other-keys)
               (when tests?
                 (setenv "PERL5LIB"
                         (string-append (getenv "PERL5LIB")
                                        ":"
                                        (assoc-ref outputs "out")
                                        "/lib/perl5/site_perl"))
                 (copy-recursively (string-append (assoc-ref inputs "source") "/t")
                                   "/tmp/t")
                 (for-each make-file-writable (find-files "/tmp/t"))
                 ;; TODO: haplo needs Set/IntervalTree.pm
                 (invoke "perl" "-e" (string-append "
use Test::Harness; use Test::Exception;
my $dirname = \"/tmp\";
opendir TEST, \"$dirname\\/t\";
my @test_files = map {\"$dirname\\/t\\/\".$_} grep {!/^\\./ && /\\.t$/} readdir TEST; closedir TEST;
@test_files = grep {!/Haplo/} @test_files;
runtests(@test_files);
"))))))))
      (inputs
       (list bioperl-minimal
             perl-bio-db-hts
             perl-dbi
             perl-dbd-mysql
             perl-libwww
             perl-http-tiny
             perl-json
             which))
      (propagated-inputs
       (list kentutils))
      (native-inputs
       `(("unzip" ,unzip)
         ("perl" ,perl)
         ("api-module-ensembl"
          ,(api-module "ensembl"
                       "0s59rj905g72hljzfpvnx5nxwz925b917y4jp912i23f5gwxh14v"))
         ("api-module-ensembl-variation"
          ,(api-module "ensembl-variation"
                       "1dvwdzzfjhzymq02b6n4p6j3a9q4jgq0g89hs7hj1apd7zhirgkq"))
         ("api-module-ensembl-funcgen"
          ,(api-module "ensembl-funcgen"
                       "1x23pv38dmv0w0gby6rv3wds50qghb4v3v1mf43vk55msfxzry8n"))
         ("api-module-ensembl-io"
          ,(api-module "ensembl-io"
                       "14adb2x934lzsq20035mazdkhrkcw0qzb0xhz6zps9vk4wixwaix"))
         ("perl-test-harness" ,perl-test-harness)
         ("perl-test-exception" ,perl-test-exception)))
      (home-page "http://www.ensembl.org/vep")
      (synopsis "Predict functional effects of genomic variants")
      (description
       "This package provides a Variant Effect Predictor, which predicts
the functional effects of genomic variants.  It also provides
Haplosaurus, which uses phased genotype data to predict
whole-transcript haplotype sequences, and Variant Recoder, which
translates between different variant encodings.")
      (license license:asl2.0))))

(define-public r-signac
  (let ((commit "af4142724b72574d957f7fe3d422ed5828ec3ad0")
        (revision "1"))
    (package
      (name "r-signac")
      (version (git-version "1.9.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/timoast/signac/")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0ps0lp1dcy20r6lakil6ih81m04r0s6fnirvfjf01sfs0gsyddww"))))
      (properties `((upstream-name . "Signac")))
      (build-system r-build-system)
      (inputs (list zlib))
      (propagated-inputs
       (list r-biocgenerics
             r-data-table
             r-dplyr
             r-fastmatch
             r-future
             r-future-apply
             r-genomeinfodb
             r-genomicranges
             r-ggplot2
             r-iranges
             r-irlba
             r-matrix
             r-patchwork
             r-pbapply
             r-rcpp
             r-rcpproll
             r-rsamtools
             r-s4vectors
             r-scales
             r-seuratobject
             r-stringi
             r-tidyr
             r-tidyselect
             r-vctrs))
      (home-page "https://github.com/timoast/signac/")
      (synopsis "Analysis of single-cell chromatin data")
      (description
       "This package provides a framework for the analysis and exploration of
single-cell chromatin data.  The Signac package contains functions for
quantifying single-cell chromatin data, computing per-cell quality control
metrics, dimension reduction and normalization, visualization, and DNA
sequence motif analysis.")
      (license license:expat))))

(define-public tombo
  (package
    (name "tombo")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ont-tombo" version))
       (sha256
        (base32
         "1023hadgcsgi53kz53ql45207hfizf9sw57z0qij3ay1bx68zbpm"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #false))                ;no tests
    (native-inputs
     (list python-cython python-nose2))
    ;; The package mainly consists of a command-line tool, but also has a
    ;; Python-API. Thus these must be propagated.
    (propagated-inputs
     (list python-future
           python-h5py
           python-mappy
           python-numpy
           python-scipy
           python-tqdm
           python-rpy2))
    (home-page "https://github.com/nanoporetech/tombo")
    (synopsis "Analysis of raw nanopore sequencing data")
    (description "Tombo is a suite of tools primarily for the identification of
modified nucleotides from nanopore sequencing data.  Tombo also provides tools
for the analysis and visualization of raw nanopore signal.")
    ;; Some parts may be BSD-3-licensed.
    (license license:mpl2.0)))

(define-public python-pyvcf
  (let ((commit "476169cd457ba0caa6b998b301a4d91e975251d9")
        (revision "0"))
    (package
      (name "python-pyvcf")
      (version (git-version "0.6.8" revision commit))
      ;; Use git, because the PyPI tarballs lack test data.
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jamescasbon/PyVCF.git")
               ;; Latest release is not tagged.
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0qf9lwj7r2hjjp4bd4vc7nayrhblfm4qcqs4dbd43a6p4bj2jv5p"))))
      (build-system python-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'patch-sample-script
             (lambda _
               ;; Add Python 3 compatibility to this sample script.
               (substitute* "scripts/vcf_sample_filter.py"
                 (("print (.*)\n" _ arg)
                  (string-append "print(" arg ")\n")))))
           (add-after 'install 'remove-installed-tests
             ;; Do not install test files.
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (delete-file-recursively (string-append
                                         (site-packages inputs outputs)
                                         "/vcf/test")))))))
      (native-inputs
       ;; Older setuptools is needed for use_2to3.
       (list python-cython python-setuptools-57))
      (propagated-inputs
       (list python-pysam python-rpy2))
      (home-page "https://github.com/jamescasbon/PyVCF")
      (synopsis "Variant Call Format parser for Python")
      (description "This package provides a @acronym{VCF,Variant Call Format}
parser for Python.")
      (license license:expat))))

(define-public nanosv
  (package
   (name "nanosv")
   (version "1.2.4")
   (source (origin
            (method url-fetch)
            (uri (pypi-uri "NanoSV" version))
            (sha256
             (base32
              "1wl2daj0bwrl8fx5xi8j8hfs3mp3vg3qycy66538n032v1qkc6xg"))))
   (build-system python-build-system)
   (inputs
    (list python-configparser python-pysam python-pyvcf))
   (home-page "https://github.com/mroosmalen/nanosv")
   (synopsis "Structural variation detection tool for Oxford Nanopore data")
   (description "NanoSV is a software package that can be used to identify
structural genomic variations in long-read sequencing data, such as data
produced by Oxford Nanopore Technologies’ MinION, GridION or PromethION
instruments, or Pacific Biosciences RSII or Sequel sequencers.")
   (license license:expat)))

(define-public python-strawc
  (package
    (name "python-strawc")
    (version "0.0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "strawC" version))
       (sha256
        (base32
         "1z1gy8n56lhriy6hdkh9r82ndikndipq2cy2wh8q185qig4rimr6"))))
    (build-system python-build-system)
    (inputs
     (list curl zlib))
    (propagated-inputs
     (list pybind11))
    (home-page "https://github.com/aidenlab/straw")
    (synopsis "Stream data from .hic files")
    (description "Straw is library which allows rapid streaming of contact
data from @file{.hic} files.  This package provides Python bindings.")
    (license license:expat)))

(define-public python-pybbi
  (package
    (name "python-pybbi")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pybbi" version))
       (sha256
        (base32
         "1hvy2f28i2b41l1pq15vciqbj538n0lichp8yr6413jmgg06xdsk"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #false ; tests require network access
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-cc
           (lambda _ (setenv "CC" "gcc")))
         (replace 'check
           (lambda* (#:key inputs outputs tests? #:allow-other-keys)
             (when tests?
               (add-installed-pythonpath inputs outputs)
               (copy-recursively "tests" "/tmp/tests")
               (with-directory-excursion "/tmp/tests"
                 (invoke "python" "-m" "pytest" "-v"))))))))
    (native-inputs
     (list pkg-config python-pkgconfig python-pytest))
    (inputs
     (list libpng openssl zlib))
    (propagated-inputs
     (list python-cython python-numpy python-pandas python-six))
    (home-page "https://github.com/nvictus/pybbi")
    (synopsis "Python bindings to UCSC Big Binary file library")
    (description
     "This package provides Python bindings to the UCSC Big
Binary (bigWig/bigBed) file library.  This provides read-level access to local
and remote bigWig and bigBed files but no write capabilitites.  The main
feature is fast retrieval of range queries into numpy arrays.")
    (license license:expat)))

(define-public python-dna-features-viewer
  (package
    (name "python-dna-features-viewer")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dna_features_viewer" version))
       (sha256
        (base32
         "10a5pmh73spdgfml88zjqg1rn2j2zdxn06ir8a5q3arspyqvyqcb"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #false ;there are none
      #:phases
      '(modify-phases %standard-phases
         ;; See https://github.com/Edinburgh-Genome-Foundry/DnaFeaturesViewer/issues/73
         ;; and https://github.com/Edinburgh-Genome-Foundry/DnaFeaturesViewer/pull/74
         (add-after 'unpack 'fix-biopython-compatibility
           (lambda _
             (substitute* "dna_features_viewer/biotools.py"
               (("zip\\(aa1 \\+ \"\\*\", aa3 \\+ \\[\"\\*\"\\]\\)")
                "zip(aa1 + ('*',), aa3 + ('*',))")))))))
    (propagated-inputs
     (list python-biopython
           python-matplotlib
           python-packaging))
    (home-page
     "https://github.com/Edinburgh-Genome-Foundry/DnaFeaturesViewer")
    (synopsis "Plot features from DNA sequences")
    (description
     "DNA Features Viewer is a Python library to visualize DNA features,
e.g. from GenBank or Gff files, or Biopython SeqRecords.")
    (license license:expat)))

(define-public python-coolbox
  (package
    (name "python-coolbox")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "coolbox" version))
       (sha256
        (base32
         "0gqp76285w9klswr47y6kxbzwhv033b26jfa179kccfhiaq5p2xa"))))
    (build-system python-build-system)
    (arguments '(#:tests? #false)) ; there are none
    (inputs
     (list pybind11))
    (propagated-inputs
     (list python-cooler
           python-dna-features-viewer
           python-fire
           python-h5py
           python-intervaltree
           python-ipywidgets
           jupyter
           python-matplotlib
           python-nbformat
           python-numpy
           python-numpydoc
           python-pandas
           python-pybbi
           python-pytest
           python-scipy
           python-statsmodels
           python-strawc
           python-svgutils
           python-termcolor
           python-voila))
    (home-page "https://github.com/GangCaoLab/CoolBox")
    (synopsis "Genomic data visualization toolkit")
    (description
     "CoolBox is a toolkit for visual analysis of genomics data.  It aims to
be highly compatible with the Python ecosystem, easy to use and highly
customizable with a well-designed user interface.  It can be used in various
visualization situations, for example, to produce high-quality genome track
plots or fetch common used genomic data files with a Python script or command
line, interactively explore genomic data within Jupyter environment or web
browser.")
    (license license:gpl3+)))

(define-public python-pyspoa
  (package
    (name "python-pyspoa")
    (version "0.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nanoporetech/pyspoa")
             (commit (string-append "v" version))
             (recursive? #true)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1lgf2shzhxkcsircd6vy46h27pjljd5q95fyz1cm3lkk702qbnzx"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'build-libspoa
           (lambda _
             (mkdir-p "src/build")
             (with-directory-excursion "src/build"
               (invoke "cmake"
                       "-Dspoa_optimize_for_portability=ON"
                       "-DCMAKE_BUILD_TYPE=Release"
                       "-DCMAKE_CXX_FLAGS=\"-I ../vendor/cereal/include/\" -fPIC"
                       "..")
               (invoke "make"))))
         (replace 'check
           (lambda* (#:key inputs outputs tests? #:allow-other-keys)
             (when tests?
               (add-installed-pythonpath inputs outputs)
               (invoke "python" "tests/test_pyspoa.py")))))))
    (propagated-inputs
     (list pybind11))
    (native-inputs
     `(("cmake" ,cmake-minimal)))
    (home-page "https://github.com/nanoporetech/pyspoa")
    (synopsis "Python bindings for the SIMD partial order alignment library")
    (description
     "This package provides Python bindings for spoa, a C++ implementation of
the @dfn{partial order alignment} (POA) algorithm (as described in
10.1093/bioinformatics/18.3.452) which is used to generate consensus
sequences")
    (license license:expat)))

(define-public python-bwapy
  (package
    (name "python-bwapy")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bwapy" version))
       (sha256
        (base32 "090qwx3vl729zn3a7sksbviyg04kc71gpbm3nd8dalqp673x1npw"))
       (modules '((guix build utils)))
       (snippet
        '(for-each delete-file (find-files "." "\\.o$")))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'relax-requirements
           (lambda _
             (substitute* "setup.py"
               (("wheel>=0.34") "wheel>=0.30"))))
         ;; TODO: it's possible that the import error points to a real
         ;; problem with the C sources.
         (delete 'sanity-check))))
    (propagated-inputs
     (list python-cffi python-setuptools python-wheel))
    (inputs
     (list zlib))
    (home-page "https://github.com/ACEnglish/bwapy")
    (synopsis "Python bindings to bwa alinger")
    (description "This package provides Python bindings to the bwa mem
aligner.")
    ;; These Python bindings are licensed under Mozilla Public License 2.0,
    ;; bwa itself is licenced under GNU General Public License v3.0.
    (license license:mpl2.0)))

(define-public scvelo
  (package
    (name "scvelo")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "scvelo" version))
       (sha256
        (base32 "0h5ha1459ljs0qgpnlfsw592i8dxqn6p9bl08l1ikpwk36baxb7z"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; Numba needs a writable dir to cache functions.
         (add-before 'check 'set-numba-cache-dir
           (lambda _
             (setenv "NUMBA_CACHE_DIR" "/tmp")))
         (replace 'check
           (lambda* (#:key outputs tests? #:allow-other-keys)
             (when tests?
               ;; The discovered test file names must match the names of the
               ;; compiled files, so we cannot run the tests from
               ;; /tmp/guix-build-*.
               (with-directory-excursion
                   (string-append (assoc-ref outputs "out")
                                  "/lib/python3.10/site-packages/scvelo/core/tests/")
                 (invoke "pytest" "-v"))))))))
    (propagated-inputs
     (list python-anndata
           python-hnswlib
           python-isort
           python-igraph
           python-loompy
           python-louvain
           python-matplotlib
           python-numba
           python-numpy
           python-pandas
           python-scanpy
           python-scikit-learn
           python-scipy
           python-umap-learn
           pybind11))
    (native-inputs
     (list python-black
           python-flake8
           python-hypothesis
           python-pytest
           python-setuptools-scm
           python-wheel))
    (home-page "https://scvelo.org")
    (synopsis "RNA velocity generalized through dynamical modeling")
    (description "ScVelo is a scalable toolkit for RNA velocity analysis in
single cells.  RNA velocity enables the recovery of directed dynamic
information by leveraging splicing kinetics. scVelo generalizes the concept of
RNA velocity by relaxing previously made assumptions with a stochastic and a
dynamical model that solves the full transcriptional dynamics.  It thereby
adapts RNA velocity to widely varying specifications such as non-stationary
populations.")
    (license license:bsd-3)))

(define-public scregseg
  (package
    (name "scregseg")
    (version "0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BIMSBbioinfo/scregseg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "07g2barywa1wi8mggbxkbxqjw1fzd0a0l9cjdbkx4s40imb1dbxb"))
              (snippet
               '(delete-file "src/scregseg/_utils.c"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      '(modify-phases %standard-phases
         ;; Numba needs a writable dir to cache functions.
         (add-before 'check 'set-numba-cache-dir
           (lambda _
             (setenv "NUMBA_CACHE_DIR" "/tmp")))
         ;; Cython extensions have to be built before running the tests.
         (add-before 'check 'build-extensions
           (lambda _
             (invoke "python" "setup.py" "build_ext" "--inplace")))
         (add-after 'unpack 'do-not-fail-to-find-sklearn
           (lambda _
             ;; XXX: I have no idea why it cannot seem to find sklearn.
             (substitute* "setup.py"
               (("'sklearn',") "")))))))
    (native-inputs
     (list python-cython))
    (propagated-inputs
     (list python-scikit-learn
           python-scipy
           python-numpy
           python-hmmlearn
           python-pandas
           python-numba
           python-anndata
           python-scanpy
           python-pybedtools
           python-pysam
           python-matplotlib
           python-seaborn
           python-coolbox))
    (home-page "https://github.com/BIMSBbioinfo/scregseg")
    (synopsis "Single-cell regulatory landscape segmentation")
    (description "Scregseg (Single-Cell REGulatory landscape SEGmentation) is a
tool that facilitates the analysis of single cell ATAC-seq data by an
HMM-based segmentation algorithm.  Scregseg uses an HMM with
Dirichlet-Multinomial emission probabilities to segment the genome either
according to distinct relative cross-cell accessibility profiles or (after
collapsing the single-cell tracks to pseudo-bulk tracks) to capture distinct
cross-cluster accessibility profiles.")
    (license license:gpl3+)))

(define-public megadepth
  (package
    (name "megadepth")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ChristopherWilks/megadepth")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0hj69d2dgmk2zwgazik7xzc04fxxlk93p888kpgc52fmhd95qph7"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #false ; some tests seem to require connection to
                       ; www.ebi.ac.uk; this may be caused by htslib.
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'prepare-CMakeLists.txt
           (lambda _
             (rename-file "CMakeLists.txt.ci" "CMakeLists.txt")
             (substitute* "CMakeLists.txt"
               (("`cat ../VERSION`") ,version)
               (("target_link_libraries\\(megadepth_static") "#")
               (("target_link_libraries\\(megadepth_statlib") "#")
               (("add_executable\\(megadepth_static") "#")
               (("add_executable\\(megadepth_statlib") "#"))

             (substitute* "tests/test.sh"
               ;; Disable remote test
               (("./megadepth http://stingray.cs.jhu.edu/data/temp/test.bam") "#")
               ;; Prior to installation the binary's name differs from what
               ;; the test script assumes.
               (("./megadepth") "../build/megadepth_dynamic"))))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (with-directory-excursion "../source"
                 (invoke "bash" "tests/test.sh" "use-local-test-data")))))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
               (mkdir-p bin)
               (copy-file "megadepth_dynamic"
                          (string-append bin "/megadepth"))))))))
    (native-inputs
     (list diffutils perl grep))
    (inputs
     (list curl htslib libdeflate libbigwig zlib))
    (home-page "https://github.com/ChristopherWilks/megadepth")
    (synopsis "BigWig and BAM/CRAM related utilities")
    (description "Megadepth is an efficient tool for extracting coverage
related information from RNA and DNA-seq BAM and BigWig files.  It supports
reading whole-genome coverage from BAM files and writing either indexed TSV or
BigWig files, as well as efficient region coverage summary over intervals from
both types of files.")
    (license license:expat)))

(define-public megahit
  (package
    (name "megahit")
    (version "1.2.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/voutcn/megahit.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1r5d9nkdmgjsbrpj43q9hy3s8jwsabaz3ji561v18hy47v58923c"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:test-target "simple_test"
      #:phases
      '(modify-phases %standard-phases
         (add-after 'unpack 'fix-tests
           (lambda _
             (substitute* "src/megahit"
               (("os.path.join\\(script_path, '..'\\)")
                "os.path.join(script_path, '../source')")))))))
    (inputs (list python-wrapper zlib))
    (home-page "https://www.ncbi.nlm.nih.gov/pubmed/25609793")
    (synopsis "Meta-genome assembler")
    (description "Megahit is a fast and memory-efficient NGS assembler.  It is
optimized for metagenomes, but also works well on generic single genome
assembly (small or mammalian size) and single-cell assembly.")
    (license license:gpl3)))

(define-public mudskipper
  (package
    (name "mudskipper")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "mudskipper" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1y7fnlz6irmxdmv6bxzm95w4ws4vzldlrh8npvgxmdnrz9pgb1dv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #false    ;fail because the "mudskipper" crate cannot be found
       #:cargo-inputs
       (("rust-bio" ,rust-bio-0.39)
        ("rust-bio-types" ,rust-bio-types-0.12)
        ("rust-clap" ,rust-clap-2)
        ("rust-coitrees" ,rust-coitrees-0.2)
        ("rust-env-logger" ,rust-env-logger-0.9)
        ("rust-fnv" ,rust-fnv-1)
        ("rust-indicatif" ,rust-indicatif-0.16)
        ("rust-libradicl" ,rust-libradicl-0.4)
        ("rust-linecount" ,rust-linecount-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-cpus" ,rust-num-cpus-1)
        ("rust-rust-htslib" ,rust-rust-htslib-0.38))))
    (native-inputs
     (list cmake pkg-config))
    (inputs
     (list zlib xz))
    (home-page "https://github.com/OceanGenomics/mudskipper")
    (synopsis "Convert genomic alignments to transcriptomic BAM/RAD files")
    (description "Mudskipper is a tool for projecting genomic alignments to
transcriptomic coordinates.")
    (license license:bsd-3)))

(define-public r-ascat
  (package
   (name "r-ascat")
   (version "2.5.2")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/Crick-CancerGenomics/ascat.git")
                  (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0cc0y3as6cb64iwnx0pgbajiig7m4z723mns9d5i4j09ccid3ccm"))))
   (build-system r-build-system)
   (arguments
    `(#:phases
      (modify-phases %standard-phases
       (add-after 'unpack 'move-to-ascat-dir
         (lambda _
           (chdir "ASCAT"))))))
   (propagated-inputs
    (list r-rcolorbrewer))
   (home-page "https://github.com/VanLoo-lab/ascat/")
   (synopsis "Allele-Specific Copy Number Analysis of Tumors in R")
   (description "This package provides the @acronym{ASCAT,Allele-Specific Copy
Number Analysis of Tumors} R package that can be used to infer tumour purity,
ploidy and allele-specific copy number profiles.")
   (license license:gpl3)))

(define-public r-battenberg
  (package
   (name "r-battenberg")
   (version "2.2.9")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/Wedge-lab/battenberg.git")
                  (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0nmcq4c7y5g8h8lxsq9vadz9bj4qgqn118alip520ny6czaxki4h"))))
   (build-system r-build-system)
   (propagated-inputs
    (list r-devtools
          r-readr
          r-doparallel
          r-ggplot2
          r-rcolorbrewer
          r-gridextra
          r-gtools
          r-ascat))
   (home-page "https://github.com/Wedge-lab/battenberg")
   (synopsis "Subclonal copy number estimation in R")
   (description "This package contains the Battenberg R package for subclonal
copy number estimation, as described by
@url{doi:10.1016/j.cell.2012.04.023,Nik-Zainal et al.}")
   (license license:gpl3)))

(define-public r-catch
  (let ((commit "196ddd5a51b1a5f5daa01de53fdaad9b7505e084")
        (revision "1"))
    (package
      (name "r-catch")
      (version (git-version "1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/zhanyinx/CaTCH")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "11c7f1fc8f57wnwk1hrgr5y814m80zj8gkz5021vxyxy2v02cqgd"))))
      (build-system r-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'chdir
             (lambda _ (chdir "CaTCH"))))))
      (home-page "https://github.com/zhanyinx/CaTCH_R")
      (synopsis "Call a hierarchy of domains based on Hi-C data")
      (description "This package allows building the hierarchy of domains
starting from Hi-C data.  Each hierarchical level is identified by a minimum
value of physical insulation between neighboring domains.")
      (license license:gpl2+))))

(define-public r-spectre
  (let ((commit "f6648ab3eb9499300d86502b5d60ec370ae9b61a")
        (revision "1"))
    (package
      (name "r-spectre")
      (version (git-version "0.5.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/ImmuneDynamics/Spectre")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0g38grrhbqqa4bmcilvdyawbkcnax6k4vffx2giywp18mbirmj0x"))))
      (properties `((upstream-name . "Spectre")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-biobase
             r-biocmanager
             r-caret
             r-class
             r-colorramps
             r-data-table
             r-devtools
             r-dplyr
             r-exactextractr
             r-factoextra
             r-flowcore
             r-flowsom
             r-flowviz
             r-fnn
             r-ggplot2
             r-ggpointdensity
             r-ggpubr
             r-ggraph
             r-ggthemes
             r-gridextra
             r-gridextra
             r-gtools
             r-hdf5array
             r-irlba
             r-pheatmap
             r-plyr
             r-qs
             r-raster
             r-rcolorbrewer
             r-rgeos
             r-rhdf5
             r-rstudioapi
             r-rsvd
             r-rtsne
             r-s2
             r-scales
             r-sf
             r-sp
             r-stars
             r-stringr
             r-tidygraph
             r-tidyr
             r-tidyr
             r-tiff
             r-umap))
      (home-page "https://github.com/ImmuneDynamics/Spectre")
      (synopsis "High-dimensional cytometry and imaging analysis")
      (description
       "This package provides a computational toolkit in R for the
integration, exploration, and analysis of high-dimensional single-cell
cytometry and imaging data.")
      (license license:expat))))

(define-public r-compgenomrdata
  (let ((commit "24484cb77631e1123ead6c329b9d62c160e600c6")
        (revision "1"))
    (package
      (name "r-compgenomrdata")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/compgenomr/compGenomRData")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "06gdvz4m4qlb1ylv10qfx09zv4c95cm7nps4y2s67m946kv8czv8"))))
      (properties `((upstream-name . "compGenomRData")))
      (build-system r-build-system)
      (home-page "https://github.com/compgenomr/compGenomRData")
      (synopsis "Data for Computational Genomics with R book")
      (description "This package provides data for the book \"Computational
Genomics with R\".")
      (license license:gpl3))))

(define-public r-cytonorm
  (let ((commit "166f9ff3d692278241018c2846cb4f86ab16065b")
        (revision "1"))
    (package
      (name "r-cytonorm")
      (version (git-version "0.0.10" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/saeyslab/CytoNorm")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0vbqy3b26j1zqmwgqx59kkn9pm2m0qwlcppskvahrxcwrj6m1s5y"))))
      (properties `((upstream-name . "CytoNorm")))
      (build-system r-build-system)
      (propagated-inputs
       (list r-cytoml
             r-dplyr
             r-emdist
             r-flowcore
             r-flowsom
             r-flowworkspace
             r-ggplot2
             r-gridextra
             r-pheatmap
             r-stringr))
      (home-page "https://github.com/saeyslab/CytoNorm")
      (synopsis "Normalize cytometry data measured across multiple batches")
      (description
       "This package can be used to normalize cytometry samples when a control
sample is taken along in each of the batches.  This is done by first
identifying multiple clusters/cell types, learning the batch effects from the
control samples and applying quantile normalization on all markers of
interest.")
      (license license:gpl2+))))

(define-public r-kbet
  (let ((commit "f35171dfb04c7951b8a09ac778faf7424c4b6bc0")
        (revision "1"))
    (package
      (name "r-kbet")
      (version (git-version "0.99.6" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/theislab/kBET")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1r91prl2kki3zk694vhlmxdlqh0ixlhs8jfcqw6wc7cdsa0nv67k"))))
      (properties `((upstream-name . "kBET")))
      (build-system r-build-system)
      (propagated-inputs (list r-cluster r-fnn r-ggplot2 r-mass r-rcolorbrewer))
      (native-inputs (list r-knitr))
      (home-page "https://github.com/theislab/kBET")
      (synopsis "k-nearest neighbour batch effect test")
      (description
       "This tool detects batch effects in high-dimensional data based on chi^2-test.")
      ;; Any version of the GPL
      (license license:gpl3+))))

(define-public python-vireosnp
  (package
    (name "python-vireosnp")
    (version "0.5.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "vireoSNP" version))
              (sha256
               (base32
                "02ybhzivsxwnb1axlgbs63wni1j27xajnkl4jw1ps5vmsz2l4b0d"))))
    (build-system python-build-system)
    (propagated-inputs (list python-matplotlib python-numpy python-scipy))
    (home-page "https://github.com/huangyh09/vireoSNP")
    (synopsis "Deconvolution based on SNP for multiplexed scRNA-seq data")
    (description
     "This package provides a deconvolution based on Single Nucleotide
Position (SNP) for multiplexed scRNA-seq data.  The name vireo stand for
Variational Inference for Reconstructing Ensemble Origin by expressed SNPs in
multiplexed scRNA-seq data and follows the clone identification from
single-cell data named @url{https://github.com/PMBio/cardelino, cardelino}.")
    (license license:asl2.0)))

(define-public ccwl
  (package
    (name "ccwl")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ccwl.systemreboot.net/releases/ccwl-"
                           version ".tar.lz"))
       (sha256
        (base32
         "1ar8rfz3zrksgygrv67zv77y8gfvvz54zcs546jn6j28y20basla"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags '("GUILE_AUTO_COMPILE=0") ; to prevent guild warnings
       #:modules (((guix build guile-build-system)
                   #:select (target-guile-effective-version))
                  ,@%gnu-build-system-modules)
       #:imported-modules ((guix build guile-build-system)
                           ,@%gnu-build-system-modules)
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'wrap
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (effective-version (target-guile-effective-version)))
               (wrap-program (string-append out "/bin/ccwl")
                 `("GUILE_LOAD_PATH" prefix
                   (,(string-append out "/share/guile/site/" effective-version)
                    ,(getenv "GUILE_LOAD_PATH")))
                 `("GUILE_LOAD_COMPILED_PATH" prefix
                   (,(string-append out "/lib/guile/" effective-version "/site-ccache")
                    ,(getenv "GUILE_LOAD_COMPILED_PATH"))))))))))
    (inputs
     `(("bash" ,bash-minimal)
       ("guile" ,guile-3.0)
       ("guile-libyaml" ,guile-libyaml)))
    (native-inputs
     (list pkg-config
           lzip
           ;; To build documentation
           cwltool
           graphviz
           skribilo))
    (home-page "https://ccwl.systemreboot.net")
    (synopsis "Concise common workflow language")
    (description "The @acronym{ccwl, Concise Common Workflow Language} is a
concise syntax to express CWL workflows.  ccwl is a compiler to generate CWL
workflows from concise descriptions in ccwl.  It is implemented as an
@acronym{EDSL, Embedded Domain Specific Language} in the Scheme programming
language.")
    (license license:gpl3+)))

(define-public hh-suite
  (package
    (name "hh-suite")
    (version "3.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/soedinglab/hh-suite")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1bcmzg0ii6nkda2xm5jdddbwkgsag7k38j20af0c9chr2mbxwx4d"))
       (modules '((guix build utils)))
       (snippet
        '(delete-file-recursively "lib/simde"))))
    (build-system cmake-build-system)
    (arguments '(#:tests? #false)) ;no test target
    (inputs
     (list openmpi simde))
    (native-inputs
     (list perl pkg-config xxd))
    (home-page "https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-019-3019-7")
    (synopsis "Remote protein homology detection suite")
    (description "The HH-suite is a software package for sensitive protein sequence searching
based on the pairwise alignment of hidden Markov models (HMMs).")
    (license license:gpl3+)))

(define-public wfmash
  (package
    (name "wfmash")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ekg/wfmash/releases/download/v"
                           version "/wfmash-v" version ".tar.gz"))
       (sha256
        (base32
         "031cm1arpfckvihb28vlk69mirpnmlag81zcscfba1bac58wvr7c"))
       (snippet
        #~(begin
            (use-modules (guix build utils))
            ;; Unbundle atomic-queue.
            (delete-file-recursively "src/common/atomic_queue")
            (substitute* "src/align/include/computeAlignments.hpp"
              (("\"common/atomic_queue/atomic_queue.h\"")
               "<atomic_queue/atomic_queue.h>"))
            ;; Remove compiler optimizations.
            (substitute* (find-files "." "CMakeLists\\.txt")
              (("-mcx16 ") "")
              (("-march=native ") ""))
            ;; Allow building on architectures other than x86_64.
            (substitute* "src/common/dset64.hpp"
              (("!__x86_64__") "0"))))))
    (build-system cmake-build-system)
    (arguments
     (list
       #:phases
       #~(modify-phases %standard-phases
           (replace 'check
             ;; Adapted from .github/workflows/test_on_push.yml
             (lambda* (#:key tests? inputs #:allow-other-keys)
               (when tests?
                 (let ((samtools (search-input-file inputs "/bin/samtools")))
                   ;; This is the easiest way to access the data
                   ;; needed for the test suite.
                   (symlink (string-append "../wfmash-v" #$version "/data")
                            "data")
                   (and
                     ;; This test takes 60 minutes on riscv64-linux.
                     #$@(if (not (target-riscv64?))
                          #~((begin
                               ;; Test with a subset of the LPA dataset (PAF output)
                               (setenv "ASAN_OPTIONS" "detect_leaks=1:symbolize=1")
                               (setenv "LSAN_OPTIONS" "verbosity=0:log_threads=1")
                               (with-output-to-file "LPA.subset.paf"
                                 (lambda _
                                   (invoke "bin/wfmash"
                                           "data/LPA.subset.fa.gz"
                                           "data/LPA.subset.fa.gz"
                                           "-X" "-n" "10" "-T" "wflign_info."
                                           "-u" "./")))
                               (invoke "head" "LPA.subset.paf")))
                          #~())
                     ;; This test takes about 5 hours on riscv64-linux.
                     #$@(if (not (target-riscv64?))
                          #~((begin
                               ;; Test with a subset of the LPA dataset (SAM output)
                               (setenv "ASAN_OPTIONS" "detect_leaks=1:symbolize=1")
                               (setenv "LSAN_OPTIONS" "verbosity=0:log_threads=1")
                               (with-output-to-file "LPA.subset.sam"
                                 (lambda _
                                   (invoke "bin/wfmash"
                                           "data/LPA.subset.fa.gz"
                                           "data/LPA.subset.fa.gz"
                                           "-X" "-N" "-a" "-T" "wflign_info.")))
                               (with-output-to-file "LPA.subset.sam-view"
                                 (lambda _
                                   (invoke samtools "view" "LPA.subset.sam" "-bS")))
                               (with-output-to-file "LPA.subset.bam"
                                 (lambda _
                                   (invoke samtools "sort" "LPA.subset.sam-view")))
                               (invoke samtools "index" "LPA.subset.bam")
                               ;; samtools view LPA.subset.bam | head | cut -f 1-9
                               ;(invoke samtools "view" "LPA.subset.bam")
                               ;; There should be an easier way to do this with pipes.
                               (with-output-to-file "LPA.subset.bam-incr1"
                                 (lambda _
                                   (invoke samtools "view" "LPA.subset.bam")))
                               (with-output-to-file "LPA.subset.bam-incr2"
                                 (lambda _
                                   (invoke "head" "LPA.subset.bam-incr1")))
                               (invoke "cut" "-f" "1-9" "LPA.subset.bam-incr2")))
                          #~())
                     ;; This test takes 60 minutes on riscv64-linux.
                     #$@(if (not (target-riscv64?))
                          #~((begin
                               ;; Test with a subset of the LPA dataset,
                               ;; setting a lower identity threshold (PAF output)
                               (setenv "ASAN_OPTIONS" "detect_leaks=1:symbolize=1")
                               (setenv "LSAN_OPTIONS" "verbosity=0:log_threads=1")
                               (with-output-to-file "LPA.subset.p90.paf"
                                 (lambda _
                                   (invoke "bin/wfmash"
                                           "data/LPA.subset.fa.gz"
                                           "data/LPA.subset.fa.gz"
                                           "-X" "-p" "90" "-n" "10"
                                           "-T" "wflign_info.")))
                               (invoke "head" "LPA.subset.p90.paf")))
                          #~())
                     (begin
                       ;; Test aligning short reads (500 bps) to a reference (SAM output)
                       (setenv "ASAN_OPTIONS" "detect_leaks=1:symbolize=1")
                       (setenv "LSAN_OPTIONS" "verbosity=0:log_threads=1")
                       (with-output-to-file "reads.500bps.sam"
                         (lambda _
                           (invoke "bin/wfmash"
                                   "data/reference.fa.gz"
                                   "data/reads.500bps.fa.gz"
                                   "-s" "0.5k" "-N" "-a")))
                       (with-output-to-file "reads.500bps.sam-view"
                         (lambda _
                           (invoke samtools "view" "reads.500bps.sam" "-bS")))
                       (with-output-to-file "reads.500bps.bam"
                         (lambda _
                           (invoke samtools "sort" "reads.500bps.sam-view")))
                       (invoke samtools "index" "reads.500bps.bam")
                       (with-output-to-file "reads.500bps.bam-view"
                         (lambda _
                           (invoke samtools "view" "reads.500bps.bam")))
                       (invoke "head" "reads.500bps.bam-view"))
                     (begin
                       ;; Test with few very short reads (255bps) (PAF output)
                       (setenv "ASAN_OPTIONS" "detect_leaks=1:symbolize=1")
                       (setenv "LSAN_OPTIONS" "verbosity=0:log_threads=1")
                       (with-output-to-file "reads.255bps.paf"
                         (lambda _
                           (invoke "bin/wfmash"
                                   "data/reads.255bps.fa.gz"
                                   "data/reads.255bps.fa.gz"
                                   "-X" "-w" "16")))
                       (invoke "head" "reads.255bps.paf"))))))))))
    (inputs
     (list atomic-queue
           gsl
           htslib
           jemalloc
           zlib))
    (native-inputs
     (list samtools))
    (synopsis "Base-accurate DNA sequence aligner")
    (description "@code{wfmash} is a DNA sequence read mapper based on mash
distances and the wavefront alignment algorithm.  It is a fork of MashMap that
implements base-level alignment via the wflign tiled wavefront global
alignment algorithm.  It completes MashMap with a high-performance alignment
module capable of computing base-level alignments for very large sequences.")
    (home-page "https://github.com/ekg/wfmash")
    (license license:expat)))

(define-public gdcm
  (package
    (name "gdcm")
    (version "3.0.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/malaterre/gdcm")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1rf0p7dnakjry0fa6ax1h762bn0l5n6ibfdxn077mjvwgpqan51l"))))
    (build-system cmake-build-system)
    (outputs '("out" "doc"))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'set-HOME
            ;; The build spams ‘Fontconfig error: No writable cache
            ;; directories’ in a seemingly endless loop otherwise.
            (lambda _
              (setenv "HOME" "/tmp"))))
      #:configure-flags
      #~(list "-DGDCM_BUILD_TESTING=true"
              (string-append "-DCMAKE_CTEST_ARGUMENTS=-E;"
                             "'TestFileMetaInformation"
                             "|TestElement2"
                             "|TestSCUValidation"
                             "|TestWriter"
                             "|TestAnonymizer4"
                             "|TestPrinter1"
                             "|TestEcho"
                             ;; The scanner tests depend on TestWriter output
                             "|TestStrictScanner1"
                             "|TestStrictScanner2_1"
                             "|TestStrictScanner2"
                             "|TestStrictScanner2_2"
                             "|TestFind'")
              "-DGDCM_DOCUMENTATION:BOOL=ON"
              "-DGDCM_PDF_DOCUMENTATION:BOOL=OFF"
              (string-append "-DGDCM_INSTALL_DOC_DIR="
                             #$output:doc "/share/doc/" #$name)
              "-DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=OFF"))) ; TODO: need ‘xsl-ns’
    (native-inputs (list doxygen graphviz))
    (home-page "https://gdcm.sourceforge.net/wiki/index.php/Main_Page")
    (synopsis "Grassroots DICOM library")
    (description
     "Grassroots DICOM (GDCM) is an implementation of the DICOM standard
designed to be open source so that researchers may access clinical data
directly.  GDCM includes a file format definition and a network communications
protocol, both of which should be extended to provide a full set of tools for
a researcher or small medical imaging vendor to interface with an existing
medical database.")
    (license license:bsd-3)))

(define-public wiggletools
  (package
    (name "wiggletools")
    (version "1.2.11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ensembl/WiggleTools/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1g3qla4l1g583nzlgyww5jqxpq87ndpn9cmjls098bgqjyn5292q"))))
    (build-system gnu-build-system)
    (arguments
     (list
      ;; Tests require internet access
      #:tests? #false
      #:make-flags
      #~(list "Wiggletools"
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda _
              (install-file "bin/wiggletools"
                            (string-append #$output "/bin")))))))
    (inputs
     (list curl ; XXX: needed by libbigwig
           htslib libbigwig gsl xz zlib))
    (home-page "https://github.com/Ensembl/WiggleTools/")
    (synopsis "Operations on the space of numerical functions defined on the genome")
    (description "The WiggleTools package allows genomewide data files to be
manipulated as numerical functions, equipped with all the standard functional
analysis operators (sum, product, product by a scalar, comparators), and
derived statistics (mean, median, variance, stddev, t-test, Wilcoxon's rank
sum test, etc).")
    (license license:asl2.0)))

(define-public flair
  (package
    (name "flair")
    (version "1.6.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/BrooksLabUCSC/flair")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0jviacx6qx5rwgi3wvl7a8a8ml19r6cpngddivlk13f6g9072din"))))
    (build-system python-build-system)
    (arguments
     (list
      #:tests? #false ;there are none
      #:phases
      #~(modify-phases %standard-phases
          ;; TODO: implement as a feature of python-build-system (PEP-621,
          ;; PEP-631, PEP-660)
          (replace 'build
            (lambda _
              (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version)
              ;; ZIP does not support timestamps before 1980.
              (setenv "SOURCE_DATE_EPOCH" "315532800")
              (invoke "python" "-m" "build" "--wheel" "--no-isolation" ".")))
          (replace 'install
            (lambda _
              (apply invoke "pip" "--no-cache-dir" "--no-input"
                     "install" "--no-deps" "--prefix" #$output
                     (find-files "dist" "\\.whl$"))))
          (add-after 'install 'wrap-executable
            (lambda _
              (for-each
               (lambda (script)
                 (wrap-program script
                   `("R_HOME" ":" = (,(string-append #$r-minimal "/lib/R")))
                   `("R_LIBS_SITE" ":" = (,(getenv "R_LIBS_SITE")))))
               (find-files (string-append #$output "/bin"))))))))
    (propagated-inputs
     (list python-mappy
           python-numpy
           python-ncls
           python-pybedtools
           python-pysam
           python-rpy2
           python-scipy
           python-tqdm))
    ;; Used by rpy2
    (inputs
     (list r-minimal  ;for R_LIBS_SITE
           r-apeglm   ;for runDE
           r-deseq2   ;for runDE
           r-drimseq  ;for runDS
           r-ggplot2  ;runDS, runDU
           r-lazyeval ;for rpy2
           r-qqman    ;for runDE
           r-rlang))  ;for rpy2
    (native-inputs
     (list python-pypa-build python-setuptools))
    (home-page "https://flair.readthedocs.io/en/latest/")
    (synopsis "Full-length alternative isoform analysis of RNA")
    (description "This package implements FLAIR (Full-Length Alternative
Isoform analysis of RNA) for the correction, isoform definition, and
alternative splicing analysis of noisy reads.  FLAIR has primarily been used
for nanopore cDNA, native RNA, and PacBio sequencing reads.")
    (license license:bsd-3)))

(define-public go-github-com-biogo-graph
  (package
    (name "go-github-com-biogo-graph")
    (version "0.0.0-20150317020928-057c1989faed")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/biogo/graph")
                    (commit (go-version->git-ref version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1kpzs5dfd5dsk4mg1g2qjz1prqd84ixhrcxxnf90hq25vxcnk7lh"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/biogo/graph"
       #:tests? #false))      ;TODO: one of 13 tests fails for unknown reasons
    (propagated-inputs
     (list go-gopkg-in-check-v1))
    (home-page "https://github.com/biogo/graph")
    (synopsis "Undirected graph analysis for biogo")
    (description "The package @code{graph} implements graph manipulation
functions.")
    (license license:bsd-3)))

(define-public go-github-com-biogo-store-interval
  (package
    (name "go-github-com-biogo-store-interval")
    (version "0.0.0-20201120204734-aad293a2328f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/biogo/store")
                    (commit (go-version->git-ref version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0skizrp1j6vgbl0g1kmh73picagqlvwckaqs0gkl6rai5lckxj8a"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/biogo/store/interval"
       #:unpack-path "github.com/biogo/store"))
    (propagated-inputs
     (list go-gopkg-in-check-v1
           go-github-com-kr-pretty))
    (home-page "https://github.com/biogo/store")
    (synopsis "Interval store type for biogo")
    (description
     "The @code{store} package provides a number of data store types that are
useful for bioinformatic analysis.")
    (license license:bsd-3)))

(define-public go-github-com-biogo-store-kdtree
  (package
    (inherit go-github-com-biogo-store-interval)
    (name "go-github-com-biogo-store-kdtree")
    (arguments
     '(#:import-path "github.com/biogo/store/kdtree"
       #:unpack-path "github.com/biogo/store"))
    (propagated-inputs
     (list go-gopkg-in-check-v1
           go-github-com-kr-pretty))
    (synopsis "kdtree store type for biogo")))

(define-public go-github-com-biogo-store-llrb
  (package
    (inherit go-github-com-biogo-store-interval)
    (name "go-github-com-biogo-store-llrb")
    (arguments
     '(#:import-path "github.com/biogo/store/llrb"
       #:unpack-path "github.com/biogo/store"))
    (propagated-inputs
     (list go-gopkg-in-check-v1
           go-github-com-kr-pretty))
    (synopsis "LLRB store for biogo")))

(define-public go-github-com-biogo-store-step
  (package
    (inherit go-github-com-biogo-store-interval)
    (name "go-github-com-biogo-store-step")
    (arguments
     '(#:import-path "github.com/biogo/store/step"
       #:unpack-path "github.com/biogo/store"))
    (propagated-inputs
     (list go-gopkg-in-check-v1
           go-github-com-kr-pretty))
    (synopsis "Step store for biogo")))

(define-public go-github-com-biogo-hts-bam
  (package
    (name "go-github-com-biogo-hts-bam")
    (version "1.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/biogo/hts")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1vkcqxyajghx5p5j7g2i376nbsxh8q2smk0smlv8mi34yr7hlw5b"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/biogo/hts/bam"
       #:unpack-path "github.com/biogo/hts"))
    (propagated-inputs
     (list go-gopkg-in-check-v1))
    (home-page "https://github.com/biogo/hts")
    (synopsis "HTS BAM module for biogo")
    (description "This package provides tools for handling BAM files.")
    (license license:bsd-3)))

(define-public go-github-com-biogo-hts-sam
  (package
    (inherit go-github-com-biogo-hts-bam)
    (name "go-github-com-biogo-hts-sam")
    (arguments
     '(#:import-path "github.com/biogo/hts/sam"
       #:unpack-path "github.com/biogo/hts"))
    (propagated-inputs
     (list go-gopkg-in-check-v1))
    (synopsis "HTS SAM module for biogo")
    (description "This package provides tools for handling SAM files.")))

(define-public go-github-com-biogo-hts-tabix
  (package
    (inherit go-github-com-biogo-hts-bam)
    (name "go-github-com-biogo-hts-tabix")
    (arguments
     '(#:import-path "github.com/biogo/hts/tabix"
       #:unpack-path "github.com/biogo/hts"))
    (propagated-inputs
     (list go-gopkg-in-check-v1))
    (synopsis "HTS Tabix module for biogo")
    (description "This package provides tools for handling Tabix files.")))

(define-public go-github-com-biogo-hts-bgzf
  (package
    (inherit go-github-com-biogo-hts-bam)
    (name "go-github-com-biogo-hts-bgzf")
    (arguments
     '(#:import-path "github.com/biogo/hts/bgzf"
       #:unpack-path "github.com/biogo/hts"))
    (propagated-inputs
     (list go-gopkg-in-check-v1))
    (synopsis "HTS bgzf module for biogo")
    (description "This package provides tools for handling bgzf files.")))

(define-public go-github-com-biogo-hts-cram
  (package
    (inherit go-github-com-biogo-hts-bam)
    (name "go-github-com-biogo-hts-cram")
    (arguments
     '(#:import-path "github.com/biogo/hts/cram"
       #:unpack-path "github.com/biogo/hts"
       #:tests? #false)) ;require network access
    (propagated-inputs
     (list go-gopkg-in-check-v1
           go-github.com-ulikunitz-xz
           go-github-com-kortschak-utter))
    (synopsis "HTS CRAM module for biogo")
    (description "This package provides tools for handling CRAM files.")))

(define-public go-github-com-biogo-hts-csi
  (package
    (inherit go-github-com-biogo-hts-bam)
    (name "go-github-com-biogo-hts-csi")
    (arguments
     '(#:import-path "github.com/biogo/hts/csi"
       #:unpack-path "github.com/biogo/hts"))
    (propagated-inputs
     (list go-gopkg-in-check-v1))
    (synopsis "Coordinate sorted indexing for biogo")
    (description "This package implements CSIv1 and CSIv2 coordinate sorted
indexing.")))

(define-public go-github-com-biogo-hts-fai
  (package
    (inherit go-github-com-biogo-hts-bam)
    (name "go-github-com-biogo-hts-fai")
    (arguments
     '(#:import-path "github.com/biogo/hts/fai"
       #:unpack-path "github.com/biogo/hts"))
    (propagated-inputs
     (list go-gopkg-in-check-v1))
    (synopsis "Fasta sequence file index handling for biogo")
    (description "This package implements FAI fasta sequence file index
handling.")))

(define-public go-github-com-biogo-biogo
  (package
    (name "go-github-com-biogo-biogo")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/biogo/biogo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ali1mqf3dc26myv6l7wmqfr8i25461rbq3qdad8s0wi29622199"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/biogo/biogo"))
    (propagated-inputs
     (list go-gopkg-in-check-v1
           go-github-com-biogo-store-interval
           go-github-com-biogo-store-kdtree
           go-github-com-biogo-store-llrb
           go-github-com-biogo-store-step
           go-github-com-biogo-hts-bam
           go-github-com-biogo-graph))
    (home-page "https://github.com/biogo/biogo")
    (synopsis "Bioinformatics library for Go")
    (description
     "Bíogo is a bioinformatics library for the Go language.")
    (license license:bsd-3)))

(define-public python-gseapy
  (package
    (name "python-gseapy")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zqfang/GSEApy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "06gh09dwwj2xr5zx8i41smy8arx2pw7rll7sk50np28z419bnyz9"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:install-source? #false
      #:features '(list "extension-module")
      #:cargo-test-flags '(list "--features=extension-module")
      #:cargo-inputs
      `(("rust-csv" ,rust-csv-1)
        ("rust-itertools" ,rust-itertools-0.10)
        ("rust-pyo3" ,rust-pyo3-0.16)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-serde" ,rust-serde-1))
      #:imported-modules
      (append %cargo-build-system-modules
              %pyproject-build-system-modules)
      #:modules
      '((guix build cargo-build-system)
        ((guix build pyproject-build-system) #:prefix py:)
        (guix build utils))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'prepare-python-module
            (lambda _
              ;; We don't use maturin, nor do we use setuptools-rust.
              (delete-file "pyproject.toml")
              (call-with-output-file "pyproject.toml"
                (lambda (port)
                  (format port "\
[build-system]
build-backend = 'setuptools.build_meta'
requires = ['setuptools']
")))
              (delete-file "setup.py")
              (call-with-output-file "setup.cfg"
                (lambda (port)
                  (format port "\
[metadata]
name = gseapy
version = ~a

[options]
packages = find:

[options.packages.find]
exclude =
  src
  docs
  tests
  Cargo.toml
" #$version)))))
          ;; We delete the Cargo checks but run the Python tests later.
          ;; See https://github.com/zqfang/GSEApy/issues/207
          (delete 'check)
          (add-after 'prepare-python-module 'enable-bytecode-determinism
            (assoc-ref py:%standard-phases 'enable-bytecode-determinism))
          (add-after 'enable-bytecode-determinism 'build-python-module
            (assoc-ref py:%standard-phases 'build))
          (add-after 'build-python-module 'install-python-module
            (assoc-ref py:%standard-phases 'install))
          (add-after 'install-python-module 'install-python-library
            (lambda _
              (let ((site (string-append #$output "/lib/python"
                                         #$(version-major+minor
                                            (package-version python))
                                         "/site-packages")))
                (mkdir-p site)
                (copy-file "target/release/libgse.so"
                           (string-append site "/gseapy/gse.so")))))
          (add-after 'install-python-library 'add-install-to-pythonpath
            (assoc-ref py:%standard-phases 'add-install-to-pythonpath))
          (add-after 'add-install-to-pythonpath 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke "pytest" "-vv" "tests"
                        ;; These tests need access to the internet
                        "-k" "not test_enrichr and not test_prerank")))))))
    (inputs
     (list python-wrapper))
    (native-inputs
     (list python-pytest))
    (propagated-inputs
     (list python-numpy
           python-scipy
           python-pandas
           python-matplotlib
           python-requests))
    (home-page "https://github.com/zqfang/gseapy")
    (synopsis "Gene Set Enrichment Analysis in Python")
    (description "GSEApy is a Python/Rust implementation for GSEA and wrapper
for Enrichr.  GSEApy can be used for RNA-seq, ChIP-seq, Microarray data. It
can be used for convenient GO enrichment and to produce publication quality
figures in Python.")
    (license license:bsd-3)))

;;;
;;; Avoid adding new packages to the end of this file. To reduce the chances
;;; of a merge conflict, place them above by existing packages with similar
;;; functionality or similar names.
;;;
