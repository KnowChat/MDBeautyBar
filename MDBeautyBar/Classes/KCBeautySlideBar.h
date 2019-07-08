//
//  KCBeautySlideBar.h
//  Knowchat04
//
//  Created by Tyler on 2017/8/24.
//  Copyright © 2017年 yyk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ValueChangedBlock)(float value);

@interface KCBeautySlideBar : UISlider
@property (nonatomic, strong) UILabel *lblTip;
@property (nonatomic, strong) UIImageView *igwTipBg;
@property (nonatomic, copy) ValueChangedBlock valueChangeBlock;

@end
