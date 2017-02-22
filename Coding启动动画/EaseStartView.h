//
//  EaseStartView.h
//  Coding启动动画
//
//  Created by 岳琛 on 2017/2/22.
//  Copyright © 2017年 Conny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EaseStartView : UIView
+ (instancetype)startView;
- (void)startAnimationWithCompletionBlock:(void(^)(EaseStartView *easeStartView))completionHandler;
@end
