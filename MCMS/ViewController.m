//
//  ViewController.m
//  MCMS
//
//  Created by Alejandro Tami on 29/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "EditCreatureViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *addCreatureField;
@property (weak, nonatomic) IBOutlet UITableView *myTable;

@property NSMutableArray *creatures;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MagicalCreature *magicalCreature1 = [[MagicalCreature alloc]
                                         initWithName:@"Elf-Panda"
                                         andDescription:@"Half elf, half panda"];
    MagicalCreature *magicalCreature2 = [[MagicalCreature alloc]
                                         initWithName:@"Diablo"
                                         andDescription:@"Lord of Terror"];
    MagicalCreature *magicalCreature3 = [[MagicalCreature alloc]
                                         initWithName:@"My Wife"
                                         andDescription:@"She is magical!!"];
    
    self.creatures = [NSMutableArray arrayWithObjects:
                      magicalCreature1,
                      magicalCreature2,
                      magicalCreature3,
                      nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EditCreatureViewController *editCreatureVC = (EditCreatureViewController *)[segue destinationViewController];
    
}



- (IBAction)onAdd:(id)sender {
    
    [self.addCreatureField resignFirstResponder];
    
    MagicalCreature *creature = [[MagicalCreature alloc]
                                 initWithName:self.addCreatureField.text                                                    andDescription:@"N/A"];
    
    [self.creatures addObject:creature];
    [self.myTable reloadData];
    self.addCreatureField.text = nil;
}


#pragma mark Data Source

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    
    return cell;
    
}

@end

