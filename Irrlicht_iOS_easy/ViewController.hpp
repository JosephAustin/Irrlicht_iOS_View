//
//  ViewController.h
//  Irrlicht_iOS_easy
//
//  Created by JosephAustin on 6/26/16.
//  Copyright © 2016 JosephAustin. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "irrlicht.h"

using namespace irr;
using namespace irr::scene;
using namespace irr::video;
using namespace irr::core;

@interface ViewController : UIViewController {

    CADisplayLink *displayLink; // For a render loop

    IrrlichtDevice* device; // Connects irrlicht to our view
    
    // Helper pointers for easier irrlicht access
    IVideoDriver* driver;
    ISceneManager* scene;
}
@end

