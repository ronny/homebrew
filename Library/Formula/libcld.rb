require 'formula'

class Libcld < Formula
  head 'https://github.com/mzsanford/cld.git', :using => :git
  url 'https://github.com/mzsanford/cld/archive/v0.1.1.tar.gz'
  homepage 'https://github.com/mzsanford/cld'
  sha1 'af1b337ddddd15262a67305b8ef474860d72b0c5'

  depends_on 'pkg-config' => :build
  depends_on :automake
  depends_on :autoconf
  depends_on :libtool

  def install
    system "autoreconf", "-fi", "-Wall,no-obsolete"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make check"
    system "make install"
  end
end
