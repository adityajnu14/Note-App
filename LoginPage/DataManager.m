//
//  DataManager.m
//  LoginPage
//
//  Created by Aditya Kumar on 08/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+(instancetype)sharedManager
{
    static DataManager* sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[DataManager alloc]init];
    });
    
    return  sharedManager;
}




-(NSMutableArray *)getNotesData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"notesList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:plistPath])
    {
        return nil;
    }
    else
        return [NSMutableArray arrayWithContentsOfFile:plistPath];
}


-(void)saveNote:(Note *)note
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"notesList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSMutableArray* dataFromPlist;
    
    if ([fileManager fileExistsAtPath:plistPath])
    {
        dataFromPlist = [NSMutableArray arrayWithContentsOfFile:plistPath];
    }
    else
        dataFromPlist = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* dataDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:note.titleOfTheNotes, @"title", note.descriptionOfTheNotes, @"description", note.noteTagColor, @"tagColor",[NSNumber numberWithBool:note.isLock], @"lock", nil];
    
    [dataFromPlist addObject:dataDict];
    
    BOOL didWriteToFile = [dataFromPlist writeToFile:plistPath atomically:YES];
    
    if(didWriteToFile)
    {
        NSLog(@"Write to .plist file is a SUCCESS!");
    }
    else
    {
        NSLog(@"Write to .plist file is a FAILURE!");
    }

}


-(void)updateNote:(Note *)note atIndex:(int)index
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"notesList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSMutableArray* dataFromPlist;
    
    if ([fileManager fileExistsAtPath:plistPath])
    {
        dataFromPlist = [NSMutableArray arrayWithContentsOfFile:plistPath];
    }
    else
        dataFromPlist = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* dataDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:note.titleOfTheNotes, @"title", note.descriptionOfTheNotes, @"description", note.noteTagColor, @"tagColor", [NSNumber numberWithBool:note.isLock], @"lock", nil];

    
    [dataFromPlist replaceObjectAtIndex:index withObject:dataDict];
    
    BOOL didWriteToFile = [dataFromPlist writeToFile:plistPath atomically:YES];
    
    if(didWriteToFile)
    {
        NSLog(@"Write to .plist file is a SUCCESS!");
    }
    else
    {
        NSLog(@"Write to .plist file is a FAILURE!");
    }
    
}


-(int)seachForAnIndexNote:(Note *)note
{
    int i;
    
    DataManager* sharedManager = [DataManager sharedManager];
    NSMutableArray *dataFromPlist = [sharedManager getNotesData];
 
    NSMutableDictionary* dataDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:note.titleOfTheNotes, @"title", note.descriptionOfTheNotes, @"description", note.noteTagColor, @"tagColor", [NSNumber numberWithBool:note.isLock], @"lock", nil];
    
    for(i=0; i<dataFromPlist.count; ++i)
    {
    
        if(([[dataDict objectForKey:@"title"] isEqualToString:[dataFromPlist[i] objectForKey:@"title"]]) && ([[dataDict objectForKey:@"description"] isEqualToString:[dataFromPlist[i] objectForKey:@"description"]]))
        {
            return  i;
        }
        
    }
    
    return i;
    
}





@end
