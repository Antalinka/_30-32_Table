//
//  GRViewController.h
//  _30_Table_part1
//
//  Created by Exo-terminal on 6/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GRColorGroup;
@class GRStudents;

@interface GRViewController : UIViewController <UITableViewDataSource>

@property(weak, nonatomic)IBOutlet UITableView* tableView;


@end
