//
//  dbconnection.m
//  FEMS
//
//  Created by contus on 04/09/13.
//  Copyright (c) 2013 contus. All rights reserved.
//

#import "dbconnection.h"

@implementation dbconnection

-(void)verifyDatabase:(NSString *)dbName:(NSString *)dbPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPath])
    {
        NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
        [fileManager copyItemAtPath:databasePathFromApp toPath:dbPath error:nil];
         NSLog(@"documentsPath %@ - %@",dbPath,databasePathFromApp);
    }
    //[fileManager release];
}

-(void)openDatabase
{
    databaseName = DBName;
    documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0];
    documentsPath = [documentsDir stringByAppendingPathComponent:databaseName];

    [self verifyDatabase:databaseName:documentsPath];
    
}




-(BOOL)insertbookMark:(NSString *)notificationTitle date:(NSString *)notificationDate
{
    [self openDatabase];
       const char *sqlStatement = nil;
    
     //CREATE TABLE bookMarkTable(id INTEGER PRIMARY KEY   AUTOINCREMENT,Header  TEXT,List  TEXT,ListNumber  int(10),ChapterNumber float(10))
    
   // insert into bookMarkTable(List,ListNumber,ChapterNumber)values('test',1,1)

    
    //notificationtable
    sqlStatement =[[NSString stringWithFormat:@"insert into notificationtable(name,date)values('%@','%@')",notificationTitle,notificationDate
                    ] UTF8String];
   
 
    
    if(sqlite3_open([documentsPath UTF8String], &database) == SQLITE_OK)
    {
        if (sqlite3_exec(database, sqlStatement, NULL,NULL, NULL) == SQLITE_OK)
        {
            NSLog(@"Inserted");
            result = YES;
        }
        else
        {
            NSLog(@"Failed");
            NSLog(@"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
            result = NO;
        }
    }
    sqlite3_close(database);
    return result;
    
}


-(NSMutableArray *)getallRecords
{
    [self openDatabase];
    
    
    dictArray = [[NSMutableArray alloc]init];
    if(sqlite3_open([documentsPath UTF8String], &database) == SQLITE_OK)
    {
        // Setup the SQL Statement and compile it for faster access
        const char *sqlStatement = nil;
        
        sqlStatement=[[NSString stringWithFormat:@"select *from notificationtable"]UTF8String];
        
        sqlite3_stmt *compiledStatement;
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            
            ///CREATE TABLE indexTable(id INTEGER PRIMARY KEY   AUTOINCREMENT,ChapterTitle TEXT,chapterNumber  int(10),chapterCount int(10))
            
            
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
               
                
              //  int idValue  = sqlite3_column_int(compiledStatement, 0);
              
                NSString *nameString = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                 NSString *dateString = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                
               
                dict = [[NSMutableDictionary alloc]init];
               
            
                [dict setObject:nameString forKey:@"notification_String"];
                  [dict setObject:dateString forKey:@"date_String"];
             
                [dictArray addObject:dict];
            
                
            }
        }
        else
        {
            NSLog(@"Failed");
            NSLog(@"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
      return dictArray;

}






@end
