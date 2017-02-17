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


public extension UIEdgeInsets {
    //static public var zero: UIEdgeInsets { return UIEdgeInsets.zero }

    static public func top(_ margin: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: 0, bottom: 0, right: 0)
    }

    static public func left(_ margin: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: margin, bottom: 0, right: 0)
    }

    static public func bottom(_ margin: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: margin, right: 0)
    }

    static public func right(_ margin: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: margin)
    }

    static func margins(_ margin: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }

    /**
     Method that creates an UIEdgeInsets. All parameters are optional.

     Examples:
     .margins(bottom: 20)
     .margins(bottom: 20, right: 12)
     .margins(top: 20, left: 12, right: 12)
     .margins(left: 12, right: 12)

     - parameter top:    Optional top inset (default is 0)
     - parameter left:   Optional left inset (default is 0)
     - parameter bottom: Optional bottom inset (default is 0)
     - parameter right:  Optional right inset (default is 0)

     - returns: UIEdgeInsets
     */
    static public func margins(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    var width: CGFloat {
        return right - left
    }

    var height: CGFloat {
        return bottom - top
    }
}
