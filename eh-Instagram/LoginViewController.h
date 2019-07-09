//
//  LoginViewController.h
//  eh-Instagram
//
//  Created by unauthorize on 7/9/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)LoginButton:(id)sender;

- (IBAction)SignUpTapButton:(id)sender;
@end

NS_ASSUME_NONNULL_END
