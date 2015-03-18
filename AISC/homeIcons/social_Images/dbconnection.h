//
//  dbconnection.h
//  FEMS
//
//  Created by contus on 04/09/13.
//  Copyright (c) 2013 contus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#define DBName @"notificationdb.sqlite"


@interface dbconnection : NSObject
{
    sqlite3 *database;
	NSString *documentsPath;
	NSString *documentsDir;
	NSString *databaseName;
    
    BOOL result;
    NSMutableDictionary *dict;
    NSMutableArray *dictArray;
    NSUserDefaults *userCurrentStatus;
    
}
//CREATE TABLE bookMarkTable(id INTEGER PRIMARY KEY   AUTOINCREMENT,List  TEXT,ListNumber  int(10),ChapterNumber float(10))

-(BOOL)insertbookMark:(NSString *)notificationTitle date:(NSString *)notificationDate;
-(void)openDatabase;
-(NSMutableArray *)selectallRecords;

-(NSMutableArray *)getallRecords;


-(NSMutableArray *)bookMarkAllRecords;
-(BOOL)removeBookMark:(int)removeid;
@end
