//
//  NewTaskItemViewer.swift
//  Devote
//
//  Created by kirshi on 6/13/23.
//

import SwiftUI

struct NewTaskItemViewer: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var task = ""
    
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.id = UUID()
            newItem.completion = false
            
            do {
                try viewContext.save()
            } catch {
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                VStack(spacing: 16) {
                    TextField("New Task", text: $task)
                        .foregroundColor(.pink)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .padding()
                        .background(
                            isDarkMode
                            ? Color(UIColor.tertiarySystemBackground)
                            :
                                Color(UIColor.secondarySystemBackground)
                        )
                        .cornerRadius(10)
                    
                    Button(action: {
                        addItem()
                        playSound(sound: "sound-ding", type: "mp3")
                    }) {
                        Spacer()
                        Text("SAVE")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer()
                    }
                    .disabled(isButtonDisabled)
                    .onTapGesture {
                        if isButtonDisabled {
                            playSound(sound: "sound-tap", type: "mp3")
                        }
                    }
                    .padding()
                    .background(isButtonDisabled ? Color.blue : Color.pink)
                    .font(.headline)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .background(isDarkMode
                            ? Color(UIColor.secondarySystemBackground)
                            :
                        .white)
                .cornerRadius(20)
                .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.65), radius: 24)
                .frame(maxWidth: 640)
            }
            .padding()
        }
    }
}

struct NewTaskItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemViewer(isShowing: .constant(false))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
