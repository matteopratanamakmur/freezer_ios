//
//  Utils.swift
//  freezer
//
//  Created by yuhori on 2021/01/09.
//

import Foundation

public let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
