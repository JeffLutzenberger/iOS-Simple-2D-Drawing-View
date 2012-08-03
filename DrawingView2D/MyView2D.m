//
//  MyView2D.m
//  DrawingView2D
//
//  Created by Jeff Lutzenberger on 2/12/12.
//  Copyright 2012 Hellroaring Micromachines, LLC. All rights reserved.
//

#import "MyView2D.h"


@implementation MyView2D

- (id)initWithCoder:(NSCoder *)aDecoder 
{
    self = [super initWithCoder:aDecoder];
    if(self){
        graphicsModel = [[GraphicsModel alloc] init];
        [self ZoomToExtents];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat pixelScale = self.frame.size.width/viewRect.size.width;    
    [super  drawRect:rect];
    [graphicsModel draw:context pixelScale:pixelScale];
}

- (void)ZoomToExtents
{
    //override this to point the origin of the viewport
    //at the center of your model
    CGFloat modelExtent = [graphicsModel extent];
    CGPoint modelCenter = [graphicsModel center];
    [self Resize:modelExtent modelCenter:modelCenter];
}

@end
