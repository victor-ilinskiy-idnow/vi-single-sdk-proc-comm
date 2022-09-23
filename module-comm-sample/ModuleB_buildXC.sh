


xcodebuild archive \
-workspace module-comm-sample.xcworkspace \
-scheme ModuleB \
-destination "generic/platform=iOS" \
-configuration 'Release' \
ARCHS='arm64' \
-archivePath './build/ModuleB.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \

xcodebuild archive \
-workspace module-comm-sample.xcworkspace \
-scheme ModuleB \
-sdk "iphonesimulator" \
-configuration 'Release' \
-arch 'arm64' \
-arch 'x86_64' \
-archivePath './build/ModuleB.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \

xcodebuild -create-xcframework \
-framework './build/ModuleB.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/ModuleB.framework' \
-framework './build/ModuleB.framework-iphoneos.xcarchive/Products/Library/Frameworks/ModuleB.framework' \
-output './IDnowPlatform/Frameworks/ModuleB.xcframework'
