{ stdenv, fetchurl, cmake, makedepend, perl, pkgconfig, qttools
, dssi, fftwSinglePrec, ladspaH, ladspaPlugins, libjack2
, liblo, liblrdf, libsamplerate, libsndfile, lirc ? null, qtbase }:

stdenv.mkDerivation (rec {
  version = "17.12.1";
  name = "rosegarden-${version}";

  src = fetchurl {
    url = "mirror://sourceforge/rosegarden/${name}.tar.bz2";
    sha256 = "155kqbxg85wqv0w97cmmx8wq0r4xb3qpnk20lfma04vj8k6hc1mg";
  };

  patchPhase = ''
    substituteInPlace src/CMakeLists.txt --replace svnheader svnversion
  '';

  nativeBuildInputs = [ cmake makedepend perl pkgconfig qttools ];

  buildInputs = [
    dssi
    fftwSinglePrec
    ladspaH
    ladspaPlugins
    libjack2
    liblo
    liblrdf
    libsamplerate
    libsndfile
    lirc
    qtbase
  ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    homepage = http://www.rosegardenmusic.com/;
    description = "Music composition and editing environment";
    longDescription = ''
      Rosegarden is a music composition and editing environment based around
      a MIDI sequencer that features a rich understanding of music notation
      and includes basic support for digital audio.

      Rosegarden is an easy-to-learn, attractive application that runs on Linux,
      ideal for composers, musicians, music students, and small studio or home
      recording environments.
    '';
    maintainers = with maintainers; [ lebastr ];
    license = licenses.lgpl2Plus;
    platforms = platforms.linux;
  };
})
