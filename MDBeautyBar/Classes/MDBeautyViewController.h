//
//  MDBeautyViewController.h
//  Masonry
//
//  Created by KnowChat02 on 2019/7/8.
//

#import <UIKit/UIKit.h>
#import "KCBeautyBar.h"
NS_ASSUME_NONNULL_BEGIN

@interface MDBeautyViewController : UIViewController
@property (nonnull, nonatomic) KCBeautyBar* bar;
- (instancetype)initWithFilter:(nullable NSArray<NSString *> *)name WithValue:(nullable NSArray<NSString *> *)value;
@end

NS_ASSUME_NONNULL_END
