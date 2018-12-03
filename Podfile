source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

#link_with 'Weather', 'WeatherTests'

def weatherPods
    #CollectionViewCenteredFlowLayout
    pod 'CollectionViewCenteredFlowLayout', '~> 1.0.1'
    
    #Realm (data base)
    pod 'RealmSwift', '~> 3.7.6'
    
    #Networking
    pod 'ReachabilitySwift', '~> 4.2.1'
    
    #Firebase
    pod 'Firebase/Core'
    pod 'Firebase/Firestore'
end

target 'Weather' do
    weatherPods
end

target 'WeatherTests' do
    weatherPods
end
