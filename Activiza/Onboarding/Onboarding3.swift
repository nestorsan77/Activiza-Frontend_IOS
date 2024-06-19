//
//  Onboarding3.swift
//  Activiza
//
//  Created by Nestor Calderon perez on 19/6/24.
//

import SwiftUI

struct Onboarding3: View {
    @Binding var userEmail: String
    @Binding var userPassword: String
    @Binding var gender: Int
    @Binding var height: String
    @Binding var weight: String
    @Binding var age: String
    @Binding var activityLevel: Int
    @Binding var isSignedIn: Bool
    @State private var objective: Int = 1
    @State private var house: Int = 1
    @State private var targetWeight: String = ""
    @State private var errorMessage: String? = ""

    var body: some View {
        VStack {
            Text("ACTIVIZA")
                .font(.title)
                .bold()
                .foregroundColor(.blue)
                .padding()

            HStack(spacing: 0) {
                rectangleLine(percentage: 300)
            }

            Text("¿Cual es tu objetivo?")
            HStack {
                ToggleButton(text: "Ganar Masa", imageName: "ic_more_weight", gender: 0, selectedGender: $objective)
                ToggleButton(text: "Perder Peso", imageName: "ic_low_weight", gender: 1, selectedGender: $objective)
            }.frame(maxWidth: .infinity, maxHeight: 100)
                .padding(.horizontal, 16)
            Text("¿Donde vas a entrenar?")
            HStack {
                ToggleButton(text: "Gimnasio", imageName: "ic_gym", gender: 0, selectedGender: $house)
                ToggleButton(text: "Casa", imageName: "ic_house", gender: 1, selectedGender: $house)
            }.frame(maxWidth: .infinity, maxHeight: 100)
                .padding(.horizontal, 16)
            Spacer()

            ButtonNext(weight: $weight, height: $height, isSignedIn: $isSignedIn, errorMessage: $errorMessage)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
#Preview{
    OnboardingFlow()
}
