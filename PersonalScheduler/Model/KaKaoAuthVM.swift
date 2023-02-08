//
//  KaKaoAuthVM.swift
//  PersonalScheduler
//
//  Created by leewonseok on 2023/02/08.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser

class KaKaoApiManager {
    var isLoggedIn : Bool = false
    
    func loginWithApp() {
        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoTalk() success.")
                self.isLoggedIn = true
                _ = oauthToken
            }
        }
    }
    
    func loginWithEmail() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() success.")
                self.isLoggedIn = true
                _ = oauthToken
            }
        }
    }
    
    func handleKakaoLogin() {
        print("handleKakaoLogin() Called")
        if (UserApi.isKakaoTalkLoginAvailable()) {
            loginWithApp()
        } else {
            loginWithEmail()
        }
    }
}
