//
//  Constant.swift
//  Devote
//
//  Created by kirshi on 6/12/23.
//

import Foundation
import SwiftUI


 let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
