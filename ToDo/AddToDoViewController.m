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
    self.toDo.titelArray =[[[NSUserDefaults standardUserDefaults] objectForKey:@"titleArray"]mutableCopy];
    [self.toDo.titelArray addObject:self.toDoTitel.text];
    [[NSUserDefaults standardUserDefaults] setObject:self.toDo.titelArray forKey:@"titleArray"];
    [self.navigationController popViewControllerAnimated:YES];
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

@end
