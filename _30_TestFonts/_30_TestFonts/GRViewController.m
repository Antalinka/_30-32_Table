//
//  GRViewController.m
//  _30_TestFonts
//
//  Created by Exo-terminal on 6/11/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSLog(@"numberOfSectionsInTableView");
    return [[UIFont familyNames]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"numberOfRowsInSection, %d", section);
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    return [fontNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"cellForRowAtIndexPath  {%d, %d}",indexPath.section, indexPath.row);
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
     
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaaa"];
    }
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:indexPath.section];
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];

    UIFont* font = [UIFont fontWithName:fontName size:26];
    
    cell.textLabel.text = fontName;
    cell.textLabel.font = font;
    
    return cell;
    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:section];
    
    return familyName;
}


@end















