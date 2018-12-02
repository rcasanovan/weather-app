source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

#link_with 'Weather', 'WeatherTests'

def weatherPods
    #SVProgressHUD
    pod 'SVProgressHUD', '~> 2.2.5'
    
    #CollectionViewCenteredFlowLayout
    pod 'CollectionViewCenteredFlowLayout', '~> 1.0.1'
    
    #Realm (data base)
    pod 'RealmSwift', '~> 3.7.6'
end

target 'Weather' do
    weatherPods
end

target 'WeatherTests' do
    weatherPods
end
