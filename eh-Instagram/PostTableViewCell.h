//
//  PostTableViewCell.h
//  eh-Instagram
//
//  Created by unauthorize on 7/11/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *captionView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
- (IBAction)likeButton:(id)sender;
- (IBAction)commentButton:(id)sender;


@end

NS_ASSUME_NONNULL_END
