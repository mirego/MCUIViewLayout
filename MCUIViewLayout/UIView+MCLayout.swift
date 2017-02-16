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
    * Simplified syntax compare to objective-c (remove all “mc_()”)
    * Add/Expose many UIView's properties:
         - width: CGFloat     [read-write]
         - height: CGFloat    [read-write]
         - size: CGSize       [read-write]
         - origin: CGPoint    [read-write]
         - x: CGFloat         [read-write]
         - y: CGFloat         [read-write]
         - maxX: CGFloat      [read-write]
         - maxY: CGFloat      [read-write]
         - minX: CGFloat      [read-write]
         - minY: CGFloat      [read-write]
         - midX: CGFloat      [read-write]
         - midY: CGFloat      [read-write]

        Examples:
            myChild.size = view.size
            myChild.width = view.width

    * Expose two methods to position UIView easily: setPosition() and setRelativePosition()
*/
// swiftlint:disable variable_name

extension UIView {
    var maxX: CGFloat {
        set {
            mc_setOrigin(CGPoint(x: newValue - width, y: y))
        }
        get {
            return frame.maxX
        }
    }

    var maxY: CGFloat {
        set {
            mc_setOrigin(CGPoint(x: x, y: newValue - height))
        }
        get {
            return frame.maxY
        }
    }

    var minX: CGFloat {
        set {
            x = newValue
        }
        get {
            return frame.minX
        }
    }

    var minY: CGFloat {
        set {
            y = newValue
        }
        get {
            return frame.minY
        }
    }


    /**
     Position the view

     - parameter position: see MCViewPosition
     - parameter inView:   Optional relative view. Default value is view's superview.
     - parameter margins:  Optional margins.
     - parameter size:     Optional view new size. By default keeps the current view size.
     - parameter fitSize:  Optional size to fit. If specified the view sizeThatFits() method will be called using the specified size and the result
                           will be use to set the view size.
     
     Examples:
         myChild.setPosition(.PositionTopHCenter)
         myChild.setPosition(.PositionTopHCenter, size: CGSize(width: 200, height: 40))
         myChild.setPosition(.PositionTopLeft, size: CGSize(width: width / 2, height: height / 2))
         myChild.setPosition(.PositionTopLeft, fitSize: CGSize(width: width, height: .max))
     */
    func setPosition(_ position: MCViewPosition, inView: UIView? = nil, margins: UIEdgeInsets? = nil, size: CGSize? = nil, fitSize: CGSize? = nil) {
        let inView = inView ?? superview
        let margins = margins ?? UIEdgeInsets.zero
        var size = size

        if let fitSize = fitSize {
            assert(size == nil, "If 'fitSize' param is specified, 'size' param will be ignored!")
            size = sizeThatFits(fitSize)
        }

        mc_setPosition(position, in:inView, withMargins: margins, size: size ?? frame.size)
    }

    /**
     Position the view relative to another view.

     - parameter position: see MCViewPosition
     - parameter toView:   The view from which the view will be relatively positioned.
     - parameter margins:  Optional margins.
     - parameter size:     Optional view new size. By default keeps the current view size.
     - parameter fitSize:  Optional size to fit. If specified the view sizeThatFits() method will be called using the specified and the result
                           will be use to set the view size.

     Examples:
         myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView)
         myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView, size: CGSize(width: 200, height: 40))
         myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView, margins: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
         myChild.setRelativePosition(.RelativePositionUnderCentered, toView: previousView, fitSize: CGSize(width: width, height: .max))
     */
    func setRelativePosition(_ position: MCViewPosition, toView: UIView?, margins: UIEdgeInsets? = nil, size: CGSize? = nil, fitSize: CGSize? = nil) {
        let margins = margins ?? UIEdgeInsets.zero
        var size = size

        if let fitSize = fitSize {
            assert(size == nil, "If 'fitSize' param is specified, 'size' param will be ignored!")
            size = sizeThatFits(fitSize)
        }

        mc_setRelativePosition(position, to:toView, withMargins: margins, size: size ?? frame.size)
    }
}
// swiftlint:enable variable_name
