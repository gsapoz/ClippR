//
//  FindStylistViewController.m
//  home
//
//  Created by Junsu Kim on 4/24/16.
//  Copyright © 2016 Junsu Kim. All rights reserved.
//

#import "FindStylistViewController.h"

@interface FindStylistViewController ()

@end

@implementation FindStylistViewController{
    RLMResults<Stylists*> *stylists;
    NSMutableArray<NSString*>* names;
    NSMutableArray<NSString*>* biographies;
    NSMutableArray<NSString*>* photos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return stylists.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stylistCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"stylistCell"];
    }
    stylists = [Stylists allObjects];
    Stylists *placeholder;
    for(placeholder in stylists){
        [names addObject:placeholder.name];
    }
    cell.textLabel.text = [names objectAtIndex:indexPath.row];
    //pull data from Realm objects and display it in table cell
    //add photo
    //add followers count the number of rlmarray elements
    //***cannot seem to fetch data
    return cell;
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
