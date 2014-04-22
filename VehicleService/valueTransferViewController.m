//
//  valueTransferViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/13/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "valueTransferViewController.h"
#import <Parse/Parse.h>
#import "RequestDetailsViewController.h"
@interface valueTransferViewController ()
{
        NSMutableArray *detailsArray1;
    NSMutableArray *demo;
}
@end

@implementation valueTransferViewController
@synthesize data;
@synthesize cellText;
@synthesize scheduleView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"DetailsTrans1"])
    {
        
        PFQuery *requestQuery=[PFQuery queryWithClassName:@"myDetails"];
        [requestQuery whereKey:@"user" equalTo:@"raj"];
        //[requestQuery orderByAscending:@"datetime"];
        //[requestQuery selectKeys:@[@"username"]];
        NSArray *results = [requestQuery findObjects];
        RequestDetailsViewController *destViewController = segue.destinationViewController;
        destViewController.data= results;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"from segue!" message:cellText  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
        [alert show];
    }
}


/*-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [data count];
}
*/

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check Row and Select Next View controller
    //if (indexPath.row == 1)
    //{
        
        // Push Selected View
        //UIViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"RequestDetailsViewController"];
        //[self.navigationController pushViewController:view1 animated:YES];
    //}
    //[requestQuery orderByAscending:@"datetime"];
    //[requestQuery selectKeys:@[@"username"]];
    
    //RequestDetailsViewController *destViewController = segue.destinationViewController;
    //destViewController.data= results;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"textval!" message:cellText  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];
    UITableViewCell *selectedCell=[scheduleView cellForRowAtIndexPath:indexPath];
    cellText=selectedCell.textLabel.text;
    PFQuery *requestQuery=[PFQuery queryWithClassName:@"myDetails"];
    [requestQuery whereKey:@"user" equalTo:selectedCell.textLabel.text];
    NSArray *results = [requestQuery findObjects];
    RequestDetailsViewController *ctrl = [self.storyboard instantiateViewControllerWithIdentifier:@"RequestDetailsViewController"];
    
    ctrl.text=cellText;
    ctrl.data=results;
    
    [self.navigationController pushViewController:ctrl animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //based on the number of objects in array this will be created
    //    return [detailsArray count];
   // return [detailsArray1 count];
     return [data count];
    
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
    PFObject *pf = [data objectAtIndex:indexPath.row];
    //cell.textLabel.text = [detailsArray1 objectAtIndex:indexPath.row];
    cell.textLabel.text = [pf objectForKey:@"username"];
    
    return cell;
}
- (void)viewDidLoad
{
    // PFObject *pf = [pt firstObject];
      //  NSLog(@"heere the first obj is:%@", [pf objectForKey:@"user"]);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //PFObject *ab = [data firstObject];
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[ab objectForKey:@"user"]  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    //[alert show];
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
