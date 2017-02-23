//
//  AppDelegate.m
//  home
//
//  Created by Junsu Kim on 4/22/16.
//  Copyright © 2016 Junsu Kim. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSError* configureError;
    [[GGLContext sharedInstance] configureWithError:&configureError];
    NSAssert(!configureError,@"Error configuring Google services: %@",configureError);
    [GIDSignIn sharedInstance].delegate = self; //다른 delegate이나 view로 assign되도록 재설정해야함.
    return YES;
}

//start open url
-(BOOL)application:(UIApplication*)application
           openURL:(NSURL*)url
 sourceApplication:(NSString*)sourceApplication
        annotation:(id)annotation{
    return [[GIDSignIn sharedInstance] handleURL:url sourceApplication:sourceApplication annotation:annotation];
}
//end open url

//start signin_handler
-(void)signIn:(GIDSignIn*)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error{
    //***update this imformation for later use in local data.
    NSString* userId=user.userID;
    NSString* idToken=user.authentication.idToken;
    NSString* name=user.profile.name;
    NSString* email=user.profile.email;
    //***delete the below line.
    NSDictionary* statusText=@{@"statusText":[NSString stringWithFormat:@"Signed in user: %@",name]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ToggleAuthUINotification" object:nil userInfo:statusText];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
