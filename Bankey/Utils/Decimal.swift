//
//  Decimal.swift
//  Bankey
//
//  Created by olivier geiger on 22/04/2024.
//

import UIKit

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
