//
//  PasteboardChecker.h
//  Secure Web
//
//  Created by Jörg Bühmann on 23.02.15.
//  Copyright (c) 2015 Jörg Bühmann. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface ORKPasteboardURLChecker : NSObject
@property (nonatomic, strong) UIPasteboard* pasteboard; // if not set, the general pasteboard is used

-(NSURL *) firstURL;   // returns first URL found in pasteboard
-(NSArray *) allURLs;
-(NSOrderedSet *) allURLsUnique;

@end

