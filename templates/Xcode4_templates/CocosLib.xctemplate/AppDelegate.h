//
//  AppDelegate.h
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "CCNavigationViewController.h"

@interface AppDelegate : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
    
}

@property (nonatomic, strong) UIWindow *window;
@property (readonly) CCNavigationViewController *navController;
@property (weak, readonly) CCDirectorIOS *director; // weak ref

@end
