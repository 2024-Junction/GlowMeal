//
//  MoreInfoView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct MoreInfoView: View {
    @State var percentage: CGFloat = 30
    @State private var searchText: String = ""
    @State private var hasSearched: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Check how other moms\nthink about this food")
                .font(.Pretendard(.bold, size: 24))
                .foregroundColor(Color.mainBlue)
                .lineSpacing(10)
                .padding(.bottom, 20)
            VStack(spacing: 5) {
                PercentBar(firstRectanglePercentage: percentage)
                    .padding(.bottom, 5)
                HStack(spacing: 0) {
                    HStack(spacing: 4) {
                        Text("Positive")
                            .font(.Pretendard(.bold, size: 14))
                            .foregroundColor(Color.turquoise)
                        Image("doubleArrowRight_Icon")
                    }
                    Spacer()
                    HStack(spacing: 4) {
                        Image("doubleArrowLeft_Icon")
                        Text("Nagative")
                            .font(.Pretendard(.bold, size: 14))
                            .foregroundColor(Color.mainOrange)
                    }
                }
                .padding(.horizontal, 7)
            }
            Spacer()
                .frame(maxHeight: 40)
            VStack(alignment: .leading, spacing: 10) {
                Text("Positive")
                    .font(.Pretendard(.semibold, size: 20))
                    .foregroundColor(Color.turquoise)
                HStack(spacing: 0) {
                    Spacer()
                    Text("During my pregnancy,\nI drank decaf coffee made for\npregnant women, and it was fine for me.")
                        .font(.Pretendard(.bold, size: 16))
                        .foregroundColor(Color.textGray2)
                        .lineSpacing(4)
                        .padding(.vertical, 26)
                    Spacer()
                }
                .background(Color.subGreen)
                .cornerRadius(10)
            }
            Spacer()
                .frame(maxHeight: 28)
            VStack(alignment: .leading, spacing: 10) {
                Text("Negative")
                    .font(.Pretendard(.semibold, size: 20))
                    .foregroundColor(Color.mainOrange)
                HStack(spacing: 0) {
                    Spacer()
                    Text("During my pregnancy,\nI drank decaf coffee made for\npregnant women, and it was fine for me.")
                        .font(.Pretendard(.bold, size: 16))
                        .foregroundColor(Color.textGray2)
                        .lineSpacing(4)
                        .padding(.vertical, 26)
                    Spacer()
                }
                .background(Color.subOrange)
                .cornerRadius(10)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct PercentBar: View {
    let firstRectanglePercentage: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.43, green: 0.8, blue: 0.7), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.7, green: 0.87, blue: 0.83), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0, y: 0.5),
                                endPoint: UnitPoint(x: 1, y: 0.5)
                            ))
                        .frame(width: geometry.size.width * (firstRectanglePercentage / 100), height: 48)
                        .cornerRadius(15, corners: [.topLeft, .bottomLeft])
                    
                    Rectangle()
                        .fill(LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 1, green: 0.55, blue: 0.36), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.89, green: 0.74, blue: 0.67), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 1, y: 0.5),
                            endPoint: UnitPoint(x: 0.03, y: 0.5)
                        ))
                        .frame(width: geometry.size.width * ((100 - firstRectanglePercentage) / 100), height: 48)
                        .cornerRadius(15, corners: [.topRight, .bottomRight])
                }
                HStack(spacing: 0) {
                    Text("\(Int(firstRectanglePercentage))%")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.white)
                    Spacer()
                    Text("\(100 - Int(firstRectanglePercentage))%")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, 15)
            }
        }
        .frame(height: 48)
    }
}


#Preview {
    MoreInfoView()
}
