//
//  KCBeautyBlurBar.m
//  Knowchat04
//
//  Created by Tyler on 2017/8/24.
//  Copyright © 2017年 yyk. All rights reserved.
//

#import "KCBeautyBlurBar.h"
#import "Masonry.h"
#import "MDResourceAccess.h"
@implementation BlurCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    self.layer.cornerRadius = 45.f / 2.0;

    _igwBlur = [[UIImageView alloc] init];
    _igwBlur.contentMode = UIViewContentModeScaleAspectFill;
    _igwBlur.layer.masksToBounds = YES;
    [self.contentView addSubview:_igwBlur];
    
    _lblBlur = [[UILabel alloc] init];
    _lblBlur.textColor = [UIColor whiteColor];
    _lblBlur.font = [UIFont systemFontOfSize:16.f];
    [self.contentView addSubview:_lblBlur];
    
    [_igwBlur mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [_lblBlur mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
}

@end

@interface KCBeautyBlurBar ()
@property (nonatomic, strong) UIImage *cancelImage;
@property (nonatomic, strong) UIImage *selectedImage;
@end

@implementation KCBeautyBlurBar
- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout
                  cancelImage:(UIImage *)cancelImage
                selectedImage:(UIImage *)selectedImage {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.cancelImage = cancelImage == nil ? [MDResourceAccess image:@"beauty_cancel" bundleName:@"MDBeautyBar" moduleClass:self.class] : cancelImage;
        self.selectedImage = selectedImage == nil ? [MDResourceAccess image:@"beauty_selected" bundleName:@"MDBeautyBar" moduleClass:self.class] : selectedImage;
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
    self.showsHorizontalScrollIndicator = NO;
    [self registerClass:[BlurCell class] forCellWithReuseIdentifier:@"BlurCell"];
}

-(NSInteger)numberOfSections{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BlurCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BlurCell" forIndexPath:indexPath];

    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    if (indexPath.row == 0) {
        cell.igwBlur.hidden = NO;
        cell.igwBlur.image = self.cancelImage;
        cell.lblBlur.hidden = YES;
    }else {
        cell.lblBlur.hidden = NO;
        cell.lblBlur.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        cell.igwBlur.hidden = YES;
    }
    
    if (_selectedBlur == indexPath.row) {
        cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        cell.igwBlur.hidden = NO;
        cell.igwBlur.image = self.selectedImage;
        cell.lblBlur.hidden = YES;
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _selectedBlur) {
        return;
    }
    
    NSIndexPath *preIndex = [NSIndexPath indexPathForRow:_selectedBlur inSection:0];
    _selectedBlur = indexPath.row;
    [UIView performWithoutAnimation:^{
        [collectionView reloadItemsAtIndexPaths:@[indexPath,preIndex]];
    }];
    
    if (self.selectedBlock) {
        self.selectedBlock(indexPath.row);
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
