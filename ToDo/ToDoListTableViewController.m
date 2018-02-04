//
//  ToDoListTableViewController.m
//  ToDo
//
//  Created by Christian Persson on 2018-01-28.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "AddToDoViewController.h"
#import "ToDoS.h"
#import "ShowDetailsViewController.h"

@interface ToDoListTableViewController ()
@property (nonatomic) ToDoS *toDo;
@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDo = [[ToDoS alloc] init];
}


-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    [self loadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)editBUtton:(id)sender {
    if ([self isEditing]) {
        [self setEditing:NO animated:YES];
        [self.tableView reloadData];
    } else {
        [self setEditing:YES animated:YES];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {

    if (sourceIndexPath.section == 0) {
        NSString *titleToMove = self.toDo.titelArray[sourceIndexPath.row];
        NSString *descriptionToMove = self.toDo.descriptionArray[sourceIndexPath.row];
        NSString *isImportantToMove = self.toDo.isImportantArray[sourceIndexPath.row];
        
        [self.toDo.titelArray removeObjectAtIndex:sourceIndexPath.row];
        [self.toDo.titelArray insertObject:titleToMove atIndex:destinationIndexPath.row];
    
        [self.toDo.descriptionArray removeObjectAtIndex:sourceIndexPath.row];
        [self.toDo.descriptionArray insertObject:descriptionToMove atIndex:destinationIndexPath.row];
    
        [self.toDo.isImportantArray removeObjectAtIndex:sourceIndexPath.row];
        [self.toDo.isImportantArray insertObject:isImportantToMove atIndex:destinationIndexPath.row];

        [self.toDo saveData];
    } else {
        NSString *titleToMove = self.toDo.doneTitelArray[sourceIndexPath.row];
        NSString *descriptionToMove = self.toDo.doneDescriptionArray[sourceIndexPath.row];
        NSString *isImportantToMove = self.toDo.doneIsImportantArray[sourceIndexPath.row];
        
        [self.toDo.doneTitelArray removeObjectAtIndex:sourceIndexPath.row];
        [self.toDo.doneTitelArray insertObject:titleToMove atIndex:destinationIndexPath.row];
        
        [self.toDo.doneDescriptionArray removeObjectAtIndex:sourceIndexPath.row];
        [self.toDo.doneDescriptionArray insertObject:descriptionToMove atIndex:destinationIndexPath.row];
        
        [self.toDo.doneIsImportantArray removeObjectAtIndex:sourceIndexPath.row];
        [self.toDo.doneIsImportantArray insertObject:isImportantToMove atIndex:destinationIndexPath.row];
        
        [self.toDo saveData];
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        return @"ToDo´s";
    }else {
        return @"Marked as done";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.toDo.titelArray count];
    } else {
        return [self.toDo.doneTitelArray count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        if ([self.toDo.isImportantArray[indexPath.row] isEqualToString:@"yes"]) {
            [cell setBackgroundColor:[UIColor orangeColor]];
        }
        cell.textLabel.text = self.toDo.titelArray[indexPath.row];
    } else {
        if ([self.toDo.doneIsImportantArray[indexPath.row] isEqualToString:@"yes"]) {
            [cell setBackgroundColor:[UIColor orangeColor]];
        }
        cell.textLabel.text = self.toDo.doneTitelArray[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (indexPath.section == 0) {
            [self.toDo deleteIteam:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.toDo addFromTempToDone];
            [self.tableView reloadData];
        } else {
            [self.toDo deletFromDone:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView reloadData];
            
        }
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if( sourceIndexPath.section != proposedDestinationIndexPath.section )
    {
        return sourceIndexPath;
    }
    else
    {
        return proposedDestinationIndexPath;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    

    if ([segue.identifier isEqualToString:@"showDetails"]) {
        UITableViewCell *cell = sender;
        ShowDetailsViewController *detail = [segue destinationViewController];
        detail.title = cell.textLabel.text;
        int index = (int)[self.tableView indexPathForCell:cell].row;
        if (self.tableView.indexPathForSelectedRow.section == 0) {
            detail.showDetailsArray = self.toDo.descriptionArray;
            detail.showImportantArray = self.toDo.isImportantArray;
            detail.detailIndex = index;
        } else {
            detail.showDetailsArray = self.toDo.doneDescriptionArray;
            detail.showImportantArray = self.toDo.doneIsImportantArray;
            detail.detailIndex = index;
        }
            
    } else if ([segue.identifier isEqualToString:@"addTask"]) {
        AddToDoViewController *add = [segue destinationViewController];
        add.title = [NSString stringWithFormat:(@"Add your ToDo")];
        add.toDo = self.toDo;
        [self.tableView reloadData];
    }
}

@end

