//
//  footerView.m
//  BiaoTaiDemo
//
//  Created by 艾 on 2023/3/12.
//

#import "footerView.h"
@interface footerView()

@property (nonatomic, strong) UILabel *label;


@end
@implementation footerView

- (instancetype)initWithFooterView {
    if (self) {
        self = [super init];
        [self addSubview:self.label];
        [self addSubview:self.btn];
        [self addSubview:self.okEditBtn];
    }
    return self;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 370, 50)];
        _label.textColor = [UIColor systemBlueColor];
        _label.numberOfLines = 0;
        _label.font = [UIFont boldSystemFontOfSize:20];
        _label.text = @"添加选项";
    }
    return _label;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        [_btn setImage:[UIImage systemImageNamed:@"plus.circle.fill"] forState:UIControlStateNormal];
    }
    return _btn;
}
- (UIButton *)okEditBtn {
    if (!_okEditBtn) {
        _okEditBtn = [[UIButton alloc] initWithFrame:CGRectMake(120, 50, 140, 40)];
        [_okEditBtn setTitle:@"完成编辑" forState:UIControlStateNormal];
        _okEditBtn.backgroundColor = [UIColor blueColor];
        [_okEditBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _okEditBtn.layer.cornerRadius = 20;
    }
    return _okEditBtn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
