//
//  PublishTagCell.m
//  BiaoTaiDemo
//
//  Created by 艾 on 2023/2/6.
//

#import "PublishTagCell.h"

@implementation PublishTagCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.btn];
        [self.contentView addSubview:self.textField];
    }
    return self;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 10, 300, 30)];
        _textField.textColor = [UIColor blackColor];
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.backgroundColor = [UIColor systemGray3Color];
        _textField.layer.cornerRadius = 15;
        _textField.layer.masksToBounds = YES;
    }
    return _textField;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
//        [_btn setImage:[UIImage systemImageNamed:@"plus.circle"] forState:];
        [_btn setImage:[UIImage systemImageNamed:@"minus.circle"] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}


- (void)pressBtn {
    self.pressDeleteCell(self);
}


@end
