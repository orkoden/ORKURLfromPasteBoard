//
//  ORKLinkDataDetector.m
//  ORKURLfromPasteBoard
//
//  Created by Jörg Bühmann on 23.02.15.
//  Copyright (c) 2015 orkoden. All rights reserved.
//

#import "ORKLinkDataDetector.h"

@interface ORKLinkDataDetector ()
@property (nonatomic, strong) NSDataDetector* urlDataDetector;
@end

@implementation ORKLinkDataDetector
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSError* err = nil;
        _urlDataDetector = [[NSDataDetector alloc] initWithTypes:NSTextCheckingTypeLink error: &err];
        if (err) {
            @throw [NSException exceptionWithName:@"Could not instantiate NSDataDetector" reason:err.localizedDescription userInfo:nil];
        }
    }
    return self;
}

-(instancetype) initWithString:(NSString*) detectionString
{
    self = [self init];
    self.detectionString = detectionString;
    return self;
}

-(NSString*) firstLinkString
{
    NSString* possibleURL = nil;
    NSTextCheckingResult* urlTestResult = [self.urlDataDetector firstMatchInString:self.detectionString options:kNilOptions range:NSMakeRange(0, [self.detectionString length])];
    if (urlTestResult) {
        possibleURL = [self.detectionString substringWithRange:urlTestResult.range];
    }
    return possibleURL;
}

-(NSArray*) allLinkStrings
{
    NSMutableArray* possibleURLs = [NSMutableArray new];
    NSArray* matches = [self.urlDataDetector matchesInString:self.detectionString options:kNilOptions range: NSMakeRange(0, self.detectionString.length)];
    for (NSTextCheckingResult* urlTestResult in matches) {
        if (urlTestResult) {
            [possibleURLs addObject: [self.detectionString substringWithRange:urlTestResult.range]];
        }
    }
    return possibleURLs;
}

@end
