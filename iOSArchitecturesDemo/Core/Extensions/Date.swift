//
//  Date.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 07.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

func getTimeAge(from dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    let relativeFormatter = RelativeDateTimeFormatter()
    relativeFormatter.unitsStyle = .abbreviated
    
    return relativeFormatter.localizedString(for: dateFormatter.date(from: dateString) ?? Date(timeIntervalSinceNow: 0), relativeTo: Date())
}

func getYear(from dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    guard let date = dateFormatter.date(from: dateString) else { return "" }
    
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year], from: date)
    
    guard let year = components.year else { return "" }
    
    return "\(year)"
}
