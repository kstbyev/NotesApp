//
//  AddNoteView.swift
//  NotesApp
//
//  Created by Madi Sharipov on 15.09.2024.
//

import SwiftUI

struct AddNoteView: View {
    @State private var title = ""
    @State private var content = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var noteManager: NoteManager
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Note Details")) {
                    TextField("Title", text: $title)
                    TextEditor(text: $content)
                }
            }
            .navigationTitle("Add Note")
            .navigationBarItems(trailing: Button("Save") {
                let newNote = Note(title: title, content: content)
                noteManager.add(note: newNote)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


