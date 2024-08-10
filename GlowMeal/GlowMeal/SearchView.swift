//
//  SearchView.swift
//  GlowMeal
//
//  Created by 주영정 on 8/10/24.
//
import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var hasSearched: Bool = false

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 80)
            
            VStack(alignment: .leading) {
                Text("Nutrition Info")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(hasSearched ? Color("mainColor") : .black)

                Text("Finder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(hasSearched ? Color("mainColor") : .black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.bottom, 20)

            HStack {
                TextField("Search and get nutrition information", text: $searchText, onEditingChanged: { editing in
                    if !editing && !searchText.isEmpty {
                        hasSearched = true
                        //검색 텍스트 백엔드와 통신하기
                        
                    }
                })
                .font(.system(size: 15))
                .foregroundColor(.gray)
                .padding(.horizontal, 8)

                Spacer()

                Button(action: {
                    if !searchText.isEmpty {
                        hasSearched = true
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.trailing, 6)
                }
            }
            .padding()
            .background(hasSearched ? Color("subColor") : Color(red: 0.89, green: 1.0, blue: 0.91))
            .cornerRadius(8) // 전체 HStack에 둥근 모서리 적용
            .padding(.horizontal)

            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
