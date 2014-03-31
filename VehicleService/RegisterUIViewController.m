//
//  RegisterUIViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 3/23/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "RegisterUIViewController.h"

@interface RegisterUIViewController ()

@end

@implementation RegisterUIViewController


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
    //keyboard return
    self.usernameField.delegate = self;
    self.emailField.delegate = self;
    self.passwordField.delegate = self;
    self.confirmpasswordField.delegate = self;
    self.loginUsernameField.delegate = self;
    self.loginPasswordField.delegate = self;
    
	// Do any additional setup after loading the view.
}

//to keep the user logged in until he logs off
- (void) viewDidAppear:(BOOL)animated
{
        PFUser *newUser = [PFUser user];
    
    if (newUser.username !=NULL) {
        [self performSegueWithIdentifier:@"signupSuccessful" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SubmitButton:(id)sender {
            [self checkFieldsComplete];
}

- (IBAction)alreadyRegistered:(id)sender {
    [UIView animateWithDuration:0.02 animations:^{
        _loginViewOutlet.frame = self.view.frame;
    }];
}

- (void) checkFieldsComplete
{
    if([_usernameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_confirmpasswordField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Please enter all the fields" delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
        [alert show];
    }
    else{
        [self checkPasswordsMatch];
    }
}
- (void) checkPasswordsMatch
{
    if (! [_passwordField.text isEqualToString: _confirmpasswordField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Passwords doesnot match" delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self createNewUser];
    }
}

- (void) createNewUser
{
    PFUser *newUser = [PFUser user];
    newUser.username = _usernameField.text;
    newUser.email = _emailField.text;
    newUser.password = _passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self performSegueWithIdentifier:@"signupSuccessful" sender:self];
            //NSLog(@"Welcome to vehicle service app");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" message: _usernameField.text delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
            [alert show];
            
        }
        else{
            NSLog(@"Sorry!There was an error in registeration");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message: @"Registeration Unsuccessful"  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
            [alert show];
            }
    }];
 }

// keyboard return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
- (IBAction)loginbuttonField:(id)sender {
    [PFUser logInWithUsernameInBackground:_loginUsernameField.text password:_loginPasswordField.text block:^(PFUser *user, NSError *error) {
        if(!error)
        {
            NSLog(@"userlog");
            [self performSegueWithIdentifier:@"signupSuccessful" sender:self];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congrats!" message: @"login successful"  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
            [alert show];
        }
        if (error) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message: @"login Unsuccessful"  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
            [alert show];
        }
    }];
}
@end
