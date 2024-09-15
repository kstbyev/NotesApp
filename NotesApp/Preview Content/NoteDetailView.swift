//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Madi Sharipov on 15.09.2024.
//

import SwiftUI

struct NoteDetailView: View {
    @State var note: Note
    @ObservedObject var noteManager: NoteManager
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Title", text: $note.title)
                .font(.headline)
                .padding()
            TextEditor(text: $note.content)
                .padding()
            Spacer()
        }
        .navigationTitle("Edit Note")
        .navigationBarItems(trailing: Button("Save") {
            noteManager.update(note: note)
        })
    }
}


