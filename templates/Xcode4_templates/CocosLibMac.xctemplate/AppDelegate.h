//
//  AppDelegate.h
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "cocos2d.h"

@interface ___PROJECTNAMEASIDENTIFIER___AppDelegate : NSObject <NSApplicationDelegate>
{
}

@property (strong) IBOutlet NSWindow	*window;
@property (strong) IBOutlet CCGLView	*glView;

- (IBAction)toggleFullScreen:(id)sender;

@end