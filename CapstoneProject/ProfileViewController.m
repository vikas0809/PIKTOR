//
//  ProfileViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-10-18.
//  Copyright © 2016 Student. All rights reserved.
//

#import "ProfileViewController.h"
#import "ViewController.h"
// facebook login headers
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ProfileViewController ()

@end

ViewController *mV;

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    _fullName.text = [defaults stringForKey:@"fullName"];
    _email.text    = [defaults stringForKey:@"emailID"];
    _userID        = [defaults stringForKey:@"userID"];
    
    if(_userID == nil || [_userID isEqualToString: @"nil"] || [_userID isEqual:[NSNull null]] )
    {
        mV = [[ViewController alloc] init];
        
        [mV getUserDetails : ^{
            _fullName.text  = mV.fullName;
            _email.text     = mV.emailID;
        
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:mV.profilePicURL]];
        
            _profilePic.image = [UIImage imageWithData:imageData];
        
        }];
    
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doLogout:(UIButton *)sender {
    
    if ([FBSDKAccessToken currentAccessToken])
    {
        FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
        [loginManager logOut];
    }
    
    if (![FBSDKAccessToken currentAccessToken]) {
        
        [self resetDefaults];
        
        //[self dismissModalStack];
    
        //show view controller
        UIViewController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"loginMain"];
        [self presentViewController:tbc animated:YES completion:nil];
    }
    
}

//Reset NSDefaults
- (void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

//Clears all open viewControllers.
-(void)dismissModalStack {
    UIViewController *vc = self.presentingViewController;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:NULL];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)CancelBtn:(id)sender {    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}
@end
