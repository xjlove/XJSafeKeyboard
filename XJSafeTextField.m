
//
//  XJSafeTextField.m
//  GhostRainbowChat
//
//  Created by superButton on 2019/4/22.
//  Copyright © 2019 superButton. All rights reserved.
//

#import "XJSafeTextField.h"
#import "XJKeyboardView.h"
#import "XJKeyboardAccessoryBtn.h"

#define STATUSHEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define IPHONEX STATUSHEIGHT>20?YES:NO

@interface XJSafeTextField ()<XJKeyboardDelegate>

@property (nonatomic, strong) XJKeyboardView *keyboard;
@property (nonatomic, strong) NSMutableString *passWord;

@end

@implementation XJSafeTextField

- (instancetype)init{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    self.userInteractionEnabled = YES;
    
    [self addTarget:self action:@selector(textFiledDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textFiledChange:) forControlEvents:UIControlEventEditingChanged];
    
}

#pragma mark -- overwrite
-(void)textFiledDidBegin:(UITextField*)filed{
    NSLog(@"%s",__func__);
    
    CGFloat x = 0;
    CGFloat h = 216;
    if (IPHONEX) {
        h = 291; //x系列291  其他216
    }
    CGFloat y = [UIScreen mainScreen].bounds.size.height - h;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    
    self.inputAccessoryView = [[XJKeyboardAccessoryBtn alloc] init];
    self.keyboard = [[XJKeyboardView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    self.keyboard.delegate = self;
    self.inputView = self.keyboard;
    
    self.passWord = nil;
    [self.passWord appendString:self.text];
}

//点击clearBtn清空
-(void)textFiledChange:(UITextField*)filed{
    if (![self isEmptyStr:filed.text]) {
        NSUInteger loc = self.passWord.length;
        if (loc == 0)   return;
        NSRange range = NSMakeRange(0, loc);
        [self.passWord deleteCharactersInRange:range];
        NSLog(@"%@",self.passWord);
    }
}

#pragma mark - LVKeyboardDelegate
- (void)keyboard:(XJKeyboardView *)keyboard didClickButton:(UIButton *)button {
    
    [self.passWord appendString:button.currentTitle];
    self.text = self.passWord;
    
    NSLog(@"%@", self.text);
}

- (void)keyboard:(XJKeyboardView *)keyboard didClickDeleteBtn:(UIButton *)deleteBtn {
    NSLog(@"删除");
    NSUInteger loc = self.passWord.length;
    if (loc == 0)   return;
    NSRange range = NSMakeRange(loc - 1, 1);
    [self.passWord deleteCharactersInRange:range];
    self.text = self.passWord;
    NSLog(@"%@", self.text);
}
- (void)keyboard:(XJKeyboardView *)keyboard didClickReturnBtn:(UIButton *)returnBtn
{
    [self resignFirstResponder];
    
    if ([self.safeDelegate respondsToSelector:@selector(textFiledDoneActon:)]) {
        [self.safeDelegate textFiledDoneActon:self];
    }
    NSLog(@"return 确认");
}
#pragma mark - 需要
- (NSMutableString *)passWord {
    if (!_passWord) {
        _passWord = [[NSMutableString alloc]init];
    }
    return _passWord;
}

- (BOOL)isEmptyStr:(NSString*)str {
    if (str==nil) {
        return YES;
    }
    
    BOOL isEmpty = NO;
    NSString *copyStr = [str copy];
    
    if((![copyStr isKindOfClass:[NSNull class]]) && (![copyStr isKindOfClass:[NSString class]]) && (![copyStr isKindOfClass:[NSMutableString class]]))
    {
        copyStr = [NSString stringWithFormat:@"%@", copyStr];
    }
    
    if (copyStr == nil || [@"" isEqualToString:copyStr] || [@" " isEqualToString:copyStr]|| [copyStr isKindOfClass:[NSNull class]]) {
        return YES;
    } else if ([[copyStr substringToIndex:1] isEqualToString:@" "]) {
        isEmpty = [self isEmptyStr:[copyStr substringFromIndex:1]];
    }
    
    return isEmpty;
}

@end
