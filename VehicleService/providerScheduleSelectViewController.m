//
//  providerScheduleSelectViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/5/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "providerScheduleSelectViewController.h"

@interface providerScheduleSelectViewController ()

@end

@implementation providerScheduleSelectViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)get:(id)sender {
    [self dothis];
}

- (void)dothis
{
    //get the schedules from current time + 4 hrs(minimum time to pickup)
    PFQuery *query = [PFQuery queryWithClassName:@"appointment"];
    [query whereKey:@"datetime" greaterThanOrEqualTo:[NSDate date]];
    [query orderByAscending:@"datetime"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //  find succeeded objects
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                PFObject *post = object[@"user"];
                NSLog(@"%@", post);
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message: @"will do it "  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];
}
@end
