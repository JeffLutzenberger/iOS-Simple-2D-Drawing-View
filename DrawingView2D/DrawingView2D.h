//
//  DrawingView.h
//
//  Created by Jeff Lutzenberger on 2/11/12.
//  Copyright 2012 Hellroaring Micromachines, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

// A simple drawing class that uses Core Graphics to handle 2D drawing
// Inhertis from UIView so it can be bound to a UIView in a storyboard
// Handles the following:
//  - pan
//  - zoom
//  - zoom to extents
//  - invalidation for gestures (redraw after gesture)
//  - y-flip
//  - screen to world transformation
//  - world to screen transformation
//
// Usage: Your drawing implementation should inherit from this class.
//        For basic drawing you should override drawRect and zoomToExtents.
//        
@interface DrawingView2D : UIView {
    //Our viewport
    CGRect viewRect;
    //toggle gesture support
    bool allowPanGestures;
    bool allowPinchGestures;
    bool allowTapGestures;
}

//Moves the viewport to the model center and rests the scale based on
//model extents
- (void)Resize:(CGFloat)modelExtent modelCenter:(CGPoint)modelCenter;

//Zoom to the extents of the current model
- (void)ZoomToExtents;

//convert this window point to a point in space (world coords)
- (CGPoint)WindowToWorld: (CGPoint)windowPt;

//convert this world point to a point in the UIView rectangle
- (CGPoint)WorldToWindow: (CGPoint)worldPt;

//used to test drawing
- (void)DrawCircle;

@end
