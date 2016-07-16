//
//  Team.h
//  Sports
//
//  Created by Cory Alder on 2016-07-16.
//  Copyright © 2016 Davander Mobile Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Team;

@protocol TeamDelegate <NSObject>

-(BOOL)team:(Team *)team shouldScore:(int)numberOfPoints;

@end

@interface Team : NSObject


- (instancetype)initWithPlayers:(int)players andScoreIncrement:(int)scoreIncrement;

@property (nonatomic, weak) id<TeamDelegate> delegate;
@property (nonatomic) int score;
@property (nonatomic) int scoreIncrement;
@property unsigned int players;

-(void)increaseScore;

@end
