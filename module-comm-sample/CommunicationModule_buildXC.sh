


xcodebuild archive \
-workspace module-comm-sample.xcworkspace \
-scheme CommunicationModule \
-destination "generic/platform=iOS" \
-configuration 'Release' \
ARCHS='arm64' \
-archivePath './build/CommunicationModule.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \

xcodebuild archive \
-workspace module-comm-sample.xcworkspace \
-scheme CommunicationModule \
-sdk "iphonesimulator" \
-configuration 'Release' \
-arch 'arm64' \
-arch 'x86_64' \
-archivePath './build/CommunicationModule.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \

xcodebuild -create-xcframework \
-framework './build/CommunicationModule.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/CommunicationModule.framework' \
-framework './build/CommunicationModule.framework-iphoneos.xcarchive/Products/Library/Frameworks/CommunicationModule.framework' \
-output './IDnowPlatform/Frameworks/CommunicationModule.xcframework'
