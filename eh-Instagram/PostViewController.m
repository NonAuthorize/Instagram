//
//  PostViewController.m
//  eh-Instagram
//
//  Created by unauthorize on 7/11/19.
//  Copyright © 2019 unauthorize. All rights reserved.
//

#import "PostViewController.h"
#import "HomePageViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"
#import "Post.h"

@import Parse;

@interface PostViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) UIImage *originalImage;
@property (weak, nonatomic) UIImage *editedImage;


@end

@implementation PostViewController : UIViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)uploadPic{
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    //UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    self.editedImage = [self resizeImage:editedImage withSize:CGSizeMake(400, 400)];
    
    // Do something with the images (based on your use case)
    
    
    // [self.imageUploadView setImage:self.editedImage];
    self.imageUploadView.image = editedImage; //self.editedImage;
    NSLog(@"Image should upload");
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CancelButton:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (IBAction)postButton:(id)sender {
    [Post postUserImage:self.editedImage withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            NSLog(@"Success");
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

- (IBAction)DidTapButton:(id)sender {
    [self uploadPic];
}

@end
