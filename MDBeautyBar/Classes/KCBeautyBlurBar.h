//
//  KCBeautyBlurBar.h
//  Knowchat04
//
//  Created by Tyler on 2017/8/24.
//  Copyright © 2017年 yyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlurCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *igwBlur;
@property (nonatomic, strong) UILabel *lblBlur;
@end

typedef void(^SelectedBlurBlock)(NSInteger blur);

@interface KCBeautyBlurBar : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, copy) SelectedBlurBlock selectedBlock;
@property (nonatomic, assign) NSInteger   selectedBlur;

- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout
                  cancelImage:(UIImage *)cancelImage
                selectedImage:(UIImage *)selectedImage;
@end
