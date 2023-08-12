//
//  ToolbarAddButton.swift
//  MV-ToDoApp
//
//  Created by David Ali on 11/08/23.
//

import SwiftUI

struct ToolbarAddButton: View {
    let completion: (()->())?
    var body: some View {
        Button {
            completion?()
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct ToolbarAddButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarAddButton(completion: nil)
    }
}
