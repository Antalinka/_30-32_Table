//
//  GRViewController.m
//  _31_TableAditingTest
//
//  Created by Exo-terminal on 6/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

/*Ученик.
 
 1. Создайте таблицу которая содержит 1000 разных ячеек.
 2. для каждой ячейки генирируйте радномный цвет.
 3. RGB данные пишите в тексте ячейки, например: RGB(10,20,255)
 4. Также раскрашивайте текст ячейки этим цветом.
 */

#import "GRViewController.h"

@interface GRViewController ()

@property(strong, nonatomic)NSString* textCell;
@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Edit

-(UIColor*) randomColor{
    
    
    
    CGFloat r = (CGFloat)(arc4random() %256)/255;
    
    CGFloat g = (CGFloat)(arc4random() %256)/255;
    
    CGFloat b = (CGFloat)(arc4random() %256)/255;
    
    self.textCell = [NSString stringWithFormat:@"RGB: Red = %.0f%%, Green = %.0f%%, Blue = %.0f%%",r*100,g*100,b*100];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1000;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"a"];
    }
    
    UIFont* font = [UIFont fontWithName: @"Thonburi" size:12];
    
    cell.backgroundColor = [self randomColor];
    
    cell.textLabel.text = self.textCell;
    cell.textLabel.font = font;
    
    
    return cell;
}

@end
