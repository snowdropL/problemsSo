//
//  MLifePageControl.h
//  ProblemSoSo
//
//  Created by sifangL on 2020/7/6.
//  Copyright © 2020 snow. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/* pageControll显示的位置 */
typedef enum {
    PageShowLeft,   //居左
    PageShowMiddle, //居中
    PageShowRight,   //居右

}PagePosition;

@interface MLifePageControl : UIPageControl

@property (nonatomic) PagePosition pagePosition;    //PageControll的位置，目前提供底部左侧、底部中间、底部右侧显示

@property (nonatomic) CGFloat space;    //PageControll距离屏幕左右距离

@end

NS_ASSUME_NONNULL_END
