//
//  AddToDoViewController.m
//  ToDo
//
//  Created by Christian Persson on 2018-01-28.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "AddToDoViewController.h"
#import "ToDoS.h"


@interface AddToDoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *toDoTitel;
@property (weak, nonatomic) IBOutlet UITextField *toDoDescription;
@property (nonatomic) ToDoS *toDo;
@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDo = [[ToDoS alloc] init];
}

- (IBAction)addItem:(id)sender {
    [self.toDo addItem:self.toDoTitel.text];
    NSLog(@"value %@", self.toDo.titelArray);
    [[NSUserDefaults standardUserDefaults] setObject:self.toDo.titelArray forKey:@"titleArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
