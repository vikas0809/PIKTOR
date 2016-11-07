//
//  docFoldersCollectionViewController.h
//  CapstoneProject
//
//  Created by Student on 2016-11-07.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface docFoldersCollectionViewController : UICollectionViewController

@property (strong, nonatomic) IBOutlet UILabel *folderL;


@property NSArray* folderPhotos;
@property NSArray* folderLabels;

@end
