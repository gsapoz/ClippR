//
//  AppDelegate.h
//  home
//
//  Created by Junsu Kim on 4/22/16.
//  Copyright © 2016 Junsu Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

