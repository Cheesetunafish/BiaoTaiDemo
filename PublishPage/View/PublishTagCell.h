//
//  PublishTagCell.h
//  BiaoTaiDemo
//
//  Created by 艾 on 2023/2/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublishTagCell : UITableViewCell

// 应该是lable，添加一个点击手势打开编辑窗，保存后修改label
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, copy) void (^pressDeleteCell)(UITableViewCell *currentCell);

@end

NS_ASSUME_NONNULL_END
