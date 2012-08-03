//
//  GraphicsModel.h
//  DrawingView2D
//
//  Created by Jeff Lutzenberger on 8/2/12.
//  Copyright 2012 Hellroaring Micromachines, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphicsModel : NSObject{
    int radius;
}

- (id)init;

-(CGFloat)extent;

-(CGPoint)center;

-(void)drawCircle:(CGContextRef)context 
       pixelScale:(double)pixelScale
           center:(CGPoint)center
            color:(CGColorRef)color;

-(void)draw:(CGContextRef)context pixelScale:(double)pixelScale;

@end
