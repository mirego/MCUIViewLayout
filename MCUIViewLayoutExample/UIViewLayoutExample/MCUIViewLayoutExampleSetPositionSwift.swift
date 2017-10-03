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

import Foundation

class MCUIViewLayoutExampleSetPositionSwift: UIView
{
    fileprivate let margin: CGFloat = 10

    fileprivate let topLeft = UILabel()
    fileprivate let top = UILabel()
    fileprivate let topRight = UILabel()
    fileprivate let left = UILabel()
    fileprivate let centered = UILabel()
    fileprivate let right = UILabel()
    fileprivate let bottomLeft = UILabel()
    fileprivate let bottom = UILabel()
    fileprivate let bottomRight = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .blue

        addLabel(topLeft, title: "topLeft")
        addLabel(top, title: "top")
        addLabel(topRight, title: "topRight")
        addLabel(left, title: "left")
        addLabel(centered, title: "centered")
        addLabel(right, title: "right")

        addLabel(bottomLeft, title: "bottomLeft")
        addLabel(bottom, title: "bottom")
        addLabel(bottomRight, title: "bottomRight")

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MCUIViewLayoutExampleSetPositionSwift.close)))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let margins = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)

        topLeft.setPosition(.positionTopLeft, margins: margins)
        top.setPosition(.positionTopHCenter, margins: margins)
        topRight.setPosition(.positionTopRight, margins: margins)
        left.setPosition(.positionVCenterLeft, margins: margins)
        centered.setPosition(.positionCenters, margins: margins)
        right.setPosition(.positionVCenterRight, margins: margins)
        bottomLeft.setPosition(.positionBottomLeft, margins: margins)
        bottom.setPosition(.positionBottomHCenter, margins: margins)
        bottomRight.setPosition(.positionBottomRight, margins: margins)
    }

    fileprivate func addLabel(_ label: UILabel, title: String) {
        label.text = title
        label.textAlignment = .center
        label.sizeToFit()

        addSubview(label)
    }

    func close() {
        removeFromSuperview()
    }
}
