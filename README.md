![Demo Snapshot]()
This is  a demo for a school Informations 


## 🚀 Features
```
UIKit
MVVM pattern
TDD development
```
### 🖼 Overlays
```
Based on MVVM pattern
    * Views
        SchoolListViewController:
            main entry
        SchoolListViewCell
        SchoolListView
        DetailsViewController
            a view show details SAT info. could back click button
                
    * ViewModel
        load data and combine with views
    * Model
        defined data structur
    * Network
        URLs
            save the real URLs and return available URLs
        NetworkManager
            used Alamofire and native method.
            send data by async/wait and clouser method
            parse HTML by SwiftSoup 
        MockNetworkManager
            supply mock data for test and developing

TDD: Coveage Rate >90%  =98%
    20220531-jian&li-NYCSchoolsTests:
        testSchoolListViewModel:
            mock data for load school list
        testSchoolSATViewModel
            mock data for load SAT data
    NYCSchoolsUITests:
        testSwitchBetween1And2:
            simulated switch between screen 1 and screen 2
```
### 🛠 Appearance / Behavior Customization
![Demo Snapshot](https://github.com/jala886/20230116--jianli--NYCSchools-UIKit/blob/main/ScreenShot%20main.png)

### 👀 Adapt visibility of:


### 🪄 Custom controls


## 💻 Supported Platforms

| 📱 | iOS 13+ |
| :-: | :-: |
| 🖥 | **macOS 10.15+** | 
| 📺 | **tvOS 13+** |
| ⌚️ | **watchOS 6+** |



### 📌 Annotations: The old-fashioned approach



## 🔩 Installation


## ✍️ Author

Jian Li

## 📄 License

