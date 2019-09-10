//
//  LHPlaceHoldView.m
//  LHDefaultImage
//
//  Created by chenlonghai on 2019/9/4.
//  Copyright © 2019年 chenlonghai. All rights reserved.
//

#import "LHPlaceHoldView.h"

@interface LHPlaceHoldView ()

@property (nonatomic, copy) void(^clickBlock)(void);
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIImage *img;
@end
@implementation LHPlaceHoldView
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img viewClick:(void(^)(void))clickBlock {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.clickBlock = clickBlock;
        self.img = img;
        [self setupSubViews];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setupSubViews {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:self.img];
    
    [self addSubview:imgView];
    self.imgView = imgView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView:)];
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:tap];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgView.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
}

- (void)clickImgView:(UITapGestureRecognizer *)recognizer {
    self.clickBlock();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
