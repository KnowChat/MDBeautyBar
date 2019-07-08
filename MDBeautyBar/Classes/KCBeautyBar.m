//
//  KCBeautyBar.m
//  Knowchat04
//
//  Created by Tyler on 2017/8/24.
//  Copyright © 2017年 yyk. All rights reserved.
//

#import "KCBeautyBar.h"
#import "KCBeautyFilterBar.h"
#import "KCBeautyBlurBar.h"
#import "KCBeautySlideBar.h"
#import "Masonry.h"
#import "MDResourceAccess.h"
@interface KCBeautyBar()
@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UIView *vwMenuBg;
@property (nonatomic, strong) UIButton *currentMenu;
@property (nonatomic, strong) UIView *currentView;
@property (nonatomic, strong) KCBeautyFilterBar *filterBar;
@property (nonatomic, strong) KCBeautyBlurBar *blurBar;
@property (nonatomic, strong) KCBeautySlideBar *whiteSlide;
@property (nonatomic, strong) KCBeautySlideBar *redSlide;
@property (nonatomic, strong) KCBeautySlideBar *thinSlide;
@property (nonatomic, strong) KCBeautySlideBar *eyeSlide;
@property (nonatomic, copy) NSString *strNoEnableTip;

@property (nonatomic, copy) NSArray *btnNormalImage;
@property (nonatomic, copy) NSArray *btnSelectedImage;
@property (nonatomic, strong) UIImage *blurCancelImage;
@property (nonatomic, strong) UIImage *blurSelectedImage;
@end

@implementation KCBeautyBar
- (instancetype)initWithNormalImages:(NSArray *)normalImages
                      selectedImages:(NSArray *)selectedImages
                     blurCancelImage:(UIImage *)blurCancelImage
                   blurSelectedImage:(UIImage *)blurSelectedImage {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        self.btnNormalImage = normalImages;
        self.btnSelectedImage = selectedImages;
        self.blurCancelImage = blurCancelImage;
        self.blurSelectedImage = blurSelectedImage;
        [self loadUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    _lblTitle = [[UILabel alloc] init];
    _lblTitle.textColor = [UIColor whiteColor];
    _lblTitle.font = [UIFont systemFontOfSize:15.f];
    [self addSubview:_lblTitle];
    
    UIView *vwLine = [[UIView alloc] init];
    vwLine.backgroundColor = [UIColor colorWithRed:142 / 255.0 green:142 / 255.0 blue:142 / 255.0 alpha:1];
    [self addSubview:vwLine];
    
    _vwMenuBg = [[UIView alloc] init];
    _vwMenuBg.backgroundColor = [UIColor blackColor];
    [self addSubview:_vwMenuBg];
    
    if (self.btnNormalImage == nil) {
        self.btnNormalImage = @[@"beauty_filters_n",
                                @"beauty_blur_n",
                                @"beauty_whitening_n",
                                @"beauty_filters_n",
                                @"beauty_face_n",
                                @"beauty_eye_n"];
    }
    
    if (self.btnSelectedImage == nil) {
        self.btnSelectedImage = @[@"beauty_filters_s",
                                  @"beauty_blur_s",
                                  @"beauty_whitening_s",
                                  @"beauty_filters_s",
                                  @"beauty_face_s",
                                  @"beauty_eye_s"];
    }
    
    for (NSInteger i = 0; i < self.btnNormalImage.count; i++) {
        UIButton *btnFilter = [[UIButton alloc] init];
        
        [btnFilter setImage:[MDResourceAccess image:self.btnNormalImage[i] bundleName:@"MDBeautyBar" moduleClass:self.class] forState:UIControlStateNormal];
        
        [btnFilter setImage:[MDResourceAccess image:self.btnSelectedImage[i] bundleName:@"MDBeautyBar" moduleClass:self.class] forState:UIControlStateSelected];
        btnFilter.tag = 100 + i;
        [_vwMenuBg addSubview:btnFilter];
        [btnFilter addTarget:self action:@selector(beautyEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        [btnFilter mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.vwMenuBg);
            make.width.mas_equalTo(CGRectGetWidth(UIScreen.mainScreen.bounds) / 6.0);
            make.height.mas_equalTo(40);
            make.left.mas_equalTo(i * CGRectGetWidth(UIScreen.mainScreen.bounds) / 6.0);
        }];
    }
    
    [_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_equalTo(11.f);
    }];
    
    [vwLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.mas_equalTo(35.f);
        make.height.mas_equalTo(0.5);
    }];
    
    [_vwMenuBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        if (@available(iOS 11.0, *)) {
            make.height.mas_equalTo(40.f+UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom);
        } else {
            make.height.mas_equalTo(40.f);
        }
    }];
}

