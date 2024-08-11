//
//  CompareView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct CompareView: View {
    @State private var searchText: String = ""
    @State private var hasSearched: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Compare\nwith alternative food")
                .font(.Pretendard(.bold, size: 24))
                .foregroundColor(Color.mainBlue)
                .lineSpacing(10)
            VStack(alignment: .leading, spacing: 5) {
                Text("Explain why you want ")
                    .font(.Pretendard(.semibold, size: 16))
                    .foregroundColor(Color.black)
                Text("with alternative food")
                    .font(.Pretendard(.semibold, size: 16))
                    .foregroundColor(Color.black)
                Text("and we’ll recommend a suitable alternative")
                    .font(.Pretendard(.semibold, size: 16))
                    .foregroundColor(Color.black)
            }
            .padding(.leading, 20)
            .padding(.top, 32)
            .padding(.bottom, 15)
            
            HStack {
                TextField("", text: $searchText)
                .frame(height: 20)

                Spacer()

                Button(action: {
                    if !searchText.isEmpty {
                        hasSearched = true
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.gray1)
                        .padding(.trailing, 6)
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray1, lineWidth: 1)
            )
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("or Just get recommendation")
                        .underline()
                        .font(.Pretendard(.medium, size: 14))
                        .foregroundColor(Color.turquoise)
                })
                .padding(.top, 22)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
}

#Preview {
    CompareView()
}
