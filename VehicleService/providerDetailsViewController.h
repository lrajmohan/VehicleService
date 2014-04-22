//
//  providerDetailsViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/21/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface providerDetailsViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *streetAdd1;
@property (weak, nonatomic) IBOutlet UITextField *streetAdd2;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;
@property (weak, nonatomic) IBOutlet UITextField *phoneNo;

- (IBAction)Submit:(id)sender;
@end
