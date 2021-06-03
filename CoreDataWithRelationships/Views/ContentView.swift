//
//  ContentView.swift
//  CoreDataWithRelationships
//
//  Created by Fred Javalera on 6/3/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
  // MARK: Properties
  @StateObject var viewModel = ContentViewModel()
  
  // MARK: Body
  var body: some View {
    
    NavigationView {
      
      ScrollView {
        
        VStack {
          
          Button(action: {
            
            // TODO: Update with the operation that you would like to perform.
            viewModel.deleteBusiness()
          
          }, label: {
            
            Text("Perform Action")
              .foregroundColor(.white)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .background(Color.blue.cornerRadius(10.0))
          
          })//: Button
          
          ScrollView(.horizontal, showsIndicators: true, content: {
            
            HStack(alignment: .top) {
             
              ForEach(viewModel.businesses) { business in
                
                BusinessView(entity: business)
              
              }//: End ForEach
              
            }//: HStack
            
          })//: ScrollView
          
          ScrollView(.horizontal, showsIndicators: true, content: {
            
            HStack(alignment: .top) {
             
              ForEach(viewModel.departments) { department in
                
                DepartmentView(entity: department)
              
              }//: End ForEach
              
            }//: HStack
            
          })//: ScrollView
          
          ScrollView(.horizontal, showsIndicators: true, content: {
            
            HStack(alignment: .top) {
             
              ForEach(viewModel.employees) { employee in
                
                EmployeeView(entity: employee)
              
              }//: End ForEach
              
            }//: HStack
            
          })//: ScrollView
          
        }//: VStack
        .padding()
        
      }//: ScrollView
      .navigationTitle("Relationships")
      
    }//: NavigationView
    
  }//: Body
  
}//: View

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
