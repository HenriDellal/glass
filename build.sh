#!/data/data/com.termux/files/usr/bin/sh -e 
#
# Copyright 2017 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
# Adapted from Adi Lima https://github.com/fx-adi-lima/android-tutorials
#####################################################################
PROJECT_NAME=glass

if [ ! -d "./bin" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
mkdir ./bin
fi
if [ ! -d "./assets" ]; then
mkdir ./assets
fi
# create R.java
echo "aapt begun"
aapt package -v -f \
             -M ./AndroidManifest.xml \
             -I $PREFIX/share/java/android.jar \
             -J src \
             -S res \
             -m


# compile the java sources
# THIS EXAMPLE USING ecj, and we should find out which version
# If using jack then we must do like this:
#   jack --classpath $ANDROID_HOME/platforms/android-n/android.jar \
#        --import [path/to/import/lib/*.jar \
#        --output-dex bin/ \
#        src/ gen/
# And then, no more using dx to produce classes.dex

#####################################################################
#
echo "ecj begun"
ecj -d ./obj -classpath $HOME/../usr/share/java/android.jar \
	     -sourcepath . $(find src -type f -name "*.java")
#
echo "dx begun"
dx --dex --verbose --output=./bin/classes.dex ./obj

#jack --classpath $PREFIX/share/java/android.jar \
#	--output-dex bin/ \
#	src/ gen/

# make the apk
echo "make the apk"

aapt package -v -f \
             -M ./AndroidManifest.xml \
             -S ./res \
	     -A ./assets \
             -F bin/$PROJECT_NAME.apk


# add the classes.dex to the apk
echo "add the classes.dex to the apk"
cd bin
aapt add -f $PROJECT_NAME.apk classes.dex

cp $PROJECT_NAME.apk ../$PROJECT_NAME.apk
echo "sign the apk"
apksigner -p test test-keystore.jks $PROJECT_NAME.apk $HOME/$PROJECT_NAME/$PROJECT_NAME.apk

cd ..
echo "and make it accessible to the outside world"
chmod 444 $PROJECT_NAME.apk

echo "Our Dialer app is ready to go"
cp $PROJECT_NAME.apk /sdcard/Download/
echo "caller-ui.apk copied to /sdcard/Download/"

