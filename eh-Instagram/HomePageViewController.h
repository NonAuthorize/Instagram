//
//  HomePageViewController.h
//  eh-Instagram
//
//  Created by unauthorize on 7/9/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageViewController : UIViewController <PostViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

- (IBAction)CameraButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

NS_ASSUME_NONNULL_END
