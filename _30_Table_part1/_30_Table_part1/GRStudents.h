//
//  GRStudents.h
//  _30_Table_part1
//
//  Created by Exo-terminal on 6/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRStudents : NSObject

@property(strong, nonatomic)NSString* firstName;
@property(strong, nonatomic)NSString* lastName;
@property(assign, nonatomic)NSInteger average;
@property(strong, nonatomic)UIImage* photoStudent;
@property(strong, nonatomic)UIColor* colorName;

-(NSString*) randomName;
-(NSString*)randomLastName;
-(NSInteger) randomAverage;
-(UIImage*)randomImage;
-(UIColor*)groupStudents: (NSInteger)average;
@end
