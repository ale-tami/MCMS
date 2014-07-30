//
//  MagicalCreature.m
//  MCMS
//
//  Created by Alejandro Tami on 29/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

- (instancetype) initWithName: (NSString *) name withDescription: (NSString *) description andWithImage: (UIImage*) image
{
    self = [super init];
    
    self.name = name;
    self.description = description;
    self.image = image;
    
    return self;
}

@end
