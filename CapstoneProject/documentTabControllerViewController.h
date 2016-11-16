//
//  documentTabControllerViewController.h
//  CapstoneProject
//
//  Created by Student on 2016-10-18.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface documentTabControllerViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *folderCollecions;

@end
