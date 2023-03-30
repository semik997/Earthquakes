//
//  QuakeError.swift
//  Earthquakes-iOS
//
//  Created by Sem Koliesnikov on 30/03/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

enum QuakeError: Error {
    case missingData
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard missing a valid code, magnitude, place or time.",
                comment: "")
        }
    }
}
