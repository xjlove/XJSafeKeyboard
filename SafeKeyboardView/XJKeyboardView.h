
#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
#import "XJKeyboardAccessoryBtn.h"

@class XJKeyboardView;

@protocol XJKeyboardDelegate <NSObject>

@optional
/** 点击了数字按钮 */
- (void)keyboard:(XJKeyboardView *)keyboard didClickButton:(UIButton *)button;
/** 点击删除按钮 */
- (void)keyboard:(XJKeyboardView *)keyboard didClickDeleteBtn:(UIButton *)deleteBtn;
/** 点击return按钮 */
- (void)keyboard:(XJKeyboardView *)keyboard didClickReturnBtn:(UIButton *)returnBtn;

@end

@interface XJKeyboardView : UIView

@property (nonatomic, assign) id<XJKeyboardDelegate> delegate;

@end
