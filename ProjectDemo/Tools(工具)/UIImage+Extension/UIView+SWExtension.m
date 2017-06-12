
/**
 *  UIView 扩展类
 *
 *  获取 View frame 属性
 */

#import "UIView+SWExtension.h"

@implementation UIView (SWExtension)

- (CGFloat)sw_width
{
    return self.frame.size.width;
}

- (CGFloat)sw_height
{
    return self.frame.size.height;
}

- (void)setSw_width:(CGFloat)sw_width
{
    CGRect frame = self.frame;
    frame.size.width = sw_width;
    self.frame = frame;
}

- (void)setSw_height:(CGFloat)sw_height
{
    CGRect frame = self.frame;
    frame.size.height = sw_height;
    self.frame = frame;
}

- (CGFloat)sw_x
{
    return self.frame.origin.x;
}

- (void)setSw_x:(CGFloat)sw_x
{
    CGRect frame = self.frame;
    frame.origin.x = sw_x;
    self.frame = frame;
}

- (CGFloat)sw_y
{
    return self.frame.origin.y;
}

- (void)setSw_y:(CGFloat)sw_y
{
    CGRect frame = self.frame;
    frame.origin.y = sw_y;
    self.frame = frame;
}

- (CGFloat)sw_centerX
{
    return self.center.x;
}

- (void)setSw_centerX:(CGFloat)sw_centerX
{
    CGPoint center = self.center;
    center.x = sw_centerX;
    self.center = center;
}

- (CGFloat)sw_centerY
{
    return self.center.y;
}

- (void)setSw_centerY:(CGFloat)sw_centerY
{
    CGPoint center = self.center;
    center.y = sw_centerY;
    self.center = center;
}

- (CGFloat)sw_right
{
//    return self.sw_x + self.sw_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)sw_bottom
{
//    return self.sw_y + self.sw_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setSw_right:(CGFloat)sw_right
{
    self.sw_x = sw_right - self.sw_width;
}

- (void)setSw_bottom:(CGFloat)sw_bottom
{
    self.sw_y = sw_bottom - self.sw_height;
}

/** * 尺寸 */

- (CGSize)sw_size
{
    return self.frame.size;
}

- (void)setSw_size:(CGSize)sw_size
{
    CGRect frame = self.frame;
    frame.size = sw_size;
    self.frame = frame;
}
- (CGPoint)sw_origin {
    return self.frame.origin;
}

- (void)setSw_Origin:(CGPoint)sw_point {
    CGRect newFrame = self.frame;
    newFrame.origin = sw_point;
    self.frame = newFrame;
}

- (CGPoint)sw_bottomRight {
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)sw_bottomLeft {
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)sw_topRight {
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (void)moveBy:(CGPoint)offset {
    CGPoint newCenter = self.center;
    newCenter.x += offset.x;
    newCenter.y += offset.y;
    self.center = newCenter;
}

- (void)scaleBy:(CGFloat)scaleFactor
{
    CGRect newFrame = self.frame;
    newFrame.size.width *= scaleFactor;
    newFrame.size.height *= scaleFactor;
    self.frame = newFrame;
}

- (void)fitInSize:(CGSize)aSize {
    CGFloat scale;
    CGRect newFrame = self.frame;
    
    if (newFrame.size.height && (newFrame.size.height > aSize.height)) {
        scale = aSize.height / newFrame.size.height;
        newFrame.size.width *= scale;
        newFrame.size.height *= scale;
    }
    
    if (newFrame.size.width && (newFrame.size.width >= aSize.width)) {
        scale = aSize.width / newFrame.size.width;
        newFrame.size.width *= scale;
        newFrame.size.height *= scale;
    }
    
    self.frame = newFrame;
}

CGPoint CGRectGetCenter(CGRect rect) {
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center) {
    CGRect newRect = CGRectZero;
    newRect.origin.x = center.x - CGRectGetMidX(rect);
    newRect.origin.y = center.y - CGRectGetMidY(rect);
    newRect.size = rect.size;
    return newRect;
}


@end
