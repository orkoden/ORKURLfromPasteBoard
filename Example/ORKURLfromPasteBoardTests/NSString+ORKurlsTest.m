//
//  NSString+ORKurlsTest.m
//  ORKURLfromPasteBoard
//
//  Created by Jörg Bühmann on 26.02.15.
//  Copyright (c) 2015 orkoden. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+ORKurls.h"

@interface NSString_ORKurlsTest : XCTestCase

@end

@implementation NSString_ORKurlsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testork_url
{
    NSArray* shouldproduceURLs = @[@"http://blalla.com",@"https://uhuhu.museum",@"foo.org", @"foo.âbcdéf.example"];
    NSArray* expectedURLs = @[@"http://blalla.com",@"https://uhuhu.museum",@"http://foo.org", @"http://foo.xn--bcdf-9na9b.example"];
    XCTAssertEqual(shouldproduceURLs.count, expectedURLs.count);
    
    for (int i = 0; i < shouldproduceURLs.count; i++) {
        XCTAssertTrue([[(NSString*)shouldproduceURLs[i] ork_url] isEqual:[NSURL URLWithString: expectedURLs[i]]]);
    }
    
    NSArray* shouldproduceNoURLs = @[@"some words", @"hhh: :/bla"];
    for (NSString* notaURL in shouldproduceNoURLs) {
        XCTAssertNil([notaURL ork_url]);
    }
}

-(void) testork_isURL
{
    NSArray* correctURLs = @[@"http://www.google.de",
                             @"https://user:password@example.com",
                             @"http://bla.laber.foo.bar.example.museum",
                             @"http://bla.laber.foo.bar.example.museum/fooo/?lalala=lalala",
                             @"https://user:password@example.com:99",
                             @"http://vnc.example.com:5800",
                             @"https://username:password@domain.dom:port/path?query_string#fragment_id",
                             @"http://en.wikipedia.org/wiki/BSD_(disambiguation)"
                             ];
    for (NSString* possibleString in correctURLs) {
        XCTAssertTrue([possibleString ork_isURL], @"URL: %@ should be okay, but isn't", possibleString);
    }
    
    
    NSArray* inCorrectURLs = @[@"This is a wonderful story about you and me.",
                               @"nogoodscheme://bla.com",
                               @"$%+)(_*^&^*$%&#$*^(&)"
                               ];
    for (NSString* possibleString in inCorrectURLs) {
        XCTAssertFalse([possibleString ork_isURL], @"URL: %@ should not be okay, but is", possibleString);
    }
    
}

-(void)canBeTurnedIntoURL
{
    NSArray* correctURLs = @[@"http://www.google.de",
                             @"https://username:password@domain.dom:port/path?query_string#fragment_id",
                             @"www.google.com",
                             @"bla.de",
                             @"en.wikipedia.org/wiki/BSD_(disambiguation)"
                             ];
    for (NSString* possibleString in correctURLs) {
        XCTAssertTrue([possibleString ork_canBeTurnedIntoURL], @"URL: %@ should be okay, but isn't", possibleString);
    }
    
    
    NSArray* inCorrectURLs = @[@"This is a wonderful story about you and me.",
                               @"$%+)(_*^&^*$%&#$*^(&)",
                               @"foobar"
                               ];
    for (NSString* possibleString in inCorrectURLs) {
        XCTAssertFalse([possibleString ork_canBeTurnedIntoURL], @"URL: %@ should not be okay, but is", possibleString);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
