//
//  DetailsNotesVC.h
//  LoginPage
//
//  Created by Aditya Kumar on 09/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "PopButtonVC.h"


@interface DetailsNotesVC : UIViewController <UIPopoverPresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleOfTheNotes;
@property (weak, nonatomic) IBOutlet UITextView *descriptionOfTheNotes;

@property (weak, nonatomic) IBOutlet UIButton *tagButton;
@property (weak, nonatomic) IBOutlet UIButton *secureButton;



- (void)setDataToViewController:(Note *)Note;



@end
