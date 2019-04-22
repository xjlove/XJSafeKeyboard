
#import "XJKeyboardAccessoryBtn.h"
#import "UIView+Extension.h"

@interface XJKeyboardAccessoryBtn()

@property (nonatomic, strong) UILabel *tipTitleLabel;

@property (nonatomic, strong) UIButton *finishBtn;

@end

@implementation XJKeyboardAccessoryBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        
        self.backgroundColor = [UIColor colorWithRed:(222)/255.0 green:(222)/255.0 blue:(222)/255.0 alpha:1.0];
        [self addSubview:self.tipTitleLabel];
        [self addSubview:self.finishBtn];
    }
    return self;
}

- (void)accessoryBtnDidClick {
    
    [self.nextResponder resignFirstResponder];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

-(UILabel *)tipTitleLabel{
    if (!_tipTitleLabel) {
        _tipTitleLabel = [[UILabel alloc] init];
        _tipTitleLabel.font = [UIFont systemFontOfSize:15];
        _tipTitleLabel.text = @"智能安全键盘";
        _tipTitleLabel.textColor = [UIColor colorWithRed:(51)/255.0 green:(51)/255.0 blue:(51)/255.0 alpha:1.0];
        [_tipTitleLabel sizeToFit];
        CGFloat titleX = (self.width-self.tipTitleLabel.frame.size.width)/2;
        CGFloat titleY = 0;
        CGFloat titleW = self.tipTitleLabel.frame.size.width;
        CGFloat titleH = self.height;
        _tipTitleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    }
    return _tipTitleLabel;
}

-(UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [[UIButton alloc] init];
        [_finishBtn setImage:[UIImage imageNamed:@"formitem"] forState:UIControlStateNormal];
        [_finishBtn addTarget:self action:@selector(accessoryBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        CGFloat btnW = 24;
        CGFloat btnH = 22;
        _finishBtn.frame = CGRectMake(self.width-40, (self.height-btnW)/2, btnW, btnH);
    }
    return _finishBtn;
}

@end
