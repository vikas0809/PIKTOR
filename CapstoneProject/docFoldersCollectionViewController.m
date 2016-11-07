//
//  docFoldersCollectionViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-11-07.
//  Copyright © 2016 Student. All rights reserved.
//

#import "docFoldersCollectionViewController.h"
#import "folderCollectionViewCell.h"

@interface docFoldersCollectionViewController ()

@end

@implementation docFoldersCollectionViewController

static NSString * const reuseIdentifier = @"folderCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    _folderPhotos = [NSArray arrayWithObjects:@"add Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", @"Folder-96.png", nil];
    _folderLabels = @[@"New Folder", @"Documents", @"PROG8180", @"PROG8080", @"INFO8180", @"Random", @"My Project", @"School Stuffs", @"Resume", @"Jobs", @"Letters", @"Cards"];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _folderPhotos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell
    folderCollectionViewCell* fCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"folderCell" forIndexPath:indexPath];
    NSLog(@"Row Count %ld", (long)indexPath.row);
    NSLog(@"Row Value %@", _folderLabels[indexPath.row]);
    
    fCell.folderLabel.text = _folderLabels[indexPath.row];
    
    return fCell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
