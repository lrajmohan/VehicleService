//
//  appointmentUIViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/1/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "appointmentUIViewController.h"

@interface appointmentUIViewController ()

@end

@implementation appointmentUIViewController

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
    //setting date field to current value
    
    NSDate *currentDate = [NSDate date];
    [_dateInputField setDate:currentDate animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submitDTField:(id)sender {

    NSDate *selectedDate = [_dateInputField date];

    NSString *datestring = [[NSString alloc] initWithFormat:@"date is: %@", selectedDate];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"time is!" message: datestring  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];
    
}
@end
