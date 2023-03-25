//
//  PublishVC.m
//  BiaoTaiDemo
//
//  Created by 艾 on 2023/2/6.
//

#import "PublishVC.h"
#import "PublishTagCell.h"
#import "headerView.h"

#import "footerView.h"
#define TABLEVIEWHEIGHT self.table.frame.size.height
@interface PublishVC ()<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *table;

@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) NSMutableArray *muteDataArray;

@property (nonatomic, strong) headerView *headView;

@property (nonatomic, strong) footerView *footView;

@property (nonatomic, assign) CGFloat tableViewHeight;
@end

@implementation PublishVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    self.view.backgroundColor = [UIColor systemGray3Color];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.footView];
    [self.view addSubview:self.table];
    [self setTap];
    
    self.navigationItem.title = @"表态区";
    
}

- (void)setData {
    self.dataArray = @[@"选项1", @"选项2", @"选项3", @"选项4", @"选项5"];
    self.muteDataArray = [self.dataArray mutableCopy];
}

// !!!: tap方法
- (void)setTap {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taptap)];
    tap.numberOfTapsRequired = 1;
    [self.headView.headerText addGestureRecognizer:tap];
}

- (void)taptap {
    NSString *string = @"ddasfasdasdfddddddddddd";
    self.headView.headerText.text = string;
}

#pragma mark - DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat aCellHeight = 50.0;
    return aCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.muteDataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.footView;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

#pragma mark - Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PublishTagCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textField.text = [self clickedOkEditBtn];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"identify";
    PublishTagCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[PublishTagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textField.text = self.muteDataArray[indexPath.row];
    // 删除
    cell.pressDeleteCell = ^(UITableViewCell * _Nonnull currentCell) {
        NSIndexPath *currentIndex = [self.table indexPathForCell:currentCell];
        [self.muteDataArray removeObjectAtIndex:currentIndex.row];
        [self.table beginUpdates];
        [self.table deleteRowsAtIndexPaths:@[currentIndex] withRowAnimation:UITableViewRowAnimationFade];
        [self.table endUpdates];
        // 动态变化tableview高度：减小
        [self changeTableViewHeight];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
// 添加
- (void)addCell:(UIButton *)button{
    if (self.muteDataArray.count < 10) {
        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
        NSInteger row = self.muteDataArray.count;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        [indexPaths addObject: indexPath];

        NSString *string = [NSString stringWithFormat:@"选项%ld",(row + 1)];
        
        [self.muteDataArray addObject:string];
        [self.table beginUpdates];
        [self.table insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];

        // 动态变化tableview高度：增加
        if (TABLEVIEWHEIGHT < self.view.frame.size.height ) {
            [self changeTableViewHeight];
        }
        [self.table endUpdates];
        
    }
    else {
        NSLog(@"最大只能添加10个");
    }
}
//// MARK: headDelegate
//- (void)changeTitleLabel {
//    NSString *string = @"asdaflkawjekla";
//    self.headView.headerText.text = string;
//}
#pragma mark - LazyLoad
- (UITableView *)table {
    if (!_table) {
        self.tableViewHeight = 50 * 7;
        _table = [[UITableView alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width - 20, self.tableViewHeight) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.layer.cornerRadius = 15;
    }
    return _table;
}

- (void)changeTableViewHeight {
    [UIView animateWithDuration:0.3 animations:^{
        NSInteger numberOfCells = self.muteDataArray.count;
        // 获取每个cell的高度
        CGFloat cellHeight = [self.table.delegate tableView:self.table heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        // 计算tableview应该展示的高度
//        CGFloat newHeight = (numberOfCells + 2) * cellHeight;
        CGFloat newHeight = numberOfCells * cellHeight + [self tableView:self.table heightForFooterInSection:0];
        // 设置tableview的高度不能小于最小高度50 * 7
        newHeight = MAX(newHeight, 50 * 7);
        // 设置tableview的高度
        self.table.frame = CGRectMake(self.table.frame.origin.x, self.table.frame.origin.y, self.table.frame.size.width, newHeight);
    }];
}

- (NSString *)clickedOkEditBtn {
    NSString *string = [NSString string];
    string = @"传文字得到的点点滴滴点点滴滴点点滴滴点点滴滴";
    
    return string;
}

- (headerView *)headView {
    if (!_headView) {
        _headView = [[headerView alloc] initWithHeaderView];
        // 在tableview底下，和tableview拼起来的头视图
        // tableview的x，tableview高一点y-（）
        _headView.frame = CGRectMake(self.table.frame.origin.x, self.table.frame.origin.y - 70, self.table.frame.size.width, 100);
        _headView.layer.cornerRadius = 15;
    }
    return _headView;
}
- (footerView *)footView {
    if (!_footView) {
        _footView = [[footerView alloc] initWithFooterView];
        _footView.frame = CGRectMake(0, 0, 100, 50);
        _footView.backgroundColor = [UIColor whiteColor];
        [_footView.btn addTarget:self action:@selector(addCell:) forControlEvents:UIControlEventTouchUpInside];
        [_footView.okEditBtn addTarget:self action:@selector(clickedOkEditBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footView;
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
