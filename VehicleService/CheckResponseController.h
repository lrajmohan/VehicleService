//
//  CheckResponseController.h
//  VehicleService
//
//  Created by Vinesh on 4/21/14.
//  Copyright (c) 2014 Vinesh Roshan K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckResponseController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *data;

@end
