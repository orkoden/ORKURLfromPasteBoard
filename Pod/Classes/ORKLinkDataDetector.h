//
//  ORKLinkDataDetector.h
//  ORKURLfromPasteBoard
//
//  Created by Jörg Bühmann on 23.02.15.
//  Copyright (c) 2015 orkoden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ORKLinkDataDetector : NSObject
@property (nonatomic, copy) NSString* detectionString;
-(instancetype) initWithString:(NSString*) detectionString;

-(NSString*) firstLinkString;
-(NSArray*) allLinkStrings;

@end
