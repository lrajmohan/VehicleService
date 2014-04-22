//
//  providerScheduleSelectViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/5/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface providerScheduleSelectViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
//get button
- (IBAction)get:(id)sender;
//table view

//@property (strong, nonatomic) IBOutlet UITableView *ScheduleTableView;

//@property (weak, nonatomic) IBOutlet UITableView *ScheduleTableView;

- (IBAction)logoutProvider:(id)sender;

- (IBAction)passValue:(id)sender;


@end


