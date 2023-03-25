//
//  headerView.m
//  BiaoTaiDemo
//
//  Created by 艾 on 2023/3/12.
//

#import "headerView.h"
@interface headerView()
@property (nonatomic, strong) UILabel *headerText;
@end

@implementation headerView
- (instancetype)initWithHeaderView {
    if (self) {
        self = [super init];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headerText];
    }
    return self;
}

- (UILabel *)headerText {
    if (!_headerText) {
        _headerText = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 250, 30)];
        _headerText.text = @"请输入内容";
        _headerText.textAlignment = NSTextAlignmentCenter;
        _headerText.font = [UIFont systemFontOfSize:15];
        _headerText.backgroundColor = [UIColor systemGray3Color];
        _headerText.layer.cornerRadius = 10;
        _headerText.layer.masksToBounds = YES;
    }
    return _headerText;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
