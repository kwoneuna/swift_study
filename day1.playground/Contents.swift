import UIKit
//다크모드 여부, 조건문
var isDarkMode : Bool = false
if (isDarkMode == true){
    print("다크모드입니다")
}else{
    print("다크모드가 아닙니다")
}
//isDarkMode == true
if isDarkMode{
    print("다크모드입니다")
}else{
    print("다크모드가 아닙니다")
}

var title : String = isDarkMode == true ? "다크모드 입니다" : "다크모드가 아닙니다"

print("title: \(title)")

var nottitle : String = !isDarkMode == true ? "다크모드 입니다" : "다크모드가 아닙니다"

print("title: \(nottitle)")

//foreach 반복문
//콜렉션 : 데이터를 모아둔것
//배열, set, 딕셔너리, 튜플
var myArray : [Int] = [0,1,2,3,4,5,6,7,8,9,10]
for item in myArray{
    print("item : \(item)")
}
for item in myArray where item > 5{
    print("5보다 큰수 \(item)")
}
for item in myArray where item % 2 == 0{
    print("짝수: \(item)")
}

//enum표현 방법
//학교 - 초,중,고
enum School {
// case 나누지, 값은 없음
    case elementary, middle, high
}
//constant
let yourSchool = School.elementary
print("yourshcool :\(yourSchool)")
print("yourschool", yourSchool)
enum Grade : Int {
    case first = 1
    case second = 2
}
let yourGrade = Grade.second
print("yourgrade: \(yourGrade)")

enum SchoolDetail {
    case elementary(name : String)
    case middle(name : String)
    case high(name : String)
    func getName() -> String{
        switch self{
        case.elementary(let name):
            return name
        case let .middle(name):
            return name
        case let .high(name):
            return name

        }

        
    }
}
let yourMiddleSchoolName = SchoolDetail.middle(name: "정대리중학교")
print("yourMiddleSchoolName \(yourMiddleSchoolName.getName())")
