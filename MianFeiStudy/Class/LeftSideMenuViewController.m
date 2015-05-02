//
//  LeftSideMenuViewController.m
//  DaXiaProject
//
//  Created by Gao Huang on 14-10-30.
//  Copyright (c) 2014年 None. All rights reserved.
//

#import "LeftSideMenuViewController.h"
#import "LeftSideMenuCell.h"
#import "RootViewController.h"
#import "SVProgressHUD.h"
@interface LeftSideMenuViewController ()<UITableViewDataSource,UITableViewDelegate,LoginViewControllerDelegate>

@end

@implementation LeftSideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(loadLeftSide:) name:@"loadLeftSide" object:nil];
}

#pragma NSNotificationCenter
-(void)loadLeftSide:(NSNotificationCenter *)sender{
    [self loadData];
    [self.tableview reloadData];
    
}

-(void)loadData{
    SharedData *sharedata = [SharedData sharedInstance];
    self.datas = [NSArray arrayWithObjects:@"推荐用烟",@"信息反馈",@"我的消息",@"检测更新",@"工作任务",@"工作记录",@"价格采集",@"信息互动",@"群组互动",@"走访记录",@"走访统计", nil];
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftSideMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftSideMenuCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    NSString *data = self.datas[row];
    cell.menuTitle.text = data;
    return cell;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    // Add your Colour.
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIColor *color = [UIColor colorWithRed:47/255.0 green:109/255.0 blue:151/255.0 alpha:0.7];
    cell.contentView.backgroundColor = color;
    cell.backgroundColor = color;
}

-(void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIColor *color = [UIColor colorWithRed:47/255.0 green:109/255.0 blue:151/255.0 alpha:0.0];
    cell.contentView.backgroundColor = color;
    cell.backgroundColor = color;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = indexPath.row;
    
    if (row != 0 && row != 3) {
        // 要登陆
        SharedData *sharedData = [SharedData sharedInstance];
        NSString *loginStatus = sharedData.loginStatus;
        if ([loginStatus isEqualToString:@"yes"]) {
        }else{
            [SharedAction presentLoginViewControllerInViewController:self];
            return;
        }
        
    }
    
    if (row==0) {
        UIViewController *target = [self.storyboard instantiateViewControllerWithIdentifier:@"RecommendationsViewController"];
        [self presentViewController:target animated:YES completion:nil];
    }else if(row==1){
        [self pushtoViewControllerInStoryboard:@"Index" withIdentifier:@"FeedBackViewController" atIndex:0 fromLeftController:self];
    }else if(row==2){
         [self pushtoViewControllerInStoryboard:@"User" withIdentifier:@"NoticeListViewController" atIndex:3 fromLeftController:self];
    }else if(row==3){
        [SVProgressHUD showSuccessWithStatus:@"当前已是最新版"];
    }else if(row==4){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LeftSideMenu" bundle:nil];
        UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"WorkListNav"];
        [self presentViewController:target animated:YES completion:nil];
        
    }else if(row==5){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LeftSideMenu" bundle:nil];
        UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"WorkSheetListNav"];
        [self presentViewController:target animated:YES completion:nil];
    }else if(row==6){
//        [self pushtoOrderListViewControllerInStoryboard:@"Index" withIdentifier:@"OrderListViewController" atIndex:0 fromLeftController:self];

    }else if(row==7){
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LeftSideMenu" bundle:nil];
        UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"MessageSendNav"];
        [self presentViewController:target animated:YES completion:nil];
    }else if(row==8){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LeftSideMenu" bundle:nil];
        UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"GroupListNav"];
        [self presentViewController:target animated:YES completion:nil];
        
    }else if(row==9){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LeftSideMenu" bundle:nil];
        UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"VisitListNav"];
        [self presentViewController:target animated:YES completion:nil];
        
    }else if(row==10){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LeftSideMenu" bundle:nil];
        UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"StatisticsVisitNav"];
        [self presentViewController:target animated:YES completion:nil];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}



//push to target的一种方式，可以实现他们现在在他们本来应该在的位置
-(void)pushtoViewControllerInStoryboard:(NSString *)storyboardName withIdentifier:(NSString *)identifier atIndex:(NSInteger)index fromLeftController:(UIViewController *)leftController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    RootViewController *viewController = (RootViewController *)leftController.parentViewController;
    UITabBarController *tabController = (UITabBarController *)viewController.contentViewController;
    [tabController setSelectedIndex:index];
    UINavigationController *nav = tabController.viewControllers[index];
    
    [viewController hideMenuViewController];
    target.hidesBottomBarWhenPushed=YES;
    [nav pushViewController:target animated:YES];
}

@end
