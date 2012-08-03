//
//  GraphicsModel.m
//  DrawingView2D
//
//  Created by Jeff Lutzenberger on 8/2/12.
//  Copyright 2012 Hellroaring Micromachines, LLC. All rights reserved.
//

#import "GraphicsModel.h"

@implementation GraphicsModel

- (id)init
{
    self = [super init];
    radius = 10;
    return self;
}

-(CGFloat)extent{
    return 100;
}

-(CGPoint)center{
    return CGPointMake(0,0);
}

-(void)drawCircle:(CGContextRef)context 
       pixelScale:(double)pixelScale
           center:(CGPoint)center
            color:(CGColorRef)color
{
    CGRect circle = CGRectMake(center.x, center.y, radius*2, radius*2);
    CGContextSetLineWidth(context, 8.0/pixelScale);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextAddEllipseInRect(context, circle);
    CGContextStrokePath(context);
}

-(void)draw:(CGContextRef)context pixelScale:(double)pixelScale{
    //draw olympic rings
    //3 on top (blue, black, red)
    //2 on bottom (gold, green)
    double gap = radius*0.4;
    CGPoint p = CGPointMake(-radius-gap-2*radius, 0);
    [self drawCircle:context pixelScale:pixelScale center:p color:[UIColor blueColor].CGColor];
    p = CGPointMake(-radius, 0);
    [self drawCircle:context pixelScale:pixelScale center:p color:[UIColor blackColor].CGColor];
    p = CGPointMake(radius+gap, 0);
    [self drawCircle:context pixelScale:pixelScale center:p color:[UIColor redColor].CGColor];
    p = CGPointMake(-2*radius-gap/2, -radius);
    [self drawCircle:context pixelScale:pixelScale center:p color:[UIColor yellowColor].CGColor];
    p = CGPointMake(gap/2, -radius);
    [self drawCircle:context pixelScale:pixelScale center:p color:[UIColor greenColor].CGColor];
}

@end
