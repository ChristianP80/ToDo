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
@property (weak, nonatomic) IBOutlet UITextView *toDoDescription;
@property (weak, nonatomic) IBOutlet UISwitch *isImportantSwitch;
@property (nonatomic) ToDoS *toDo;
@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDo = [[ToDoS alloc] init];
}

- (IBAction)addItem:(id)sender {
    if ([self.isImportantSwitch isOn]) {
        [self.toDo addItem:self.toDoTitel.text: self.toDoDescription.text: @"yes"];
    } else {
        [self.toDo addItem:self.toDoTitel.text: self.toDoDescription.text: @"no"];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
