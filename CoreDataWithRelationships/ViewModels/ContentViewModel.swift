//
//  ContentViewModel.swift
//  CoreDataWithRelationships
//
//  Created by Fred Javalera on 6/3/21.
//

import Foundation
import CoreData

class ContentViewModel: ObservableObject {
  
  // MARK: Properties
  let manager = CoreDataManager.instance
  @Published var businesses: [BusinessEntity] = []
  @Published var departments: [DepartmentEntity] = []
  @Published var employees: [EmployeeEntity] = []
  
  // MARK: Init
  init() {
    getBusinesses()
    getDepartments()
    getEmployees()
  }
  
  // MARK: CRUD Operations
  func getBusinesses() {
    let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
    // Sort logic
    let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
    request.sortDescriptors = [sort]
    
    // Filter logic
//    let filter = NSPredicate(format: "name == %@", "Apple")
//    request.predicate = filter
    
    do {
      businesses = try manager.context.fetch(request)
    } catch let error {
      print("Error fetching. \(error.localizedDescription)")
    }
  }
  
  func getDepartments() {
    let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
    
    do {
      departments = try manager.context.fetch(request)
    } catch let error {
      print("Error fetching. \(error.localizedDescription)")
    }
  }
  
  func getEmployees() {
    let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
    
    do {
      employees = try manager.context.fetch(request)
    } catch let error {
      print("Error fetching. \(error.localizedDescription)")
    }
  }
  
  func getEmployees(forBusiness business: BusinessEntity) {
    let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
    
    let filter = NSPredicate(format: "business == %@", business)
    request.predicate = filter
    
    do {
      employees = try manager.context.fetch(request)
    } catch let error {
      print("Error fetching. \(error.localizedDescription)")
    }
  }
  
  func updateBusiness() {
    let existingBusiness = businesses[4]
    existingBusiness.addToDepartments(departments[4])
    save()
  }
  
  func addBusiness() {
    let newBusiness = BusinessEntity(context: manager.context)
    newBusiness.name = "Facebook"
    
//    // Add existing departments to the new business
//    newBusiness.departments = [departments[0], departments[1]]
//
//    // Add existing employees to the new business
//    newBusiness.employees = [employees[1]]
//
//    // Add new business to existing department
//    newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
//
//    // Add new business to existing employee
//    newBusiness.addToEmployees(<#T##value: EmployeeEntity##EmployeeEntity#>)
    
    save()
  }
  
  func addDepartment() {
    let newDepartment = DepartmentEntity(context: manager.context)
    newDepartment.name = "Finance"
    newDepartment.businesses = [businesses[0],businesses[2],businesses[4]]
    newDepartment.addToEmployees(employees[1])
    
    save()
  }
  
  func addEmployee() {
    let newEmployee = EmployeeEntity(context: manager.context)
    newEmployee.age = 21
    newEmployee.dateJoined = Date()
    newEmployee.name = "John"
    
    newEmployee.business = businesses[4]
    newEmployee.department = departments[4]
    save()
  }
  
  func deleteDepartment() {
    let department = departments[1]
    manager.context.delete(department)
    save()
  }
  
  func deleteBusiness() {
    let business = businesses[1]
    manager.context.delete(business)
    
    let business2 = businesses[2]
    manager.context.delete(business2)
    
    save()
  }
  
  func save() {
    businesses.removeAll()
    departments.removeAll()
    employees.removeAll()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      self.manager.save()
      self.getBusinesses()
      self.getDepartments()
      self.getEmployees()
    }
  }
}
