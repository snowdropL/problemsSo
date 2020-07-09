//
//  MLifePageControl.m
//  ProblemSoSo
//
//  Created by sifangL on 2020/7/6.
//  Copyright © 2020 snow. All rights reserved.
//

#import "MLifePageControl.h"
#import "BaseViewController.h"

#define dotW 10
#define dotH 2
#define magrin 2

@implementation MLifePageControl
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置page位置
    [self setPosition];

    //计算圆点间距
    CGFloat marginX = dotW + magrin;
    
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        
        if (i == self.currentPage) {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotH)];
        }else {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotH)];
        }
    }
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    for (NSUInteger i = 0; i < [self.subviews count]; i++) {
            
        //计算圆点间距
        UIImageView* subview = [self.subviews objectAtIndex:i];
        //设置item的圆角
        subview.layer.cornerRadius = 1.0f;
        subview.layer.masksToBounds = YES;
        subview.backgroundColor = RGBACOLOR(255, 255, 255, 0.4);
        if (self.currentPage == i) {
            subview.backgroundColor = RGBACOLOR(177, 46, 37, 1);
        } 
        //设置item的大小
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y, dotW, dotH)];
    }
    
}
- (void)setPosition
{
    CGFloat marginX = dotW + magrin;
    
    //计算整个pageControll的宽度
    CGFloat newW = (self.numberOfPages - 1 ) * marginX  + dotW;
    
    //设置新frame
    switch (self.pagePosition) {
        case PageShowLeft:
        {
            self.frame = CGRectMake(self.space, self.frame.origin.y, newW, self.frame.size.height);
        }
            break;
        case PageShowMiddle:
        {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW + dotW, self.frame.size.height);

            //设置居中
            CGPoint center = self.center;
            center.x = self.superview.center.x;
            self.center = center;
        }
            break;
        case PageShowRight:
        {
            self.frame = CGRectMake(ScreenWidth - newW - 16, self.frame.origin.y, newW + dotW, self.frame.size.height);
        }
            break;
            
        default:
            break;
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
