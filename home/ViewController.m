//
//  ViewController.m
//  home
//
//  Created by Junsu Kim on 4/22/16.
//  Copyright © 2016 Junsu Kim. All rights reserved.
//

#import "ViewController.h"
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = CGRectMake(30, 150, 260, 50);
    HTPressableButton *followed = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    followed.buttonColor = [UIColor ht_grapeFruitColor];
    followed.shadowColor = [UIColor ht_grapeFruitDarkColor];
    [followed setTitle:@"Followed" forState:UIControlStateNormal];
    [self.view addSubview:followed];
    [followed addTarget:self action:@selector(goToFollowed:) forControlEvents:UIControlEventTouchUpInside];
    
    frame = CGRectMake(30, 230, 260, 50);
    HTPressableButton *schedule = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    [schedule setTitle:@"Make an Appointment" forState:UIControlStateNormal];
    [self.view addSubview:schedule];
    [schedule addTarget:self action:@selector(goToSchedule:) forControlEvents:UIControlEventTouchUpInside];

    frame = CGRectMake(30, 310, 260, 50);
    HTPressableButton *FindStylist = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    FindStylist.buttonColor = [UIColor ht_turquoiseColor];
    FindStylist.shadowColor = [UIColor ht_greenSeaColor];
    [FindStylist setTitle:@"Find Another Stylist!" forState:UIControlStateNormal];
    [self.view addSubview:FindStylist];
    [FindStylist addTarget:self action:@selector(goToStylist:) forControlEvents:UIControlEventTouchUpInside];
    
    frame = CGRectMake(30, 390, 260, 50);
    HTPressableButton *MyProfile = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    MyProfile.buttonColor = [UIColor ht_concreteColor];
    MyProfile.shadowColor = [UIColor ht_asbestosColor];
    [MyProfile setTitle:@"My Profile" forState:UIControlStateNormal];
    [self.view addSubview:MyProfile];
    [MyProfile addTarget:self action:@selector(goToProfile:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToFollowed:(id)sender{
    [self performSegueWithIdentifier:@"Followed" sender:sender];
}


-(void)goToSchedule:(id)sender{
    [self performSegueWithIdentifier:@"Schedule" sender:sender];
}

-(void)goToStylist:(id)sender{
    [self performSegueWithIdentifier:@"Stylist" sender:sender];
}

-(void)goToProfile:(id)sender{
    [self performSegueWithIdentifier:@"Profile" sender:sender];
}

@end
