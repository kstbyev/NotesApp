//
//  NoteManager.swift
//  NotesApp
//
//  Created by Madi Sharipov on 15.09.2024.
//

import Foundation

class NoteManager: ObservableObject {
    @Published var notes: [Note] = []
    
    private let key = "notes"
    
    init() {
        load()
    }
    
    func add(note: Note) {
        notes.append(note)
        save()
    }
    
    func update(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
            save()
        }
    }
    
    func delete(note: Note) {
        notes.removeAll { $0.id == note.id }
        save()
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Failed to save notes:", error)
        }
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key) else { return }
        do {
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            print("Failed to load notes:", error)
        }
    }
}
