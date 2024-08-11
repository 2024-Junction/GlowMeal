//
//  NutrientTableView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct NutrientTableView: View {
    let items: [String] = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 2) {
                ForEach(0...3, id: \.self) { index in
                        ZStack {
                            if (index == 0) {
                                Rectangle()
                                    .fill(Color.mainGreen)
                                    .frame(width: index % 2 == 0 ? 108 : 66, height: 44)
                                    .cornerRadius(15, corners: [.topLeft])
                                Text("Nutrient")
                                    .font(.Pretendard(.medium, size: 14))
                                    .foregroundColor(.white)
                            } else if (index == 1) {
                                Rectangle()
                                    .fill(Color.mainGreen)
                                    .frame(width: index % 2 == 0 ? 108 : 66, height: 44)
                                Text("Amount")
                                    .font(.Pretendard(.medium, size: 14))
                                    .foregroundColor(.white)
                            } else if (index == 2) {
                                Rectangle()
                                    .fill(Color.mainGreen)
                                    .frame(width: index % 2 == 0 ? 108 : 66, height: 44)
                                Text("Nutrient")
                                    .font(.Pretendard(.medium, size: 14))
                                    .foregroundColor(.white)
                            } else if (index == 3) {
                                Rectangle()
                                    .fill(Color.mainGreen)
                                    .frame(width: index % 2 == 0 ? 108 : 66, height: 44)
                                    .cornerRadius(15, corners: [.topRight])
                                Text("Amount")
                                    .font(.Pretendard(.medium, size: 14))
                                    .foregroundColor(.white)
                            }
                        }
                }
            }
            
            let count = boxCount(for: items.count)
            ForEach(0..<count - 1, id: \.self) { _ in
                VStack(spacing: 0) {
                    HStack(spacing: 2) {
                        ForEach(0...3, id: \.self) { index in
                            ZStack(alignment: .leading) {
                                    Rectangle()
                                        .fill(Color.gray2)
                                        .frame(width: index % 2 == 0 ? 108 : 66, height: 40)
                                    Text("123")
                                        .font(.Pretendard(.medium, size: 12))
                                        .foregroundColor(.black)
                                        .padding(.leading, 8)
                                }
                        }
                    }
                    Rectangle()
                        .fill(Color.gray1)
                        .frame(width: 338, height: 1)
                }
            }
            
            HStack(spacing: 2) {
                ForEach(0...3, id: \.self) { index in
                        ZStack(alignment: .leading) {
                            if (index == 1 || index == 2) {
                                Rectangle()
                                    .fill(Color.gray2)
                                    .frame(width: index % 2 == 0 ? 108 : 66, height: 40)
                                Text("asdjas")
                                    .font(.Pretendard(.medium, size: 12))
                                    .foregroundColor(.black)
                                    .padding(.leading, 8)
                            } else if (index == 0) {
                                Rectangle()
                                    .fill(Color.gray2)
                                    .frame(width: index % 2 == 0 ? 108 : 66, height: 40)
                                    .cornerRadius(15, corners: [.bottomLeft])
                                Text("asdjas")
                                    .font(.Pretendard(.medium, size: 12))
                                    .foregroundColor(.black)
                                    .padding(.leading, 8)
                            } else if (index == 3) {
                                Rectangle()
                                    .fill(Color.gray2)
                                    .frame(width: index % 2 == 0 ? 108 : 66, height: 40)
                                    .cornerRadius(15, corners: [.bottomRight])
                                Text("asdjas")
                                    .font(.Pretendard(.medium, size: 12))
                                    .foregroundColor(.black)
                                    .padding(.leading, 8)
                            }
                        }
                }
            }
        }
    }
    
    func boxCount(for itemCount: Int) -> Int {
        return (itemCount / 2) + (itemCount % 2 > 0 ? 1 : 0)
    }
}


#Preview {
    NutrientTableView()
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
