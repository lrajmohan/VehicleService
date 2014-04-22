//
//  appointmentIViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/1/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "appointmentIViewController.h"

@interface appointmentIViewController ()
{
        NSArray* zipcodeArray;
}

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
    
    NSDate *selectedDate = [_datePicker date];
    
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
    [appointment setObject:selectedDate forKey:@"datetime"];
//saving the user along with the values
    appointment[@"username"] = user.username;
    appointment[@"userid"] = user.objectId;
    //  [query orderByAscending:@"datetime"];
    PFQuery *query = [PFQuery queryWithClassName:@"myDetails"];
    [query whereKey:@"user" equalTo:user.username];
   // [query selectKeys:@[@"zipcode"]];
    //getting the object and converting to string
    PFObject* zipcodeObj = [query getFirstObject];
    NSString *zipcodeString = zipcodeObj[@"zipCode"];
    appointment[@"zipcode"] = zipcodeString;
    // appointment[@"zipcode"] = zipcode;
    [appointment save];
    /*
    //zipcode retreival
    PFQuery *query = [PFQuery queryWithClassName:@"myDetails"];
    [query whereKey:@"user" equalTo:user.objectId];
        [query selectKeys:@[@"zipcode"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
 zipcodeArray = [query findObjects];
                  //  appointment[@"zipcode"] = zipcodeArray[0];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        for (PFObject *object1 in zipcodeArray) {
            appointment[@"username"] = user.username;
            appointment[@"userid"] = user.objectId;
            appointment[@"zipcode"] = object1;
 NSLog(@"Successfully retrieved %d scores.", zipcodeArray.count);
            
        }
         [appointment save];
        
    }];  */
    


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
