//
//  RegisterUIViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 3/23/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "finalUIViewController.h"
#import <Parse/Parse.h>

@interface RegisterUIViewController : finalUIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmpasswordField;

- (IBAction)SubmitButton:(id)sender;

@end
