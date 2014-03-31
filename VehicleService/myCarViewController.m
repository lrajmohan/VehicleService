//
//  myCarViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 3/25/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "myCarViewController.h"

@interface myCarViewController ()

@end

@implementation myCarViewController

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
    self.makeField.delegate = self;
    self.modelField.delegate = self;
    self.licenseField.delegate = self;
    self.yearField.delegate = self;
    self.yearlymileageField.delegate = self;
    self.mileageField.delegate = self;
	// Do any additional setup after loading the view.
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitAction:(id)sender {
    [self checkFieldsComplete];
}

- (void) checkFieldsComplete
{
    if([_modelField.text isEqualToString:@""] || [_makeField.text isEqualToString:@""] || [_mileageField.text isEqualToString:@""] || [_yearlymileageField.text isEqualToString:@""]  || [_licenseField.text isEqualToString:@""] || [_yearField.text isEqualToString:@""]  )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Please enter all the fields" delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
        [alert show];
    }
    else{
        [self createvehicle];
    }
}

- (void) createvehicle
{
    PFObject *car = [PFObject objectWithClassName: @"car"];
    [car setObject:_modelField.text forKey:@"name"];
    [car setObject:_makeField.text forKey:@"make"];
    [car setObject:_licenseField.text forKey:@"licenseno"];
    [car setObject:_yearField.text forKey:@"yearofmanf"];
    [car setObject:_yearlymileageField.text forKey:@"yearlymileage"];
    [car setObject:_mileageField.text forKey:@"mileage"];


 
    
    // Upload car details to Parse
    [car saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {
            // Show success message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Successfully saved the car details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
