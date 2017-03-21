//
//  Note.m
//  LoginPage
//
//  Created by Aditya Kumar on 08/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Note.h"

@implementation Note


-(instancetype)initNotesWithTitle:(NSString *)notesTitle andDescription:(NSString *)notesDescription withTag:(NSString *)color andLock:(BOOL)lock;
{
    self = [super init];
    if(self)
    {
        self.titleOfTheNotes = notesTitle;
        self.descriptionOfTheNotes = notesDescription;
        self.noteTagColor = color;
        self.isLock = lock;
    }
    return self;
}

@end
