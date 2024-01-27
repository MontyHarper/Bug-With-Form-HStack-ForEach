//
//  ContentView.swift
//  Bug With Form-HStack-ForEach
//
//  Created by Monty Harper on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers1 = Set<Int>()
    @State private var numbers2 = Set<Int>()
    @State private var numbers3 = Set<Int>()
    
    var body: some View {
        
        VStack {
            
            Text("Example 1")
                .dynamicTypeSize(.xxxLarge)
                .fontWeight(.black)
            
            Form {
                
                Text("In a form without HStack, buttons behave as expected...")
                
                ForEach(0..<3) { number in
                    Button(String(number)) {
                        if numbers2.contains(number) {
                            numbers2.remove(number)
                        } else {
                            numbers2.insert(number)
                        }
                    }
                }
                
                Text("Numbers included: " + numbers2.map({String($0)}).joined(separator: ", "))
            }
            
            Text("Example 2")
                .dynamicTypeSize(.xxxLarge)
                .fontWeight(.black)
            
            Form {
                Text("In a form with HStack, with no button style, tapping one button taps them all. With button style, they work as expected...")
                HStack {
                    ForEach(3..<6) { number in
                        Button(String(number)) {
                            if numbers1.contains(number) {
                                numbers1.remove(number)
                            } else {
                                numbers1.insert(number)
                            }
                        }
 // This also fixes the problem.
 //                       .buttonStyle(.plain)
                    }
                }
                HStack {
                    ForEach(3..<6) { number in
                        Button(String(number)) {
                            if numbers1.contains(number) {
                                numbers1.remove(number)
                            } else {
                                numbers1.insert(number)
                            }
                        }
                        .buttonStyle(.borderedProminent)

                    }
                }
                
                Text("Numbers included: " + numbers1.map({String($0)}).joined(separator: ", "))
            }
           
            VStack {
                
                Text("Example 3")
                    .dynamicTypeSize(.xxxLarge)
                    .fontWeight(.black)
                
                Text("Outside of a form, HStack-ed buttons work as expected...")
                HStack {
                    ForEach(6..<9) { number in
                        Button(String(number)) {
                            if numbers3.contains(number) {
                                numbers3.remove(number)
                            } else {
                                numbers3.insert(number)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                        ForEach(6..<9) { number in
                            Button(String(number)) {
                                if numbers3.contains(number) {
                                    numbers3.remove(number)
                                } else {
                                    numbers3.insert(number)
                                }
                            }
                        }
                }
                
                Text("Numbers included: " + numbers3.map({String($0)}).joined(separator: ", "))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
