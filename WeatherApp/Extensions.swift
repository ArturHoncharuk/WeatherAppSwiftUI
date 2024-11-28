//
//  Extensions.swift
//  WeatherApp
//
//  Created by Artur Honcharuk on 28.11.2024.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
