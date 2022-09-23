rm -rf ./build
rm -rf ./IDnowPlatform/Frameworks

sh ModuleCore_buildXC.sh
sh ModuleA_buildXC.sh
sh ModuleB_buildXC.sh
sh CommunicationModule_buildXC.sh