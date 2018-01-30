//
//  ToDoS.m
//  ToDo
//
//  Created by Christian Persson on 2018-01-28.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "ToDoS.h"

@implementation ToDoS

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titelArray = [[NSMutableArray alloc] init];
        self.titelArray = @[].mutableCopy;
    }
    return self;
}

-(void)addItem:(NSString*)titel{
    [self.titelArray addObject:titel];
    [[NSUserDefaults standardUserDefaults] setObject:self.titelArray forKey:@"titleArray"];
}

-(void)deleteIteam:(NSInteger*)index{
    self.titelArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"titleArray"];
    [self.titelArray removeObjectAtIndex:index];
}

-(NSInteger)getArrayLength {
    return self.titelArray.count;
}

@end
