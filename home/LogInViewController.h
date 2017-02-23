//
//  LogInViewController.h
//  home
//
//  Created by Junsu Kim on 4/26/16.
//  Copyright © 2016 Junsu Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

@interface LogInViewController : UIViewController <GIDSignInUIDelegate>
- (void)goToHome:(id)sender;
@property (weak,nonatomic) IBOutlet GIDSignInButton *signInButton;
@property (weak,nonatomic) IBOutlet UILabel *statusText;

@end
