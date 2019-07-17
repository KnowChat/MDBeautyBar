//
//  KCBeautyFilterBar.m
//  Knowchat04
//
//  Created by Tyler on 2017/8/24.
//  Copyright © 2017年 yyk. All rights reserved.
//

#import "KCBeautyFilterBar.h"
#import "Masonry.h"
#import "MDResourceAccess.h"
@implementation FilterData

@end

@implementation FilterCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    _igwFilter = [[UIImageView alloc] init];
    _igwFilter.contentMode = UIViewContentModeScaleAspectFill;
    _igwFilter.layer.cornerRadius = 30.f;
    _igwFilter.layer.masksToBounds = YES;
    [self.contentView addSubview:_igwFilter];
    
    _lblFilter = [[UILabel alloc] init];
    _lblFilter.textColor = [UIColor whiteColor];
    _lblFilter.font = [UIFont systemFontOfSize:11.f];
    [self.contentView addSubview:_lblFilter];
    
    [_igwFilter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_lblFilter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.igwFilter.mas_bottom).offset(10);
        make.centerX.equalTo(self.contentView);
    }];
}
@end

@implementation KCBeautyFilterBar
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.selectColor = [UIColor colorWithRed:197 / 255.0 green:193 / 255.0 blue:255 / 255.0 alpha:1];
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
    self.showsHorizontalScrollIndicator = NO;
    [self registerClass:[FilterCell class] forCellWithReuseIdentifier:@"FilterCell"];
}

- (void)setFiltersDataSource:(NSArray<FilterData *> *)filtersDataSource
{
    _filtersDataSource = filtersDataSource;
    
    [self reloadData];
}

-(NSInteger)numberOfSections{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _filtersDataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FilterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilterCell" forIndexPath:indexPath];
    
    cell.igwFilter.image = [MDResourceAccess image:_filtersDataSource[indexPath.row].filterBundleName bundleName:@"MDBeautyBar" moduleClass:self.class];
    cell.lblFilter.text = _filtersDataSource[indexPath.row].filterShowName;
    
    cell.igwFilter.layer.borderColor = [UIColor clearColor].CGColor;
    cell.igwFilter.layer.borderWidth = 0.0;
    
    if (_selectedFilter == indexPath.row) {
        
        cell.igwFilter.layer.borderColor = self.selectColor.CGColor;
        cell.igwFilter.layer.borderWidth = 2.f;
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _selectedFilter) {
        return;
    }
    NSIndexPath *preIndex = [NSIndexPath indexPathForRow:_selectedFilter inSection:0];
    _selectedFilter = indexPath.row;
    [collectionView reloadItemsAtIndexPaths:@[indexPath,preIndex]];
    
    if (self.selectedBlock) {
        self.selectedBlock(_filtersDataSource[indexPath.row].filterBundleName);
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
