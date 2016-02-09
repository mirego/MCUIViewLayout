// Copyright (c) 2016, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import UIKit

/**
 Swift wrapper for MCUIViewLayout
 
 Features:
    * Simplified syntaxe, remove all “mc_()”
    * Many view properties are exposed as variable in Swift:
         - width: CGFloat     [read-write]
         - height: CGFloat    [read-write]
         - size: CGSize       [read-write]
         - origin: CGPoint    [read-write]
         - xPosition: CGFloat [read only]
         - yPosition: CGFloat [read only]
         - maxX: CGFloat      [read only]
         - maxY: CGFloat      [read only]
         - minX: CGFloat      [read only]
         - minY: CGFloat      [read only]
         - midX: CGFloat      [read only]
         - midY: CGFloat      [read only]

        Examples:
            myChild.size = view.size
            myChild.width = view.width

    * Only expose two methods to position UIView easily:  setPosition() and setRelativePosition()
            Optional parameters: margins and size parameters are optionals, so they can be omitted.

        Examples:
            myChild.setPosition(.PositionTopHCenter)
            myChild.setPosition(.PositionTopHCenter, size: CGSize(width: 10, height: 10))
            myChild.setPosition(.PositionTopLeft, size: CGSize(width: parentView.width / 2, height: parentView.height / 2))
 
            myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView, margins: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
*/
extension UIView
{
    var width: CGFloat {
        set {
            mc_setWidth(newValue)
        }

        get {
            return bounds.width
        }
    }

    var height: CGFloat {
        set {
            mc_setHeight(newValue)
        }

        get {
            return bounds.height
        }
    }

    var size: CGSize {
        set {
            mc_setSize(newValue)
        }

        get {
            return bounds.size
        }
    }

    var origin: CGPoint {
        set {
            mc_setOrigin(newValue)
        }

        get {
            return frame.origin
        }
    }

    var xPosition: CGFloat {
        return frame.origin.x
    }

    var yPosition: CGFloat {
        return frame.origin.y
    }

    var maxX: CGFloat {
        return frame.maxX
    }

    var maxY: CGFloat {
        return frame.maxY
    }

    var minX: CGFloat {
        return frame.minX
    }

    var minY: CGFloat {
        return frame.minY
    }

    var midX: CGFloat {
        return frame.midX
    }

    var midY: CGFloat {
        return frame.midY
    }

    func setPosition(position: MCViewPosition, inView: UIView? = nil, margins: UIEdgeInsets? = nil, size: CGSize? = nil)
    {
        let inView = inView ?? superview
        let margins = margins ?? UIEdgeInsetsZero
        let size = size ?? frame.size

        mc_setPosition(position, inView:inView, withMargins: margins, size:size)
    }

    func setRelativePosition(position: MCViewPosition, toView: UIView?, margins: UIEdgeInsets? = nil, size: CGSize? = nil)
    {
        let margins = margins ?? UIEdgeInsetsZero
        let size = size ?? frame.size

        mc_setRelativePosition(position, toView:toView, withMargins: margins, size:size)
    }
}
