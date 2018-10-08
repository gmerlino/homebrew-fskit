class Fskit < Formula
  desc "Batteries-Included Filesystems"
  homepage "https://github.com/jcnelson/fskit"

  head do
    url "https://github.com/jcnelson/fskit.git"
  end

  depends_on "pkg-config" => :build

  patch :p1, :DATA

  def install
    # ENV.append_to_cflags "-D_UTIME_H"
    system "make", "-C",
                   "libfskit",
                   "PREFIX=#{prefix}",
                   "CCFLAGS+=-D_UTIME_H",
                   # "CCFLAGS+=-D_POSIX_C_SOURCE",
                   "install"
  end

  test do
    system "make", "-C", "test"
  end
end

__END__
diff --git a/include/fskit/common.h b/include/fskit/common.h
index 944f890..c0f598f 100644
--- a/include/fskit/common.h
+++ b/include/fskit/common.h
@@ -69,7 +69,7 @@
 
 #include <utime.h>
 
-#include <attr/xattr.h>
+#include <sys/xattr.h>
 #include <stdbool.h>
 
 #ifndef ENOATTR
diff --git a/include/fskit/getxattr.h b/include/fskit/getxattr.h
index aff699a..0d4a6e4 100644
--- a/include/fskit/getxattr.h
+++ b/include/fskit/getxattr.h
@@ -25,7 +25,7 @@
 #include <fskit/debug.h>
 #include <fskit/entry.h>
 
-#include <attr/xattr.h>
+#include <sys/xattr.h>
 
 FSKIT_C_LINKAGE_BEGIN 
 
diff --git a/include/fskit/removexattr.h b/include/fskit/removexattr.h
index 248c531..eb8b9fc 100644
--- a/include/fskit/removexattr.h
+++ b/include/fskit/removexattr.h
@@ -25,7 +25,7 @@
 #include <fskit/debug.h>
 #include <fskit/entry.h>
 
-#include <attr/xattr.h>
+#include <sys/xattr.h>
 
 FSKIT_C_LINKAGE_BEGIN 
 
diff --git a/include/fskit/repl.h b/include/fskit/repl.h
index f476cac..28b153d 100644
--- a/include/fskit/repl.h
+++ b/include/fskit/repl.h
@@ -25,7 +25,7 @@
 #include <fskit/debug.h>
 #include <fskit/entry.h>
 
-#include <attr/xattr.h>
+#include <sys/xattr.h>
 
 FSKIT_C_LINKAGE_BEGIN
 
diff --git a/include/fskit/setxattr.h b/include/fskit/setxattr.h
index 0506400..092fb20 100644
--- a/include/fskit/setxattr.h
+++ b/include/fskit/setxattr.h
@@ -25,7 +25,7 @@
 #include <fskit/debug.h>
 #include <fskit/entry.h>
 
-#include <attr/xattr.h>
+#include <sys/xattr.h>
 
 FSKIT_C_LINKAGE_BEGIN 
 
