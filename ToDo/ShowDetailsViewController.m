//
//  ShowDetailsViewController.m
//  ToDo
//
//  Created by Christian Persson on 2018-01-31.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "ShowDetailsViewController.h"
#import "ToDoS.h"

@interface ShowDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *showToDoDetail;

@end

@implementation ShowDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displyText];
    // Do any additional setup after loading the view.
}

-(void)displyText {
    self.showToDoDetail.text = self.showDetailsArray[self.detailIndex];
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
