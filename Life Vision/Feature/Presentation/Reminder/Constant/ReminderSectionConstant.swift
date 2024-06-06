//
//  ReminderSectionConstant.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//
import Foundation

enum ReminderSectionConstant{
    
    static let date = SectionItem(label: "Date", image: "calendar")
    static let time = SectionItem(label: "Time", image: "clock")
    
    static let `repeat` = SectionItem(label: "Repeat", image: "repeat")
    static let EarlyReminder = SectionItem(label: "Early Reminder", image: "bell.fill")
    
    static let tag = SectionItem(label: "Tags", image: "tag.fill")
    
    static let location = SectionItem(label: "Location", image: "location.fill")
    
    static let flag = SectionItem(label: "Flag", image: "flag.fill")
    static let priority = SectionItem(label: "Priority", image: "exclamationmark")

}
