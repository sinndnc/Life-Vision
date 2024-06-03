//
//  CalendarServiceProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 3.06.2024.
//

import Foundation

protocol CalendarServiceProtocol {
    
    var date : Date { get set  }
    var calendar : Calendar { get set }
    var getCurentDay : Day { get }
}
