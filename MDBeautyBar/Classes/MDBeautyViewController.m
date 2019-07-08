//
//  MDBeautyViewController.m
//  Masonry
//
//  Created by KnowChat02 on 2019/7/8.
//

#import "MDBeautyViewController.h"
#import "Masonry.h"
@interface MDBeautyViewController ()<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>
@property (nonatomic,assign) BOOL isShow;
@end

@implementation MDBeautyViewController
- (instancetype)init{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* b = [[UIButton alloc] init];
    [self.view addSubview:b];
    [b mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    [b addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.bar = [[KCBeautyBar alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:self.bar];
    [self.bar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-186);
        } else {
            
            make.height.offset(186);
        }
        make.bottom.offset(0);
        
     }];
    [self.bar selectBeautyType:BeautyTypeFilter];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.isShow = true;
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.isShow = false;
    return self;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView * from = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView * to = [transitionContext viewForKey:UITransitionContextToViewKey];
    if(self.isShow){
        [transitionContext.containerView addSubview:from];
        [transitionContext.containerView addSubview:to];
        [from mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        [to mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        [self.view layoutIfNeeded];
        self.bar.transform = CGAffineTransformMakeTranslation(0, self.bar.frame.size.height);
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.bar.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:true];
        }];
    }else{
        [transitionContext.containerView addSubview:to];
        [transitionContext.containerView addSubview:from];
        [from mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        [to mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.bar.transform = CGAffineTransformMakeTranslation(0, self.bar.frame.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:true];
        }];
        
    }
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}
- (void)back{
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
