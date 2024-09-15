//
//  ContentView.swift
//  NotesApp
//
//  Created by Madi Sharipov on 15.09.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var noteManager = NoteManager()
    @State private var isAdding = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(noteManager.notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note, noteManager: noteManager)) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.content)
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {
                isAdding = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isAdding) {
                AddNoteView(noteManager: noteManager)
            }
        }
    }
    
    private func deleteNote(at offsets: IndexSet) {
        for index in offsets {
            noteManager.delete(note: noteManager.notes[index])
        }
    }
}


#Preview {
    ContentView()
}
