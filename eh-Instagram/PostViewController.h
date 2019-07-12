//
//  PostViewController.h
//  eh-Instagram
//
//  Created by unauthorize on 7/11/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PostViewControllerDelegate

-(void) postButton:(Post *)post;

@end

@interface PostViewController : UIViewController <UIImagePickerControllerDelegate>
- (IBAction)CancelButton:(id)sender;
- (IBAction)postButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *captionField;
@property (weak, nonatomic) IBOutlet UIImageView *imageUploadView;

@end

NS_ASSUME_NONNULL_END
