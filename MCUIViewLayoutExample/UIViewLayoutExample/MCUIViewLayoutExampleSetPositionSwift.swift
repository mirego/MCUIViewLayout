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
    private let margin: CGFloat = 10

    private let topLeftLabel = UILabel()
    private let topLabel = UILabel()
    private let topRightLabel = UILabel()
    private let leftLabel = UILabel()
    private let centeredLabel = UILabel()
    private let rightLabel = UILabel()
    private let bottomLeftLabel = UILabel()
    private let bottomLabel = UILabel()
    private let bottomRightLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .blueColor()

        addLabel(topLeftLabel, title: "topLeft")
        addLabel(topLabel, title: "top")
        addLabel(topRightLabel, title: "topRight")
        addLabel(leftLabel, title: "left")
        addLabel(centeredLabel, title: "centered")
        addLabel(rightLabel, title: "right")

        addLabel(bottomLeftLabel, title: "bottomLeft")
        addLabel(bottomLabel, title: "bottom")
        addLabel(bottomRightLabel, title: "bottomRight")

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MCUIViewLayoutExampleSetPositionSwift.close)))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let margins = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)

        topLeftLabel.setPosition(.PositionTopLeft, margins: margins)
        topLabel.setPosition(.PositionTopHCenter, margins: margins)
        topRightLabel.setPosition(.PositionTopRight, margins: margins)
        leftLabel.setPosition(.PositionVCenterLeft, margins: margins)
        centeredLabel.setPosition(.PositionCenters, margins: margins)
        rightLabel.setPosition(.PositionVCenterRight, margins: margins)
        bottomLeftLabel.setPosition(.PositionBottomLeft, margins: margins)
        bottomLabel.setPosition(.PositionBottomHCenter, margins: margins)
        bottomRightLabel.setPosition(.PositionBottomRight, margins: margins)
    }

    private func addLabel(label: UILabel, title: String) {
        label.text = title
        label.textAlignment = .Center
        label.sizeToFit()

        addSubview(label)
    }

    func close() {
        removeFromSuperview()
    }
}
