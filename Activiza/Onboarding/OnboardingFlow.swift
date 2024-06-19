//
//  OnboardingFlow.swift
//  Activiza
//
//  Created by Nestor Calderon perez on 19/6/24.
//

import SwiftUI

struct OnboardingFlow: View {
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var gender: Int = 0
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var age: String = ""
    @State private var activityLevel: Int = 0
    @State private var isSignedIn: Bool = false

    var body: some View {
        NavigationView {
            Onboarding1(
                userEmail: $userEmail,
                userPassword: $userPassword,
                gender: gender,
                height: height,
                weight: weight,
                isSignedIn: isSignedIn
            )
        }
    }
}

#Preview {
    OnboardingFlow()
}

