//
//  BTLDocumentWindowController.h
//  Spriteplant Iso
//
//  Created by Buckley on 11/3/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class BTLSceneDelegate;

@interface SpritePlantIsoDocumentWindowController : NSWindowController

- (void) addDocument:    (NSDocument*) document;
- (void) removeDocument: (NSDocument*) document;

@property (nonatomic, readwrite, retain) BTLSceneDelegate* sceneDelegate;

@end
