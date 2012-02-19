//
//  DrawingView.h
//  fea_tester
//
//  Created by Jeff Lutzenberger on 2/11/12.
//  Copyright 2012 Hellroaring Micromachines, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawingView2D : UIView {
    CGRect viewRect;
    
    double scale;
    
    bool allowPanGestures;
    bool allowPinchGestures;
    bool allowTapGestures;
    
}

- (void)Resize:(CGFloat)modelExtent modelCenter:(CGPoint)modelCenter;
- (void)ZoomToExtents;
- (CGPoint)WindowToWorld: (CGPoint)windowPt;
- (CGPoint)WorldToWindow: (CGPoint)worldPt;

- (void)DrawCircle;

@end
