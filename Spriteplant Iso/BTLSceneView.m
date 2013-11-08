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
    
    SCNLight *spotlight = [SCNLight light];
    SCNNode *spotlightNode = [SCNNode node];
    [spotlight setType: SCNLightTypeOmni];
    [spotlight setColor: [NSColor colorWithDeviceWhite: 0.7 alpha:1.0]];
    [spotlight setAttribute: [NSNumber numberWithInt:90] forKey: SCNLightSpotOuterAngleKey];
    [spotlightNode setPosition: SCNVector3Make(0, 2, 0)];
    //[spotlightNode setRotation: SCNVector4Make(1.0, 0, 0, -M_PI_2)];
    
    [spotlightNode setLight: spotlight];
    [[self scene].rootNode addChildNode: spotlightNode];
    
    SCNLight* ambientLight = [SCNLight light];
    SCNNode* ambientLightNode = [SCNNode node];
    
    [ambientLight setType: SCNLightTypeAmbient];
    [ambientLight setColor: [NSColor colorWithDeviceWhite: 0.01 alpha:1.0]];
    [ambientLightNode setLight: ambientLight];
    
    [[self scene].rootNode addChildNode: ambientLightNode];
    
    SCNCamera *camera = [SCNCamera camera];
    camera.xFov = 45;   // Degrees, not radians
    camera.yFov = 45;
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = camera;
    cameraNode.position = SCNVector3Make(0, 0, 2);
    [[self scene].rootNode addChildNode:cameraNode];
    
    //SCNBox* box = [SCNCylinder cylinderWithRadius: 1.0 height:2.0];
    //SCNBox* box = [SCNSphere sphereWithRadius: 1.0];
    SCNBox* box = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0.0];
    SCNNode* boxNode = [SCNNode nodeWithGeometry: box];
    [boxNode setRotation: SCNVector4Make(1.0, 0, 0, 0.942477796)];
    
    SCNMaterial* material = [SCNMaterial material];
    [[material diffuse] setContents: [NSColor blueColor]];
    [[material specular] setContents: [NSColor blueColor]];
    //[[material emission] setContents: [NSColor redColor]];
    [material setLocksAmbientWithDiffuse: YES];
    [material setShininess: 0.0];
    [material setLightingModelName: SCNLightingModelBlinn];
    
    [box setMaterials: @[ material ]];
    
    [[[self scene] rootNode] addChildNode: boxNode];
}

@end
