//
//  ProviderRegisterationViewController.m
//  VehicleService
//
//  Created by Rajmohan Loganathan on 4/2/14.
//  Copyright (c) 2014 Rajmohan Loganathan. All rights reserved.
//

#import "ProviderRegisterationViewController.h"

@interface ProviderRegisterationViewController ()

@end

@implementation ProviderRegisterationViewController

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
    self.providerUsername.delegate = self;
    self.providerEmailId.delegate = self;
    self.providerPassword.delegate = self;
    self.providerConfirmPassword.delegate = self;
    self.providerSignInUsername.delegate = self;
    self.providerSignInPassword.delegate = self;
    self.providerCompanyName.delegate = self;
    self.zipcode.delegate = self;
	// Do any additional setup after loading the view.
}

//to keep the user logged in until he logs off
- (void) viewDidAppear:(BOOL)animated
{
    PFUser *provider = [PFUser currentUser];
    
    if (provider.username !=NULL && [provider[@"usertype"]  isEqual: @"provider"]) {
        [self performSegueWithIdentifier:@"providerSignupSuccessful" sender:self];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)providerSignUp:(id)sender {
    [self checkFieldsComplete];
}

- (IBAction)providerAlreadySigned:(id)sender {
    [UIView animateWithDuration:0.02 animations:^{
        _signInView.frame = self.view.frame;
    }];
}

- (void) checkFieldsComplete
{
    if([_providerUsername.text isEqualToString:@""] || [_providerEmailId.text isEqualToString:@""] || [_providerPassword.text isEqualToString:@""] || [_providerConfirmPassword.text isEqualToString:@""] || [_providerCompanyName.text isEqualToString:@""]|| [_zipcode.text isEqualToString:@""])
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
    if (! [_providerPassword.text isEqualToString: _providerConfirmPassword.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Passwords doesnot match" delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self createNewProvider];
    }
}

- (void) createNewProvider
{
    PFUser *provider = [PFUser user];
    provider.username = _providerUsername.text;
    provider.email = _providerEmailId.text;
    provider.password = _providerPassword.text;
    provider[@"companyname"] = _providerCompanyName.text;
    provider[@"zipcode"] = _zipcode.text;
    //usertype to distinguish with user 
    provider[@"usertype"] = @"provider";
    [provider signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            _providerUsername.text = nil;
            _providerPassword.text = nil;
            _providerConfirmPassword.text = nil;
            _providerEmailId.text = nil;
            _providerSignInUsername.text = nil;
            _providerSignInPassword.text = nil;
          
            [self performSegueWithIdentifier:@"providerSignupSuccessful" sender:self];
            //NSLog(@"Welcome to vehicle service app");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" message: _providerUsername.text delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
            [alert show];
            
        }
        else{
            NSLog(@"Sorry!There was an error in registeration");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message: @"Registeration Unsuccessful"  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
            [alert show];
        }
    }];
}



- (IBAction)providerSignIn:(id)sender {
    [PFUser logInWithUsernameInBackground:_providerSignInUsername.text password:_providerSignInPassword.text block:^(PFUser *user, NSError *error) {
        if(!error && [user[@"usertype"]  isEqual: @"provider"])
        {
            NSLog(@"userlog");
            _providerUsername.text = nil;
            _providerPassword.text = nil;
            _providerConfirmPassword.text = nil;
            _providerEmailId.text = nil;
            _providerSignInUsername.text = nil;
            _providerSignInPassword.text = nil;
            
            
            [self performSegueWithIdentifier:@"providerSignupSuccessful" sender:self];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congrats!" message: @"login successful"  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
            [alert show];
        }
        if (error) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message: @"login Unsuccessful"  delegate:nil cancelButtonTitle:@"OKay" otherButtonTitles:nil];
            [alert show];
        }
    }];
    
}

// keyboard return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
