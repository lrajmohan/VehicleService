//
//  appointmentUIViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/1/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "finalUIViewController.h"

@interface appointmentUIViewController : finalUIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *dateInputField;
- (IBAction)submitDTField:(id)sender;


@end
