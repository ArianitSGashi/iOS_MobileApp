import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @Binding var currentShowingView: String
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @AppStorage("uid") var userID: String = ""
    
    private func isValidPassword(_ password: String) -> Bool {
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Create an Account!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                    Spacer()
                    
                    if email.isValidEmail() {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                    }
                }
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
                .padding()
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                    Spacer()
                    
                    if isValidPassword(password) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                    }
                }
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
                .padding()
                
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "login"
                    }
                }) {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button {
                    signUp()
                } label: {
                    Text("Create New Account")
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                        )
                        .padding(.horizontal)
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func signUp() {
        guard isValidPassword(password)&&email.isValidEmail() else {
            showAlert(message: "Invalid email and password")
            return
        }
        
        guard email.isValidEmail() else {
            showAlert(message: "Invalid email address")
            return
        }
        
        guard isValidPassword(password) else {
            showAlert(message: "Invalid password")
            return
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                showAlert(message: error.localizedDescription)
                return
            }
            
            if let authResult = authResult {
                userID = authResult.user.uid
                
            }
        }
    }
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

struct SignUpView_Previews: PreviewProvider {
    @State static var currentShowingView: String = ""
    static var previews: some View {
        SignUpView(currentShowingView: $currentShowingView)
    }
}

