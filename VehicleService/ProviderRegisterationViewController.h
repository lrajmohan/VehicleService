//
//  ProviderRegisterationViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/2/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "finalUIViewController.h"

@interface ProviderRegisterationViewController : UIViewController<UITextFieldDelegate>
//sign up
@property (weak, nonatomic) IBOutlet UITextField *providerUsername;
@property (weak, nonatomic) IBOutlet UITextField *providerEmailId;
@property (weak, nonatomic) IBOutlet UITextField *providerPassword;
@property (weak, nonatomic) IBOutlet UITextField *providerConfirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *providerCompanyName;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;



- (IBAction)providerSignUp:(id)sender;
- (IBAction)providerAlreadySigned:(id)sender;

//login view

@property (weak, nonatomic) IBOutlet UIView *signInView;

//sign in
@property (weak, nonatomic) IBOutlet UITextField *providerSignInUsername;
@property (weak, nonatomic) IBOutlet UITextField *providerSignInPassword;

- (IBAction)providerSignIn:(id)sender;

@end
