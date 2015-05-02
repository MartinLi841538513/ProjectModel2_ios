//
//  ContentViewController.m
//  DaXiaProject
//
//  Created by Gao Huang on 14-12-5.
//  Copyright (c) 2014年 None. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationController *nav0 = [self navFromStoryboardName:@"Index0" andIdentifier:@"Index0Nav"];
    UINavigationController *nav1 = [self navFromStoryboardName:@"Index1" andIdentifier:@"Index1Nav"];
    UINavigationController *nav2 = [self navFromStoryboardName:@"Index2" andIdentifier:@"Index2Nav"];
    UINavigationController *nav3 = [self navFromStoryboardName:@"Index3" andIdentifier:@"Index3Nav"];
    self.viewControllers = [NSArray arrayWithObjects:nav0,nav1,nav2,nav3, nil];
    
}

-(UINavigationController *)navFromStoryboardName:(NSString *)storyboardName andIdentifier:(NSString *)identifier{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UINavigationController *nav = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
