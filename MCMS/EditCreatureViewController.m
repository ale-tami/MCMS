//
//  EditCreatureViewController.m
//  MCMS
//
//  Created by Alejandro Tami on 29/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "EditCreatureViewController.h"
#import "CreatureAccessory.h"

@interface EditCreatureViewController () 

@property (weak, nonatomic) IBOutlet UITextField *creatureName;
@property (weak, nonatomic) IBOutlet UITextField *creatureDescription;
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatureDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage;
@property (weak, nonatomic) IBOutlet UITableView *accessoriesTable;
@property (weak, nonatomic) IBOutlet NSMutableArray *accessoriesArray;

@property BOOL isEditing;
@property int selectionCounter;

@end

@implementation EditCreatureViewController


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    NSArray * aux = [self.accessoriesTable indexPathsForSelectedRows];
    
    for (NSIndexPath *ip in aux) {
        
        UITableViewCell * cell = [self.accessoriesTable cellForRowAtIndexPath:ip];
        
        CreatureAccessory *ca =  [[CreatureAccessory alloc]
                                  initWithName:cell.textLabel.text
                                  andWithPower:[cell.detailTextLabel.text intValue]];
        
        [self.creature.accesories addObject:ca];
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.creature) {
        self.creatureDescriptionLabel.text = self.creature.description;
        self.creatureNameLabel.text = self.creature.name;
        
        self.creatureDescription.text = self.creature.description;
        self.creatureName.text = self.creature.name;
        self.creatureImage.image = self.creature.image;
        
        self.creatureName.hidden = YES;
        self.creatureDescription.hidden = YES;
        
        [self createAccessories];
    }
    
    self.isEditing = NO;

}

- (void) createAccessories
{
    int swordPower = rand() % 50 + 100;
    int rapierPower = rand() % 20 + 90;
    int extraFistPower = rand() % 90;
    int extraFootPower = rand() % 100;
    
    

    CreatureAccessory *accessory1 = [[CreatureAccessory alloc]
                                         initWithName:@"Sword of Misery"
                                         andWithPower:swordPower];
    CreatureAccessory *accessory2 = [[CreatureAccessory alloc]
                                         initWithName:@"Rapier sword"
                                     andWithPower:rapierPower];
    CreatureAccessory *accessory3 = [[CreatureAccessory alloc]
                                         initWithName:@"Extra fist"
                                        andWithPower:extraFistPower];
    CreatureAccessory *accessory4 = [[CreatureAccessory alloc]
                                     initWithName:@"Extra foot"
                                     andWithPower:extraFootPower];
    
    self.accessoriesArray = [NSMutableArray arrayWithObjects:
                      accessory1,
                      accessory2,
                      accessory3,
                      accessory4,
                      nil];
    
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




- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.indexPathsForSelectedRows.count > 1){
       
        return nil;
        
    } else {
        
        return indexPath;

    }
}

#pragma mark Data Source

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.accessoriesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
    CreatureAccessory *accessory = [self.accessoriesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = accessory.accesoryName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i",accessory.power ];
    
    return cell;
    
}


@end
