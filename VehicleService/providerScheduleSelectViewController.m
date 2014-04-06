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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message: @"will do it "  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];
}
@end
