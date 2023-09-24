//
//  UIDemoView.swift
//  UIDemo
//
//  Created by Arianna Foo on 2023-09-23.
//

import SwiftUI

struct CreateAccountView: View {
    
    // State property wrapper - for binding
    
    // name email password confirm password
    @State private var tfName: String = ""
    @State private var tfEmail: String = ""
    @State private var tfPassword: String = ""
    @State private var tfConpassword: String = ""
    @State private var showAlert: Bool = false
    @State private var showPasswordAlert: Bool = false
    @State private var errorMessage : String = ""
    
    var body: some View {
        
        VStack{
                
                Form{
                    Text("Sign up")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .bold()
                        .frame(maxWidth: .infinity)
                    
                    TextField("Enter Name", text: self.$tfName)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .keyboardType(.default)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.words)
                    
                    
                    TextField("Enter Email Address", text: self.$tfEmail)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .keyboardType(.default)
                        .autocorrectionDisabled(true)
                    
                    // User text isn't visible
                    SecureField(text: self.$tfPassword, prompt: Text("Enter Password")) {
                        Text("Password")
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .keyboardType(.default)
                    .autocorrectionDisabled(true)
                    
                    
                    SecureField(text: self.$tfConpassword, prompt: Text("Confirm Password")) {
                        Text("Password")
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .keyboardType(.default)
                    .autocorrectionDisabled(true)
                    
                    Spacer()
                    
                    Button(action: {
                        self.areInputsEmpty()
                        self.passwordsMatching()
                    
                        // some operation
                    }) {
                        Text("Create Account")
                            .frame(maxWidth: .infinity)
                        // by applying the frame directly to text
                        // we are able to expand the button
                    }
                    // this will create a new frame around the button
                    // which is why the button doesnt expand -> expands frame
                    // .frame(maxWidth: .infinity)
                    
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
                
                Spacer()
                
            } // VStack
    
    } // body
    
    // Helper function
    private func areInputsEmpty() {
        if(self.tfName.isEmpty || self.tfEmail .isEmpty || self.tfPassword.isEmpty || self.tfConpassword.isEmpty){
            self.errorMessage = "One or more fields are not completed. Please fill in all fields to continue."
            self.showAlert = true
        }
    }
    
    
    // Question about using show alert - everytime i press button, showAlert resets to false
    
    private func passwordsMatching() {
        if(!self.tfName.isEmpty && !self.tfEmail .isEmpty && !self.tfPassword.isEmpty && !self.tfConpassword.isEmpty) && (self.tfPassword != self.tfConpassword){
            self.showAlert = true
            self.errorMessage = "Passwords are not the same. Please try again"
        }
    }
   
} // struct


// Preview
struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
