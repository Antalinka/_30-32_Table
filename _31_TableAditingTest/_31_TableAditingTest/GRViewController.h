//
//  GRViewController.h
//  _31_TableAditingTest
//
//  Created by Exo-terminal on 6/12/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRViewController : UIViewController <UITableViewDataSource>

@property(weak, nonatomic)IBOutlet UITableView* tableView;

@end
