//
//  MagicalCreature.h
//  MCMS
//
//  Created by Alejandro Tami on 29/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *description;

- (instancetype) initWithName:(NSString *) name andDescription:(NSString *) description;

@end
