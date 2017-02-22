//
//  EaseStartView.m
//  Coding启动动画
//
//  Created by 岳琛 on 2017/2/22.
//  Copyright © 2017年 Conny. All rights reserved.
//

#import "EaseStartView.h"

#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kScreen_Bounds [UIScreen mainScreen].bounds


@interface EaseStartView ()
@property (strong, nonatomic) UIImageView *bgImageView;
@end

@implementation EaseStartView

+ (instancetype)startView{
    return [[self alloc] initWithBgImage:[UIImage imageNamed:@"启动.jpg"]];
}

- (instancetype)initWithBgImage:(UIImage *)bgImage{
    self = [super initWithFrame:kScreen_Bounds];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];;
        self.alpha = 1.0;
        
        _bgImageView = [[UIImageView alloc] initWithFrame:kScreen_Bounds];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.alpha = 1.0;
        [self addSubview:_bgImageView];
        
        self.bgImageView.image = bgImage;
        [self updateConstraintsIfNeeded];
    }
    return self;
}


- (void)startAnimationWithCompletionBlock:(void(^)(EaseStartView *easeStartView))completionHandler{
    [kKeyWindow addSubview:self];
    [kKeyWindow bringSubviewToFront:self];
    _bgImageView.alpha = 1.0;
    
    __weak typeof(self) weakself = self;
    
    [UIView animateWithDuration:2.0 animations:^{
        weakself.bgImageView.alpha = 1.0;
        
        [weakself.bgImageView setFrame:CGRectMake(-kScreen_Bounds.size.width/20, -kScreen_Bounds.size.height/20, 1.1*kScreen_Bounds.size.width, 1.1*kScreen_Bounds.size.height)];
        
    } completion:^(BOOL finished) {
        weakself.backgroundColor = [UIColor clearColor];
        
        //UIViewAnimationOptionCurveEaseIn
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakself.bgImageView.alpha = 0.0;
            weakself.alpha = 0.0;
        } completion:^(BOOL finished) {
            [weakself removeFromSuperview];
            if (completionHandler) {
                completionHandler(weakself);
            }
        }];
    }];
    
}

@end
