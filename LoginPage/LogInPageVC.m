
//
//  LogInPageVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 02/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "LogInPageVC.h"
#import "Utility.h"

@interface LogInPageVC ()

@end

@implementation LogInPageVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.passwordTextField setSecureTextEntry:YES];
}


-(void)loginCheck
{
    if([self logMeIn])
    {
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        
    }
}


-(BOOL)logMeIn
{
    return [Utility fetchNSUserDataForKey:@"isSaved"].boolValue;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.userNameTextField.text = @"";
    self.passwordTextField.text = @"";
    [self addImageIntoUserAndPasswordField];
    [self addCheckBox];
    [self loginCheck];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


-(void)addImageIntoUserAndPasswordField
{
    UIImageView *lockIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile.png"]];
    lockIcon.frame = CGRectMake(0, 0, 30.f, 30.f);
    self.userNameTextField.leftView = lockIcon;
    self.userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *psdIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lockIcon.png"]];
    psdIcon.frame = CGRectMake(0, 0, 30.f, 30.f);
    self.passwordTextField.leftView = psdIcon;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
}

-(void)addCheckBox
{

    [self.checkBox setBackgroundImage:[UIImage imageNamed:@"logOff.png"] forState:UIControlStateNormal];
    [self.checkBox setBackgroundImage:[UIImage imageNamed:@"Loging.png"] forState:UIControlStateSelected];
    [self.checkBox addTarget:self action:@selector(checkBoxSelected:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)checkBoxSelected:(id)sender
{
    if([self.checkBox isSelected]==YES)
    {
        [self.checkBox setSelected:NO];
    }
    else{
        [self.checkBox setSelected:YES];
    }
    
}





- (IBAction)logIn:(id)sender {

    if(self.userNameTextField.text.length == 0 && self.passwordTextField.text.length == 0)
        [self promptErrorMessage:@"Empty User Name and Password"];
    else if(self.userNameTextField.text.length == 0)
        [self promptErrorMessage:@"Empty User Name"];
    else if(self.passwordTextField.text.length == 0)
        [self promptErrorMessage:@"Empty Password"];
    else if([self.userNameTextField.text isEqualToString:[Utility fetchNSUserDataForKey:@"userName"]]  && [self.passwordTextField.text isEqualToString:[Utility fetchNSUserDataForKey:@"password"]] )
    {
        [self saveLoginCredential];
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        
    }
    else if(![self.userNameTextField.text isEqualToString:[Utility fetchNSUserDataForKey:@"userName"]] && ![self.passwordTextField.text isEqualToString:[Utility fetchNSUserDataForKey:@"password"]] )
    {
        [self promptErrorMessage:@"Wrong User Name and Password"];
    }
    else if(![self.userNameTextField.text isEqualToString:[Utility fetchNSUserDataForKey:@"userName"]])
    {
        [self promptErrorMessage:@"Worng User Name"];
    }
    else
        [self promptErrorMessage:@"Wrong Password"];
}



-(void)promptErrorMessage:(NSString *)message
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert!" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
    
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}



-(void)saveLoginCredential
{

    NSString* login;
    if(self.checkBox.selected)
        login = @"YES";
    else
        login = @"NO";
    
    [Utility saveUserDataToNSUserDefaultForKey:@"isSaved" withValue:login];
    
}



- (IBAction)signUp:(id)sender {
}

@end
