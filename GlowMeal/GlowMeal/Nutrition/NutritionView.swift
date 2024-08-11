//
//  NutritionView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct NutritionView: View {
    @ObservedObject var dataManager = DataManager()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Text("You are")
                    .font(.Pretendard(.bold, size: 24))
                    .foregroundColor(Color.black)
                    .lineSpacing(10)
                    .padding(.bottom, 5)
                
                HStack(spacing: 0) {
                    // UserInfo의 conception_date를 Date로 변환
                    let dateFormatter = ISO8601DateFormatter()
                    let conceptionDate = dateFormatter.date(from: dataManager.userInfo?.conception_date ?? "")
                    let weeksPregnant = conceptionDate != nil ? dataManager.calculatePregnancyWeeks(from: conceptionDate!) : 0
                    
                    Text("14")
                        .font(.Pretendard(.bold, size: 24))
                        .foregroundColor(Color.black)
                        .lineSpacing(10)
                        .underline()
                    Text(" weeks pregnant")
                        .font(.Pretendard(.bold, size: 24))
                        .foregroundColor(Color.black)
                        .lineSpacing(10)
                }
                
                Spacer()
                    .frame(maxHeight: 32)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Essential nutrients")
                        .font(.Pretendard(.semibold, size: 16))
                        .foregroundColor(Color.turquoise)
                        .lineSpacing(10)
                        .padding(.bottom, 5)
                }
                .padding(.bottom, 18)
                
                HStack(spacing: 0) {
                    Spacer()
                    Text("Iron 24mg  /day\nOmega-3 700mg /day\nVitaminD 10㎍ /day")
                        .font(.Pretendard(.semibold, size: 16))
                        .foregroundColor(Color.textGray2)
                        .lineSpacing(4)
                        .padding(.vertical, 26)
                    Spacer()
                }
                .background(Color.subGreen)
                .cornerRadius(10)
                
                NavigationLink(destination: NutrientRecommendView()) {
                    Text("Food recommendation")
                        .font(.Pretendard(.medium, size: 16))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 52)
                        .background(Color.mainBlue)
                        .cornerRadius(12)
                }
                .padding(.top, 15)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Spacer()
                    NavigationLink(destination: NutritionMapView()) {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70, alignment: .topLeading)
                                .foregroundColor(Color.subGreen)
                            Text("Week\ninfo")
                                .font(.Pretendard(.bold, size: 16))
                                .foregroundColor(Color.turquoise)
                                .multilineTextAlignment(.center)
                        }
                        .frame(alignment: .center)
                    }
                }
            }
            .padding(.horizontal, 17.5)
        }
    }
}

#Preview {
    NutritionView()
}


