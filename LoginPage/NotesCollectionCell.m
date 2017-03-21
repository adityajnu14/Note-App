//
//  NotesCollectionCell.m
//  LoginPage
//
//  Created by Aditya Kumar on 08/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "NotesCollectionCell.h"
#import "Utility.h"
@implementation NotesCollectionCell

-(void)setValueIntoCell:(Note *)note
{
    self.titleUILabelField.text = note.titleOfTheNotes;
    self.descriptionUILabelField.text = note.descriptionOfTheNotes;
     self.lcokImage.hidden = YES;
    
    
    UIColor* color = [Utility stringToColor:note.noteTagColor];
    
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.titleUILabelField.backgroundColor = color;
    self.descriptionUILabelField.backgroundColor = color;
    self.backgroundColor = color;
    self.layer.borderWidth = 3.0;
    [self.descriptionUILabelField sizeToFit];
    [self showLockForSecureNote:note];
}






-(void)showLockForSecureNote:(Note*)note
{
    self.lcokImage.hidden = !note.isLock;
    self.descriptionUILabelField.hidden =note.isLock;
    self.titleUILabelField.hidden = note.isLock;
//    [self.descriptionUILabelField setHidden:true];
//    [self.titleUILabelField setHidden:true];
    
}


@end
