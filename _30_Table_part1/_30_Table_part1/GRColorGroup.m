//
//  GRColorGroup.m
//  _30_Table_part1
//
//  Created by Exo-terminal on 6/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRColorGroup.h"

@implementation GRColorGroup

-(UIColor*) randomColor{
    
    CGFloat r = (CGFloat)(arc4random() %256)/255;
    CGFloat g = (CGFloat)(arc4random() %256)/255;
    CGFloat b = (CGFloat)(arc4random() %256)/255;

    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    
}

-(NSString*)randomName{
    
    NSString* allName = @"Amaranth Amber Amethyst Apricot Aquamarine AzureBaby-blue Beige Black Blue Blue-green Blue-violet Blush Bronze Brown Burgundy Carmine Cerise Cerulean Champagne Chartreuse-green Cobalt-blue Coffee Copper Coral Crimson Cyan Desert sand Electric-blue Emerald Erin Gold Gray Green Harlequin Indigo Ivory Jade Jungle green Lavender Lemon Lilac Lime Magenta Magenta rose Mauve Navy blue Ocher Orange Orange-red Orchid Peach Pear Periwinkle Persian-blue Pink Plum Prussian blue Puce Purple Raspberry Red Red-violet Rose Salmon Sangria Sapphire Scarlet Silver Slate gray Spring-bud Spring-green Tan Taupe Teal Turquoise Violet Viridian White Yankees Blue";
    
    NSArray* nameArray = [allName componentsSeparatedByString:@" "];
    int random = arc4random()%[nameArray count];
   
    return [nameArray objectAtIndex:random];
 }

-(NSString*) editStringFromUIColor:(UIColor*)color{
    
    CGColorRef c = color.CGColor;
    
    const CGFloat *components = CGColorGetComponents(c);
    
    float r = components[0];
    float g = components[1];
    float b = components[2];
    
    NSString *s = [NSString stringWithFormat:@"RGB: Red = %.0f%%, Green = %.0f%%, Blue = %.0f%%",r*100,g*100,b*100];
    
    return s;
}



@end
