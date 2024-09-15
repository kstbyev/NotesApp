//
//  Note.swift
//  NotesApp
//
//  Created by Madi Sharipov on 15.09.2024.
//

import Foundation

struct Note: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}

