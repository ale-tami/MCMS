//
//  BattleViewController.m
//  MCMS
//
//  Created by Alejandro Tami on 30/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "BattleViewController.h"
#import "CreatureAccessory.h"


@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage1;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage2;

@end

@implementation BattleViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.creatureImage1.image = self.creature1.image;
    self.creatureImage2.image = self.creature2.image;

}
- (IBAction)onFIght:(id)sender {
    
    MagicalCreature * winner = [self getWinner];
    
    UIAlertView * alertView = [[UIAlertView alloc]init];
    alertView.title = @"Fight Result!";
    alertView.message = [winner.name stringByAppendingString:@" won!"];
    [alertView addButtonWithTitle:@"COOL!!"];
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    
    [alertView show];

}

- (MagicalCreature*) getWinner
{
    NSArray * accessoriesCreature1 = self.creature1.accesories;
    NSArray * accessoriesCreature2 = self.creature2.accesories;
    
    int powerCreature1 = 0;
    int powerCreature2 = 0;
    
    if (accessoriesCreature1) {
        for (CreatureAccessory *ca in accessoriesCreature1) {
            powerCreature1 += ca.power;
        }
    } else {
        powerCreature1 = 0;
    }
    
    if (accessoriesCreature2) {
        for (CreatureAccessory *ca in accessoriesCreature2) {
            powerCreature2 += ca.power;
        }
    } else {
        powerCreature2 = 0;
    }
    
    int totalPowerCreature1 = rand() % 200 + powerCreature1;
    int totalPowerCreature2 = rand() % 200 + powerCreature2;
    
    if (totalPowerCreature1 > totalPowerCreature2) {
        return self.creature2;
    } else if (totalPowerCreature1 < totalPowerCreature2) {
        return self.creature1;
    } else {
        return nil;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
