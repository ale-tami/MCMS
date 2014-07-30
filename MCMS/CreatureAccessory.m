//
//  CreatureAccessory.m
//  MCMS
//
//  Created by Alejandro Tami on 30/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "CreatureAccessory.h"

@implementation CreatureAccessory

- (instancetype) initWithName: (NSString *) name andWithPower: (int) power
{
    self = [super init];
    
    self.accesoryName = name;
    self.power = power;
    
    return self;
}

@end
