//
//  MDViewController.m
//  MDBeautyBar
//
//  Created by yinhaofrancis on 07/08/2019.
//  Copyright (c) 2019 yinhaofrancis. All rights reserved.
//

#import "MDViewController.h"
#import "KCBeautyBar.h"
#import "Masonry.h"
#import "MDBeautyViewController.h"
@interface MDViewController ()

@end

@implementation MDViewController

- (void)viewDidLoad{
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)t:(id)sender {
//    原图："origin",
//    粉嫩："fennen5",
//    清新："xiaoqingxin5",
//    白亮："bailiang7",
//    个性："gexing10"，
//    黑白："heibai1"
//    冷色调："lengsediao11",
//    暖色调："nuansediao3"
    NSArray *v = @[@"origin",
                     @"fennen5",
                     @"xiaoqingxin5",
                     @"bailiang7",
                     @"gexing10",
                     @"heibai1",
                     @"lengsediao11",
                     @"nuansediao3"];
    NSArray *n = @[@"原图",@"粉嫩",@"清新",@"白亮",@"个性",@"黑白",@"冷色调",@"暖色调"];
    
    [self presentViewController:[[MDBeautyViewController alloc] initWithFilter:n WithValue:v] animated:true completion:nil];
}

@end
