//
//  AddToDoViewController.m
//  ToDo
//
//  Created by Christian Persson on 2018-01-28.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "AddToDoViewController.h"


@interface AddToDoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *toDoTitel;
@property (weak, nonatomic) IBOutlet UITextField *toDoDescription;

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleTodoList = @[].mutableCopy;
    // Do any additional setup after loading the view.
}

- (IBAction)addItem:(id)sender {
    //
    //[self.toDoTitel.text isEqualToString:self.titleTodoList[self.titleTodoList.count-1]]
    if ([self.toDoTitel.text isEqualToString:@""]){
        [self.navigationController popViewControllerAnimated:YES];

    } else {
        [self.titleTodoList addObject:self.toDoTitel.text];
        //   [self.descriptionToDoList addObject:self.toDoDescription.text];
        [[NSUserDefaults standardUserDefaults] setObject:self.titleTodoList forKey:@"titleToDoListArray"];
        [self.navigationController popViewControllerAnimated:YES];
    }
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
