//
//  ToDoS.h
//  ToDo
//
//  Created by Christian Persson on 2018-01-28.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoS : NSObject
@property (nonatomic) NSMutableArray *titelArray;
@property (nonatomic) NSMutableArray *descriptionArray;
@property (nonatomic) NSMutableArray *isImportantArray;
@property (nonatomic) NSMutableArray *doneTitelArray;
@property (nonatomic) NSMutableArray *doneDescriptionArray;
@property (nonatomic) NSMutableArray *doneIsImportantArray;
@property (nonatomic) NSMutableArray *tempArray;

-(void)addItem:(NSString*)titel :(NSString*)description :(NSString*)isImportant;
-(void)deleteIteam:(NSInteger)index;
-(NSInteger)getArrayLength;
-(void)addFromTempToDone;
-(void)saveData;
-(void)deletFromDone:(NSInteger)index;

@end
