//
//  LogoView.swift
//  Item2.0
//
//  Created by Joseph DeWeese on 11/12/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            HStack {
                Spacer()
                ZStack{
                    
                    Image(systemName: "atom")
                        .resizable()
                        .frame(width: 45, height: 40)
                        .foregroundColor(.blue).opacity(0.3)
                    HStack {
                        Text("Items")
                            .font(.callout)
                            .fontDesign(.serif)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .offset(x: 8, y: -1)
                        Text("2.0")
                            .font(.caption)
                            .fontDesign(.serif)
                            .fontWeight(.regular)
                            .padding(.leading, 10)
                            .foregroundColor(.blue)
                            .offset(x: -16, y: -6)
                    }.offset(x: 5)
                     
                }
                Spacer()
                
            }
              
          
           
        }
    }
}
#Preview{
    LogoView()
}
