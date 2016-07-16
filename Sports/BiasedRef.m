//
//  BiasedRef.m
//  Sports
//
//  Created by Cory Alder on 2016-07-16.
//  Copyright © 2016 Davander Mobile Corporation. All rights reserved.
//

#import "BiasedRef.h"

@implementation BiasedRef

-(BOOL)team:(Team *)team shouldScore:(int)numberOfPoints {
    return team == self.favouriteTeam;
}

@end
