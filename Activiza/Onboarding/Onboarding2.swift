//
//  Onboarding2.swift
//  Activiza
//
//  Created by Nestor Calderon perez on 19/6/24.
//

import SwiftUI

struct Onboarding2: View {
    @Binding var userEmail: String
    @Binding var userPassword: String
    @Binding var gender: Int
    @Binding var height: String
    @Binding var weight: String
    @Binding var isSignedIn: Bool
    @State private var age: String = ""
    @State private var activityLevel: Int = 0
    @State private var errorMessage: String? = ""

    var body: some View {
        VStack {
            Text("ACTIVIZA")
                .font(.title)
                .bold()
                .foregroundColor(.blue)
                .padding()

            HStack(spacing: 0) {
                rectangleLine(percentage: 140)
            }

            parameters(text: "¿Cuántos años tienes?", textHolding: "Ingrese su edad", response: $age)
            Text("Nivel de actividad física")
            HStack {
                ToggleButton(text: "Bajo", imageName: "ic_low_activity", gender: 0, selectedGender: $activityLevel)
                ToggleButton(text: "Medio", imageName: "ic_medium_activity", gender: 1, selectedGender: $activityLevel)
                ToggleButton(text: "Alto", imageName: "ic_hight_activity", gender: 2, selectedGender: $activityLevel)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .padding(.horizontal, 16)

            Spacer()

            NavigationLink(destination: Onboarding3(
                userEmail: $userEmail,
                userPassword: $userPassword,
                gender: $gender,
                height: $height,
                weight: $weight,
                age: $age,
                activityLevel: $activityLevel,
                isSignedIn: $isSignedIn
            )) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .font(.title2)
                    .padding(.horizontal, 32)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

