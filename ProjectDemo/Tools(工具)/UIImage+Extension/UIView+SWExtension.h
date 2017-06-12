//
//  UIView+SWExtension.h
//  百思不得姐
//
//  Created by mac on 14/7/13.
//  Copyright © 2014年 shi-wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SWExtension)

/** * 控件的宽 */
@property(nonatomic,assign)CGFloat sw_width;
/** * 控件的高 */
@property(nonatomic,assign)CGFloat sw_height;
/** * 控件的 x  */
@property(nonatomic,assign)CGFloat sw_x;
/** * 控件的 y  */
@property(nonatomic,assign)CGFloat sw_y;
/** * 控件中心点 x 坐标 */
@property(nonatomic,assign)CGFloat sw_centerX;
/** * 控件中心点 y 坐标 */
@property(nonatomic,assign)CGFloat sw_centerY;

/** * 最大 x 值 */
@property(nonatomic,assign)CGFloat sw_right;
/** * 最大 y 值 */
@property(nonatomic,assign)CGFloat sw_bottom;


/** * 控件的尺寸 */
@property(nonatomic,assign)CGSize sw_size;

/** * 设置/获取一个view的原点坐标(左上脚坐标) */
@property(nonatomic,assign,readonly)CGPoint sw_origin;
/** * 返回一个view的左下角坐标 */
@property(nonatomic,assign,readonly)CGPoint sw_bottomLeft;
/** * 返回一个view的右下角坐标 */
@property(nonatomic,assign,readonly)CGPoint sw_bottomRight;
/** * 返回一个view的右上角坐标 */
@property(nonatomic,assign,readonly)CGPoint sw_topRight;

// 将一个view，移动offset
- (void)moveBy:(CGPoint)offset;
// 将一个view，放大/缩小一个比例，并不是transform
- (void)scaleBy:(CGFloat)scaleFactor;
// 将一个view，适应（缩放）到size大小(size要小于原来的)
- (void)fitInSize:(CGSize)aSize;

// 获取一个rect的中心点
CGPoint CGRectGetCenter(CGRect rect);
// 获取一个将rect的中心点，移动到center位置的新的rect
CGRect CGRectMoveToCenter(CGRect rect, CGPoint center);

@end
