//
//  ViewController.m
//  JsonApplication
//
//  Created by Student on 17/05/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "ViewController.h"
#import "AppsTableViewController.h"


@interface ViewController ()

@end
AppsTableViewController * appTV;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appTV=[[AppsTableViewController alloc]init];
    self.titleArray=[[NSMutableArray alloc]init];
    appTV.titleOnCellArray=[[NSMutableArray alloc]init];
    appTV.imageOnCellArray=[[NSMutableArray alloc]init];

    self.imageArray=[[NSMutableArray alloc]init];
    self.summaryArray=[[NSMutableArray alloc]init];
    //self.newAppsArrayTitle=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    


    


    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickOfProceedButton:(UIButton *)sender {
        if ((self.countrySC.selectedSegmentIndex==0||self.countrySC.selectedSegmentIndex==1||self.countrySC.selectedSegmentIndex==2)&&(self.categorySC.selectedSegmentIndex==0||self.categorySC.selectedSegmentIndex==1||self.categorySC.selectedSegmentIndex==2)) {
            [self.titleArray removeAllObjects];
            [self.imageArray removeAllObjects];


    if (self.countrySC.selectedSegmentIndex==0&&self.categorySC.selectedSegmentIndex==0) {
        
        self.getURLReq=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/in/rss/topfreeapplications/limit=25/json"]];
        
        
       
        
    }
    else if (self.countrySC.selectedSegmentIndex==0&&self.categorySC.selectedSegmentIndex==1)
        {
                        self.getURLReq=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/in/rss/toppaidapplications/limit=25/json"]];
           

            
        }
    else if (self.countrySC.selectedSegmentIndex==0&&self.categorySC.selectedSegmentIndex==2)
    {
        
        self.getURLReq=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/in/rss/newfreeapplications/limit=25/json"]];
        
        
    }
    else if (self.countrySC.selectedSegmentIndex==1&&self.categorySC.selectedSegmentIndex==0)
    {
       

        self.getURLReq=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/us/rss/topfreeapplications/limit=25/json"]];
        
        
    }
    else if (self.countrySC.selectedSegmentIndex==1&&self.categorySC.selectedSegmentIndex==1)
    {
        
        self.getURLReq=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/us/rss/toppaidapplications/limit=25/json"]];
        
        
    }else if (self.countrySC.selectedSegmentIndex==1&&self.categorySC.selectedSegmentIndex==2)
    {
        
        self.getURLReq=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/us/rss/newfreeapplications/limit=25/json"]];
        
        
    }
    else if (self.countrySC.selectedSegmentIndex==2&&self.categorySC.selectedSegmentIndex==0)
    {
        
        self.getURLReq=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/gb/rss/topfreeapplications/limit=25/json"]];
        
        
    }
    else if (self.countrySC.selectedSegmentIndex==2&&self.categorySC.selectedSegmentIndex==1)
    {
       

        self.getURLReq=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/gb/rss/toppaidapplications/limit=25/json"]];
        
        
    }
    else if (self.countrySC.selectedSegmentIndex==2&&self.categorySC.selectedSegmentIndex==2)
    {
        

        self.getURLReq=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/gb/rss/newfreeapplications/limit=25/json"]];
        
        
    }
    //[appTV.tableView reloadData];

    
    self.urlSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
   
    self.sessionDataTask=[self.urlSession dataTaskWithRequest:self.getURLReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        self.serverData=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        if ((self.countrySC.selectedSegmentIndex==0&&self.categorySC.selectedSegmentIndex==2)||(self.countrySC.selectedSegmentIndex==1&&self.categorySC.selectedSegmentIndex==2)||(self.countrySC.selectedSegmentIndex==2&&self.categorySC.selectedSegmentIndex==2)) {
            [self.summaryArray removeAllObjects];

            for(self.i=0;self.i<=24 ;self.i++)
            {
                [self.titleArray addObject:[[[[[self.serverData objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:self.i]objectForKey:@"im:name"]objectForKey:@"label"]];
                [self.imageArray addObject:[[[[[[self.serverData objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:self.i]objectForKey:@"im:image"]objectAtIndex:0] objectForKey:@"label"]];
                [self.summaryArray addObject:[[[[[self.serverData objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:self.i]objectForKey:@"title"]objectForKey:@"label"]];
                
            }
            

        }
        else{
            [self.summaryArray removeAllObjects];

        for( int y=0;y<=24 ;y++)
        {

            [self.titleArray addObject:[[[[[self.serverData objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:y]objectForKey:@"im:name"]objectForKey:@"label"]];
            [self.imageArray addObject:[[[[[[self.serverData objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:y]objectForKey:@"im:image"]objectAtIndex:0] objectForKey:@"label"]];
            [self.summaryArray addObject:[[[[[self.serverData objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:y]objectForKey:@"summary"]objectForKey:@"label"]];
            
        }
       

        }
        
       
       
        
        
        
        [appTV.tableView reloadData];
    }];
        [self.sessionDataTask resume];

    
    }
    else{
        UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"Error" message:@"Select Both Segments" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    

  

    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     appTV = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"hello"]) {
       
        appTV.titleOnCellArray=self.titleArray;
        appTV.imageOnCellArray=self.imageArray;
        appTV.summaryData=self.summaryArray;
        //appTV.newAppsSummaryArray=self.newAppsArrayTitle;
        
    }
}

@end
