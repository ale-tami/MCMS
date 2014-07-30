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
@property UIImage *image;
@property NSMutableArray *accesories;

- (instancetype) initWithName: (NSString *) name withDescription: (NSString *) description andWithImage: (UIImage*) image;

@end
