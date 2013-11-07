//
//  BTLSceneDelegate.m
//  Spriteplant Iso
//
//  Created by Buckley on 11/6/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import <OpenGL/gl.h>

#import "BTLSceneDelegate.h"

@implementation BTLSceneDelegate

#define TILE_SIZE 20.0

- (void) renderer: (id<SCNSceneRenderer>) renderer didRenderScene: (SCNScene*) scene atTime: (NSTimeInterval) time
{
    SCNView* view = (SCNView*) renderer;
    NSRect bounds = [view bounds];
    
    glPushMatrix();
    
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, bounds.size.width, 0, bounds.size.height, -1.0, 1.0);
    
    glClear(GL_COLOR_BUFFER_BIT);
    
    int hTiles = ceil(bounds.size.width / TILE_SIZE);
    int vTiles = ceil(bounds.size.height / TILE_SIZE);
    
    for (int h = 0; h < hTiles; ++h)
    {
        for (int v = 0; v < vTiles; ++v)
        {
            if ((v + h) % 2 == 0)
            {
                glColor3f(0.7, 0.7, 0.7);
                glRectf(h * TILE_SIZE,
                        bounds.size.height - (v + 1) * TILE_SIZE,
                        (h + 1) * TILE_SIZE,
                        bounds.size.height - v * TILE_SIZE);
            }
        }
    }
    
    glPopMatrix();
    glFlush();
}

@end
