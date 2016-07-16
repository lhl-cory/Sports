//
//  SportTests.m
//  Sports
//
//  Created by Cory Alder on 2016-07-14.
//  Copyright © 2016 Davander Mobile Corporation. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BasketballTeam.h"
#import "HockeyTeam.h"
#import "Team.h"

@interface Team ()

- (instancetype)initWithPlayers:(int)players andScoreIncrement:(int)scoreIncrement;

-(void)increaseScore;

-(int)score;
-(unsigned int)players;

@end

@interface TeamTests : XCTestCase

@property (nonatomic, strong) Team *teamA;
@property (nonatomic, strong) Team *teamB;

@property (nonatomic, strong) Team *unknownTeam;

@end

@implementation TeamTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.teamA = [[BasketballTeam alloc] init];
    self.teamB = [[HockeyTeam alloc] init];
    
    self.unknownTeam = [[Team alloc] initWithPlayers:7 andScoreIncrement:5];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTeamHasSevenPlayers {
    XCTAssertEqual(self.unknownTeam.players, 7, @"this team, of unknown sport, should have seven players");
}

-(void)testTeamIncreasesScoreByFive {
    int before = self.unknownTeam.score;
    [self.unknownTeam increaseScore];
    int after = self.unknownTeam.score;
    
    XCTAssertEqual(after, before+5, @"score should increase by five");
}

-(void)testTeamAIsTeam {
    XCTAssertTrue([self.teamA isKindOfClass:[Team class]], @"Team A should be a subclass of Team");
}

-(void)testTeamBIsTeam {
    XCTAssertTrue([self.teamB isKindOfClass:[Team class]], @"Team B should be a subclass of Team");
}

@end
