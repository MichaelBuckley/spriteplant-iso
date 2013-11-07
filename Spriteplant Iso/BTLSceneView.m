//
//  BTLSceneView.m
//  Spriteplant Iso
//
//  Created by Buckley on 11/6/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import "BTLSceneView.h"

@implementation BTLSceneView

- (void) awakeFromNib
{
    [self setScene: [SCNScene new]];
    
    [self setBackgroundColor: [NSColor blackColor]];
    
    SCNLight *ambientLight = [SCNLight light];
    SCNNode *ambientLightNode = [SCNNode node]; ambientLight.type = SCNLightTypeAmbient; ambientLight.color = [NSColor colorWithDeviceWhite:0.1
                                                                                                                                      alpha:1.0];
    [[self scene].rootNode addChildNode:ambientLightNode];
    
    SCNBox* box = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0];
    SCNNode* boxNode = [SCNNode nodeWithGeometry: box];
    
    [[[self scene] rootNode] addChildNode: boxNode];
}

@end
