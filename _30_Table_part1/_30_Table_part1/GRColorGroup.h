//
//  GRColorGroup.h
//  _30_Table_part1
//
//  Created by Exo-terminal on 6/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRColorGroup : NSObject
@property(strong, nonatomic)NSString* colorName;
@property(strong, nonatomic)UIColor* color;
@property(strong, nonatomic)NSString* name;

-(UIColor*)randomColor;
-(NSString*)randomName;
-(NSString*) editStringFromUIColor:(UIColor*)color;
@end
