//
//  LoginFunctions.swift
//  Activiza
//
//  Created by Nestor Calderon perez on 18/6/24.
//

import Foundation

class LoginFunctions{
    func checkFunctions(email: String, password: String) -> String? {
        // Verificar si los campos están vacíos
        if email.isEmpty || password.isEmpty {
            return "empty"
        }

        // Verificar el formato del correo electrónico usando una expresión regular
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: email) {
            return "invalidEmail"
        }

        // Verificar la longitud de la contraseña (por ejemplo, mínimo 8 caracteres)
        if password.count < 8 {
            return "shortPassword"
        }

        // Si todas las validaciones pasan, retornar nil (no hay errores)
        return nil
    }
}
