//
//  EditCreatureViewController.m
//  MCMS
//
//  Created by Alejandro Tami on 29/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "EditCreatureViewController.h"

@interface EditCreatureViewController ()

@property (weak, nonatomic) IBOutlet UITextField *creatureName;
@property (weak, nonatomic) IBOutlet UITextField *creatureDescription;
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatureDescriptionLabel;

@property BOOL isEditing;

@end

@implementation EditCreatureViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.creature) {
        self.creatureDescriptionLabel.text = self.creature.description;
        self.creatureNameLabel.text = self.creature.name;
        
        self.creatureDescription.text = self.creature.description;
        self.creatureName.text = self.creature.name;
        
        self.creatureName.hidden = YES;
        self.creatureDescription.hidden = YES;
    }
    
    self.isEditing = NO;

}


- (IBAction)onEdit:(UIBarButtonItem *)sender {
    
    if (self.isEditing) {
        
        sender.title = @"Edit";
        self.isEditing = NO;
        
        self.creatureName.hidden = YES;
        self.creatureDescription.hidden = YES;
        
        self.creature.description = self.creatureDescription.text;
        self.creature.name = self.creatureName.text;
        
        self.creatureDescriptionLabel.text = self.creature.description;
        self.creatureNameLabel.text = self.creature.name;
        
    } else {
        
        sender.title = @"Done";
        self.isEditing = YES;
        
        self.creatureName.hidden = NO;
        self.creatureDescription.hidden = NO;
    }
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}

@end
