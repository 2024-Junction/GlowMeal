//
//  AuthManager.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import Foundation
import Supabase

/// 앱에 로그인한 유저의 정보
struct AppUser {
    let uid: String
    let email: String?
}

/// 유저가 진행한 테스트 결과 정보
struct TestResult: Encodable {
    let user_id: String
    let completed: Bool
}

/// apple 로그인 관련 class
class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    ///  supabase 클라이언트 정의
    let supabaseClient = SupabaseManager.shared.supabaseClient
    
    // 현재 새션을 받아오는 함수
    func getCurrentSession() async throws -> AppUser? {
        let session = try await supabaseClient.auth.session
        print("Current session: \(session)")
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    func signInWithApple(idToken: String, nonce: String) async throws -> AppUser {
        let session = try await supabaseClient.auth.signInWithIdToken(credentials: .init(provider: .apple, idToken: idToken, nonce: nonce))
        let appUser = AppUser(uid: session.user.id.uuidString, email: session.user.email)
        
        return appUser
    }
    
    func signOut() async throws {
        try await supabaseClient.auth.signOut()
        print("User signed out")
    }
}
