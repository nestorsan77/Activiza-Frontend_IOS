//
//  Onboarding1.swift
//  Activiza
//
//  Created by Nestor Calderon perez on 18/6/24.
//

import SwiftUI

struct Onboarding1: View {
    @Binding var userEmail: String
    @Binding var userPassword: String
    @State var gender: Int = 1
    @State var height: String = ""
    @State var weight: String = ""
    @State var isSignedIn: Bool = false
    @State private var errorMessage: String? = ""

    var body: some View {
        VStack {
            Text("ACTIVIZA")
                .font(.title)
                .bold()
                .foregroundColor(.blue)
                .padding()

            HStack(spacing: 0) {
                rectangleLine(percentage: 33)
            }

            parameters(text: "¿Cuánto mides?", textHolding: "Ingrese su altura en cm", response: $height)
            parameters(text: "¿Cuánto pesas?", textHolding: "Ingrese su peso en kg", response: $weight)
            Text("¿Cuál es tu género?")
            HStack {
                ToggleButton(text: "Hombre", imageName: "man", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", imageName: "woman", gender: 1, selectedGender: $gender)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .padding(.horizontal, 16)

            Spacer()

            NavigationLink(destination: Onboarding2(
                userEmail: $userEmail,
                userPassword: $userPassword,
                gender: $gender,
                height: $height,
                weight: $weight,
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


struct ButtonNext: View {
    @Binding var weight: String
    @Binding var height: String
    @Binding var isSignedIn: Bool
    @Binding var errorMessage: String?

    var body: some View {
        Button(action: {
            if let error = checkFunctions(email: weight, password: height) {
                errorMessage = error
            } else {
                // Lógica de inicio de sesión
                isSignedIn = true
            }
        }) {
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
}

struct ToggleButton:View {
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    
    var body: some View {
        
        let color = if(gender == selectedGender){
            Color.blue
        }else{
            Color.blueLight
        }
        
        Button(action:{
            selectedGender = gender
        }){
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .foregroundColor(.white)
                InformationText(text: text)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .background(color)
        }
    }
}

struct InformationText:View {
    let text:String
    var body: some View {
        Text(text).font(.title).bold().foregroundColor(.black)
    }
}

struct parameters:View {
    var text:String
    var textHolding:String
    @Binding var response:String
    var body: some View {
        Text(text)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title3)
        TextField(textHolding, text: $response)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
    }
}

struct rectangleLine:View {
    let percentage:CGFloat
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width:percentage, height: 12)
        Rectangle()
            .fill(Color.gray)
            .frame(height: 12)
    }
}

