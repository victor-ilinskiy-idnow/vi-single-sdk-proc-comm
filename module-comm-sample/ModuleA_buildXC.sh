


xcodebuild archive \
-workspace module-comm-sample.xcworkspace \
-scheme ModuleA \
-destination "generic/platform=iOS" \
-configuration 'Release' \
ARCHS='arm64' \
-archivePath './build/ModuleA.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \

xcodebuild archive \
-workspace module-comm-sample.xcworkspace \
-scheme ModuleA \
-sdk "iphonesimulator" \
-configuration 'Release' \
-arch 'arm64' \
-arch 'x86_64' \
-archivePath './build/ModuleA.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \

xcodebuild -create-xcframework \
-framework './build/ModuleA.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/ModuleA.framework' \
-framework './build/ModuleA.framework-iphoneos.xcarchive/Products/Library/Frameworks/ModuleA.framework' \
-output './IDnowPlatform/Frameworks/ModuleA.xcframework'
