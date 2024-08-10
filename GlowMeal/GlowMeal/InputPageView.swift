//
//  InputPageView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/10/24.
//

import SwiftUI

struct BirthdateInputView: View {
    @Binding var birthdate: Date
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Birthdate")
                    .font(.Pretendard(.semibold, size: 15))
                    .foregroundColor(Color.turquoise)
                Spacer()
                DatePicker("", selection: $birthdate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .labelsHidden()
            }
            .padding()
            .cornerRadius(5)
            .padding(.horizontal)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray1, lineWidth: 1)
            )
        }
    }
}
#Preview {
    BirthdateInputView(birthdate: .constant(Date()))
}

struct MeasurementInputView: View {
    @State var weight: CGFloat
    @State var height: CGFloat
    @State var bodyFatMass: CGFloat

    var body: some View {
        VStack(spacing: 20) {
            InputFieldView(label: "Weight", value: $weight, unit: "kg", isRequired: true)
            InputFieldView(label: "Height", value: $height, unit: "cm", isRequired: true)
            InputFieldView(label: "Body fat mass", value: $bodyFatMass, unit: "kg", isRequired: false)
        }
    }
}

struct InputFieldView: View {
    var label: String
    @Binding var value: CGFloat
    var unit: String
    var isRequired: Bool

    @State private var textValue: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(label)
                    .font(.Pretendard(.semibold, size: 15))
                    .foregroundColor(Color.turquoise)
                
                if isRequired {
                    Text("*")
                        .foregroundColor(Color.turquoise)
                }
            }
            .padding(.bottom, 13)
            
            HStack {
                TextField("0", text: $textValue)
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
                    .frame(height: 48)
                    .cornerRadius(5)
                
                Text(unit)
                    .foregroundColor(Color(hex: 0xE0E1E2))
                    .padding(.trailing, 19)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(hex: 0xE0E1E2), lineWidth: 1)
            )
        }
        .onAppear {
            if value != 0 {
                textValue = "\(value)"
            }
        }
    }
}

#Preview {
    MeasurementInputView(weight: 0, height: 0, bodyFatMass: 0)
}

struct FlavorRankingView: View {
    @State private var rankings = ["Sweet", "Sour", "Salty", "Bitter", "Spicy"]
    @State private var selectedFlavors = Array(repeating: "None", count: 5)

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(0..<5, id: \.self) { index in
                HStack {
                    Text("\(index + 1)")
                        .frame(width: 40, height: 40)
                        .background(Color.teal.opacity(0.1))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.teal, lineWidth: 1)
                        )
                        .foregroundColor(Color.teal)
                    
                    Picker("Select Flavor", selection: $selectedFlavors[index]) {
                        Text("None")
                            .tag("None")
                            .foregroundColor(.black)  // "None" 옵션 텍스트 색상 설정
                        
                        // 현재 선택된 항목을 제외한 항목들만 필터링하여 표시
                        ForEach(filteredRankings(excluding: selectedFlavors[index]), id: \.self) { flavor in
                            Text(flavor)
                                .tag(flavor)
                                .foregroundColor(.black)  // 옵션 텍스트 색상 설정
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor.separator), lineWidth: 1)
                    )
                }
            }
        }
    }
    
    // 현재 선택된 항목을 제외한 리스트 반환
    private func filteredRankings(excluding selectedFlavor: String) -> [String] {
        rankings.filter { flavor in
            !selectedFlavors.contains(flavor) || flavor == selectedFlavor
        }
    }
}

#Preview {
    FlavorRankingView()
}

struct RatingSliderView: View {
    @State private var rating: Double = 5.0  // 초기값을 3.0으로 설정

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 0) {
                Text("light(1)")
                    .font(.Pretendard(.semibold, size: 15))
                    .foregroundColor(Color.turquoise)
                Spacer()
                Text("strong(10)")
                    .font(.Pretendard(.semibold, size: 15))
                    .foregroundColor(Color.turquoise)
            }
            Slider(value: $rating, in: 1...10, step: 1)
                .accentColor(Color.turquoise)
                .padding(.vertical, -10)

            Text("Score : \(Int(rating))")
                .font(.Pretendard(.semibold, size: 15))
                .foregroundColor(Color.turquoise)
        }
    }
}

struct RatingSliderView_Previews: PreviewProvider {
    static var previews: some View {
        RatingSliderView()
    }
}


struct MealSelectionView: View {
    @State private var selectedMeals: [String] = []

    let meals = ["Breakfast", "Lunch", "Dinner", "Extra meal after dinner"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            Text("multiple choice")
                .font(.subheadline)
                .foregroundColor(Color.blue)
            
            // Meal selection buttons
            HStack {
                MealButton(meal: meals[0], isSelected: selectedMeals.contains(meals[0])) {
                    toggleSelection(of: meals[0])
                }
                Spacer()
                MealButton(meal: meals[1], isSelected: selectedMeals.contains(meals[1])) {
                    toggleSelection(of: meals[1])
                }
                Spacer()
                MealButton(meal: meals[2], isSelected: selectedMeals.contains(meals[2])) {
                    toggleSelection(of: meals[2])
                }
            }
            HStack {
                MealButton(meal: meals[3], isSelected: selectedMeals.contains(meals[3])) {
                    toggleSelection(of: meals[3])
                }
            }
        }
    }

    func toggleSelection(of meal: String) {
        if let index = selectedMeals.firstIndex(of: meal) {
            selectedMeals.remove(at: index)
        } else {
            selectedMeals.append(meal)
        }
    }
}

struct MealButton: View {
    var meal: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(meal)
                .font(.Pretendard(.semibold, size: 16))
                .foregroundColor(isSelected ? .turquoise : Color.textGray)
                .padding()
                .frame(alignment: .leading)
                .background(isSelected ? Color.turquoise.opacity(0.2) : .white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isSelected ? Color.turquoise : .gray1, lineWidth: 1)
                )
        }
    }
}

struct MealSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MealSelectionView()
    }
}

struct NumberPickerView: View {
    @State private var selectedNumber: Int = 0  // 초기값을 0으로 설정

    var body: some View {
        VStack(spacing: 0) {
            Picker("Number", selection: $selectedNumber) {
                ForEach(0..<8) { number in  // 0부터 7까지의 숫자 제공
                    Text("\(number)")
                        .tag(number)
                }
            }
            .pickerStyle(MenuPickerStyle())  // 드롭다운 스타일 Picker
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray1, lineWidth: 1)
            )
        }
    }
}

#Preview {
    NumberPickerView()
}
