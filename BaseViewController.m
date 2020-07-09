//
//  BaseViewController.m
//  ProblemSoSo
//
//  Created by sifangL on 2020/7/6.
//  Copyright © 2020 snow. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = self.titleStr.length > 0 ? self.titleStr : @"详情";
    
    [self setBackButton];
}

- (void)setBackButton
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"leftMore"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"leftMore"] forState:UIControlStateHighlighted];
    [btn setTitle:@"" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0, 0, 30, 44)];
    [btn addTarget:self action:@selector(backClickBase:) forControlEvents:UIControlEventTouchUpInside];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    
}

//子类重写
- (void)backClickBase:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
