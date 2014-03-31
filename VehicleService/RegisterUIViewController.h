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
@property (weak, nonatomic) IBOutlet UIView *loginViewOutlet;

- (IBAction)SubmitButton:(id)sender;
- (IBAction)alreadyRegistered:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *loginUsernameField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordField;
- (IBAction)loginbuttonField:(id)sender;

@end
