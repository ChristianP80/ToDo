//
//  ToDoS.m
//  ToDo
//
//  Created by Christian Persson on 2018-01-28.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "ToDoS.h"

@implementation ToDoS

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titelArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"titleArray"]mutableCopy];
        self.descriptionArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"descriptionArray"]mutableCopy];
        self.isImportantArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"isImportantArray"]mutableCopy];
        self.doneTitelArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"doneTitleArray"]mutableCopy];
        self.doneDescriptionArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"doneDescriptionArray"]mutableCopy];
        self.doneIsImportantArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"doneIsImportantArray"]mutableCopy];
        
        if(self.titelArray == nil) {
            self.titelArray = [[NSMutableArray alloc] init];
        }
        if(self.descriptionArray == nil) {
            self.descriptionArray = [[NSMutableArray alloc] init];
        }
        if(self.isImportantArray == nil) {
            self.isImportantArray = [[NSMutableArray alloc] init];
        }
        if(self.doneTitelArray == nil) {
            self.doneTitelArray = [[NSMutableArray alloc] init];
        }
        if(self.doneDescriptionArray == nil) {
            self.doneDescriptionArray = [[NSMutableArray alloc] init];
        }
        if(self.doneIsImportantArray == nil) {
            self.doneIsImportantArray = [[NSMutableArray alloc] init];
        }
        }
    return self;
}


-(void)addItem:(NSString*)titel :(NSString*)description :(NSString*)isImportant{
    [self.titelArray addObject:titel];
    [self.descriptionArray addObject:description];
    [self.isImportantArray addObject:isImportant];
    [self saveData];
}

-(void)deleteIteam:(NSInteger)index {
    NSString *titelObject = self.titelArray[index];
    NSString *descriptionObject = self.descriptionArray[index];
    NSString *importantObject = self.isImportantArray[index];
    self.tempArray = @[].mutableCopy;
    [self.tempArray addObject:titelObject];
    [self.tempArray addObject:descriptionObject];
    [self.tempArray addObject:importantObject];
    [self.titelArray removeObjectAtIndex:(int)index];
    [self.descriptionArray removeObjectAtIndex:(int)index];
    [self.isImportantArray removeObjectAtIndex:(int)index];
    [self saveData];
}

-(void)deletFromDone:(NSInteger)index {
    [self.doneTitelArray removeObjectAtIndex:(int)index];
    [self.doneDescriptionArray removeObjectAtIndex:(int)index];
    [self.doneIsImportantArray removeObjectAtIndex:(int)index];
    [self saveData];
}

-(void)addFromTempToDone {
    [self.doneTitelArray addObject:self.tempArray[0]];
    [self.doneDescriptionArray addObject:self.tempArray[1]];
    [self.doneIsImportantArray addObject:self.tempArray[2]];
    [self saveData];
}

-(void)saveData {
    [[NSUserDefaults standardUserDefaults] setObject:self.titelArray forKey:@"titleArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.descriptionArray forKey:@"descriptionArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.isImportantArray forKey:@"isImportantArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.doneTitelArray forKey:@"doneTitleArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.doneDescriptionArray forKey:@"doneDescriptionArray"];
    [[NSUserDefaults standardUserDefaults] setObject:self.doneIsImportantArray forKey:@"doneIsImportantArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(NSInteger)getArrayLength {
    return self.titelArray.count;
}

@end
