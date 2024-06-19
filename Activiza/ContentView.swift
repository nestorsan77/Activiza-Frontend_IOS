//
//  ContentView.swift
//  Activiza
//
//  Created by Nestor Calderon perez on 17/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    @State private var isSignedIn = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    Image("fitnessPortada")
                        .resizable()
                        .scaledToFit()
                    HStack {
                        Text("Sign In")
                            .font(.title)
                            .bold()
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
                VStack {
                    editTextFormat(email: $email, texto: "Escribe tu email")
                    passwordTextFormat(password: $password, text: "Escribe tu password")
                    ButtonSignIn(userEmail: email, userPassword: password, isSignedIn: $isSignedIn, errorMessage: $errorMessage)
                    Spacer()
                    HStack {
                        Text("¿No tienes cuenta?")
                        Button("Sign Up") {
                            // Acción para el botón de registro
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $isSignedIn) {
                Onboarding1(userEmail: $email, userPassword: $password)
            }
            .alert(isPresented: Binding<Bool>(
                get: { errorMessage != nil },
                set: { if !$0 { errorMessage = nil } }
            )) {
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage ?? "Unknown error"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct editTextFormat:View {
    @Binding var email:String
    let texto:String
    var body: some View {
        TextField(texto, text: $email)
            .keyboardType(.emailAddress)
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal, 32)
            .onChange(of: email) { oldValue, newValue in
                print("El antiguo valor era \(oldValue) y el nuevo es \(newValue)")
            }.padding(.top, 70)
    }
}
struct passwordTextFormat:View {
    @Binding var password:String
    let text:String
    var body: some View {
        SecureField(text, text: $password)
            .keyboardType(.emailAddress)
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal, 32)
            .onChange(of: password) { oldValue, newValue in
                print("El antiguo valor era \(oldValue) y el nuevo es \(newValue)")
            }.padding(.vertical, 40)
    }
}
struct ButtonSignIn: View {
    let userEmail: String
    let userPassword: String
    @Binding var isSignedIn: Bool
    @Binding var errorMessage: String?

    var body: some View {
        Button(action: {
            if let error = checkFunctions(email: userEmail, password: userPassword) {
                errorMessage = error
            } else {
                // Lógica de inicio de sesión
                isSignedIn = true
            }
        }) {
            Text("Sign in")
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
func checkFunctions(email: String, password: String) -> String? {
    // Verificar si los campos están vacíos
    if email.isEmpty || password.isEmpty {
        return "Por favor, complete todos los campos."
    }

    // Verificar el formato del correo electrónico usando una expresión regular
    let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}$"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    if !emailPredicate.evaluate(with: email) {
        return "Por favor, ingrese un correo electrónico válido."
    }

    // Verificar la longitud de la contraseña (por ejemplo, mínimo 8 caracteres)
    if password.count < 8 {
        return "La contraseña debe tener al menos 8 caracteres."
    }

    // Si todas las validaciones pasan, retornar nil (no hay errores)
    return nil
}

#Preview {
    ContentView()
}
