//
//  LoginViewController.m
//  eh-Instagram
//
//  Created by unauthorize on 7/9/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LoginButton:(id)sender {
    [self loginUser];
}

- (IBAction)SignUpTapButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
