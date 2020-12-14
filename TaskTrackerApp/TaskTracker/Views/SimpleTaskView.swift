//
//  SimpleTaskView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/13/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI

struct SimpleTaskView: View {
    var shouldShowFavorites: Bool
    @ObservedObject var viewModel: TaskViewModel
    
    private var data: [Task]{
        return shouldShowFavorites ? viewModel.favorites : viewModel.data
    }
    
    var body: some View {
        VStack{

            List{
                ForEach(data) { task in
                    HStack{
                    Text(task.title)
                        .font(.headline)
                    
                    Text(task.content)
                    Text("\(task.date)")
                        .fontWeight(.medium)
                    }
                }
            }.frame(maxWidth: .infinity, alignment: .center)
            .background(Color(red: 32/255, green: 36/255, blue: 38/255))
            .modifier(CardModifier())
            .padding(.all, 10)
        }
    }
}

//struct SimpleTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleTaskView()
//    }
//}
