//
//  Utility.h
//  LoginPage
//
//  Created by Aditya Kumar on 07/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

+(NSString* )colorToString:(UIColor* )color;
+(UIColor* )stringToColor:(NSString* )colorString;



+(void)saveUserDataToNSUserDefaultForKey:(NSString *)key withValue:(NSString *)value;
+(NSString *)fetchNSUserDataForKey:(NSString *)keyString;
@end
