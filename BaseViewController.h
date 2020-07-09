//
//  BaseViewController.h
//  ProblemSoSo
//
//  Created by sifangL on 2020/7/6.
//  Copyright © 2020 snow. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (strong ,nonatomic) NSString * titleStr;

//子类重写
- (void)backClickBase:(UIButton *)btn;
@end

NS_ASSUME_NONNULL_END
