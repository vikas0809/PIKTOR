//
//  NewDocumentViewController.m
//  CapstoneProject
//
//  Created by Vikas Joshi on 2016-11-07.
//  Copyright © 2016 Student. All rights reserved.
//

#import "NewDocumentViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <TesseractOCR/TesseractOCR.h>

@interface NewDocumentViewController ()

@end

@implementation NewDocumentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _camButton.layer.cornerRadius = 36.5;
    [self.camButton.layer setBorderWidth:1.0];
    [self.camButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [self.camButton.layer setShadowOffset:CGSizeMake(2, 2)];
    [self.camButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.camButton.layer setShadowOpacity:0.3];
    
    [self doInit];
    
    //Detect image Tap
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleToolBar)];
    singleTap.numberOfTapsRequired = 1;
    //[preArrowImage setUserInteractionEnabled:YES];
    [self.cameraImage addGestureRecognizer:singleTap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *editedImage   = info[UIImagePickerControllerEditedImage];
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    
    if(editedImage)
    self.cameraImage.image= editedImage;
    
    if(originalImage)
      [self.cameraImage setImage:originalImage];
    
    if(self.cameraImage.image)
    {
        [self.camButton setImage:[UIImage imageNamed:@"text-file-5-xxl.png"] forState:UIControlStateNormal];
        [self.camButton setImage:[UIImage imageNamed:@"text-file-5-xxl.png"] forState:UIControlStateSelected];
    }
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    [self toggleToolBar];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cameraButton:(id)sender {
    if( [[self.camButton imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"text-file-5-xxl.png"]])
    {
        
    }
    else
    {
        [self doInit];
    }
}

-(void)toggleToolBar
{
    if(self.cameraImage.image)
    {
        if(_imageToolBar.isHidden)
        {
            CATransition *animation = [CATransition animation];
            [animation setType:kCATransitionPush];
            [animation setSubtype:kCATransitionFromBottom];
            
            [animation setDuration:0.3];
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [[_imageToolBar layer] addAnimation:animation forKey:kCATransition];
            
            [_imageToolBar setHidden:NO];
        }
        else
        {
            CATransition *animation = [CATransition animation];
            [animation setType:kCATransitionPush];
            [animation setSubtype:kCATransitionFromTop];
            
            [animation setDuration:0.5];
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [[_imageToolBar layer] addAnimation:animation forKey:kCATransition];
            
            [_imageToolBar setHidden:YES];
        }
    }
}

-(void) doInit
{
    UIAlertController *alert =
    [UIAlertController alertControllerWithTitle:@"Document Snapshot"
                                        message:@"Select method of input"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Gallery"
                                              style:UIAlertActionStyleDefault
                                            handler:^void (UIAlertAction *action) {
                                                NSLog(@"Clicked Gallery");
                                                
                                                //Select Image
                                                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                                picker.delegate = self;
                                                picker.allowsEditing = YES;
                                                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                                
                                                [self presentViewController:picker animated:YES completion:NULL];
                                                
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Camera"
                                              style:UIAlertActionStyleDefault
                                            handler:^void (UIAlertAction *action) {
                                                NSLog(@"Clicked Camera");
                                                
                                                //Capture image
                                                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                                                {
                                                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                                    picker.delegate = self;
                                                    picker.allowsEditing = YES;
                                                    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                                                    
                                                    [self presentViewController:picker animated:YES completion:NULL];
                                                }
                                                else
                                                {
                                                    //Select Image
                                                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                                    picker.delegate = self;
                                                    picker.allowsEditing = YES;
                                                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                                    
                                                    [self presentViewController:picker animated:YES completion:NULL];
                                                }
                                                
                                                
                                            }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                              style:UIAlertActionStyleCancel
                                            handler:^void (UIAlertAction *action) {
                                                NSLog(@"Clicked Remove Photo");
                                            }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)replaceImage:(id)sender {
    [self doInit];
}
@end
