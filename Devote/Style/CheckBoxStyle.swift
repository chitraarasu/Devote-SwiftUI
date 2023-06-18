//
//  CheckBoxStyle.swift
//  Devote
//
//  Created by kirshi on 6/18/23.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" :
             "circle"
            )
            .foregroundColor(configuration.isOn ? .pink : .primary)
            .font(.system(size: 30, weight: .semibold, design: .rounded))
            .onTapGesture {
                configuration.isOn.toggle()
                
                if(configuration.isOn){
                    playSound(sound: "sound-rise", type: "mp3")
                } else {
                    playSound(sound: "sound-tap", type: "mp3")
                }
            }
            
            configuration.label
        }
    }
}

struct CheckBoxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder Lable", isOn: .constant(false))
            .padding()
            .previewLayout(.sizeThatFits)
            .toggleStyle(CheckBoxStyle())
        
    }
}
