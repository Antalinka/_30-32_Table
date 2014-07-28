//
//  GRStudents.m
//  _30_Table_part1
//
//  Created by Exo-terminal on 6/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRStudents.h"

@implementation GRStudents

-(NSString*) randomName{
    
    NSString* name = @"Michael Joshua William James David Tyler Gavin Dylan Jackson Brandon Caleb Mason Jack Zachary Austin Chase Diego Carson Josiah Colton Nathaniel Liam Cameron Luis Julian";
    
    NSArray* nameArray = [name componentsSeparatedByString:@" "];
    
    int i = arc4random()%[nameArray count];
    
    return [nameArray objectAtIndex:i];
}


-(NSString*)randomLastName{
    
    NSString* name = @"Abramson Adderiy Aldridge Arnold Arthurs Attwood Brooks Brown Bush Calhoun Campbell Carey Carrington Carroll Chesterton Clapton Clifford Coleman Creighton Gerald Gilmore Goldman Goodman Hawkins";
    
    NSArray* nameArray = [name componentsSeparatedByString:@" "];
    
    int i = arc4random()%[nameArray count];
    
    return [nameArray objectAtIndex:i];
    
}
-(NSInteger) randomAverage{
    
    int i = arc4random()%4;
    
    return i+2;
}
-(UIImage*)randomImage{
    int i = arc4random()%5;
    NSString* nameImage = [NSString stringWithFormat:@"%d.jpg", i];
    
    UIImage* photoStudent = [UIImage imageNamed:nameImage];
    
    return photoStudent;
}

-(UIColor*)groupStudents: (NSInteger)average{
    
    UIColor*color = [UIColor greenColor];
    
    switch (average) {
        case 2: color = [UIColor redColor];
            break;
            
        case 3: color = [UIColor orangeColor];
            break;
            
        case 4: color = [UIColor yellowColor];
            break;
            
        case 5: color = [UIColor greenColor];
            break;
            
        default:
            break;
    }
    return color;
}

@end
