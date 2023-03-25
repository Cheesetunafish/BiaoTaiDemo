//
//  ViewController.m
//  表demo态
//
//  Created by 小艾同学 on 2023/1/12.
//

#import "ViewController.h"
#import "ExpressVC.h"
#import "PublishVC.h"
#import "MainPageTableViewCell.h"

@interface ViewController () <
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self setNavitationStyle];
}

- (void)setNavitationStyle {
    self.navigationItem.title = @"表态区";
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressRight:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(pressLeft:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)pressRight:(UIBarButtonItem*)btn {
    NSLog(@"右侧按钮被按下");
    PublishVC *publish = [[PublishVC alloc] init];
    [self.navigationController pushViewController:publish animated:YES];
}

- (void)pressLeft:(UIBarButtonItem *)btn {
    NSLog(@"左侧按下返回邮镇");
//    [self.navigationController pushViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>]
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpressVC *express = [[ExpressVC alloc] init];
    [self.navigationController pushViewController:express animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *string = @"identify";
    MainPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[MainPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.title.text = @"你认为暴雪在中国的游戏代理由谁接手？";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor systemGray4Color];
    }
    return _tableView;
}

@end
