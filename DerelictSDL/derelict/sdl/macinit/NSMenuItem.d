/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sdl.macinit.NSMenuItem;

version (darwin):

import derelict.sdl.macinit.ID;
import derelict.sdl.macinit.NSGeometry;
import derelict.sdl.macinit.NSMenu;
import derelict.sdl.macinit.NSObject;
import derelict.sdl.macinit.NSString;
import derelict.sdl.macinit.runtime;
import derelict.sdl.macinit.selectors;
import derelict.sdl.macinit.string;

package:

class NSMenuItem : NSObject
{
    this ()
    {
        id_ = null;
    }

    this (id id_)
    {
        this.id_ = id_;
    }

    static NSMenuItem alloc ()
    {
        id result = objc_msgSend(cast(id)class_, sel_alloc);
        return result ? new NSMenuItem(result) : null;
    }

    static Class class_ ()
    {
    	return cast(Class) objc_getClass!(this.stringof);
    }

    NSMenuItem init ()
    {
        id result = objc_msgSend(this.id_, sel_init);
        return result ? this : null;
    }

    static NSMenuItem separatorItem ()
    {
        id result = objc_msgSend(class_NSMenuItem, sel_separatorItem);
        return result ? new NSMenuItem(result) : null;
    }

    NSMenuItem initWithTitle (NSString itemName, string anAction, NSString charCode)
    {
        id result = objc_msgSend(this.id_, sel_initWithTitle_action_keyEquivalent, itemName ? itemName.id_ : null, sel_registerName!(anAction).ptr, charCode ? charCode.id_ : null);
        return result ? new NSMenuItem(result) : null;
    }

    NSString title ()
    {
        id result = objc_msgSend(this.id_, sel_title);
        return result ? new NSString(result) : null;
    }

    void setTitle (NSString str)
    {
        objc_msgSend(this.id_, sel_setTitle, str ? str.id_ : null);
    }

    bool hasSubmenu ()
    {
        return objc_msgSend(this.id_, sel_hasSubmenu) !is null;
    }

    NSMenu submenu ()
    {
        id result = objc_msgSend(this.id_, sel_submenu);
        return result ? new NSMenu(result) : null;
    }

    void setKeyEquivalentModifierMask (NSUInteger mask)
    {
        objc_msgSend(this.id_, sel_setKeyEquivalentModifierMask, mask);
    }

    void setSubmenu (NSMenu submenu)
    {
        objc_msgSend(this.id_, sel_setSubmenu, submenu ? submenu.id_ : null);
    }
}