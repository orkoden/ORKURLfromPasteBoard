//
//  NSCharacterSet+ORKurls.m
//  ORKURLfromPasteBoard
//
//  Created by Jörg Bühmann on 23.02.15.
//  Copyright (c) 2015 orkoden. All rights reserved.
//

#import "NSCharacterSet+ORKurls.h"

@implementation NSCharacterSet (ORKurls)
+(NSCharacterSet*) ork_validURLCharacterSet
{
    NSCharacterSet* charSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~:/?#[]@!$&'()*+,;="];
    return charSet;
}

@end
