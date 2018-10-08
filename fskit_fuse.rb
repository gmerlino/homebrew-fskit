class FskitFuse < Formula
  desc "Batteries-Included Filesystems"
  homepage "https://github.com/jcnelson/fskit"

  head do
    url "https://github.com/jcnelson/fskit.git"
  end

  depends_on "pkg-config" => :build
  depends_on :osxfuse
  depends_on "fskit"

  def install
    ENV.append "LIBS", "-losxfuse"
    #, "`pkg-config --libs enchant`.chomp"
    system "make", "-C", "fuse", "PREFIX=#{prefix}", "install"
  end
end
