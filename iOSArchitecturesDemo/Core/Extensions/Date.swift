//
//  Date+Extensions.swift
//  iOSArchitecturesDemo
//
//  Created by Дмитрий Дуденин on 07.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

func utcToTimeAgoDisplay(dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    
    let relativeFormatter = RelativeDateTimeFormatter()
    relativeFormatter.unitsStyle = .full
    
    return relativeFormatter.localizedString(for: dateFormatter.date(from: dateString) ?? Date(timeIntervalSinceNow: 0), relativeTo: Date())
}
