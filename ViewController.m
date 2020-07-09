//
//  ViewController.m
//  ProblemSoSo
//
//  Created by sifangL on 2020/7/6.
//  Copyright © 2020 snow. All rights reserved.
//

#import "ViewController.h"
#import "RootListCell.h"
#import "BaseViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collFlow;

@property (strong ,nonatomic) NSArray * dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCollectionView];
    
    self.dataArray = @[
    @{@"title":@"轮播图点点",@"vc":@"CusPageControlViewController"}];
    [self.collection reloadData];
}

#pragma mark - UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    RootListCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary * dic = self.dataArray[indexPath.row];
    cell.titleLabel.text = [dic objectForKey:@"title"];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.8];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = self.dataArray[indexPath.row];
    NSString * classStr = [dic objectForKey:@"vc"];
    BaseViewController * vc = [[NSClassFromString(classStr) alloc] init];
    vc.titleStr = [dic objectForKey:@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)initCollectionView
{
    [self.collection registerNib:[UINib nibWithNibName:@"RootListCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    self.collFlow.itemSize = CGSizeMake(ScreenWidth / 3.0, 44);
    self.collFlow.minimumLineSpacing = 0;
    self.collFlow.minimumInteritemSpacing = 0;
}


@end
