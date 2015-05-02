//
//  ViewController.m
//  DaXiaProject
//
//  Created by Gao Huang on 14-10-30.
//  Copyright (c) 2014年 None. All rights reserved.
//

#import "RootViewController.h"
@interface RootViewController ()
{
    BOOL menuIsShown;
}
@end

@implementation RootViewController

-(void)awakeFromNib{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftSideMenuViewController"];
//    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftSideNav"];

//    self.backgroundImage = [UIImage imageNamed:@"Stars"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    menuIsShown = NO;
    [[UIApplication sharedApplication]setApplicationSupportsShakeToEdit:YES];
}

-(BOOL)canBecomeFirstResponder
{// 默认值是 NO
    return YES;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"开始晃动");
    if (menuIsShown==NO) {
        menuIsShown=YES;
        [self presentLeftMenuViewController];
    }else if(menuIsShown==YES){
        menuIsShown=NO;
        [self hideMenuViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