- (void)selectBeautyType:(BeautyType)type {
    _currentMenu = [_vwMenuBg viewWithTag:100 + type];
    [self beautyEvent:_currentMenu];
}

- (void)beautyEvent:(UIButton *)btn {
    _currentMenu.selected = NO;
    _currentMenu = btn;
    _currentMenu.selected = YES;
    
    NSInteger i = btn.tag - 100;
    
    if (i == 0) {
        _lblTitle.text = @"滤镜";
        self.currentView.hidden = YES;
        self.currentView = self.filterBar;
        self.currentView.hidden = NO;
    }else if (i == 1) {
        _lblTitle.text = @"磨皮";
        self.currentView.hidden = YES;
        self.currentView = self.blurBar;
        self.currentView.hidden = NO;
    }else if (i == 2) {
        _lblTitle.text = @"美白";
        self.currentView.hidden = YES;
        self.currentView = self.whiteSlide;
        self.currentView.hidden = NO;
    }else if (i == 3) {
        _lblTitle.text = @"红润";
        self.currentView.hidden = YES;
        self.currentView = self.redSlide;
        self.currentView.hidden = NO;
    }else if (i == 4) {
        _lblTitle.text = @"廋脸";
        self.currentView.hidden = YES;
        self.currentView = self.thinSlide;
        self.currentView.hidden = NO;
    }else if (i == 5) {
        _lblTitle.text = @"大眼";
        self.currentView.hidden = YES;
        self.currentView = self.eyeSlide;
        self.currentView.hidden = NO;
    }
}

//滤镜
- (KCBeautyFilterBar *)filterBar {
    if (!_filterBar) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(60, 81);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 22;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 11, 0, 11);
        
        _filterBar = [[KCBeautyFilterBar alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self addSubview:_filterBar];
        
        NSArray *aryBundleName = @[@"origin",@"red tea",@"pink",@"refreshing",@"delta",@"hongkong"];
        NSArray *aryShowName = @[@"自然",@"柔光",@"清新",@"冷调",@"温暖",@"日系"];
        NSMutableArray *dataSource = @[].mutableCopy;
        for (NSInteger i = 0; i < aryBundleName.count; i++) {
            FilterData *data = [FilterData new];
            data.filterShowName = aryShowName[i];
            data.filterBundleName = aryBundleName[i];
            [dataSource addObject:data];
        }
        _filterBar.filtersDataSource = dataSource;
        [_filterBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.mas_equalTo(35);
            if (@available(iOS 11.0, *)) {
                make.bottom.equalTo(self.mas_safeAreaLayoutGuideBottom).offset(-40);
            } else {
                make.bottom.equalTo(self).offset(-40);
            }
        }];
    }
    _filterBar.selectedBlock = self.filterBlock;
    return _filterBar;
}

//磨皮
- (KCBeautyBlurBar *)blurBar {
    if (!_blurBar) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(45, 45);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 12;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 6, 0, 6);
        
        _blurBar = [[KCBeautyBlurBar alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout cancelImage:self.blurCancelImage selectedImage:self.blurSelectedImage];
        [self addSubview:_blurBar];
        [_blurBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.mas_equalTo(70);
            make.height.mas_equalTo(45);
        }];
    }
    _blurBar.selectedBlock = self.blurBlock;
    return _blurBar;
}

