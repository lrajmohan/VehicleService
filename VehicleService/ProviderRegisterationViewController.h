//
//  ProviderRegisterationViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/2/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "finalUIViewController.h"

@interface ProviderRegisterationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *providerUsername;
@property (weak, nonatomic) IBOutlet UITextField *providerEmailId;
@property (weak, nonatomic) IBOutlet UITextField *providerPassword;
@property (weak, nonatomic) IBOutlet UITextField *providerConfirmPassword;

- (IBAction)providerSignUp:(id)sender;
@end
