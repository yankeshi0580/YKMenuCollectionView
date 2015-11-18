//
//  YKMenuFlowLayout.m
//  YKMenuCollectionView
//
//  Created by doup0580 on 15/11/17.
//  Copyright © 2015年 doup0580. All rights reserved.
//

#import "YKMenuFlowLayout.h"
#import "dishCell.h"
@implementation YKMenuFlowLayout
-(void)prepareLayout{
    [super prepareLayout];
    
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *resultArr=[NSMutableArray array];
    NSArray *arr=[super layoutAttributesForElementsInRect:rect];
    CGRect newBounds=self.collectionView.bounds;
    for (UICollectionViewLayoutAttributes *attributes in arr) {
        
        CGFloat screenCenterY=CGRectGetMidY(newBounds);
        CGFloat distanceY=attributes.center.y-screenCenterY;
        if (attributes.indexPath.row!=0) {
            dishCell *cell=(dishCell *)[self.collectionView cellForItemAtIndexPath:attributes.indexPath];
            [cell setSubViewsDistance:distanceY ForRow:attributes.indexPath.row];
            
        }
        
        [resultArr addObject:attributes];
        
    }
      return resultArr;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
