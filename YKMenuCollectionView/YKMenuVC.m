//
//  YKMenuVC.m
//  YKMenuCollectionView
//
//  Created by doup0580 on 15/11/17.
//  Copyright © 2015年 doup0580. All rights reserved.
//

#import "YKMenuVC.h"
#import "dishCell.h"
@interface YKMenuVC ()

@end

@implementation YKMenuVC{
    BOOL intial;
}

static NSString * const reuseIdentifier1 = @"titlecell";
static NSString * const reuseIdentifier2 = @"scell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
-(UICollectionViewCell *)getCellRow:(NSUInteger)row{
    NSIndexPath *indexPath=[NSIndexPath indexPathForItem:row inSection:0  ];
    return [self.collectionView cellForItemAtIndexPath:indexPath];
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}
-(void)invitalCell{
    self.collectionView.userInteractionEnabled=NO;
    [self processIndexPathFirst];
    for ( int i=0; i<2; i++) {
        dishCell *cell =(dishCell *)[self getCellRow:i+1];
        [cell setSubViewsDistance:cell.center.y-667/2 ForRow:i+1];
        [cell hideAll];
    }
}
-(void)processIndexPathFirst{
    UICollectionViewCell *cell=[self getCellRow:0];
    UIImageView *hidev=[cell viewWithTag:999];
    hidev.layer.masksToBounds=YES;
    hidev.layer.cornerRadius=hidev.bounds.size.width/2.0;
    
    UILabel *view1=(UILabel *)[cell viewWithTag:666];
    view1.hidden=YES;
    view1.alpha=0.8;
    CGAffineTransform move=CGAffineTransformMakeTranslation(0, 30);
    [view1 setTransform:move];
    UIView *view2=[cell viewWithTag:888];
    view2.hidden=YES;
    [view2 setBackgroundColor:[UIColor clearColor]];
    [view2 setTransform:move];
    [self firstAppearView:view1 view2:view2 view3:hidev];
    
    
}
-(void)firstAppearView:(UIView *)v1 view2:(UIView *)v2 view3:(UIView *)v3{
    
    CGAffineTransform move=CGAffineTransformMakeTranslation(0, 0);
    [UIView animateKeyframesWithDuration:1.5 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.7 animations:^{
            v1.hidden=NO;
            v1.alpha=1;
            
            [v1 setTransform:move];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:1 animations:^{
            v2.hidden=NO;
            [v2 setTransform:move];
            
            
        }];
        
    } completion:^(BOOL finished) {
        
        for ( int i=0; i<2; i++) {
           dishCell *cell =(dishCell *)[self getCellRow:i+1];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:1 animations:^{
                    [cell allShow];
                    
                    v2.backgroundColor=[UIColor colorWithRed:54/255.0 green:63/255.0 blue:71/255.0 alpha:0.9];
                    v3.center=CGPointMake(v3.center.x-v3.bounds.size.width/4.0, v3.center.y);
                    
                } completion:^(BOOL finished) {
                    self.collectionView.userInteractionEnabled=YES;
                    
                }];
                
            });
            
        }
        
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    //   [v2 setBackgroundColor:[UIColor colorWithRed:54/255.0 green:63/255.0 blue:71/255.0 alpha:0.9]];
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showAllSubView{
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier1 forIndexPath:indexPath];
        
        return cell;
    }else{
        
        dishCell*cell = (dishCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier2 forIndexPath:indexPath];
        if (indexPath.row>2) {
            [self showAll:cell];
            
        }
        if (indexPath.row%2==0) {
            cell.backGroundView.backgroundColor=[UIColor colorWithRed:179/255.0 green:193/255.0 blue:54/255.0 alpha:1];
        }
        else{
            cell.backGroundView.backgroundColor=[UIColor colorWithRed:166/255.0 green:60/255.0 blue:38/255.0 alpha:1];
            
        }
        [self setShadowColor:cell];
        return cell;
        
    }
}
-(void)showAll:(dishCell *)v{
    [self recover:v.imageScroll];
    [self recover:v.labelView];
    [self recover:v.backGroundView];
}
-(void)recover:(UIView *)v{
    v.hidden=NO;
    
    v.alpha=1;
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    当第三个加载结束后 刷新subviews
    
    if ([cell isKindOfClass:[dishCell class]]&&indexPath.row==2&&!intial) {
        dispatch_async(dispatch_get_main_queue(),^{
            [self invitalCell];
            
        });
        intial=YES;
        
    }
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size=(indexPath.row==0)?CGSizeMake(375, 220):CGSizeMake(375, 250);
    return size;
    
}
-(void)setlayer:(CALayer *)layer{
    [layer setShadowColor:[UIColor blackColor].CGColor];
    [layer setShadowOffset:CGSizeMake(0, 2)];
    [layer setShadowOpacity:0.8];
}
-(void)setShadowColor:(dishCell *)cell{
    [self setlayer:cell.backGroundView.layer];
    [self setlayer:cell.imageScroll.layer];
    [self setlayer:cell.labelView.layer];
    
}

@end
