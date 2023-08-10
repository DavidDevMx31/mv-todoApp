//
//  ToolbarEditButton.swift
//  MV-ToDoApp
//
//  Created by David Ali on 10/08/23.
//

import SwiftUI

struct ToolbarEditButton: View {
    let completion: (()->())?
    
    var body: some View {
        Button {
            completion?()
        } label: {
            Image(systemName: "pencil")
        }
    }
}

struct ToolbarEditButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarEditButton(completion: nil)
    }
}
