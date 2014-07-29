//
//  MagicalCreature.m
//  MCMS
//
//  Created by Alejandro Tami on 29/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

- (instancetype) initWithName: (NSString *) name andDescription: (NSString *) description
{
    self = [super init];
    
    self.name = name;
    self.description = description;
    
    return self;
}

@end
