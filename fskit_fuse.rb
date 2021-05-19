# typed: false
# frozen_string_literal: true

class FskitFuse < Formula
  desc "Batteries-Included Filesystems"
  homepage "https://github.com/jcnelson/fskit"

  head do
    url "https://github.com/jcnelson/fskit.git"
  end

  depends_on "pkg-config" => :build
  depends_on "fskit"

  on_macos do
    disable! date: "2021-05-19", because: "requires FUSE"
  end

  on_linux do
    depends_on "libfuse"
  end

  def install
    # ENV.append "LIBS", "-losxfuse", "`pkg-config --libs enchant`.chomp"
    ENV.append "LIBS", "-losxfuse"
    system "make", "-C", "fuse", "PREFIX=#{prefix}", "install"
  end

  test do
    system "make", "-C", "test"
  end
end
