//
//  ListRowItemView.swift
//  Devote
//
//  Created by kirshi on 6/18/23.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContent
    @ObservedObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.completion){
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default)
        }
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContent.hasChanges {
                try? self.viewContent.save()
            }
        })
    }
}

//struct ListRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowItemView()
//    }
//}
