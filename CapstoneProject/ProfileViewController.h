//
//  ProfileViewController.h
//  CapstoneProject
//
//  Created by Student on 2016-10-18.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
// facebook login headers
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *logout;

@property (weak, nonatomic) IBOutlet UIImageView *login;

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@property (weak, nonatomic) IBOutlet UILabel *fullName;

@property (weak, nonatomic) IBOutlet UILabel *email;

@property (weak, nonatomic) NSString *userID;
- (IBAction)CancelBtn:(id)sender;

@end
