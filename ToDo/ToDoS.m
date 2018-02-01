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
    if (self) {
        self.descriptionArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"descriptionArray"]mutableCopy];
        if(self.descriptionArray == nil) {
            self.descriptionArray = [[NSMutableArray alloc] init];
        }
    }
    if (self) {
        self.isImportantArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"isImportantArray"]mutableCopy];
        if(self.isImportantArray == nil) {
            self.isImportantArray = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

-(void)addItem:(NSString*)titel :(NSString*)description :(NSString*)isImportant{
    [self.titelArray addObject:titel];
    [self.descriptionArray addObject:description];
    [self.isImportantArray addObject:isImportant];
    [[NSUserDefaults standardUserDefaults] setObject:self.titelArray forKey:@"titleArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.descriptionArray forKey:@"descriptionArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.isImportantArray forKey:@"isImportantArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)deleteIteam:(NSInteger)index{
    [self.titelArray removeObjectAtIndex:(int)index];
    [self.descriptionArray removeObjectAtIndex:(int)index];
    [self.isImportantArray removeObjectAtIndex:(int)index];
    [[NSUserDefaults standardUserDefaults] setObject:self.titelArray forKey:@"titleArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.descriptionArray forKey:@"descriptionArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.isImportantArray forKey:@"isImportantArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(NSInteger)getArrayLength {
    return self.titelArray.count;
}

@end
