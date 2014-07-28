//
//  GRViewController.m
//  _30_Table_part1
//
//  Created by Exo-terminal on 6/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//


#import "GRViewController.h"
#import "GRColorGroup.h"
#import "GRStudents.h"

#define numberOfColor 10

@interface GRViewController ()

@property(strong, nonatomic)NSString* textCell;
@property(strong, nonatomic)NSMutableArray* colorArray;
@property(strong, nonatomic)NSMutableArray* studentsArray;
@property(strong, nonatomic)NSDictionary* studentsDictionary;
@property(strong, nonatomic)NSArray* keyFromDictionary;

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    
     self.colorArray = [[NSMutableArray alloc]init];
    
        for (int i = 0; i < numberOfColor; i++) {
        
        GRColorGroup* colorElement = [[GRColorGroup alloc]init];
        colorElement.name = [colorElement randomName];
        colorElement.color = [colorElement randomColor];
        colorElement.colorName = [colorElement editStringFromUIColor:colorElement.color];
  
        [self.colorArray addObject:colorElement];
    }
    
    self.studentsArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 90; i++) {
        
        GRStudents* student = [[GRStudents alloc]init];
        student.firstName = [student randomName];
        student.lastName = [student randomLastName];
        student.average = [student randomAverage];
        student.photoStudent = [student randomImage];
        student.colorName = [student groupStudents:student.average];
        
        [self.studentsArray addObject:student];
    }
    
    /*NSSortDescriptor* sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
    [self.studentsArray  sortUsingDescriptors:[NSArray arrayWithObject:sortByDate]];*/
    
    [self sortByAverage:self.studentsArray];

}

- (void)dealloc {
    [_tableView setDelegate:nil];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
}
/*-(UIColor*) randomColor{
    
    
    
    CGFloat r = (CGFloat)(arc4random() %256)/255;
    
    CGFloat g = (CGFloat)(arc4random() %256)/255;
    
    CGFloat b = (CGFloat)(arc4random() %256)/255;
    
    self.textCell = [NSString stringWithFormat:@"RGB: Red = %.0f%%, Green = %.0f%%, Blue = %.0f%%",r*100,g*100,b*100];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    
}*/

#pragma mark - sortArray

-(NSDictionary*)sortByAverage:(NSMutableArray*)myArray{
    
    NSMutableArray* twoness = [[NSMutableArray alloc]init];
    NSMutableArray* treeness = [[NSMutableArray alloc]init];
    NSMutableArray* fourness = [[NSMutableArray alloc]init];
    NSMutableArray* fiveness = [[NSMutableArray alloc]init];
    
    for (GRStudents* student in myArray) {
        
        switch (student.average) {
                
            case 2: [twoness addObject:student];
                break;
                
            case 3: [treeness addObject:student];
                break;
                
            case 4: [fourness addObject:student];
                break;
                
            case 5: [fiveness addObject:student];
                break;
            default:
                break;
        }
    }
    
    [self sortArrayByAlphabet:twoness];
    [self sortArrayByAlphabet:treeness];
    [self sortArrayByAlphabet:fourness];
    [self sortArrayByAlphabet:fiveness];
    
    NSDictionary* sortedStudents = [NSDictionary dictionaryWithObjectsAndKeys:
                                    fiveness,@"List fiveness students",
                                    twoness,@"List twoness students",
                                    treeness,@"List treeness students",
                                    fourness,@"List fourness students",
                                   nil];
    
    self.keyFromDictionary = [NSArray arrayWithObjects:@"List twoness students",@"List treeness students",@"List fourness students",@"List fiveness students",nil];
    return sortedStudents;
    
}

-(NSMutableArray*)sortArrayByAlphabet:(NSMutableArray*)myArray{
    
    NSSortDescriptor* sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
    [myArray sortUsingDescriptors:[NSArray arrayWithObject:sortByDate]];
    
    return myArray;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    self.studentsDictionary = [self sortByAverage:self.studentsArray];
//    self.keyFromDictionary = [self.studentsDictionary allKeys];
    
    return [self.keyFromDictionary count] + 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section < [self.keyFromDictionary count]) {
        NSString* groupName = [self.keyFromDictionary objectAtIndex:section];
        NSArray* groupArray = [self.studentsDictionary objectForKey:groupName];
        
     return [groupArray count];
    }else{
        return numberOfColor;
    }
}

/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.studentsArray count];
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   /* static NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"a"];
    }
    
    
    UIFont* font = [UIFont fontWithName: @"Thonburi" size:12];
    
    GRColorGroup* rowElement = [self.colorArray objectAtIndex:indexPath.row];
    cell.backgroundColor = rowElement.color;
    cell.textLabel.text = rowElement.name;
    cell.detailTextLabel.text = rowElement.colorName;
    cell.detailTextLabel.font = font;
    cell.detailTextLabel.textColor = [UIColor whiteColor];
        
    
    
    return cell;*/
    
   /* static NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"q"];
    }
    
    GRStudents* student = [self.studentsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text =[NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"average: %ld",(long)student.average];
    cell.detailTextLabel.textColor = student.colorName;
    cell.imageView.image = student.photoStudent;
    
    return cell;*/
    
    static NSString* identifier = @"Cell";
    static NSString* identifier2 = @"Cell2";
    
    
    
    if (indexPath.section < [self.keyFromDictionary count]) {
        
         UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"a"];
        }
        
        NSString* groupName = [self.keyFromDictionary objectAtIndex:indexPath.section];
        NSArray* groupArray = [self.studentsDictionary objectForKey:groupName];
        
        GRStudents* student = [groupArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text =[NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"average: %ld",(long)student.average];
        //    cell.detailTextLabel.textColor = student.colorName;
        cell.imageView.image = student.photoStudent;
        cell.backgroundColor = student.colorName;
        
        return cell;
    }else{
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier2];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"a"];
        }
        
        UIFont* font = [UIFont fontWithName: @"Thonburi" size:12];
        
        GRColorGroup* rowElement = [self.colorArray objectAtIndex:indexPath.row];
        cell.backgroundColor = rowElement.color;
        cell.textLabel.text = rowElement.name;
        cell.detailTextLabel.text = rowElement.colorName;
        cell.detailTextLabel.font = font;
        cell.detailTextLabel.textColor = [UIColor whiteColor];
        return cell;
    }
   
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section < [self.keyFromDictionary count]) {
         NSString* groupName = [self.keyFromDictionary objectAtIndex:section];
        
         return groupName;
    }else{
        return @"RGB";
    }
 }
@end
