//
//  AppDescriptionViewController.m
//  JsonApplication
//
//  Created by Student on 18/05/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "AppDescriptionViewController.h"

@interface AppDescriptionViewController ()

@end

@implementation AppDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.appLabel.text=self.appName;
    [self.appSummaryTV setText:self.appSummary];
    self.appImageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imgString]]];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
