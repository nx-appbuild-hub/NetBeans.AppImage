SOURCE="http://mirror.softaculous.com/apache/netbeans/netbeans/11.2/netbeans-11.2-bin.zip"
DESTINATION="build.zip"
OUTPUT="NetBeans.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	rm -rf AppDir/opt
	mkdir --parents AppDir/opt/application

	unzip $(DESTINATION) -d ./

	cp -r netbeans/* AppDir/opt/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && appimagetool AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -rf netbeans
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
