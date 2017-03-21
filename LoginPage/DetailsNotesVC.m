//
//  DetailsNotesVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 09/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DetailsNotesVC.h"
#import "Note.h"
#import "DataManager.h"
#import "Utility.h"


@interface DetailsNotesVC ()<UITextViewDelegate>
{
    Note* aNote;
    BOOL secureMyNote;
    NSString* colorCode;
}

@end

@implementation DetailsNotesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeNavigationBar];
    [self setDataToField];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self customizeButton];
    [self addPlaceholderInUITextView];
}



- (void)customizeNavigationBar
{
    [self addSaveNoteBtn];
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00 green:0.36 blue:0.57 alpha:1.0];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
}



- (void)addSaveNoteBtn
{
    UIBarButtonItem *addNewBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNotes)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = addNewBtn;
    addNewBtn.enabled=TRUE;
    addNewBtn.tintColor = [UIColor whiteColor];
    addNewBtn.style=UIBarButtonSystemItemRefresh;
}



-(void)addPlaceholderInUITextView
{
    CGFloat borderWidth = 2.0f;
    self.descriptionOfTheNotes.layer.borderColor = [UIColor whiteColor].CGColor;
    self.descriptionOfTheNotes.layer.borderWidth = borderWidth;
    self.descriptionOfTheNotes.textColor = [UIColor whiteColor];
    
    if(self.descriptionOfTheNotes.text.length == 0)
    {
        self.descriptionOfTheNotes.text = @"Enter Notes description";
        self.descriptionOfTheNotes.textColor = [UIColor lightTextColor];
    }
}


-(void)customizeButton
{
    
    self.tagButton.layer.cornerRadius = self.tagButton.frame.size.width/2.0f;
    self.secureButton.layer.cornerRadius = self.secureButton.frame.size.width/2.0f;
    
    [self.tagButton setTitle:@"Tag" forState:UIControlStateNormal];
    
    if(secureMyNote)
    {
        [self.secureButton setBackgroundImage:[UIImage imageNamed:@"roundLock.png"] forState:UIControlStateNormal];
    }
    else
    {
        self.secureButton.backgroundColor = [UIColor yellowColor];
    }
    
    
    
    [self.secureButton addTarget:self action:@selector(secureButtonToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    
}



-(void)secureButtonToggle:(id)sender
{

    secureMyNote = secureMyNote ? NO : YES;
    
    if(secureMyNote)
    {
      [self.secureButton setBackgroundImage:[UIImage imageNamed:@"roundLock.png"] forState:UIControlStateNormal];
    }
    else
    {
        [self.secureButton setBackgroundImage:nil forState:UIControlStateNormal];
       self.secureButton.backgroundColor = [UIColor yellowColor];
    }
    
}






-(void)setDataToField
{
    self.titleOfTheNotes.text = aNote.titleOfTheNotes;
    self.descriptionOfTheNotes.text = aNote.descriptionOfTheNotes;
    secureMyNote = aNote.isLock;
    colorCode = aNote.noteTagColor;
    
    // setting default color as nil for new note
    if(aNote.noteTagColor == nil)
    {
         self.tagButton.backgroundColor = [UIColor yellowColor];
         colorCode = [Utility colorToString:[UIColor yellowColor]];
    }
        else
        self.tagButton.backgroundColor = [Utility stringToColor:aNote.noteTagColor];

    
}



-(void)setDataToViewController:(Note *)Note
{
    aNote = Note;
}



-(void)promptErrorMassage:(NSString *)errorMassage
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert !" message:errorMassage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
    
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}



- (void)saveNotes
{
    
    
    if(self.titleOfTheNotes.text.length == 0 )
        [self promptErrorMassage:@"Empty Notes title"];
    if(self.descriptionOfTheNotes.text.length == 0  || [self.descriptionOfTheNotes.text isEqualToString:@"Enter Notes description"])
        [self promptErrorMassage:@"Empty Notes description"];
    else
    {
        Note* setNote = [[Note alloc]initNotesWithTitle:self.titleOfTheNotes.text andDescription:self.descriptionOfTheNotes.text withTag:colorCode andLock:secureMyNote];
        
        DataManager* sharedManager = [DataManager sharedManager];
        if(!aNote)
        {
            [sharedManager saveNote:setNote];
        }
        else
        {
            int insertNoteAtIndex = [sharedManager seachForAnIndexNote:aNote];
            
            [sharedManager updateNote:setNote atIndex:insertNoteAtIndex];
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}






- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"popOver"]) {
        PopButtonVC* dvc = segue.destinationViewController;
        UIPopoverPresentationController *controller = dvc.popoverPresentationController;
        if (controller) {
            controller.delegate = self;
        }
    }}




- (IBAction)unwindForTag:(UIStoryboardSegue *)unwindSegue
{
    PopButtonVC* popVC=unwindSegue.sourceViewController;
    
    self.tagButton.backgroundColor = popVC.tagButtonColor;
    colorCode = [Utility colorToString:self.tagButton.backgroundColor];
    
}



#pragma - mark textField Delegate


- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if([self.descriptionOfTheNotes.text isEqualToString:@"Enter Notes description"])
        self.descriptionOfTheNotes.text = @"";
    
    self.descriptionOfTheNotes.textColor = [UIColor whiteColor];
    return YES;
}



- (void)textViewDidEndEditing:(UITextView *)textView;
{
    if(self.descriptionOfTheNotes.text.length == 0){
        self.descriptionOfTheNotes.textColor = [UIColor lightTextColor];
        self.descriptionOfTheNotes.text = @"Enter Notes description";
        [self.descriptionOfTheNotes resignFirstResponder];
    }
    
}




# pragma mark - Popover Presentation Controller Delegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}


- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    
    // called when a Popover is dismissed
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    
    // return YES if the Popover should be dismissed
    // return NO if the Popover should not be dismissed
    return YES;
}



@end
