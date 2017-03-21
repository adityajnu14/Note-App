//
//  LogInPageVC.h
//  LoginPage
//
//  Created by Aditya Kumar on 02/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInPageVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField* userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField* passwordTextField;
@property (nonatomic, retain)IBOutlet UIButton* checkBox;

- (IBAction)logIn:(id)sender;
- (IBAction)signUp:(id)sender;



@end
