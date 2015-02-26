//
//  ViewController.m
//  ORKURLfromPasteBoard
//
//  Created by Jörg Bühmann on 23.02.15.
//  Copyright (c) 2015 Jörg Bühmann. All rights reserved.
//

#import "ViewController.h"
#import "ORKPasteboardURLChecker.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *detectedURLField;
@property (strong, nonatomic) ORKPasteboardURLChecker* pasteBoardChecker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pasteBoardChecker = [[ORKPasteboardURLChecker alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didHideEditMenu:) name:UIMenuControllerDidHideMenuNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didHideEditMenu: (NSNotification*) notification
{
    NSArray* detectedURLs = [self.pasteBoardChecker allURLs];
    self.detectedURLField.text = [detectedURLs componentsJoinedByString:@", "];
}

@end
