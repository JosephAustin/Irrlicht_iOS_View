//
//  ViewController.m
//  Irrlicht_iOS_easy
//
//  Created by JosephAustin on 6/26/16.
//  Copyright © 2016 JosephAustin. All rights reserved.
//

#import "ViewController.hpp"

@interface ViewController ()

- (void)render;
- (void)tapReceived:(UITapGestureRecognizer *)tapGestureRecognizer;
- (void)setupScene;
- (void)onNodeTapped: (ISceneNode*) node;
@end

@implementation ViewController

// Initialize your scene here
- (void)setupScene
{
    // Add our node, i.e. our mesh of sydney. Also texture her.
    IAnimatedMeshSceneNode* node = scene->addAnimatedMeshSceneNode( scene->getMesh("sydney.md2") );
    node->setMaterialFlag(irr::video::EMF_LIGHTING, false);         // She isn't lit, since we dont have light sources
    node->setMD2Animation(irr::scene::EMAT_STAND);                  // Animation trigger
    node->setMaterialTexture( 0, driver->getTexture("sydney.bmp") );
    
    // And point the camera at her
    scene->addCameraSceneNode(0, irr::core::vector3df(0,10,-40), irr::core::vector3df(0,10,0));
}


// Respond to touch events here. The node tapped will respond
-(void)onNodeTapped: (ISceneNode*) node {
    // Rotate the node a bit
    node->setRotation(irr::core::vector3df(0,node->getRotation().Y - 20,0));
}


// For more advanced touch stuff, modify this, or use other gesture events
-(void)tapReceived:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint tap = [tapGestureRecognizer locationOfTouch:0 inView:self.view]; // You can ask for more than one touch with this
    
    // Convert to a position2d and ask the scene collision manager if any node is at that point
    position2d<irr::s32> mousePos(tap.x, tap.y);
    ISceneNode * target = scene->getSceneCollisionManager()->getSceneNodeFromScreenCoordinatesBB(mousePos);
    
    if(target) {
        [self onNodeTapped: target];
    }
}


// Render loop
- (void)render {
    device->run();
    if (device->isWindowActive())
    {
        // That last argument means nothing
        driver->beginScene(irr::video::ECBF_COLOR | irr::video::ECBF_DEPTH, irr::video::SColor(0,0,0,0));
        
        scene->drawAll();
        
        driver->endScene();
    }
}









// The technical stuff.
//-------------------------------------------------------------------------------


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup Irrlicht
    irr::SIrrlichtCreationParameters params;
    params.DriverType = irr::video::EDT_OGLES1;
    params.WindowId   = (__bridge void*)self.view;
    params.Bits       = 32;
    params.Fullscreen = true;
    params.Stencilbuffer = true;
    params.Vsync = false;
    device = createDeviceEx((const irr::SIrrlichtCreationParameters)params);
    driver = device->getVideoDriver();
    scene = device->getSceneManager();
    
    // Hook up a display link so we can get a render loop
    if(displayLink) {
        [displayLink invalidate];
        displayLink = nil;
    }
    displayLink = [[UIScreen mainScreen] displayLinkWithTarget:self selector:@selector(render)];
    [displayLink setFrameInterval:1];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                      forMode:NSDefaultRunLoopMode];

    
    // Make it so we can get touch events
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapReceived:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    [self setupScene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
