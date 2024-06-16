//
//  HomeViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import Foundation

final class HomeViewModel : ObservableObject{
    

    @Published var countdown : Countdown = Countdown(day: 1, hour: 13, minute: 34, seconds: 12)
    
}
