//
//  HomePageViewController.m
//  eh-Instagram
//
//  Created by unauthorize on 7/9/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import "HomePageViewController.h"
#import "Parse/Parse.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LogOutUser:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];

    }];

}
@end
