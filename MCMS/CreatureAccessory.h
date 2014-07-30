//
//  CreatureAccessory.h
//  MCMS
//
//  Created by Alejandro Tami on 30/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreatureAccessory : NSObject

@property NSString * accesoryName;
@property int power;

- (instancetype) initWithName: (NSString *) name andWithPower: (int) power;


@end
