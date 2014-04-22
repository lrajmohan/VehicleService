//
//  providerScheduleSelectViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/5/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "providerScheduleSelectViewController.h"
#import "valueTransferViewController.h"

@interface providerScheduleSelectViewController ()
{
    //create arrays to store values
    NSMutableArray *detailsArray;
    NSArray *resultingUser;
 //   NSMutableArray *detailsArray1;
 
}
@end

@implementation providerScheduleSelectViewController

//get that table view
//@synthesize ScheduleTableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



//to get the schedule

- (IBAction)get:(id)sender {
    [self getTheSchedule];
    
 //   [UIView animateWithDuration:0.02 animations:^{
  //      ScheduleTableView.frame = self.view.frame;
 //   }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Reqtrans"])
    {
        //comparing zipcodes
        //getting provider zipcode
        PFUser *user = [PFUser currentUser];
        PFQuery *query = [PFQuery queryWithClassName:@"myDetails"];
        [query whereKey:@"user" equalTo:user.objectId];
        // [query selectKeys:@[@"zipcode"]];
        //getting the object and converting to string
        PFObject* zipcodeObj = [query getFirstObject];
        NSString *zipcodeString = zipcodeObj[@"zipCode"];
        NSLog(@"zipcodeis%@", zipcodeString);
        
        //comparing zipcodes and taking only the matching query
        PFQuery *requestQuery=[PFQuery queryWithClassName:@"appointment"];
        [requestQuery whereKey:@"datetime" greaterThanOrEqualTo:[NSDate date]];
        [requestQuery whereKey:@"zipcode" equalTo:zipcodeString];
        [requestQuery orderByAscending:@"datetime"];
        [requestQuery selectKeys:@[@"username"] ];
        [requestQuery selectKeys:@[@"userId"] ];
        NSArray *results = [requestQuery findObjects];
        valueTransferViewController *destViewController = segue.destinationViewController;
        destViewController.data= results;
    }
}


- (void)getTheSchedule
{
    //get the schedules from current time + 4 hrs(minimum time to pickup)
    PFQuery *query = [PFQuery queryWithClassName:@"appointment"];
    [query whereKey:@"datetime" greaterThanOrEqualTo:[NSDate date]];
    [query orderByAscending:@"datetime"];
    [query selectKeys:@[@"user"]];
     resultingUser = [query findObjects];
   /*[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
        if (!error) {
            //  find succeeded objects
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            
            //user stored as array of names
          //  detailsArray = [objects valueForKey:@"user"];
            detailsArray = [[NSMutableArray alloc]initWithObjects:[objects valueForKey:@"user"],  nil]   ;
         //  detailsArray = [[NSMutableArray alloc]initWithObjects:@"abc",@"2",  nil]   ;
            // Do something with the found objects
            for (PFObject *object in objects) {
                PFObject *post = object[@"user"];
                
                NSLog(@"%@", detailsArray);
                NSLog(@"%@", post);
           //     NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
        NSLog(@"%@", detailsArray);
             NSLog(@"it is %lu", (unsigned long)[detailsArray count]);
    }]; */
    
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message: @"will do it "  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
    [alert show];
}

//get the
/*-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //based on the number of objects in array this will be created
//    return [detailsArray count];
      return [detailsArray1 count];
   
}

//last data structure to
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    //populate the tableview with contents of the array
//    cell.textLabel.text = [detailsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [detailsArray1 objectAtIndex:indexPath.row];
    
    return cell;
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // These will let us to use delegate methods
   // self.ScheduleTableView.delegate = self;
   // self.ScheduleTableView.dataSource = self;
    
    //testing the table view (put comma at the end to run properly)
 //  detailsArray = [[NSMutableArray alloc]initWithObjects:@"1",@"1", @"2", @"3",  nil]   ;
  //  detailsArray1 = [[NSMutableArray alloc] initWithArray:(NSArray *)detailsArray];
    
   // detailsArray1 = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3",  nil]   ;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutProvider:(id)sender {
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)passValue:(id)sender {
   // NSArray *ptr=[[NSArray alloc] initWithObjects:@"1",@"2", nil];
    
 //   NSArray *ptr = detailsArray;
    // NSLog(@"here in ptr:%@", ptr);
   /* valueTransferViewController *contr =[[valueTransferViewController alloc] initWithNibName:@"valueTransferViewController" bundle:nil];
  //  contr.pt=ptr;
      contr.pt=[[NSArray alloc]initWithArray:resultingUser];
    [self.view addSubview:contr.view];
     NSLog(@"here in ptr:%@", resultingUser);*/
}
@end
