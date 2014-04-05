//
//  appointmentIViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/1/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "appointmentIViewController.h"

@interface appointmentIViewController ()

@end

@implementation appointmentIViewController

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
    //setting date to the current date
    NSDate *currentDate = [NSDate date];
    [_datePicker setDate:currentDate animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitDate:(id)sender {
    
 //   NSDate *selectedDate = [_datePicker date];
    
   // NSDateFormatter *outputFormatterDate = [[NSDateFormatter alloc] init];
   // [outputFormatterDate setDateFormat:@"yyyy-MM-dd"]; //24hr time format
   // NSString *dateString = [outputFormatterDate stringFromDate:self.datePicker.date];
    
    NSDateFormatter *outputFormatterTime = [[NSDateFormatter alloc] init];
    [outputFormatterTime setDateFormat:@"yyyy-MM-dd 'at' HH:mm"]; //24hr time format
    NSString *dateString = [outputFormatterTime stringFromDate:self.datePicker.date];
    //[outputFormatter release];
    
  //  NSString *datestring = [[NSString alloc] initWithFormat:@"%@", selectedDate];
    
    NSArray *components = [dateString componentsSeparatedByString:@"at"];
    NSString *date = components[0];
    NSString *time = components[1];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"time is!" message: time  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    
    [alert show];
//}
    
//storing the date and time fields
///- (void) storeDateAndTime
//{

//current user and his vehicle info
PFUser *user = [PFUser currentUser];
    //adding appointment object
PFObject *appointment = [PFObject objectWithClassName: @"appointment"];
[appointment setObject:date forKey:@"date"];
[appointment setObject:time forKey:@"time"];
//saving the user along with the values
appointment[@"user"] = user;
[appointment save];

// Upload car details to Parse
[appointment saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    
    if (!error) {
        // Show success message
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Successfully saved the appointment" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Failure" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
    
}];
}

@end
