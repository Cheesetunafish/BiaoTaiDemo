//
//  headerView.h
//  BiaoTaiDemo
//
//  Created by 艾 on 2023/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//@class headerView;
//@protocol headerViewDelegate <NSObject>
//
//- (void)changeTitleLabel;
//
//@end
@interface headerView : UIView
@property (nonatomic, strong) UILabel *headerText;
//@property (nonatomic, weak) id<headerViewDelegate> delegate;
- (instancetype)initWithHeaderView;
@end

NS_ASSUME_NONNULL_END
