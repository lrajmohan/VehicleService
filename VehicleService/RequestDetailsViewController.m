//
//  RequestDetailsViewController.m
//  VehicleService
//
//  Created by Vinesh on 4/20/14.
//  Copyright (c) 2014 Vinesh Roshan K. All rights reserved.
//

#import "RequestDetailsViewController.h"
#import "Parse/Parse.h"
@interface RequestDetailsViewController ()

@end

@implementation RequestDetailsViewController
@synthesize  data;
@synthesize  data1;
@synthesize  userLabel;
@synthesize text;
@synthesize zipcodeLabel;
@synthesize cityLabel;
@synthesize stateLabel;
@synthesize phonenumberLabel;
@synthesize appointmentDate;
@synthesize appointmenttime;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    cell.textLabel.text = [pf objectForKey:@"user"];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // self.tableView.dataSource=self;
  //  self.tableView.delegate=self;
    userLabel.text=text;
    PFObject *pf = [data firstObject];
    //getting  appointment time
    PFObject *pf1 = [data1 firstObject];
    cityLabel.text = [pf objectForKey:@"city"];
    stateLabel.text = [pf objectForKey:@"state"];
    zipcodeLabel.text = [pf objectForKey:@"zipCode"];
    phonenumberLabel.text = [pf objectForKey:@"phno"];
    appointmentDate.text = [pf1 objectForKey:@"date"];
    appointmenttime.text = [pf1 objectForKey:@"time"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[NSString stringWithFormat:@"%d", [data count]]  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];
    

    // Do any additional setup after loading the view.
}

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

- (IBAction)AgreetoServe:(id)sender {
    
    PFUser *user = [PFUser currentUser];
    //adding appointment object
    PFObject *ResponseConfirmation = [PFObject objectWithClassName: @"ResponseConfirmation"];
 //   PFObject *pf = [data firstObject];
    //datetime save
 //   PFObject *pf1 = [data1 firstObject];
    [ResponseConfirmation setObject:text forKey:@"user"];
   // [ResponseConfirmation setObject:@"provider1" forKey:@"ServiceProviderName"];
    //[appointment setObject:selectedDate forKey:@"datetime"];
    //saving the user along with the values
    ResponseConfirmation[@"providername"] = user.username;
    ResponseConfirmation[@"providerid"] = user.objectId;
    //datetime save
    ResponseConfirmation[@"date"] = appointmentDate.text;
    ResponseConfirmation[@"time"] = appointmenttime.text;
//    ResponseConfirmation[@"username"] =
    [ResponseConfirmation save];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!!" message:@"saved"  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];
}
@end