//美白
- (KCBeautySlideBar *)whiteSlide {
    if (!_whiteSlide) {
        _whiteSlide = [[KCBeautySlideBar alloc] init];
        _whiteSlide.minimumValue = 0;
        _whiteSlide.maximumValue = 1;
        [self addSubview:_whiteSlide];
        [_whiteSlide mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(77);
            make.left.mas_equalTo(37);
            make.right.equalTo(self).offset(-37);
        }];
        
    }
    _whiteSlide.valueChangeBlock = self.whiteBlock;
    return _whiteSlide;
}

//红润
- (KCBeautySlideBar *)redSlide {
    if (!_redSlide) {
        _redSlide = [[KCBeautySlideBar alloc] init];
        _redSlide.minimumValue = 0;
        _redSlide.maximumValue = 1;
        [self addSubview:_redSlide];
        [_redSlide mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(77);
            make.left.mas_equalTo(37);
            make.right.equalTo(self).offset(-37);
        }];
        
    }
    _redSlide.valueChangeBlock = self.redBlock;
    return _redSlide;
}

//廋脸
- (KCBeautySlideBar *)thinSlide {
    if (!_thinSlide) {
        _thinSlide = [[KCBeautySlideBar alloc] init];
        _thinSlide.minimumValue = 0;
        _thinSlide.maximumValue = 1;
        [self addSubview:_thinSlide];
        [_thinSlide mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(77);
            make.left.mas_equalTo(37);
            make.right.equalTo(self).offset(-37);
        }];
        
    }
    _thinSlide.valueChangeBlock = self.thinBlock;
    return _thinSlide;
}

//大眼
- (KCBeautySlideBar *)eyeSlide {
    if (!_eyeSlide) {
        _eyeSlide = [[KCBeautySlideBar alloc] init];
        _eyeSlide.minimumValue = 0;
        _eyeSlide.maximumValue = 1;
        [self addSubview:_eyeSlide];
        [_eyeSlide mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(77);
            make.left.mas_equalTo(37);
            make.right.equalTo(self).offset(-37);
        }];
        
    }
    _eyeSlide.valueChangeBlock = self.eyeBlock;
    return _eyeSlide;
}

#pragma mark - 开关控制
- (void)toggleThin:(BOOL)isEnable {
    self.thinSlide.enabled = isEnable;
    self.thinSlide.hidden = YES;
}

- (void)toggleEye:(BOOL)isEnable {
    self.eyeSlide.enabled = isEnable;
    self.eyeSlide.hidden = YES;
}

#pragma mark - 初始化
- (void)initFilter:(NSString *)filterName {
    for (NSInteger i = 0; i < self.filterBar.filtersDataSource.count; i++) {
        FilterData *data = self.filterBar.filtersDataSource[i];
        if ([data.filterBundleName isEqualToString:filterName]) {
            self.filterBar.selectedFilter = i;
            [self.filterBar reloadData];
            self.filterBar.hidden = YES;
            return;
        }
    }
}

- (void)initBlur:(NSInteger)blur {
    self.blurBar.selectedBlur = blur;
    [self.blurBar reloadData];
    self.blurBar.hidden = YES;
}

- (void)initWhite:(float)white {
    self.whiteSlide.value = white;
    self.whiteSlide.hidden = YES;
}

- (void)initRed:(float)red {
    self.redSlide.value = red;
    self.redSlide.hidden = YES;
}

- (void)initThin:(float)thin {
    self.thinSlide.value = thin;
    self.thinSlide.hidden = YES;
}

- (void)initEye:(float)eye {
    self.eyeSlide.value = eye;
    self.thinSlide.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
