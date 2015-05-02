//
//  LeftSideMenuViewController.h
//  DaXiaProject
//
//  Created by Gao Huang on 14-10-30.
//  Copyright (c) 2014年 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftSideMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property(nonatomic,strong)NSArray *datas;
@end
