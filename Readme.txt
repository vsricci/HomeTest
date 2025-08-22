Welcome my Home test

 The project was created using the concepts of Solid pratices;
 
 ARCHITECTURE:
    - MVVM with swiftUI;

Project Folder -

Three main layers
   - Data: Defined API Config
            - A enum to configure request using Info.plist to get Environment data, selecting by scheme, think in future: a stack with diferents scheme but using the same keys.
            - A protocol to extension URLSerssion, to mock Netework calls.
            - The layer service to uses the confi and network protocols to build the network layer.
         - Defined Entities.
         
   - Domain: Defined the classes to use the bridges and the confis.
     - A interface abstract to create a brigde, to access api, cover TDD and and solid concepts.
     - UseCase to call the service by bridge.
    
   - Presentation: Defined to create a layers call the apis, get the result follow the business layer(VM - View Model)
       - The view - to show the data(Success or Failure) collect by VM
       
       
       
TDD - fews layer tests created (but imcompleted)

    - Mock for network;
    - Tests for network;
    - some layer (VM, repository, usecase).
    
