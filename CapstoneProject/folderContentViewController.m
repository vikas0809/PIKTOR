//
//  folderContentViewController.m
//  CapstoneProject
//
//  Created by Student on 2016-11-08.
//  Copyright © 2016 Student. All rights reserved.
//

#import "folderContentViewController.h"

@interface folderContentViewController ()
{
    NSString *newNotebookTitle;
}

@end

@implementation folderContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _folderContent.delegate = self;
    _folderContent.dataSource = self;
    _content = [NSMutableArray arrayWithObjects:@"NoteBook1", @"NoteBook2", @"NoteBook3", @"NoteBook4", @"NoteBook5", @"NoteBook6", @"NoteBook7", @"NoteBook8", @"NoteBook9", @"NoteBook10",@"NoteBook11",@"NoteBook12",@"NoteBook13",@"NoteBook14",@"NoteBook15",@"NoteBook16",@"NoteBook17",@"NoteBook18",@"NoteBook19",@"NoteBook20", nil];
    
    _mainNavBar.topItem.title = _folderName;
    
   // [self doShowActions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _content.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"pageCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //[tableView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *pageImageView = (UIImageView *)[cell viewWithTag:100];
    pageImageView.image = [UIImage imageNamed:@"notebook.png"];
    
    UILabel *pageTitle = (UILabel *)[cell viewWithTag:101];
    pageTitle.text = [_content objectAtIndex:(_content.count - 1) - indexPath.row];
    
    UILabel *pageDescription = (UILabel *)[cell viewWithTag:102];
    pageDescription.text = @"This is a desription of the page. This page is located inside of a notebook. We will try as much as possible to keeep iy simple.";
    
    return cell;
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
                             [_content addObject:newNotebookTitle];
                             [_folderContent reloadData];
                         }];
    
    UIAlertAction* cancel  = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                                    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)doShowActions
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"New Notebook"
                                  message:@"Enter name for notebook"
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                         {
                             UITextField *temp = alert.textFields.firstObject;
                             newNotebookTitle= temp.text;
                             [_content addObject:newNotebookTitle];
                             [_folderContent reloadData];
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
