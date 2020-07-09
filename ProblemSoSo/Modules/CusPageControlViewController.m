//
//  CusPageControlViewController.m
//  ProblemSoSo
//
//  Created by sifangL on 2020/7/6.
//  Copyright © 2020 snow. All rights reserved.
//

#import "CusPageControlViewController.h"
#import "MLifePageControl.h"

@interface CusPageControlViewController ()
{
    NSTimer * scrollTimer;
    MLifePageControl * mPageControll;
}

@end

@implementation CusPageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addPagecontrol];
    [self startScrollTimer];
}

- (void)addPagecontrol
{
    mPageControll = [[MLifePageControl alloc] init];
    [mPageControll setFrame:CGRectMake(0, 100, ScreenWidth, 50)];
    mPageControll.numberOfPages = 5;
    mPageControll.space = 16;
    mPageControll.pagePosition = PageShowRight;
    [self.view addSubview:mPageControll];
}

- (void)startScrollTimer
{
    scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scrollScrollView:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:scrollTimer forMode:NSRunLoopCommonModes];
}
- (void)scrollScrollView:(NSTimer *)timer
{
    if (mPageControll.currentPage == mPageControll.numberOfPages - 1) {
        [mPageControll setCurrentPage:0];
    }
    else {
        mPageControll.currentPage++;
    }
    
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
