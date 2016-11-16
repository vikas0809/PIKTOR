//
//  NewDocumentViewController.h
//  CapstoneProject
//
//  Created by Vikas Joshi on 2016-11-07.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NewDocumentViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)cameraButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *camButton;

@property (strong, nonatomic) IBOutlet UIImageView *cameraImage;
@property (strong, nonatomic) IBOutlet UIToolbar *imageToolBar;
- (IBAction)replaceImage:(id)sender;

@end
