//
//  LoadResponse.m
//  VehicleService
//
//  Created by Vinesh on 4/21/14.
//  Copyright (c) 2014 Vinesh Roshan K. All rights reserved.
//

#import "LoadResponse.h"
#import "CheckResponseController.h"
#import "Parse/Parse.h"
@interface LoadResponse ()

@end

@implementation LoadResponse

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"responseTrans"])
    {
        PFUser *user = [PFUser currentUser];
        PFQuery *requestQuery=[PFQuery queryWithClassName:@"ResponseConfirmation"];
        [requestQuery whereKey:@"user" equalTo:user.username];
        //converting to date string and getting values only greater than the current date
        NSDateFormatter *outputFormatterTime = [[NSDateFormatter alloc] init];
        [outputFormatterTime setDateFormat:@"yyyy-MM-dd 'at' HH:mm"]; //24hr time format
        NSString *dateString = [outputFormatterTime stringFromDate:[NSDate date]];
        NSArray *components = [dateString componentsSeparatedByString:@"at"];
        NSString *date = components[0];
        [requestQuery whereKey:@"date" greaterThanOrEqualTo:date];
        
//        [requestQuery orderByAscending:@"datetime"];
        [requestQuery selectKeys:@[@"providername"]];
        NSArray *results = [requestQuery findObjects];
        CheckResponseController *destViewController = segue.destinationViewController;
        destViewController.data= results;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[NSString stringWithFormat:@"%d", [results count]]  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
        [alert show];
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
