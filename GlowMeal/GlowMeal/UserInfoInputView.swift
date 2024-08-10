//
//  UserInfoInputView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/10/24.
//

import SwiftUI

struct UserInfoInputView: View {
    @State private var currentIndex: Int = 0

    private let views: [AnyView] = [
        AnyView(BirthdateInputView(birthdate: .constant(Date()))),
        AnyView(MeasurementInputView(weight: 0, height: 0, bodyFatMass: 0)),
        AnyView(FlavorRankingView()),
        AnyView(RatingSliderView()),
        AnyView(MealSelectionView()),
        AnyView(NumberPickerView())
    ]

    private let titles = [
        "Enter\nyour Birthdate",
        "Enter your Measurements",
        "Rank the Flavors",
        "Rate your Preference",
        "Select your Meals",
        "Pick a Number"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(titles[currentIndex])
                .font(.Pretendard(.bold, size: 24))
                .foregroundColor(Color.turquoise)
                .padding()

            views[currentIndex]
                .padding()

            Spacer()

            HStack {
                Spacer()
                Button(action: {
                    if currentIndex < views.count - 1 {
                        currentIndex += 1
                    }
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.mainGreen)
                        .cornerRadius(10)
                }
                .disabled(currentIndex == views.count - 1) // 마지막 섹션에서 비활성화
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    UserInfoInputView()
}
