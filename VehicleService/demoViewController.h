//
//  demoViewController.h
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/20/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface demoViewController : UIViewController
{
    NSString *demoArray1;
    NSString *demoArray2;
}

@property (weak, nonatomic) IBOutlet UILabel *labelforUserInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelforUserInfo_zip;
@property(strong,nonatomic)NSString *demoArray1;
@property(strong,nonatomic)NSString *demoArray2;
@end
