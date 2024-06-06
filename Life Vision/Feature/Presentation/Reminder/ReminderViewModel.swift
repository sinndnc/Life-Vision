//
//  ReminderViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

final class ReminderViewModel : ObservableObject{
    
    @Published var titleText : String = ""
    @Published var notesText : String = ""
    
    @Published var date : Date = Date()

    @Published var isPresented : Bool = false
    
}
