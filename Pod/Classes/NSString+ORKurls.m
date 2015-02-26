//
//  NSString+ORKurls.m
//  Secure Web
//
//  Created by Jörg Bühmann on 24.01.15.
//  Copyright (c) 2015 Jörg Bühmann. All rights reserved.
//

#import "NSString+ORKurls.h"
#import "NSStringPunycodeAdditions.h"
#import "NSCharacterSet+ORKurls.h"

@implementation NSString (ORKurls)

-(BOOL) ork_isURL
{
    BOOL charsAreValid = [self ork_containsOnlyValidURLChars];
    NSURL* url = [[NSURL alloc] initWithString:self];
    BOOL hostAndSchemeOK = url.host.length > 0 && [@[@"http", @"https"] containsObject:url.scheme];
    return charsAreValid && hostAndSchemeOK;
}

-(BOOL) ork_containsOnlyValidURLChars
{
    NSCharacterSet* invalidUrlCharacters = [[NSCharacterSet ork_validURLCharacterSet] invertedSet];
    return [self rangeOfCharacterFromSet:invalidUrlCharacters].location == NSNotFound;
}

-(NSString*) ork_prependHTTP
{
    return [[NSString alloc] initWithFormat:@"http://%@", self];
}

-(BOOL) ork_canBeTurnedIntoURL
{
    return [[self ork_prependHTTP] ork_isURL];
}

-(NSString*) ork_coerceIntoURL
{
    if ([self ork_canBeTurnedIntoURL]) {
        return [self ork_prependHTTP];
    }
    else{
        return nil;
    }
}

-(NSURL*) ork_url;
{
    NSString* possibleURL = self;
    BOOL validURL = NO;
    possibleURL = [possibleURL IDNAEncodedString];  //    convert possible URL to punycode to deal with internationalized domain names
    
    validURL = [possibleURL ork_isURL];    //    check if it's already a valid url (http://google.de)
    if (!validURL) {
        // if it's not a valid URL but something like yahoo.com , try to prepending http
        possibleURL = [possibleURL ork_coerceIntoURL];
        if (possibleURL) {
            validURL = YES;
        }
    }
    if (validURL) {
        return [[NSURL alloc] initWithString: possibleURL];
    }
    else{
        return nil;
    }
}

@end
