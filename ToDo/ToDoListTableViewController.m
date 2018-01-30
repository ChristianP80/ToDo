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

@interface ToDoListTableViewController ()
@property (nonatomic) ToDoS *toDo;
@property (nonatomic) NSMutableArray *tempArray;
@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.toDo = [[ToDoS alloc] init];
}

-(void)viewWillAppear:(BOOL)animated {
    self.tempArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"titleToDoListArray"];
    [self.toDo.titelArray addObject: self.tempArray[self.tempArray.count-1]];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDo.titelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];

    cell.textLabel.text = self.toDo.titelArray[indexPath.row];

    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"AddTask"]) {
        AddToDoViewController *add = [segue destinationViewController];
        add.title = [NSString stringWithFormat:(@"test")];
    }
    
}


@end
