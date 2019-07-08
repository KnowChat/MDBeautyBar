//
//  KCBeautySlideBar.m
//  Knowchat04
//
//  Created by Tyler on 2017/8/24.
//  Copyright © 2017年 yyk. All rights reserved.
//

#import "KCBeautySlideBar.h"
#import "MDResourceAccess.h"
@implementation KCBeautySlideBar
- (instancetype)init {
    if (self = [super init]) {
        [self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    
    
    [self setThumbImage:[MDResourceAccess image:@"beauty_slide" bundleName:@"MDBeautyBar" moduleClass:self.class] forState:UIControlStateNormal];
    [self setMinimumTrackTintColor:[UIColor colorWithRed:36 / 255.0 green:165 / 255.0 blue:229 / 255.0 alpha:1]];
    [self setMaximumTrackTintColor:[UIColor colorWithRed:216 / 255.0 green:216 / 255.0 blue:216 / 255.0 alpha:1]];
    
    
    UIImage *bgImage = [MDResourceAccess image:@"beauty_prompt" bundleName:@"MDBeautyBar" moduleClass:self.class];
    _igwTipBg = [[UIImageView alloc] initWithImage:bgImage];
    _igwTipBg.frame = CGRectMake(0, -bgImage.size.height, bgImage.size.width, bgImage.size.height);
    [self addSubview:_igwTipBg];
    
    _lblTip = [[UILabel alloc] initWithFrame:_igwTipBg.frame];
    _lblTip.text = @"";
    _lblTip.textColor = [UIColor darkGrayColor];
    _lblTip.font = [UIFont systemFontOfSize:14];
    _lblTip.textAlignment = NSTextAlignmentCenter;
    _lblTip.backgroundColor = [UIColor clearColor];
    [self addSubview:_lblTip];
    
    _igwTipBg.hidden = YES;
    _lblTip.hidden = YES;
}

- (void)setValue:(float)value animated:(BOOL)animated {
    [super setValue:value animated:animated];
    
    _lblTip.text = [NSString stringWithFormat:@"%.1f",value];
    
    CGFloat x = value * (self.frame.size.width - 20) - _lblTip.frame.size.width * 0.5 + 10;
    CGRect frame = _lblTip.frame;
    frame.origin.x = x;
    
    _igwTipBg.frame = frame;
    _lblTip.frame = frame;
    
    _lblTip.hidden = !self.tracking;
    _igwTipBg.hidden = !self.tracking;
}

- (void)valueChanged:(UISlider *)slide {
    if (self.valueChangeBlock) {
        self.valueChangeBlock(slide.value);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
