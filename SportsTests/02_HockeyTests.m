//
//  HockeyTests.m
//  Sports
//
//  Created by Cory Alder on 2016-07-14.
//  Copyright © 2016 Davander Mobile Corporation. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HockeyTeam.h"

@interface HockeyTeam ()

- (void)increaseScore;
-(int)score;
-(unsigned int)players;

@end

@interface HockeyTests : XCTestCase

@property (nonatomic, strong) HockeyTeam *team;

@end

@implementation HockeyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.team = [[HockeyTeam alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHockeyTeamCanScore {
    
    int before = self.team.score;
    [self.team increaseScore];
    int after = self.team.score;
    
    XCTAssertEqual(after, before+1, @"score should increase by 1 when playing hockey");
}

-(void)testHockeyTeamPlayerCount {
    XCTAssertEqual(self.team.players, 6, @"a hockey team should have six players on the ice.");
}

@end
