//
//  ORKURLfromPasteBoardTests.m
//  ORKURLfromPasteBoardTests
//
//  Created by Jörg Bühmann on 23.02.15.
//  Copyright (c) 2015 Jörg Bühmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
@import MobileCoreServices;
#import "ORKPasteboardURLChecker.h"

@interface ORKPasteBoardCheckerTest : XCTestCase
@property (nonatomic, strong) ORKPasteboardURLChecker* pasteBoardChecker;
@end

@implementation ORKPasteBoardCheckerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.pasteBoardChecker = [ORKPasteboardURLChecker new];
    self.pasteBoardChecker.pasteboard = [UIPasteboard pasteboardWithUniqueName];
    [self.pasteBoardChecker.pasteboard setValue:[self textWithURLs] forPasteboardType: (__bridge NSString*) kUTTypePlainText];
}

- (void)tearDown {
    self.pasteBoardChecker = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSString*) textWithURLs
{
    return  @"Bernd, können wir in diesem Faden unsere Informationsquellen zusammentragen? Damit meine ich hauptsächlich Nachrichteninternetseiten die sich run um alles drehen was /c/ betrifft. Es wäre dabei sehr interessant, wenn man hier auf die verschiedenen Bereiche eingeht.\n\nIch habe seit über einem Jahr mich eigentlich nicht mehr tiefergehend damit beschäftigt und weiß nicht mehr was gute Quellen sind.\n\n>>\n Bernd 2015-02-23 20:59:39.575491 Nr. 197744  \ngute Idee. Ich fang an:\n\nmetallwoche.de\nfaz.net\nhandelsblatt.com\n\n>>\n Bernd 2015-02-23 21:03:44.348001 Nr. 197745  \n>>197744\n> Nachrichteninternetseiten die sich run um alles drehen was /c/ betrifft. \nTroll fil?\n\n>>\n Bernd 2015-02-23 21:12:55.037972 Nr. 197746  \nhttp://www.heise.de/newsticker/classic/\nhttp://www.golem.de/ticker/\n\n>>\n Bernd 2015-02-23 22:11:36.558524 Nr. 197751  \nboards.4chan.org/g\n\n>>\n Bernd 2015-02-24 00:30:00.75498 Nr. 197764  \nslashdot.com\n\n>>\n Bernd 2015-02-24 01:26:23.48957 Nr. 197766  \nhttp://arstechnica.com\nhttps://news.ycombinator.com\n\narstechnica.com\n";
}

-(NSArray*) urls
{
    NSArray* strings = @[@"http://metallwoche.de", @"http://faz.net", @"http://handelsblatt.com", @"http://www.heise.de/newsticker/classic/", @"http://www.golem.de/ticker/", @"http://boards.4chan.org/g", @"http://slashdot.com", @"http://arstechnica.com", @"https://news.ycombinator.com", @"http://arstechnica.com"];
    NSMutableArray* urls = [NSMutableArray arrayWithCapacity:strings.count];
    for (NSString* st in strings) {
        [urls addObject:[NSURL URLWithString:st]];
    }
    return urls;
}

- (void)testFirstURL {

    XCTAssertTrue([[self.pasteBoardChecker firstURL] isEqual:[NSURL URLWithString:@"http://metallwoche.de"]]);
}

- (void)testAllURLs
{
    NSArray* allURls = [self.pasteBoardChecker allURLs];
    NSArray* testURLs = [self urls];
    XCTAssertEqual(allURls.count, testURLs.count);
    XCTAssertTrue([allURls isEqualToArray: testURLs]);
}

- (void) testAllURLsUnique
{
    NSOrderedSet* set = [self.pasteBoardChecker allURLsUnique];
    NSOrderedSet* otherSet = [NSOrderedSet orderedSetWithArray:[self urls]];
    XCTAssertTrue([set isEqualToOrderedSet:otherSet]);
}

@end
