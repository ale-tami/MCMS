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
#import "BattleViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *addCreatureField;
@property (weak, nonatomic) IBOutlet UITableView *myTable;

@property NSMutableArray *creatures;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.myTable reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MagicalCreature *magicalCreature1 = [[MagicalCreature alloc]
                                         initWithName:@"Elf"
                                         withDescription:@"Never seen an elf before?"
                                         andWithImage: [UIImage imageNamed:@"elf" ]];
    MagicalCreature *magicalCreature2 = [[MagicalCreature alloc]
                                         initWithName:@"Diablo"
                                         withDescription:@"Lord of terror!!"
                                         andWithImage: [UIImage imageNamed:@"diablo"]];
    MagicalCreature *magicalCreature3 = [[MagicalCreature alloc]
                                         initWithName:@"Chuck Norris"
                                         withDescription:@"Cannot describe"
                                         andWithImage: [UIImage imageNamed:@"chuck" ]];
    
    self.creatures = [NSMutableArray arrayWithObjects:
                      magicalCreature1,
                      magicalCreature2,
                      magicalCreature3,
                      nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"]) {
        EditCreatureViewController *editCreatureVC = (EditCreatureViewController *)[segue destinationViewController];
        editCreatureVC.creature = [self.creatures objectAtIndex:[self.myTable indexPathForSelectedRow].row];
    } else {
        BattleViewController *bvc = (BattleViewController *)[segue destinationViewController];
        bvc.creature1 = [self.creatures objectAtIndex:arc4random() %3];
        bvc.creature2 = [self.creatures objectAtIndex:arc4random() %3];
    }
}


- (IBAction)onAdd:(id)sender {
    
    [self.addCreatureField resignFirstResponder];
    
    MagicalCreature *creature = [[MagicalCreature alloc]
                                 initWithName:self.addCreatureField.text
                                 withDescription:@"N/A"
                                 andWithImage: nil];
    
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

