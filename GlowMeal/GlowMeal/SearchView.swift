//
//  SearchView.swift
//  GlowMeal
//
//  Created by 주영정 on 8/10/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 80)
            VStack(alignment: .leading) {
                Text("Nutrition Info")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Text("Finder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.bottom, 20)

            HStack {
                TextField("Search and get nutrition information", text: .constant(""))
                    .padding()
                    .background(Color(red: 0.89, green: 1.0, blue: 0.91))
                    .cornerRadius(8)

                Button(action: {
                    // Add search action here
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 8)
            }
            .padding(.horizontal)

            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
