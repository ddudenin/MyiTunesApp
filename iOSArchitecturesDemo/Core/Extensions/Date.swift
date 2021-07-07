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
