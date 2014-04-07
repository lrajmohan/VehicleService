//
//  providerScheduleSelectViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/5/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "providerScheduleSelectViewController.h"

@interface providerScheduleSelectViewController ()
{
    //create arrays to store values
    NSMutableArray *detailsArray;
    
}
@end

@implementation providerScheduleSelectViewController

//get that table view
@synthesize ScheduleTableView;
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
    // These will let us to use delegate methods
    self.ScheduleTableView.delegate = self;
    self.ScheduleTableView.dataSource = self;
    
    //testing the table view (put comma at the end to run properly)
    detailsArray = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3",  nil]   ;

}


//to get the schedule

- (IBAction)get:(id)sender {
    [self getTheSchedule];
    
    [UIView animateWithDuration:0.02 animations:^{
        ScheduleTableView.frame = self.view.frame;
    }];
}

- (void)getTheSchedule
{
    //get the schedules from current time + 4 hrs(minimum time to pickup)
    PFQuery *query = [PFQuery queryWithClassName:@"appointment"];
    [query whereKey:@"datetime" greaterThanOrEqualTo:[NSDate date]];
    [query orderByAscending:@"datetime"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //  find succeeded objects
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            
            //user stored as array of names
          //  detailsArray = [objects valueForKey:@"user"];
            //detailsArray = [[NSMutableArray alloc]initWithObjects:[objects valueForKey:@"user"],  nil]   ;
    //       detailsArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",  nil]   ;
            // Do something with the found objects
            for (PFObject *object in objects) {
                PFObject *post = object[@"user"];
                
              //  NSLog(@"%@", detailsArray);
                NSLog(@"%@", post);
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        NSLog(@"%@", detailsArray);
             NSLog(@"it is %lu", (unsigned long)[detailsArray count]);
    }];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message: @"will do it "  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];
}

//get the
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //based on the number of objects in array this will be created
    return [detailsArray count];
   
}

//last data structure to
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    //populate the tableview with contents of the array
    cell.textLabel.text = [detailsArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
