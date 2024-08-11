//
//  CheckUpView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct CheckUpView: View {
    @State var appUser: AppUser
    @Binding var appUserBinding: AppUser?
    @State var isTestCompleted: Bool = false
    @StateObject var dataManager = DataManager() // DataManager 인스턴스
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            if isLoading {
                LoadingView()
            } else {
                if isTestCompleted {
                    HomeView()
                }
                else if !isTestCompleted {
                    UserInfoInputView(appUser: appUser, appUserBinding: $appUserBinding) {
                        self.isTestCompleted = true
                    }
                }
            }
        }
        .onAppear {
            Task {
                await checkIfUserInfoExists()
                self.isLoading = false
            }
        }
    }
    private func checkIfUserInfoExists() async {
        if let _ = await dataManager.fetchUserInfo(userId: appUser.uid) {
            isTestCompleted = true
        } else {
            isTestCompleted = false
        }
    }
}

#Preview {
    CheckUpView(appUser: AppUser(uid: "1234", email: "example@gmail.com"), appUserBinding: .constant(nil))
}
