//
//  MainPageTableViewCell.m
//  BiaoTaiDemo
//
//  Created by 艾 on 2023/2/5.
//

#import "MainPageTableViewCell.h"
//
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@implementation MainPageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.title];
        
    }
    return self;
}

// 使cell之间存在间隙
-(void)setFrame:(CGRect)frame {
    frame.origin.x = 10;// 这里间距为10，可以根据自己的情况调整
    frame.origin.y += 10;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 2 * frame.origin.x;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 15;
    self.clipsToBounds = YES; // 添加之后点击cell就不会发生圆角消失
    [super setFrame:frame];
}

//懒加载
- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 370, 50)];
        _title.textColor = [UIColor blackColor];
        _title.numberOfLines = 0;
        _title.font = [UIFont boldSystemFontOfSize:20];
    }
    return _title;
}

@end
