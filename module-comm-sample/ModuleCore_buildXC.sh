


xcodebuild archive \
-workspace module-comm-sample.xcworkspace \
-scheme ModuleCore \
-destination "generic/platform=iOS" \
-configuration 'Release' \
ARCHS='arm64' \
-archivePath './build/ModuleCore.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \

xcodebuild archive \
-workspace module-comm-sample.xcworkspace \
-scheme ModuleCore \
-sdk "iphonesimulator" \
-configuration 'Release' \
-arch 'arm64' \
-arch 'x86_64' \
-archivePath './build/ModuleCore.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \

xcodebuild -create-xcframework \
-framework './build/ModuleCore.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/ModuleCore.framework' \
-framework './build/ModuleCore.framework-iphoneos.xcarchive/Products/Library/Frameworks/ModuleCore.framework' \
-output './IDnowPlatform/Frameworks/ModuleCore.xcframework'
