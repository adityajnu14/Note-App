//
//  NotesCollectionCell.h
//  LoginPage
//
//  Created by Aditya Kumar on 08/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface NotesCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel* titleUILabelField;
@property (weak, nonatomic) IBOutlet UILabel* descriptionUILabelField;
@property (weak, nonatomic) IBOutlet UIImageView* lcokImage;

-(void)setValueIntoCell:(Note *)note;

@end
