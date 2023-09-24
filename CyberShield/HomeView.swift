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
    @State private var funFact = [String]()
    
    var body: some View {

        VStack{
            Form{
                Text("Check Password")
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
            
            // Creating another form to display facts
            
            Form{
                Text("\(String(describing: self.getRandomFunFact()))")
            }
            .onAppear(perform: self.readFile)
            
            
            
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
    
    private func readFile(){
        
        do {
            // Specify the path to the file you want to read
            let filePath = "/Users/ariannafoo/Documents/Geekfest/CyberShield/CyberShield/fun_facts.txt"
            
            // Read the contents of the file into a string
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
            
            // Split the file contents into an array of lines
            let lines = fileContents.components(separatedBy: "\n")
            
            // Now you can iterate over the lines and process them
            for line in lines {
                self.funFact.append(line)
            }
        } catch {
            // Handle any errors that may occur while reading the file
            print("Error reading the file: \(error)")
        }
            
        } // readFile
    
    
    private func getRandomFunFact(){
        
        let listLen = self.funFact.count
        
        return self.funFact[Int.random(in: 0..<listLen)]
    }
    
    
} // Struct



// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
