//
//  Dictionary+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 7.07.2024.
//

import Foundation


extension Dictionary where Key == String, Value == [String: Bool] {
    func encode() -> Data {
        do { return try JSONEncoder().encode(self) }
        catch { return Data() }
    }
}
