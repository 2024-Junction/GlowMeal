//
//  UserInfoInputView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/10/24.
//

import SwiftUI

struct UserInfoInputView: View {
    @State var appUser: AppUser
    @Binding var appUserBinding: AppUser?
    @State var birthDate: Date = Date()
    @State var conceptionDate: Date = Date()
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @ObservedObject var dataManager = DataManager()
    
    var onComplete: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                    .frame(maxHeight: 80)
                Text("Enter\nyour birthdate!")
                    .font(.Pretendard(.bold, size: 24))
                    .foregroundColor(Color.black)
                    .lineSpacing(10)
                    .padding(.bottom, 20)
                HStack {
                    Text("Birthdate")
                        .font(.Pretendard(.semibold, size: 15))
                        .foregroundColor(Color.turquoise)
                    Spacer()
                    DatePicker("", selection: $birthDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                }
                .padding()
                .cornerRadius(5)
                .padding(.horizontal)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray1, lineWidth: 1)
                )
                Spacer()
                    .frame(maxHeight: 46)
                Text("Enter\nyour date of conception")
                    .font(.Pretendard(.bold, size: 24))
                    .foregroundColor(Color.black)
                    .lineSpacing(10)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Date of conception")
                        .font(.Pretendard(.semibold, size: 15))
                        .foregroundColor(Color.turquoise)
                    Spacer()
                    DatePicker("", selection: $conceptionDate, displayedComponents: .date)
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
            .padding(.horizontal, 20)
            Spacer()
            Button(action: {
                Task {
                    do {
                        try await dataManager.saveUserInfo(userId: appUser.uid, birthDate: birthDate, conceptionDate: conceptionDate)
                        alertMessage = "User info saved successfully!"
                    } catch {
                        alertMessage = "Failed to save user info: \(error.localizedDescription)"
                    }
                    showAlert = true
                }
            }, label: {
                Text("Save")
                    .font(.Pretendard(.semibold, size: 17))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 52)
                    .background(Color.mainGreen)
                    .cornerRadius(12)
            })
            .padding(.horizontal, 20)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Information"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                    onComplete()
                })
            }
        }
    }
}

#Preview {
    UserInfoInputView(appUser: AppUser(uid: "1234", email: "example@gmail.com"), appUserBinding: .constant(nil), birthDate: Date(), conceptionDate: Date()) {
        
    }
}
