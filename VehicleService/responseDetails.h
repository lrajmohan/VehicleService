//
//  responseDetails.h
//  VehicleService
//
//  Created by Vinesh on 4/21/14.
//  Copyright (c) 2014 Vinesh Roshan K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface responseDetails : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *providerLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherDetailsLabel;
@property (weak,nonatomic) NSString *string1;
@property (weak,nonatomic) NSString *string2;
@property (weak,nonatomic) NSArray *data;
@end
