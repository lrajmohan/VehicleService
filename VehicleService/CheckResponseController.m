//
//  CheckResponseController.m
//  VehicleService
//
//  Created by Vinesh on 4/21/14.
//  Copyright (c) 2014 Vinesh Roshan K. All rights reserved.
//

#import "CheckResponseController.h"
#import "Parse/Parse.h"
#import "responseDetails.h"
@interface CheckResponseController ()

@end

@implementation CheckResponseController
@synthesize  data;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



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
    NSString *cellText;
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"textval!" message:cellText  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    //[alert show];
    UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
    cellText=selectedCell.textLabel.text;
    PFQuery *requestQuery=[PFQuery queryWithClassName:@"ResponseConfirmation"];
    [requestQuery whereKey:@"providername" equalTo:selectedCell.textLabel.text];
    PFUser *user= [PFUser currentUser];
    //[requestQuery whereKey:@"user" equalTo:user.username];
    NSArray *results = [requestQuery findObjects];
    responseDetails *ctrl = [self.storyboard instantiateViewControllerWithIdentifier:@"responseDetails"];
    
    ctrl.string1=selectedCell.textLabel.text;
    ctrl.data=results;
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"textval!" message:cellText  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    //[alert show];
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
    cell.textLabel.text = [pf objectForKey:@"providername"];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //PFObject *pf= [data firstObject];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"textval!" message:[NSString stringWithFormat:@"%d", [data count]]  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];

    // Do any additional setup after loading the view.
}

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"confirmResponseTrans"])
    {
        PFQuery *requestQuery=[PFQuery queryWithClassName:@"appointment"];
        [requestQuery whereKey:@"datetime" greaterThanOrEqualTo:[NSDate date]];
        [requestQuery orderByAscending:@"datetime"];
        [requestQuery selectKeys:@[@"user"]];
        NSArray *results = [requestQuery findObjects];
        responseDetails *destViewController = segue.destinationViewController;
        responseDetails.data= results;
    }
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
