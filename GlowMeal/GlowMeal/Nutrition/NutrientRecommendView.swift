//
//  NutrientRecommendView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct NutrientRecommendView: View {
    @State private var selectedTab = "Omega-3"
    
    let tabs = ["Iron", "Omega-3", "VitaminD"]
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    Button(action: {
                        selectedTab = tab
                    }) {
                        Text(tab)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(selectedTab == tab ? .white : .mainGreen)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(
                                selectedTab == tab ? Color.mainGreen : Color.clear
                            )
                    }
                }
            }
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding()
            
            Spacer()
            ScrollView {
                if selectedTab == "Iron" {
                    Image("Iron_recommend")
                } else if selectedTab == "Omega-3" {
                    Image("vitaminD_Recommend")
                } else if selectedTab == "VitaminD" {
                    Image("Omega_Recommend")
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    NutrientRecommendView()
}

