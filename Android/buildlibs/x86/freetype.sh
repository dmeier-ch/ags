export NDK_PLATFORM_ROOT=$NDK_ROOT/platforms/android-9/arch-x86/usr
export NDK_ADDITIONAL_LIBRARY_PATH=$(pwd)/../../nativelibs/x86
export NDK_HOST_NAME=i686-android-linux

FILENAME=freetype-2.4.6
EXTENSION=tar.bz2

wget -c http://download.savannah.gnu.org/releases/freetype/$FILENAME.$EXTENSION -O ../$FILENAME.$EXTENSION

tar -jxf ../$FILENAME.$EXTENSION

cd $FILENAME

wget http://git.savannah.gnu.org/cgit/config.git/plain/config.sub -O config.sub
wget http://git.savannah.gnu.org/cgit/config.git/plain/config.guess -O config.guess

LDFLAGS="-Wl,-rpath-link=$NDK_PLATFORM_ROOT/lib,-L$NDK_ADDITIONAL_LIBRARY_PATH/lib,-L$NDK_PLATFORM_ROOT/lib" CFLAGS="-std=c99 -nostdlib -I$NDK_ADDITIONAL_LIBRARY_PATH/include -I$NDK_PLATFORM_ROOT/include" LIBS="-lc" ./configure --host=$NDK_HOST_NAME --prefix=$NDK_ADDITIONAL_LIBRARY_PATH
make
make install