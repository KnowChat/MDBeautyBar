//
//  MDResourceAccess.h
//  Masonry
//
//  Created by KnowChat02 on 2019/7/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDResourceAccess : NSObject
+(UIImage *)image:(NSString *)name bundleName:(NSString *)bundleName moduleClass:(Class)cls;
@end

NS_ASSUME_NONNULL_END
