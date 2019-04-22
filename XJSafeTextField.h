//
//  XJSafeTextField.h
//  GhostRainbowChat
//
//  Created by superButton on 2019/4/22.
//  Copyright © 2019 superButton. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XJSafeTextField;
@protocol XJSafeTextFieldDelegate <NSObject>

@optional
- (void)textFiledDoneActon:(XJSafeTextField*)textField;

@end

@interface XJSafeTextField : UITextField

@property (nonatomic, assign) id<XJSafeTextFieldDelegate> safeDelegate;

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
