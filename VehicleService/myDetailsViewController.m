//
//  myDetailsViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/15/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "myDetailsViewController.h"
#import <Parse/Parse.h>
@interface myDetailsViewController ()

@end

@implementation myDetailsViewController

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
    self.streetAdd1.delegate = self;
    self.streetAdd2.delegate = self;
    self.city.delegate = self;
    self.state.delegate = self;
    self.zipcode.delegate = self;
    self.phoneNo.delegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Submit:(id)sender {
    [self checkFieldsComplete];
}


- (void) checkFieldsComplete
{
    if([_streetAdd1.text isEqualToString:@""] ||  [_city.text isEqualToString:@""] || [_state.text isEqualToString:@""]  || [_zipcode.text isEqualToString:@""] || [_phoneNo.text isEqualToString:@""]  )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Please enter all the fields" delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
        [alert show];
    }
    else{
        [self myDetails];
    }
}

- (void) myDetails
{
    //current user and his vehicle info
    PFUser *user = [PFUser currentUser];
    PFObject *myDetails = [PFObject objectWithClassName: @"myDetails"];
    [myDetails setObject:_streetAdd1.text forKey:@"streetAdd1"];
    [myDetails setObject:_streetAdd2.text forKey:@"streetAdd2"];
    [myDetails setObject:_city.text forKey:@"city"];
    [myDetails setObject:_state.text forKey:@"state"];
    [myDetails setObject:_zipcode.text forKey:@"zipCode"];
    [myDetails setObject:_phoneNo.text forKey:@"phno"];
    //saving the user along with the values
    myDetails[@"user"] = user.username;
    myDetails[@"usertype"] = @"user";
    [myDetails save];
    
    
    
    // Upload car details to Parse
    [myDetails saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {
            // Show success message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Successfully saved the details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            // Notify table view to reload the car details from Parse cloud
            // [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTable" object:self];
            
            // Dismiss the controller
            // [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Failure" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
    }];
}
// keyboard return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
