//
//  HomeView.swift
//  CyberShield
//
//  Created by Arianna Foo on 2023-09-23.
//

import SwiftUI


struct HomeView: View {
    
    @State private var tfPassword : String = ""
    @State private var errorMessage : String = ""
    @State private var showAlert : Bool = false
    @State private var isBreached : Bool = false
    
    var body: some View {

        VStack{
            
            Form{
                Text("Have I Been Breached?")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .bold()
                    .frame(maxWidth: .infinity)
                
                TextField("Enter Password", text: self.$tfPassword)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .keyboardType(.default)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                
                Button(action: {
                    // Calling helper to check if field is empty
                    self.areInputsEmpty()
                }) {
                    Text("Check breach")
                        .frame(maxWidth: .infinity)
                        // by applying the frame directly to text
                        // we are able to expand the button
                }
                .buttonStyle(.borderedProminent)
                .foregroundColor(.white)
                .tint(.blue)
                .padding()
                .alert(isPresented: self.$showAlert){
                    
                    Alert(
                        title: Text("Error"),
                        message: Text("\(self.errorMessage)"),
                        dismissButton: .default(Text("Dismiss"))
                    )
                } // alert
                
                Spacer()
                
                
            } // Form
        } // VStack
        
    }// Body
    
    // Helper function
    private func areInputsEmpty() {
        if(self.tfPassword.isEmpty){
            self.errorMessage = "Password field is not completed. Please fill in all fields to continue."
            self.showAlert = true
        }
    }
    
    
    private func isPasswordBreached() {
        
        if(self.isBreached){
            self.errorMessage = "Bad News...Unfortunately, this password has been part of a data breach."
        } else if (!self.isBreached) {
            self.errorMessage = "Great news! Your password is not compromised. No breach found. "
        }
        
    }
    
    
    
} // Struct


// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
