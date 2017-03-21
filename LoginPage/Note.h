//
//  Note.h
//  LoginPage
//
//  Created by Aditya Kumar on 08/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property(nonatomic, strong) NSString* titleOfTheNotes;
@property(nonatomic, strong) NSString* descriptionOfTheNotes;
@property(nonatomic, strong) NSString* noteTagColor;
@property(nonatomic) BOOL isLock;

-(instancetype)initNotesWithTitle:(NSString *)notesTitle andDescription:(NSString *)notesDescription withTag:(NSString *)color andLock:(BOOL)lock;
@end
