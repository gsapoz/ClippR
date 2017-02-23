//
//  LogInViewController.m
//  home
//
//  Created by Junsu Kim on 4/26/16.
//  Copyright © 2016 Junsu Kim. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate=self;
    [[GIDSignIn sharedInstance] signInSilently];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveToggleAuthUINotification:) name:@"ToggleAuthUiNotification" object:nil];
    [self toggleAuthUI];
    [self statusText].text=@"Signed in";
    // Do any additional setup after loading the view, typically from a nib.
    [_signInButton addTarget:self action:@selector(goToHome:) forControlEvents:UIControlEventTouchUpInside];
}

//start toggle auth
-(void)toggleAuthUI{
    if([GIDSignIn sharedInstance].currentUser.authentication==nil){
        [self statusText].text=@"Sign in";
        self.signInButton.hidden=NO;
    }else{
        self.signInButton.hidden=YES;
    }
}
//end toggle auth

-(void)signIn:(GIDSignIn*)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error{
    //***update this information for later use in local data.
    NSString* userId=user.userID;
    NSString* idToken=user.authentication.idToken;
    NSString* name=user.profile.name;
    NSString* email=user.profile.email;
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                      annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:sourceApplication
                                      annotation:annotation];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToHome:(id)sender{
    [self performSegueWithIdentifier:@"Home" sender:sender];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
