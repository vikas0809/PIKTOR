//
//  RegistrationViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-10-26.
//  Copyright © 2016 Student. All rights reserved.
//

#import "RegistrationViewController.h"
#import "ViewController.h"

@interface RegistrationViewController ()

@end

ViewController *vc;

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //hide loading
    loading.hidden = YES;
    
    [self hideFormFieldErrors];
    
    vc = [[ViewController alloc] init];
    
}

-(void) hideFormFieldErrors
{
    [_emailError setHidden: YES];
    [_passwordError setHidden: YES];
    [_confirmPasswordError setHidden: YES];
    [_firstNameError setHidden: YES];
    [_lastNameError setHidden: YES];
}

- (IBAction)registrationBtnFunction:(UIButton *)sender {
    
    if(![self doValidation])
    {
        //Start loading animation
        loading.hidden = NO;
        // [_loading setHidden:NO];
        [loading startAnimating];
        
        NSString *post = [NSString stringWithFormat: @"action=%@&emailAddress=%@&password=%@&firstName=%@&lastName=%@", @"doRegister",_registerEmail.text, _registerPassword.text, _registerFirstName.text, _registerLastName.text];
        
        NSString *result = [vc doConnect: post];
        
        NSLog(@"result - %@", result);
        
        NSData* data = [result dataUsingEncoding:NSUTF8StringEncoding];
        
        NSArray *values = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"userID - %@",[values valueForKey:@"userID"]);
        
        if([values valueForKey:@"error"] != nil)
        {
            NSString *err = [values valueForKey:@"error"],
                     *errmsg = @"";
            
            if([err isEqualToString:@"Email exists"])
                errmsg = @"Email already taken, please use a different email or login with this email.";
            else
            {
                errmsg = @"unknown error occured while creating your account. Please try again later. Thank you.";
            }
            
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error Occured" message:errmsg delegate:self cancelButtonTitle: @"OK"otherButtonTitles: nil];
            
            //Stop loading animation
            [loading stopAnimating];
            loading.hidden = YES;
            
            [error show];
            
        }
        
        else
        {
            if([values valueForKey:@"userID"] != nil)
            {
                [vc saveDetailsTocookie : values];
                
                //Stop loading animation
                [loading stopAnimating];
                
                UITabBarController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"tabControllers"];
                tbc.selectedIndex=0;
                [self presentViewController:tbc animated:YES completion:nil];
            }
        }
    }
}



-(BOOL) doValidation
{
    BOOL isValidationError = false;
    BOOL stricterFilter = NO;
    
        NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
        NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
        NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if(![emailTest evaluateWithObject:_registerEmail.text])
    {
        [_emailError setHidden: NO];
        _registerEmail.layer.borderColor=[[UIColor redColor] CGColor];
        
        _registerEmail.layer.borderWidth=1.0;
        isValidationError = true;
    }
    
    if([_registerPassword.text isEqualToString:@""] || [_registerPassword.text length] < 5)
    {
        [_passwordError setHidden: NO];
        _registerPassword.layer.borderColor=[[UIColor redColor] CGColor];
        
        _registerPassword.layer.borderWidth=1.0;
        
        isValidationError = true;
    }
    
    if(![_registerPassword.text isEqualToString: _registerConfirmPassword.text ] || [_registerPassword.text isEqualToString: @""])
    {
        [_confirmPasswordError setHidden: NO];
        _registerConfirmPassword.layer.borderColor=[[UIColor redColor] CGColor];
        
        _registerConfirmPassword.layer.borderWidth=1.0;
        
        isValidationError = true;
    }
    
    if([_registerFirstName.text length] < 3 || [_registerFirstName.text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)
    {
        [_firstNameError setHidden: NO];
        _registerFirstName.layer.borderColor=[[UIColor redColor] CGColor];
        
        _registerFirstName.layer.borderWidth=1.0;
        
        isValidationError = true;
    }
    
    
    if([_registerLastName.text length] < 3 || [_registerLastName.text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)
    {
        [_lastNameError setHidden: NO];
        _registerLastName.layer.borderColor=[[UIColor redColor] CGColor];
        
        _registerLastName.layer.borderWidth=1.0;
        
        isValidationError = true;
    }
    
    return isValidationError;
}


- (IBAction)ddddd:(UITextField *)sender forEvent:(UIEvent *)event {
    [_emailError setHidden: YES];
    _registerEmail.layer.borderColor=[[UIColor blackColor] CGColor];
    
    _registerEmail.layer.borderWidth=0.0;
}

- (IBAction)passwordErrorReset:(UITextField *)sender forEvent:(UIEvent *)event {
    [_passwordError setHidden: YES];
    _registerPassword.layer.borderColor=[[UIColor blackColor] CGColor];
    
    _registerPassword.layer.borderWidth=0.0;
}

- (IBAction)confirmPasswordErrorReset:(UITextField *)sender forEvent:(UIEvent *)event {
    [_confirmPasswordError setHidden: YES];
    _registerConfirmPassword.layer.borderColor=[[UIColor blackColor] CGColor];
    
    _registerConfirmPassword.layer.borderWidth=0.0;
}

- (IBAction)firstnameErrorReset:(UITextField *)sender forEvent:(UIEvent *)event {
    [_firstNameError setHidden: YES];
    _registerFirstName.layer.borderColor=[[UIColor blackColor] CGColor];
    
    _registerFirstName.layer.borderWidth=0.0;
}

- (IBAction)lastNameErrorReset:(UITextField *)sender forEvent:(UIEvent *)event {
    [_lastNameError setHidden: YES];
    _registerLastName.layer.borderColor=[[UIColor blackColor] CGColor];
    
    _registerLastName.layer.borderWidth=0.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerButton:(UIButton *)sender {
}
- (IBAction)emailChanged:(UITextField *)sender {
}

- (IBAction)resetEmailErr:(id)sender {
}
@end
