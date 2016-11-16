//
//  folderContentViewController.h
//  CapstoneProject
//
//  Created by Student on 2016-11-08.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface folderContentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (copy, nonatomic) NSMutableArray *content;

@property (strong, nonatomic) IBOutlet UITableView *folderContent;

@property (strong, nonatomic) IBOutlet UINavigationBar *mainNavBar;

@property (strong, nonatomic) UIActionSheet * aac;

@property (nonatomic, strong) NSString* folderName;
@property NSInteger folderID;



@end
