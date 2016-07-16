//
//  BasketballTests.m
//  Sports
//
//  Created by Cory Alder on 2016-07-14.
//  Copyright © 2016 Davander Mobile Corporation. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BasketballTeam.h"

@interface BasketballTeam ()

-(void)increaseScore;
-(int)score;
-(unsigned int)players;

@end

@interface BasketballTests : XCTestCase

@property BasketballTeam *team;

@end

@implementation BasketballTests

- (void)setUp {
    [super setUp];
    self.team = [[BasketballTeam alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasketballScoreIncrement {
    
    int before = self.team.score;
    [self.team increaseScore];
    int after = self.team.score;
    
    XCTAssertEqual(after, before+2, @"score should increase by 2 when playing basketball");
}

-(void)testBasketballPlayerCount {
    XCTAssertEqual(self.team.players, 5, @"a basketball team should have five active players");
}

@end
