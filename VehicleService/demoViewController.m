//
//  demoViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/20/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "demoViewController.h"

@interface demoViewController ()

@end

@implementation demoViewController
@synthesize demoArray1;
@synthesize demoArray2;
@synthesize labelforUserInfo;
@synthesize labelforUserInfo_zip;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //label values
    self.labelforUserInfo.text = demoArray1;
    self.labelforUserInfo_zip.text = demoArray2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
