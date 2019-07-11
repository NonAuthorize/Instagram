//
//  ViewController.m
//  eh-Instagram
//
//  Created by unauthorize on 7/8/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import "SignUpViewController.h"
#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)registerUser {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sign Up Error"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    if ([self.usernameField.text isEqual:@""] || [self.passwordField.text isEqual:@""] || [self.emailField.text isEqual:@""]) {
        // create a cancel action
        alert.message = @"Username/Email/Password is empty";
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle cancel response here. Doing nothing will dismiss the view.
                                                             }];
        // add the cancel action to the alertController
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    } else{
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    newUser.email = self.emailField.text;
    newUser.password = self.passwordField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            alert.message = ((void)("Error: %@"), error.localizedDescription);
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     // handle cancel response here. Doing nothing will dismiss the view.
                                                                 }];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:^ {
            }];
        } else {
            NSLog(@"User registered successfully");
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            // manually segue to logged in view
        }
    }];
    }
}

- (IBAction)CreateAccountButton:(id)sender {
    [self registerUser];
}

- (IBAction)SignInButtpn:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
