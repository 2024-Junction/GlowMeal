//
//  NutritionMapView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct NutritionMapView: View {
    @State private var selectedNutrient: Nutrient? = nil
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                    .frame(maxHeight: 40)
                Text("Essential nutrients for\neach stage of pregnancy")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.teal)
                    .lineSpacing(10)
                    .padding(.bottom, -160)
                
                ZStack {
                    Image("Map_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .position(x: 180, y: 287)
                    
                    // Forlate Button
                    Button(action: {
                        selectedNutrient = .folicAcid
                    }) {
                        Text("Forlate")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(hex: 0x99C717))
                            .cornerRadius(8)
                    }
                    .position(x: 30, y: 308) // 위치 조정
                    
                    // Omega-3 Button
                    Button(action: {
                        selectedNutrient = .omega3
                    }) {
                        Text("Omega-3")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(hex: 0xFFDF37))
                            .cornerRadius(8)
                    }
                    .position(x: 150, y: 289) // 위치 조정
                    
                    // Iron Button
                    Button(action: {
                        selectedNutrient = .iron
                    }) {
                        Text("Iron")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(hex: 0xFF9B9B))
                            .cornerRadius(8)
                    }
                    .position(x: 240, y: 252) // 위치 조정
                    
                    // VitaminD Button
                    Button(action: {
                        selectedNutrient = .vitaminD
                    }) {
                        Text("VitaminD")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(hex: 0xDD8CDE))
                            .cornerRadius(8)
                    }
                    .position(x: 170, y: 180) // 위치 조정
                    
                    // Calcium Button
                    Button(action: {
                        selectedNutrient = .calcium
                    }) {
                        Text("Calcium")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(hex: 0x8CA5FF))
                            .cornerRadius(8)
                    }
                    .position(x: 260, y: 217) // 위치 조정
                }
                .frame(maxWidth: .infinity) // ZStack의 크기 설정
                Spacer()
            }
            .padding(.horizontal, 20)
            
            // 선택된 영양소가 있을 때만 텍스트 박스를 표시
            if let nutrient = selectedNutrient {
                Button(action: {
                    selectedNutrient = nil // 다시 클릭하면 텍스트 박스를 닫음
                }) {
                    TextBox(title: nutrient.title, content: nutrient.content)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(12)
                        .shadow(radius: 10)
                        .frame(width: UIScreen.main.bounds.width - 60)
                }
            }
        }
    }
}

struct TextBox: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.black)
            Text(content)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color.gray)
        }
        .padding()
        .background(Color.teal.opacity(0.1))
        .cornerRadius(14)
    }
}

enum Nutrient: String {
    case vitaminD, folicAcid, omega3, iron, calcium
    
    var title: String {
        switch self {
        case .vitaminD:
            return "Vitamin D"
        case .folicAcid:
            return "Folic Acid"
        case .omega3:
            return "Omega-3"
        case .iron:
            return "Iron Supplements"
        case .calcium:
            return "Calcium"
        }
    }
    
    var content: String {
        switch self {
        case .vitaminD:
            return "Avoid taking it with caffeine.\n\nEssential during early pregnancy for the development of the fetus's bones. A deficiency can lead to problems with the fetus's teeth and bone formation."
        case .folicAcid:
            return "Do not take it with caffeine or pain relievers. It’s beneficial to take it with vitamins B and C!\n\nA crucial nutrient during early pregnancy for the development of the fetal neural tube. A deficiency can increase the risk of neural tube defects, leading to conditions such as anencephaly, brain malformations, or spinal deformities. Since the fetal neural tube forms within 28 days after conception, it is advisable to ensure adequate intake even before pregnancy if you are planning to conceive."
        case .omega3:
            return "Do not take it with aspirin, and avoid consuming it in the final month of pregnancy as it can interfere with blood clotting.\n\nOmega-3 plays a crucial role in the development of the fetus's brain and nervous system. This is especially important in the later stages of pregnancy when the fetal brain undergoes rapid development, making adequate intake of Omega-3 essential during this period."
        case .iron:
            return "Good to take with vitamin C, but avoid taking with calcium.\n\nRecommended for intake from the second trimester (around the 4th month), even if there are no signs of anemia. A lack of iron can increase the risk of preterm birth and stillbirth."
        case .calcium:
            return "Good to take with magnesium, but avoid taking with iron supplements.\n\nCalcium is an essential nutrient for the formation of the fetus's bones and teeth. The mother's calcium intake affects the development of the fetal musculoskeletal system. If there is a deficiency in vitamin D, it can lead to problems in the fetus's bone development."
        }
    }
}

#Preview {
    NutritionMapView()
}


