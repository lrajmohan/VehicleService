//
//  ConfirmedData.h
//  VehicleService
//
//  Created by Vinesh on 4/22/14.
//  Copyright (c) 2014 Vinesh Roshan K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmedData : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(weak,nonatomic) NSArray *data;
@end
