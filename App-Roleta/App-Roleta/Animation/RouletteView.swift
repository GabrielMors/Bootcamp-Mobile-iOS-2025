//
//  RouletteView.swift
//  App-Roleta
//
//  Created by Gabriel Mors on 22/05/25.
//

import UIKit

class RouletteView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let radius = min(bounds.width, bounds.height) / 2
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let numberOfSegments = 6
        let segmentAngle = 2 * CGFloat.pi / CGFloat(numberOfSegments)
        
        let colors: [UIColor] = [.white, .lightGray, .gray]
        
        for i in 0..<numberOfSegments {
            context.move(to: center)
            context.addArc(center: center, radius: radius, startAngle: CGFloat(i) * segmentAngle, endAngle: CGFloat(i + 1) * segmentAngle, clockwise: false)
            context.setFillColor(colors[i % colors.count].cgColor)
            context.fillPath()
        }
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(2)
        context.strokeEllipse(in: CGRect(x: bounds.midX - radius, y: bounds.midY - radius, width: 2 * radius, height: 2 * radius))
    }

    func startRotationAnimation() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat.pi * 2
        rotation.duration = 1
        rotation.repeatCount = .infinity
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

