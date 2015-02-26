//
//  NSString+ORKurls.h
//  Secure Web
//
//  Created by Jörg Bühmann on 24.01.15.
//  Copyright (c) 2015 Jörg Bühmann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ORKurls)
-(NSURL*) ork_url;
-(BOOL) ork_isURL;
-(BOOL) ork_containsOnlyValidURLChars;
-(BOOL) ork_canBeTurnedIntoURL;
-(NSString*) ork_coerceIntoURL;
@end
