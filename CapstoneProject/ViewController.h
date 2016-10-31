//
//  ViewController.h
//  CapstoneProject
//
//  Created by Student on 2016-10-13.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "documentTabControllerViewController.h"

@interface ViewController : UIViewController <UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UITabBar *mainTabBar;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *facebookLoginButton;

@property (weak, nonatomic) IBOutlet UIButton *createAccountButton;

@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;



@property (weak, nonatomic) NSString *fullName;
@property (weak, nonatomic) NSString *facebookID;
@property (weak, nonatomic) NSString *emailID;
@property (weak, nonatomic) NSString *profilePicURL;
@property (weak, nonatomic) NSString *userID;


-(void) getUserDetails : (void (^)(void))callbackFunction;

-(void) saveDetailsTocookie : (NSArray *)values;

-(NSString *) doConnect : (NSString *) postData;

@end

