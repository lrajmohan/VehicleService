//
//  responseDetails.m
//  VehicleService
//
//  Created by Vinesh on 4/21/14.
//  Copyright (c) 2014 Vinesh Roshan K. All rights reserved.
//

#import "responseDetails.h"
#import "Parse/Parse.h"
@interface responseDetails ()

@end

@implementation responseDetails
@synthesize data;
@synthesize providerLabel;
@synthesize otherDetailsLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFObject *pf = [data firstObject];
    providerLabel.text=[pf objectForKey:@"providername"];
    otherDetailsLabel.text=[pf objectForKey:@"user"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"inside" message:[pf objectForKey:@"providername"]  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
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


- (IBAction)yes:(id)sender {
    
    PFUser *user = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"ResponseConfirmation"];
    [query whereKey:@"user" equalTo:user.username];
    // [query selectKeys:@[@"zipcode"]];
    //getting the object and converting to string
    PFObject* zipcodeObj = [query getFirstObject];
    NSString *zipcodeString = zipcodeObj.objectId;
    NSLog(@"zipcodeis%@", zipcodeString);
    
    [query getObjectInBackgroundWithId:zipcodeString block:^(PFObject *responseOfUser, NSError *error) {
   // PFObject *responseOfUser = [PFObject objectWithClassName: @"ResponseConfirmation"];
     //saving the user's confirmation
     responseOfUser[@"status"] = @"confirm";
        [responseOfUser saveInBackground];
    }];
}

- (IBAction)no:(id)sender {
    PFObject *responseOfUser = [PFObject objectWithClassName: @"ResponseConfirmation"];
    //saving the user's confirmation
    responseOfUser[@"status"] = @"decline"; }
@end
