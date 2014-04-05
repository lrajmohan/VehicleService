//
//  myCarViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 3/25/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "finalUIViewController.h"
#import <Parse/Parse.h>
@interface myCarViewController : finalUIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *makeField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *licenseField;
@property (weak, nonatomic) IBOutlet UITextField *mileageField;
@property (weak, nonatomic) IBOutlet UITextField *yearlymileageField;
- (IBAction)submitAction:(id)sender;

@end
