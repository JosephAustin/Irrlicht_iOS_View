# Irrlicht_iOS_View
A simple view controller which renders the Irrlicht engine, allowing for easy graphical apps.

Included is the complete Irrlicht source. The main xcode project here treats it as a part of the project and a dependency, 
so you can modify it and compile your changes all in one place. All the code you need is in irrlicht_iOS_easy/ViewController.mm.
This modification is so that you don't have to have an irrlicht_main and can use views, storyboards and other iOS standard
items like normal.

Note you have no app delegate or main. Irrlicht takes care of that. Ideally it could be pushed off on our end, but I am happy
with this as it is. Enjoy!


  The Irrlicht Engine License
  ===========================

  Copyright (C) 2002-2012 Nikolaus Gebhardt

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgement in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be clearly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
