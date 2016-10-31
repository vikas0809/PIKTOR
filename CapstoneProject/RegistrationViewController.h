//
//  RegistrationViewController.h
//  CapstoneProject
//
//  Created by Student on 2016-10-26.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController
{
    IBOutlet UIActivityIndicatorView *loading;
}
- (IBAction)registerButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *registerEmail;

@property (weak, nonatomic) IBOutlet UITextField *registerPassword;

@property (weak, nonatomic) IBOutlet UITextField *registerConfirmPassword;

@property (weak, nonatomic) IBOutlet UITextField *registerFirstName;

@property (weak, nonatomic) IBOutlet UITextField *registerLastName;

@property (weak, nonatomic) IBOutlet UILabel *emailError;

@property (weak, nonatomic) IBOutlet UILabel *passwordError;

@property (weak, nonatomic) IBOutlet UILabel *confirmPasswordError;

@property (weak, nonatomic) IBOutlet UILabel *lastNameError;

@property (weak, nonatomic) IBOutlet UILabel *firstNameError;

- (IBAction)emailChanged:(UITextField *)sender;


@end
