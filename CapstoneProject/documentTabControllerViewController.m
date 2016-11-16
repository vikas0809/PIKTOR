//
//  documentTabControllerViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-10-18.
//  Copyright © 2016 Student. All rights reserved.
//

#import "documentTabControllerViewController.h"
#import "folderContentViewController.h"

@interface documentTabControllerViewController ()
{
    NSMutableArray* folderPhotos, *folderLabels;
    NSString *newNotebookTitle;
    NSInteger itemNo;
    NSString *itemName;
}
@end



@implementation documentTabControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    folderLabels = [NSMutableArray arrayWithObjects:@"Accounts", @"My Documents", @"Projects", @"PROG8180", @"INFO8080", @"PROG8080", @"PROG8225", @"Library Stuffs", @"Confidential", @"Notebook", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return folderLabels.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"folderIdentifier";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *folderImageView = (UIImageView *)[cell viewWithTag:100];
    folderImageView.image = [UIImage imageNamed:@"Folder-96.png"];
    //[UIImage imageNamed:[folderPhotos objectAtIndex:indexPath.row]];
    
    UILabel *folderLabel = (UILabel *)[cell viewWithTag:101];
    folderLabel.text = [folderLabels objectAtIndex:(folderLabels.count - 1) - indexPath.row];
    
    /*if (cell.selected)
    {
        
    }*/
    
   // cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Selected Folder
    UICollectionViewCell *folderCell =[collectionView cellForItemAtIndexPath:indexPath];
    folderCell.backgroundColor = [UIColor grayColor];
    
    folderCell.backgroundColor = [folderCell.backgroundColor colorWithAlphaComponent:0.20];
    
    //itemNo = (int)[indexPath row]+1;
      itemNo   = (folderLabels.count - 1) - indexPath.row;
      itemName = [folderLabels objectAtIndex:(folderLabels.count - 1) - indexPath.row];
    
    
    folderContentViewController *fc = [self.storyboard instantiateViewControllerWithIdentifier:@"folderContentVc"];
    
    fc.folderName = itemName;
    fc.folderID   = itemNo;
    [self presentViewController:fc animated:YES completion:nil];
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //Deselected Folder
    UICollectionViewCell *selectedFolderCell =[collectionView cellForItemAtIndexPath:indexPath];
    selectedFolderCell.backgroundColor = [UIColor whiteColor]; // Default color
}


- (IBAction)addNotebook:(id)sender {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"New Notebook"
                                  message:@"Enter name for notebook"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *Title) {
        Title.placeholder = @"title";
    }];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                         {
                             UITextField *temp = alert.textFields.firstObject;
                             newNotebookTitle= temp.text;
                             [folderLabels addObject:newNotebookTitle];
                             [_folderCollecions reloadData];
                         }];
    
    UIAlertAction* cancel  = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                                    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
