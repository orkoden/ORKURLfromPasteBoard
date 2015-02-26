//
//  ORKLinkDataDetectorTest.m
//  ORKURLfromPasteBoard
//
//  Created by Jörg Bühmann on 26.02.15.
//  Copyright (c) 2015 orkoden. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ORKLinkDataDetector.h"

@interface ORKLinkDataDetectorTest : XCTestCase

@end

@implementation ORKLinkDataDetectorTest

-(NSString*) textWithURLs
{
    return @"---日本語スレッド Welcome to Japanese General---日本語/日本文化/アニメについて、日本語や英語で話すスレッドです。お気軽にどうぞ。This thread is for random talk about Japanese language, culture and anime in Japanese or English. Take it easy! 前スレがAUTOSÄGEったので >27303932 ポップアップ辞書：>https://addons.mozilla.org/ja/firefox/addon/webliopane>http://rikaisama.sourceforge.net/\nHow to Learn Japanese：>https://docs.google.com/document/d/1G5C7fCe07CDzYalZYZObzxv_fhw7RUNsLHiMAY-t7FA/mobilebasic?pli=1 4chan/int/日本語スレッド： http://boards.4chan.org/int/catalog で Japanese を検索。";
}

- (NSArray* ) allURLS
{
    return @[@"https://addons.mozilla.org/ja/firefox/addon/webliopane", @"http://rikaisama.sourceforge.net/", @"https://docs.google.com/document/d/1G5C7fCe07CDzYalZYZObzxv_fhw7RUNsLHiMAY-t7FA/mobilebasic?pli=1", @"http://boards.4chan.org/int/catalog"];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAllLinks {
    ORKLinkDataDetector* linkDetector = [[ORKLinkDataDetector alloc] initWithString:[self textWithURLs]];
    NSArray* testedlinks = [linkDetector allLinkStrings];
    NSArray* allURLs = [self allURLS];
    XCTAssertEqual(testedlinks.count, allURLs.count);
    XCTAssertTrue([testedlinks isEqualToArray:allURLs]);
}

- (void) testFirstLink{
    ORKLinkDataDetector* linkDetector = [[ORKLinkDataDetector alloc] initWithString:[self textWithURLs]];
    XCTAssertTrue([[[self allURLS]firstObject] isEqualToString:[linkDetector firstLinkString]]);    
}

@end
