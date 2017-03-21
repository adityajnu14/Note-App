//
//  SignUpVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 06/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "SignUpVC.h"
#import "Utility.h"

@interface SignUpVC ()<UITextFieldDelegate>
{
    BOOL formFieldCheck;
    NSString* formFillErrorMassage;
}
@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizignNavigationBar];
    formFieldCheck = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)customizignNavigationBar
{
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"Notes";
}



- (IBAction)signUp_Action:(id)sender {
    
    // This method is is to check input data
    [self isEmptyText];
    if(formFieldCheck == NO)
    {
        [self promptErrorMassage:formFillErrorMassage];
    }
    
    else if([self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text])
    {

        [Utility saveUserDataToNSUserDefaultForKey:@"firstName" withValue:self.firstNameTextField.text];
        [Utility saveUserDataToNSUserDefaultForKey:@"lastName" withValue:self.lastNameTextField.text];
        [Utility saveUserDataToNSUserDefaultForKey:@"userName" withValue:self.userNameTextField.text];
        [Utility saveUserDataToNSUserDefaultForKey:@"password" withValue:self.passwordTextField.text];
        [Utility saveUserDataToNSUserDefaultForKey:@"phone" withValue:self.phoneTextField.text];
        [Utility saveUserDataToNSUserDefaultForKey:@"email" withValue:self.emailTextField.text];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    else
    {
        [self promptErrorMassage:@"Pasword does not match"];
        
    }
    [self.navigationController popToRootViewControllerAnimated:true];
}


-(void)isEmptyText
{
        if(self.firstNameTextField.text.length == 0)
        {
            formFieldCheck = NO;
            formFillErrorMassage =@"First Name Cannot be null";
        }
        else if(self.lastNameTextField.text.length == 0)
        {
            formFieldCheck = NO;
            formFillErrorMassage =@"Last Name Cannot be null";
        }
        else if(self.userNameTextField.text.length == 0)
        {
            formFieldCheck = NO;
            formFillErrorMassage =@"User Name Cannot be null";
        }
        else if(self.passwordTextField.text.length == 0)
        {
            formFieldCheck = NO;
            formFillErrorMassage =@"Password Cannot be null";
        }
        else if(self.confirmPasswordTextField.text.length == 0)
        {
            formFieldCheck = NO;
            formFillErrorMassage =@"Confirm Password Should be same";
        }
        else if(self.emailTextField.text.length == 0)
        {
            formFieldCheck = NO;
            formFillErrorMassage =@"Email Cannot be null";
        }
        else if(self.phoneTextField.text.length == 0)
        {
            formFieldCheck = NO;
            formFillErrorMassage =@"Phone No Cannot be null";
        }
        else
        {
            formFieldCheck = YES;
            formFillErrorMassage = @"";
        }
    

}


-(void)promptErrorMassage:(NSString *)errorMassage
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert !" message:errorMassage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
    
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}




#pragma mark - UITextFieldDelegate


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if(textField.tag == 1 || textField.tag == 2 || textField.tag == 3)
        [_myScrollView setContentOffset:CGPointZero animated:YES];
        
    if(textField.tag == 4 || textField.tag == 5 || textField.tag == 6)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}



- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if(textField.tag == 5)
    {
        if(![self isNumeric:self.phoneTextField.text])
        {
            self.phoneTextField.text = @"";
            [self promptErrorMassage:@"This in not a valid number"];
            
        }
    }
    else if(textField.tag == 6)
    {
        formFieldCheck = [self validateEmailWithString:self.emailTextField.text];
        formFillErrorMassage = @"Invalid Email";
    }
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}







- (void)keyboardDidShow:(NSNotification *)notification
{
    
    CGSize _keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGPoint scrollPoint = CGPointMake(0,_keyboardSize.height);
    [_myScrollView setContentOffset:scrollPoint animated:YES];
    
}


-(void)keyboardDidHide:(NSNotification *)notification
{
    [_myScrollView setContentOffset:CGPointZero animated:YES];
    
}




- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


-(BOOL)isNumeric:(NSString*)inputString
{
    BOOL isValid = NO;
    NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:inputString];
    isValid = [alphaNumbersSet isSupersetOfSet:stringSet];
    return isValid;
}




@end
