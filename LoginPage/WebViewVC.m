//
//  WebViewVC.m
//  LoginPage
//
//  Created by Aditya Kumar on 10/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "WebViewVC.h"

@interface WebViewVC ()

@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadWebsite];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)loadWebsite
{

    NSString *link = @"http://www.mindfiresolutions.com";
    NSURL *url = [NSURL URLWithString:link];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.viewWeb loadRequest:requestObj];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CancelWebView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
