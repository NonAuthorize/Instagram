//
//  ViewController.h
//  eh-Instagram
//
//  Created by unauthorize on 7/8/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)CreateAccountButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *SignInTapButton;
@end

