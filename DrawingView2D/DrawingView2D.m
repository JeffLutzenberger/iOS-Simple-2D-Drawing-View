//
//  DrawingView.m
//  fea_tester
//
//  Created by Jeff Lutzenberger on 2/11/12.
//  Copyright 2012 Hellroaring Micromachines, LLC. All rights reserved.
//

#import "DrawingView2D.h"


@implementation DrawingView2D

- (id)initWithCoder:(NSCoder *)aDecoder
{
    allowPanGestures = true;
    allowPinchGestures = true;
    allowTapGestures = true;
    
    self = [super initWithCoder:aDecoder];
    if(self) {
        
        //set pan gesture
        if( allowPanGestures )
        {
            UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
            [panRecognizer setMinimumNumberOfTouches:1];
            [panRecognizer setMaximumNumberOfTouches:1];
            [self addGestureRecognizer:panRecognizer];
            
        }
        //set pinch gesture
        if( allowPinchGestures )
        {
            UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchDetected:)];
            [self addGestureRecognizer:pinchRecognizer];
        }
        //set tap gesture
        if( allowTapGestures )
        {
            UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
            tapRecognizer.numberOfTapsRequired = 2;
            [self addGestureRecognizer:tapRecognizer];
        }
        
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

- (void)panDetected:(UIPanGestureRecognizer *)panRecognizer
{
    CGPoint translation = [panRecognizer translationInView:self];
    CGFloat tempScale = viewRect.size.width/self.frame.size.width;
    viewRect.origin.x -= translation.x*tempScale;
    viewRect.origin.y -= translation.y*tempScale;
    [panRecognizer setTranslation:CGPointZero inView:self];
    [self setNeedsDisplay];
}

- (void)pinchDetected:(UIPinchGestureRecognizer *)pinchRecognizer
{
    CGFloat pinchScale = pinchRecognizer.scale;
    CGPoint origin = viewRect.origin;
    viewRect = CGRectMake(origin.x, origin.y, viewRect.size.width/pinchScale, viewRect.size.height/pinchScale);
    pinchRecognizer.scale = 1.0;
    [self setNeedsDisplay];
}

- (void)tapDetected:(UIPinchGestureRecognizer *)tapRecognizer
{
    [self ZoomToExtents];
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //new
    // Drawing code
    //flip our view so that the origin is Lower Left
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, self.frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    //now set our scale (window height/model height)
    CGFloat tempScale = self.frame.size.width/viewRect.size.width;
    
    //and translate to the center of our view
    CGContextScaleCTM(context, tempScale, tempScale);
    CGContextTranslateCTM(context, 
                          -viewRect.origin.x, 
                          viewRect.origin.y + viewRect.size.height);
    
}

- (void)Resize: (CGFloat)modelExtent modelCenter:(CGPoint)modelCenter
{
    CGFloat modelWidth = modelExtent;
    CGFloat modelHeight = modelExtent;
    if( self.frame.size.height > self.frame.size.width )
    {
        modelHeight = self.frame.size.height/self.frame.size.width*modelWidth;
    }
    else
    {
        modelWidth = self.frame.size.width/self.frame.size.height*modelHeight;
    }
    CGPoint origin = CGPointMake(modelCenter.x-modelWidth/2, modelCenter.y-modelHeight/2);
    viewRect = CGRectMake(origin.x, origin.y, modelWidth, modelHeight);
}

- (void)DrawCircle
{
    
    CGFloat pixelScale = self.frame.size.width/viewRect.size.width;
    CGFloat radius = 50;
    CGFloat sigma2 = 0;
    CGRect circle = CGRectMake(sigma2, -radius, radius*2, radius*2);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0/pixelScale);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextAddEllipseInRect(context, circle);
    CGContextStrokePath(context);
}

- (void)ZoomToExtents
{
    CGFloat modelExtent = 100;
    CGPoint modelCenter = CGPointMake(50, 0);
    [self Resize:modelExtent modelCenter:modelCenter];
}
- (CGPoint)WorldToWindow: (CGPoint)worldPt
{
    //x 
    CGFloat x0win = 0;
    CGFloat x2win = self.frame.size.width;
    CGFloat x2world = viewRect.size.width + viewRect.origin.x;
    CGFloat x0world = viewRect.origin.x;
    CGFloat x1win = (worldPt.x-x0world)/(x2world-x0world)*(x2win-x0win);
    
    //y 
    CGFloat y0win = 0;
    CGFloat y2win = self.frame.size.height;
    CGFloat y2world = viewRect.size.height + viewRect.origin.y;
    CGFloat y0world = viewRect.origin.y;
    CGFloat y1win = (worldPt.y-y0world)/(y2world-y0world)*(y2win-y0win);
    
    return CGPointMake( x1win, self.frame.size.height - y1win );
    
}

- (CGPoint)WindowToWorld: (CGPoint)windowPt
{
    //x 
    CGFloat x0win = 0;
    CGFloat x2win = self.frame.size.width;
    CGFloat x2world = viewRect.size.width + viewRect.origin.x;
    CGFloat x0world = viewRect.origin.x;
    CGFloat x1world = x0world + (windowPt.x-x0win)/(x2win-x0win)*(x2world-x0world);
    
    //y 
    CGFloat y0win = 0;
    CGFloat y2win = self.frame.size.height;
    CGFloat y2world = viewRect.size.height + viewRect.origin.y;
    CGFloat y0world = viewRect.origin.y;
    CGFloat y1world = y0world + (windowPt.y-y0win)/(y2win-y0win)*(y2world-y0world);
    
    return CGPointMake( x1world, y1world );
}


@end
