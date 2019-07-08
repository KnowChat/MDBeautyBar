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
    [self presentViewController:[[MDBeautyViewController alloc] init] animated:true completion:nil];
}

@end
