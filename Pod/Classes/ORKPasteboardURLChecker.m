//
//  PasteboardChecker.m
//  Secure Web
//
//  Created by Jörg Bühmann on 23.02.15.
//  Copyright (c) 2015 Jörg Bühmann. All rights reserved.
//

#import "ORKPasteboardURLChecker.h"
#import "NSString+ORKurls.h"
#import "ORKLinkDataDetector.h"

@import MobileCoreServices;

@interface ORKPasteboardURLChecker ()
@property (nonatomic, strong) ORKLinkDataDetector* urlDetector;
@end

@implementation ORKPasteboardURLChecker

-(UIPasteboard *)pasteboard
{
    if (!_pasteboard) {
        return [UIPasteboard generalPasteboard];
    }
    else {
        return _pasteboard;
    }
}

-(ORKLinkDataDetector*) urlDetector
{
    if (!_urlDetector) {
        _urlDetector = [[ORKLinkDataDetector alloc] init];
    }
    return _urlDetector;
}

- (void) updateDetectorWithPasteBoard
{
    NSString* pasteBoardContent = [self.pasteboard valueForPasteboardType: (__bridge NSString*)kUTTypeText];
    self.urlDetector.detectionString = pasteBoardContent;
}

-(NSURL *) firstURL;   // returns first URL found in pasteboard
{
    [self updateDetectorWithPasteBoard];
    NSString* possibleURL = [self.urlDetector firstLinkString];
    NSURL* detectedURL = [possibleURL ork_url];
    return detectedURL;
}

-(NSArray *) allURLs
{
    [self updateDetectorWithPasteBoard];

    NSArray* allLinkStrings = [self.urlDetector allLinkStrings];
    NSMutableArray* allURLs = [[NSMutableArray alloc] initWithCapacity:allLinkStrings.count];

    for (NSString* possibleURL in allLinkStrings) {
        NSURL* url = [possibleURL ork_url];
        if (url) {
            [allURLs addObject:url];
        }
    }
    return allURLs;
}

-(NSOrderedSet *) allURLsUnique
{
    return [NSOrderedSet orderedSetWithArray:[self allURLs]];
}


@end
