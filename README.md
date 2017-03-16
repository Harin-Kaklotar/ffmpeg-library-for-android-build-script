this is build script for android ffmpeg 
this project is based on https://github.com/ZhangTingkuo 's https://github.com/ZhangTingkuo/ffmpeg-library-for-android-build-script project

# ffmpeg-library-for-android-build-script

download latest ffmpeg from github

copy ffmpeg to ../ndk/sources/ directory

then modify original ffmpeg/configure file text<br>
from
```
SLIBNAME_WITH_MAJOR='$(SLIBNAME).$(LIBMAJOR)'
LIB_INSTALL_EXTRA_CMD='$$(RANLIB)"$(LIBDIR)/$(LIBNAME)"'
SLIB_INSTALL_NAME='$(SLIBNAME_WITH_VERSION)'
SLIB_INSTALL_LINKS='$(SLIBNAME_WITH_MAJOR)$(SLIBNAME)'
```
to：<br>
```
SLIBNAME_WITH_MAJOR='$(SLIBPREF)$(FULLNAME)-$(LIBMAJOR)$(SLIBSUF)'
LIB_INSTALL_EXTRA_CMD='$$(RANLIB)"$(LIBDIR)/$(LIBNAME)"'
SLIB_INSTALL_NAME='$(SLIBNAME_WITH_MAJOR)'
SLIB_INSTALL_LINKS='$(SLIBNAME)'
```

after make change in configure file

copy this file in to your ffmpeg folder

and make apropriate change in all sh file like *NDK* path, *SYSROOT* and *TOOLCHAIN* 

and open software can build shall file like Git Bash or terminal in mac or Linux

then purform this command in your apropriate terminal or repalted software

```
./build-all.sh
```

it will make aproprite android cpu so file

happy to code :)
