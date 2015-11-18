//
//  dishCell.h
//  YKMenuCollectionView
//
//  Created by doup0580 on 15/11/17.
//  Copyright © 2015年 doup0580. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dishCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *backGroundView;
@property (weak, nonatomic) IBOutlet UIScrollView *imageScroll;
@property (weak, nonatomic) IBOutlet UIView *labelView;
-(void)setSubViewsDistance:(CGFloat)distance ForRow:(NSUInteger)row;
-(void)hideAll;
-(void)allShow;


@end
