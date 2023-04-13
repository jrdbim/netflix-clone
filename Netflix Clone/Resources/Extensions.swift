//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Jiradet Amornpimonkul on 4/13/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
