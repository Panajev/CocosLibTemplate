CocosLibTemplate
================

Xcode 4 template already set to use the CocosLib, CocosTools, and Utilities static libraries in an Cocos2D + Box2D project. 
CocosTools and Utilities have been converted to ARC while CocosLib (CocosLib = Cocos2D + Box2D in a static library) is compiled with ARC disabled, but Cocos2D authors have already prepared the header files so that Cocos2D plays nice with projects that have been ARC enabled and want to use Cocos2D.

Shared Libraries
----------------

This template builds upon these static libraries:

CocosLib: https://github.com/Panajev/CocosLib

CocosTools: https://github.com/Panajev/CocosTools

Utilities: https://github.com/Panajev/Utilities

PRKit: https://github.com/Panajev/PRKit

SneakyInput: https://github.com/Panajev/SneakyInput

CCItemsScroller (not used in the template): https://github.com/Panajev/CCItemsScroller


HOWTO Install
-------------

After installing the official Cocos2D templates, which this template references, please execute the following scripts in order:

buildSharedLibs.sh     (Downloads the shared libraries from GitHub, builds them, and installs them at ~/Programming/SharedLibs)

install-templates.sh	(Installs the CocosLib template, it behaves pretty much like the script offered by Cocos2D although using the -f option will not erase the original Cocos2D templates, but will only force the re-install of the CocosLib template)
