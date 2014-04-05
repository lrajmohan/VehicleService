//
//  appointmentIViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/1/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "finalUIViewController.h"
#import <Parse/Parse.h>
@interface appointmentIViewController : finalUIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)submitDate:(id)sender;


@end
