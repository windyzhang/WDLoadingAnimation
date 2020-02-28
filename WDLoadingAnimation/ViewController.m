//
//  ViewController.m
//  WDLoadingAnimation
//
//  Created by Mac on 2018/6/27.
//  Copyright © 2018年 windyzhang. All rights reserved.
//

#import "ViewController.h"
#import "WDAnimationViewController.h"

NSString *const kTableViewCellID = @"kTableViewCellID";

@interface ViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *animationTypes;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画类型";
     _animationTypes = @[@"预览",@"旋转",@"渐变",@"粒子",@"波纹", @"波浪", @"三角形", @"网格", @"条形", @"转圈", @"心", @"翻转"];
    
    [self.view addSubview:self.tableView];
    
}

- (UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animationTypes.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewCellID];
    }
    cell.textLabel.text = _animationTypes[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WDAnimationViewController *animationvc = [[WDAnimationViewController alloc] init];
    animationvc.title = _animationTypes[indexPath.row];
    animationvc.type = indexPath.row;
    [self.navigationController pushViewController:animationvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
