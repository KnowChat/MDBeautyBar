//
//  KCBeautyFilterBar.h
//  Knowchat04
//
//  Created by Tyler on 2017/8/24.
//  Copyright © 2017年 yyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterData : NSObject
@property (nonatomic, copy) NSString *filterShowName;
@property (nonatomic, copy) NSString *filterBundleName;
@end

@interface FilterCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *igwFilter;
@property (nonatomic, strong) UILabel *lblFilter;
@end


typedef void(^SelectedFilterBlock)(NSString *filter);

@interface KCBeautyFilterBar : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray<FilterData *> *filtersDataSource;

@property (nonatomic, copy) SelectedFilterBlock selectedBlock;

@property (nonatomic, assign) NSInteger       selectedFilter;

@end
