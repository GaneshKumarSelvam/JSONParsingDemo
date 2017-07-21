//
//  ViewController.h
//  JsonApplication
//
//  Created by Student on 17/05/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *countrySC;

@property (weak, nonatomic) IBOutlet UISegmentedControl *categorySC;
- (IBAction)onClickOfProceedButton:(UIButton *)sender;

@property NSURLRequest * getURLReq;
@property NSURLSessionDataTask * sessionDataTask;

@property NSURLSession * urlSession;
@property NSMutableDictionary * serverData;
@property NSMutableArray * titleArray;
@property NSMutableArray * imageArray;
@property NSMutableArray * summaryArray;

@property int i;





//-(NSMutableDictionary *) normallogin;
    
    







@end

