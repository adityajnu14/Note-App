//
//  Utility.m
//  LoginPage
//
//  Created by Aditya Kumar on 07/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Utility.h"

@implementation Utility


+(NSString* )colorToString:(UIColor* )color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    NSString* colorString = [NSString stringWithFormat:@"%f %f %f %f",components[0],components[1],components[2],components[3]];
    return colorString;
    
}


+(UIColor* )stringToColor:(NSString* )colorString
{
    
    NSArray *components = [colorString componentsSeparatedByString:@" "];
    CGFloat r = [[components objectAtIndex:0] floatValue];
    CGFloat g = [[components objectAtIndex:1] floatValue];
    CGFloat b = [[components objectAtIndex:2] floatValue];
    CGFloat a = [[components objectAtIndex:3] floatValue];
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:a];
    return color;
    
    
}


+(void)saveUserDataToNSUserDefaultForKey:(NSString *)key withValue:(NSString *)value
{
    NSUserDefaults* defaultsDataStore = [NSUserDefaults standardUserDefaults];
    [defaultsDataStore setObject:value forKey:key];
    [defaultsDataStore synchronize];

}


+(NSString *)fetchNSUserDataForKey:(NSString *)keyString
{
    NSUserDefaults* defaultsDataStore = [NSUserDefaults standardUserDefaults];
    return  [defaultsDataStore objectForKey:keyString];
        
}

@end
