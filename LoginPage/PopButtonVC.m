//
//  PopButtonVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 13/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "PopButtonVC.h"

@interface PopButtonVC ()

@end

@implementation PopButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTagButton];
    _secure = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTagButton
{
    self.redButtonTag.layer.cornerRadius = self.redButtonTag.frame.size.width/2.0f;
    self.redButtonTag.backgroundColor = [UIColor redColor];
    self.greenButtonTag.layer.cornerRadius = self.greenButtonTag.frame.size.width/2.0f;
    self.greenButtonTag.backgroundColor = [UIColor greenColor];
    self.yellowButtonTag.layer.cornerRadius = self.yellowButtonTag.frame.size.width/2.0f;
    self.yellowButtonTag.backgroundColor = [UIColor yellowColor];

}

- (void)tagButtonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    self.tagButtonColor = button.backgroundColor;
   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self tagButtonPressed:sender];
}



@end
