//
//  IndexViewController.m
//  MianFeiStudy
//
//  Created by Gao Huang on 15/5/1.
//  Copyright (c) 2015年 Martin. All rights reserved.
//

#import "Index0ViewController.h"
#import "Index0TableViewCell.h"
@interface Index0ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Index0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
#pragma UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Index0TableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"Index0TableViewCell" forIndexPath:indexPath];
    return cell;
}
@end
