//
//  Team.m
//  Sports
//
//  Created by Cory Alder on 2016-07-16.
//  Copyright © 2016 Davander Mobile Corporation. All rights reserved.
//

#import "Team.h"

@implementation Team

- (instancetype)initWithPlayers:(int)players andScoreIncrement:(int)scoreIncrement {
    self = [super init];
    if (self) {
        _players = players;
        _scoreIncrement = scoreIncrement;
    }
    return self;
}

-(void)increaseScore {
    if (!self.delegate) {
        self.score += self.scoreIncrement;
    } else {
        if ([self.delegate team:self shouldScore:self.scoreIncrement]) {
            self.score += self.scoreIncrement;
        }
    }
}

@end
