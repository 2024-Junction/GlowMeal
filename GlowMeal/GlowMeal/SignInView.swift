//
//  SignInView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/10/24.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Image("GlowMeal_logo")
                .shadow(color: Color.black.opacity(0.25), radius: 4, y: 4)
            Spacer()
                .frame(maxHeight: 170)
            Button(action: {
            }) {
                HStack(alignment: .center, spacing: 15) {
                    Image("apple_logo")
                        .frame(width: 24, height: 24)
                    Text("Sign in with Apple")
                        .font(.Pretendard(.semibold, size: 16))
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, 94)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.black)
                .cornerRadius(12)
            }

            Button(action: {
                // Google 로그인 버튼 액션
            }) {
                HStack(alignment: .center, spacing: 15) {
                    Image("google_logo")
                        .frame(width: 24, height: 24)
                    Text("Sign in with Google")
                        .font(.Pretendard(.semibold, size: 16))
                        .foregroundColor(Color.black)
                }
                .padding(.horizontal, 94)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 1)
                )
            }
            Spacer()
                .frame(maxHeight: 98)
        }
        .padding(.horizontal, 11)
    }
}


#Preview {
    SignInView()
}
