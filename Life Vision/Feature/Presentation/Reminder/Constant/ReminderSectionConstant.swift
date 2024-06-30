//
//  ReminderSectionConstant.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//
import Foundation

enum ReminderSectionConstant{
    
    static let date = SectionItem(label: "Date", image: "calendar",color: .red)
    static let time = SectionItem(label: "Time", image: "clock",color: .blue)
    
    static let `repeat` = SectionItem(label: "Repeat", image: "repeat",color: .green)
    static let EarlyReminder = SectionItem(label: "Early Reminder", image: "bell.fill",color: .purple)
    
    static let tag = SectionItem(label: "Tags", image: "tag.fill",color: .pink)
    
    static let location = SectionItem(label: "Location", image: "location.fill",color: .blue)
    
    static let flag = SectionItem(label: "Flag", image: "flag.fill",color: .orange)
    static let priority = SectionItem(label: "Priority", image: "exclamationmark",color: .red)

}
