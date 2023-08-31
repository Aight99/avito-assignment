//
//  Date.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import Foundation

extension Date {
    var russianFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
        return dateFormatter.string(from: self)
    }
}
