//
//  MyView2D.h
//  DrawingView2D
//
//  Created by Jeff Lutzenberger on 2/12/12.
//  Copyright 2012 Hellroaring Micromachines, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingView2D.h"
#import "GraphicsModel.h"

// Our DrawingView2D implementation. This one's really simple.
@interface MyView2D : DrawingView2D{
    GraphicsModel* graphicsModel;
}

@end
