//
//  KCBeautyBar.h
//  Knowchat04
//
//  Created by Tyler on 2017/8/24.
//  Copyright © 2017年 yyk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BeautyTypeFilter,
    BeautyTypeBlur,
    BeautyTypeWhite,
    BeautyTypeRed,
    BeautyTypeThin,
    BeautyTypeEye,
} BeautyType;

typedef void(^SelectedFilterBlock)(NSString *filter);
typedef void(^SelectedBlurBlock)(NSInteger blur);
typedef void(^WhiteChangedBlock)(float value);
typedef void(^RedChangedBlock)(float value);
typedef void(^ThinChangedBlock)(float value);
typedef void(^EyeChangedBlock)(float value);

@interface KCBeautyBar : UIView
@property (nonatomic, copy) SelectedFilterBlock filterBlock;
@property (nonatomic, copy) SelectedBlurBlock blurBlock;
@property (nonatomic, copy) WhiteChangedBlock whiteBlock;
@property (nonatomic, copy) RedChangedBlock redBlock;
@property (nonatomic, copy) ThinChangedBlock thinBlock;
@property (nonatomic, copy) EyeChangedBlock eyeBlock;

@property (nonatomic, strong) UIColor * selectColor;

/**
 初始化

 @param normalImages 默认下图片，为空时取默认
 @param selectedImages 选中下图片，为空时取默认
 @param blurCancelImage 磨皮为0时的图片
 @param blurSelectedImage 磨皮选中时的图片
 @return 美颜bar
 */
- (instancetype)initWithNormalImages:(NSArray *)normalImages
                      selectedImages:(NSArray *)selectedImages
                     blurCancelImage:(UIImage *)blurCancelImage
                   blurSelectedImage:(UIImage *)blurSelectedImage;

- (instancetype)initWithNormalImages:(NSArray *)normalImages
                      selectedImages:(NSArray *)selectedImages
                     blurCancelImage:(UIImage *)blurCancelImage
                   blurSelectedImage:(UIImage *)blurSelectedImage
                          filterName:(NSArray<NSString *>*)filterName
                         filterValue:(NSArray<NSString *>*)filterValue;
/**
 选中美颜选项

 @param type 选项
 */
- (void)selectBeautyType:(BeautyType)type;
//瘦脸和大眼功能的开关
- (void)toggleThin:(BOOL)isEnable;
- (void)toggleEye:(BOOL)isEnable;
//初始化参数值
- (void)initFilter:(NSString *)filterName;
- (void)initBlur:(NSInteger)blur;
- (void)initWhite:(float)white;
- (void)initRed:(float)red;
- (void)initThin:(float)thin;
- (void)initEye:(float)eye;
@end
