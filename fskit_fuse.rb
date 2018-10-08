class FskitFuse < Formula
  desc "Batteries-Included Filesystems"
  homepage "https://github.com/jcnelson/fskit"

  head do
    url "https://github.com/jcnelson/fskit.git"
  end

  depends_on "pkg-config" => :build
  depends_on "fskit"
  depends_on :osxfuse

  def install
    # ENV.append "LIBS", "-losxfuse", "`pkg-config --libs enchant`.chomp"
    ENV.append "LIBS", "-losxfuse"
    system "make", "-C", "fuse", "PREFIX=#{prefix}", "install"
  end

  test do
    system "make", "-C", "test"
  end
end
