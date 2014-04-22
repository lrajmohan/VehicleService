//
//  valueTransferViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/13/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "valueTransferViewController.h"
#import <Parse/Parse.h>
@interface valueTransferViewController ()
{
        NSMutableArray *detailsArray1;
    NSMutableArray *demo;
}
@end

@implementation valueTransferViewController
@synthesize pt;
@synthesize scheduleView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //based on the number of objects in array this will be created
    //    return [detailsArray count];
   // return [detailsArray1 count];
     return [pt count];
    
}

//last data structure to
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //populate the tableview with contents of the array
    //    cell.textLabel.text = [detailsArray objectAtIndex:indexPath.row];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    PFObject *pf = [pt objectAtIndex:indexPath.row];
    //cell.textLabel.text = [detailsArray1 objectAtIndex:indexPath.row];
    cell.textLabel.text = [pf objectForKey:@"user"];
    
    return cell;
}
- (void)viewDidLoad
{
    // PFObject *pf = [pt firstObject];
      //  NSLog(@"heere the first obj is:%@", [pf objectForKey:@"user"]);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scheduleView.delegate = self;
    self.scheduleView.dataSource = self;
    
    //testing the table view (put comma at the end to run properly)
    //  demo = [[NSMutableArray alloc]initWithObjects:@"1",@"1", @"2", @"3",  nil]   ;
   // detailsArray1 = [[NSMutableArray alloc] initWithArray:(NSArray *)pt];

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
