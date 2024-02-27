import SwiftUI
import FirebaseAuth
struct SignOutButton: View {
    @AppStorage("uid") var userID: String = ""
    var body: some View {
        Button(action: {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                withAnimation {
                    userID = ""
                }
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .padding(.top,5)
                    .padding(.leading,5)
                    .padding(.trailing,320)
                Text("Sign Out").padding(.trailing,248).padding(.top,8)
            }
        }
    }
}


