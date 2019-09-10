//
//  LHPlaceHoldView.h
//  LHDefaultImage
//
//  Created by chenlonghai on 2019/9/4.
//  Copyright © 2019年 chenlonghai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHPlaceHoldView : UIView

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img viewClick:(void(^)(void))clickBlock;

@end

NS_ASSUME_NONNULL_END
