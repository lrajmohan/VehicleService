//
//  valueTransferViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/13/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface valueTransferViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

//array for storing values passed
@property (strong, nonatomic) NSArray *pt;

//table view
@property (weak, nonatomic) IBOutlet UITableView *scheduleView;

@end
