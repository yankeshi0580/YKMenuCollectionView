//
//  dishCell.m
//  YKMenuCollectionView
//
//  Created by doup0580 on 15/11/17.
//  Copyright © 2015年 doup0580. All rights reserved.
//

#import "dishCell.h"
#define canMoveDistance 200.0

@implementation dishCell
-(void)setSubViewsDistance:(CGFloat)distance ForRow:(NSUInteger)row{
    CGFloat needChange=MIN(ABS(distance) , canMoveDistance);
    
    //    背景的变换
    CGFloat scale=0.2*needChange * (1/canMoveDistance);
    CGFloat direction=(1/canMoveDistance)*(canMoveDistance-needChange)*((row%2==0)?-20:20);
    
    CGAffineTransform scaleAff=CGAffineTransformMakeScale(1.2-scale,1.2-scale);
    CGFloat needChangeS=MIN(MAX(0, distance), canMoveDistance);
    CGFloat width=160+70*needChangeS*(1/canMoveDistance);
    CGFloat xMove=(1/canMoveDistance)*(canMoveDistance-needChangeS)*65;
    CGFloat fixXMove=(row%2==0)?-xMove:xMove;
    CGFloat yMove=(1/canMoveDistance)*(canMoveDistance-needChangeS)*(15);
    CGAffineTransform translationAff=CGAffineTransformMakeTranslation(direction, yMove);
    
    [self.backGroundView setTransform:CGAffineTransformConcat(scaleAff, translationAff)];
    
    [self.labelView setTransform:CGAffineTransformMakeTranslation(-fixXMove-(fixXMove/xMove)*20, 0)];
    
    
    
    [self.imageScroll setTransform:CGAffineTransformMakeTranslation(fixXMove, 0)];
    
    [self.imageScroll setBounds:CGRectMake(0, 0, width, 160)];
    
    
}
-(void)hideAll{
    [self smaller:self.imageScroll];
    [self smaller:self.labelView];
    [self smaller:self.backGroundView];
    
    
}
-(void)smaller:(UIView *)v{
    
    [v setBounds:CGRectMake(0, 0, v.bounds.size.width*0.8,v.bounds.size.height*0.8)];
}
-(void)recover:(UIView *)v{
    v.hidden=NO;
    
    v.alpha=1;
    
    [v setBounds:CGRectMake(0, 0, v.bounds.size.width/0.8,v.bounds.size.height/0.8)];
}
-(void)allShow{
    
    [self recover:self.imageScroll];
    [self recover:self.labelView];
    [self recover:self.backGroundView];
    self.backGroundView.alpha=0.9;
    
    
}


@end
