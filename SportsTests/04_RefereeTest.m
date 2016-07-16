//
//  04_RefereeTest.m
//  Sports
//
//  Created by Cory Alder on 2016-07-16.
//  Copyright © 2016 Davander Mobile Corporation. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BasketballTeam.h"
#import "Team.h"
#import "FairRef.h"
#import "BiasedRef.h"


@interface Team ()

-(void)setDelegate:(id<TeamDelegate>)delegate;
-(void)increaseScore;
-(int)score;

@end

@interface BiasedRef ()

-(void)setFavouriteTeam:(Team *)team;

@end

@interface BasketballTeam ()

@end


@interface RefereeTest : XCTestCase

@property (nonatomic, strong) Team *teamA;
@property (nonatomic, strong) Team *teamB;

@property (nonatomic, strong) BiasedRef *biasedRef;
@property (nonatomic, strong) FairRef *fairRef;

@end

@implementation RefereeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.teamA = [[BasketballTeam alloc] init];
    self.teamB = [[BasketballTeam alloc] init];
    
    self.fairRef = [[FairRef alloc] init];
    
    self.biasedRef = [[BiasedRef alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFairRefAllowsScoringTeamA {
    int before = self.teamA.score;
    self.teamA.delegate = self.fairRef;
    
    [self.teamA increaseScore];
    int after = self.teamA.score;
    XCTAssertGreaterThan(after, before, @"A fair ref should allow team B to score");
    // !! remember as you green these next few tests, to re-run the previous test suites.
}

- (void)testFairRefAllowsScoringTeamB {
    int before = self.teamB.score;
    
    self.teamB.delegate = self.fairRef;
    
    [self.teamB increaseScore];
    int after = self.teamB.score;
    XCTAssertGreaterThan(after, before, @"A fair ref should allow team B to score");
}

- (void)testBiasedRefAllowsScoringTeamB {
    self.biasedRef.favouriteTeam = self.teamB;
    
    int before = self.teamB.score;
    
    self.teamB.delegate = self.biasedRef;
    
    [self.teamB increaseScore];
    int after = self.teamB.score;
    XCTAssertGreaterThan(after, before, @"A biased ref should allow team B to score");
}

- (void)testBiasedRefShouldNotAllowScoringTeamA {
    self.biasedRef.favouriteTeam = self.teamB;
    
    int before = self.teamA.score;
    
    self.teamA.delegate = self.biasedRef;
    
    [self.teamA increaseScore];
    int after = self.teamA.score;
    XCTAssertEqual(after, before, @"A biased ref should not allow team A to score, when team B is it's favourite team");
}

@end
