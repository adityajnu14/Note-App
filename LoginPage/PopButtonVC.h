//
//  PopButtonVC.h
//  LoginPage
//
//  Created by Aditya Kumar on 13/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopButtonVC : UIViewController


@property (strong, nonatomic)UIColor* tagButtonColor;
@property BOOL secure;


@property (weak, nonatomic) IBOutlet UIButton *redButtonTag;
@property (weak, nonatomic) IBOutlet UIButton *greenButtonTag;

@property (weak, nonatomic) IBOutlet UIButton *yellowButtonTag;



@end
