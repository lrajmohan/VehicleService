//
//  finalUIViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 3/20/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "finalUIViewController.h"


@interface finalUIViewController ()

@end

@implementation finalUIViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Logout:(id)sender {
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
