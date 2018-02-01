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
    self.toDo.titelArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"titleArray"]mutableCopy];
    self.toDo.descriptionArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"descriptionArray"]mutableCopy];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDo getArrayLength];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];

    cell.textLabel.text = self.toDo.titelArray[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDo deleteIteam:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    

    if ([segue.identifier isEqualToString:@"showDetails"]) {
        UITableViewCell *cell = sender;
        ShowDetailsViewController *detail = [segue destinationViewController];
        detail.title = cell.textLabel.text;
        int index = (int)[self.tableView indexPathForCell:cell].row;
        detail.showDetailsArray = self.toDo.descriptionArray;
        detail.detailIndex = index;
    } else if ([segue.identifier isEqualToString:@"addTask"]) {
        AddToDoViewController *add = [segue destinationViewController];
        add.title = [NSString stringWithFormat:(@"Add your ToDo")];
    }
}

@end
