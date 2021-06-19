class TGPython < Formula
  desc "Tool for timing mechanical watches"
  homepage "https://tg.ciovil.li"
  url "https://github.com/xyzzy42/tg.git", :tag => "v0.6.0-tpiepho"
  head "https://github.com/xyzzy42/tg.git", :branch => "trentpi/python"

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "gtk+3"
  depends_on "portaudio"
  depends_on "fftw"
  depends_on "gnome-icon-theme"

  def install
    ENV["LIBTOOL"] = "glibtool"
    ENV["LIBTOOLIZE"] = "glibtoolize"
    system "./autogen.sh"
    system "./configure"
    system "make"
    system "make", "tg-timer-dbg"
    prefix.install "tg-timer-dbg"
    bin.install "tg-timer"
    man1.install "docs/tg-timer.1"
  end

  test do
    mkdir "#{testpath}/.config"
    system "#{prefix}/tg-timer-dbg", "test"
  end
end
