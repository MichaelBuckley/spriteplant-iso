//
//  SpritePlantIsoDocumentWindow.h
//  Spriteplant Iso
//
//  Created by Buckley on 11/6/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SceneKit/SceneKit.h>

@interface SpritePlantIsoDocumentWindow : NSWindow

@property (nonatomic, readwrite, assign) IBOutlet SCNView*     sceneView;
@property (nonatomic, readwrite, assign) IBOutlet NSTableView* documentsTable;
@property (nonatomic, readwrite, assign) IBOutlet NSTableView* primitivesTable;

@end
