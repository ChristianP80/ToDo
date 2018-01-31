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
        self.titelArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"titleArray"]mutableCopy];
        if(self.titelArray == nil) {
            self.titelArray = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

-(void)addItem:(NSString*)titel{
    [self.titelArray addObject:titel];
    [[NSUserDefaults standardUserDefaults] setObject:self.titelArray forKey:@"titleArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)deleteIteam:(NSInteger)index{
    [self.titelArray removeObjectAtIndex:(int)index];
    [[NSUserDefaults standardUserDefaults] setObject:self.titelArray forKey:@"titleArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(NSInteger)getArrayLength {
    //self.titelArray =[[[NSUserDefaults standardUserDefaults] objectForKey:@"titelArray"]mutableCopy];
    return self.titelArray.count;
}

@end
