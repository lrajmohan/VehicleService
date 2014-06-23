//
//  CheckResponseController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/21/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckResponseController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *data;

@end
