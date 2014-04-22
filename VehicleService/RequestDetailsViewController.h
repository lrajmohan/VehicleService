//
//  RequestDetailsViewController.h
//  VehicleService
//
//  Created by Vinesh on 4/20/14.
//  Copyright (c) 2014 Vinesh Roshan K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestDetailsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (weak,nonatomic) NSArray *data;
@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipcodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *phonenumberLabel;
@property (strong, nonatomic) NSString * text;
- (IBAction)AgreetoServe:(id)sender;

@end
