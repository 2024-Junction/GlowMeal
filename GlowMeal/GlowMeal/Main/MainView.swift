//
//  MainView.swift
//  GlowMeal
//
//  Created by 주영정 on 8/10/24.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var isEditing: Bool
    var placeholder: String
    var placeholderColor: UIColor
    var textColor: UIColor

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(parent: CustomTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.isEditing = true
            textField.placeholder = nil // 텍스트 필드가 선택되면 플레이스홀더 제거
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isEditing = false
            textField.placeholder = parent.placeholder // 편집이 끝나면 플레이스홀더 복원
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        textField.textColor = textColor
        textField.font = UIFont.boldSystemFont(ofSize: 16) // 입력 텍스트를 bold로 설정
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}

struct MainView: View {
    @State private var searchText: String = ""
    @State private var hasSearched: Bool = false
    @State private var isEditing: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 60)
                
                VStack(alignment: .leading) {
                    Text(hasSearched ? "Nutrition\nInformation" : "Nutrition Info\nFinder")
                        .font(.Pretendard(.bold, size: 24))
                        .foregroundColor(hasSearched ? Color("turquoise") : .black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 40)

                HStack {
                    CustomTextField(
                        text: $searchText,
                        isEditing: $isEditing,
                        placeholder: "Search and get nutrition information",
                        placeholderColor: UIColor(Color.mainGreen),
                        textColor: UIColor(Color.turquoise)
                    )
                    .frame(height: 20)

                    Spacer()

                    Button(action: {
                        if !searchText.isEmpty {
                            hasSearched = true
                        }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(isEditing ? Color.turquoise : Color.mainGreen) // 클릭 시 아이콘 색상 변경
                            .padding(.trailing, 6)
                    }
                }
                .padding()
                .background(isEditing ? Color.gray2 : (hasSearched ? Color.gray2 : Color.mainGreen.opacity(0.2)))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isEditing ? Color.clear : Color.mainGreen, lineWidth: 1) // 클릭 시 테두리 없앰
                )
                VStack(spacing: 0) {
                    SerchInfoView()
                    HStack(spacing: 4) {
                        Image("Pin_icon")
                        Text("Raw eggs may contain Salmonella, which can be dangerous for pregnant women.")
                            .font(.Pretendard(.semibold, size: 14))
                            .foregroundColor(Color.mainOrange)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    
                    NavigationLink(destination: CompareView()) {
                        Text("Compare with alternative food")
                            .font(.Pretendard(.medium, size: 16))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 52)
                            .background(Color.mainBlue)
                            .cornerRadius(12)
                    }
                    .padding(.vertical, 15)
                    
                    NavigationLink(destination: MoreInfoView()) {
                        Text("Ate it already - check more info")
                            .font(.Pretendard(.medium, size: 16))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, maxHeight: 52)
                            .background(Color.sky)
                            .cornerRadius(12)
                    }
                }
                .padding(.top, 20)
                Spacer()
            }
            .padding(.horizontal, 17)
        }
    }
}

struct SerchInfoView: View {
    var body: some View {
        NutrientTableView()
    }
}

// 예시로 사용할 대체 음식 뷰
struct AlternativeFoodView: View {
    var body: some View {
        Text("Compare with alternative food")
            .font(.largeTitle)
            .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

