//
//  Extensions.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 20.07.2022.
//

import UIKit

enum ValueEnum {
    enum Height: String {
        case mt
        case ft
    }

    enum Diametr: String {
        case mt
        case ft
    }

    enum Weight: String {
        case ft
        case kg
    }

    enum PayloadWeights: String {
        case ft
        case kg
    }
}

extension String {
    static func getDate(_ dateString: String?, _ dateFormat: String) -> String {
        guard let dateString = dateString else { return "Date Error" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let customDate = dateFormatter.date(from: dateString)
        dateFormatter.dateStyle = .medium
        guard let date = customDate else { return "Date Error " }
        return dateFormatter.string(from: date)
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension Notification.Name {
    static let launchScreen = Notification.Name("launchScreen")
    static let settings = Notification.Name("settings")
}
