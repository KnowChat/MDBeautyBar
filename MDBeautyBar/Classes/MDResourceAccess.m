//
//  MDResourceAccess.m
//  Masonry
//
//  Created by KnowChat02 on 2019/7/8.
//

#import "MDResourceAccess.h"

@implementation MDResourceAccess
+ (UIImage *)image:(NSString *)name bundleName:(NSString *)bundleName moduleClass:(Class)cls{
    NSBundle *b = [NSBundle bundleWithPath:[[NSBundle bundleForClass:cls] pathForResource:bundleName ofType:@"bundle"]];
    return [UIImage imageNamed:name inBundle:b compatibleWithTraitCollection:nil];
}
@end
