//
//  ImageSelectionViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-11-13.
//  Copyright © 2016 Student. All rights reserved.
//

#import "ImageSelectionViewController.h"

@interface ImageSelectionViewController ()

@end

@implementation ImageSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     
    self.cameraBtnView.layer.cornerRadius = 64;
    [self.cameraBtnView.layer setBorderWidth:1.0];
    [self.cameraBtnView.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [self.cameraBtnView.layer setShadowOffset:CGSizeMake(2, 2)];
    [self.cameraBtnView.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.cameraBtnView.layer setShadowOpacity:0.3];
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

- (IBAction)cameraButton:(id)sender {
}
@end
