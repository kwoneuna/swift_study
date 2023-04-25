import UIKit

//FOR 반복문
//레인지
//0,1,2,3,4
for index in 0...5{
    print("호호 index: \(index)")
}

for index in 0..<5 where index % 2 == 0 {
    print("호호 index: \(index)")

}
//var randomInts [Int] = []
var randomInts: [Int] = [Int]()
for _ in 0..<25{
    let randomNumber = Int.random(in: 0...100)
    randomInts.append(randomNumber)
}
print("randomInts: \(randomInts)")

//옵셔널이란? 값이 있는지 없는지 모른다
var someVariable: Int?  = nil// = nil이라면 값이 없다고 알려주는것
if someVariable == nil{
    someVariable = 90
}
print(someVariable) //optional(90)이라고 뜬다
//Unwrapping
//감싸져 있는것을 벗기는 것
if let otherVariable = someVariable{
    print("언래핑 되었다. 즉 값이 있다. otherVariable : \(otherVariable)")
}else{
    print("값이 없다")
}
someVariable = nil
//someVariable 이 비어있으면 기본값으로 뭘 넣겟다
let myValue = someVariable ?? 10
print("myVale:\(myValue)")


var firstValue : Int? = 30
var secondValue : Int? = 50
print("\(firstValue)")
print("\(secondValue)")

unwrap(firstValue)
unwrap(secondValue)
func unwrap(_ parameter: Int?){
    print("unwrap() called")
    //값이 없으면 return
    guard let unWrappedParam = parameter
    else { return}
    print("unwrappedParam : \(unWrappedParam)")
}
// 클래스 Vs 스트럭트

struct YoutubeStruct{
    var name : String
    var subscriberCount : Int
}
var devJeong = YoutubeStruct(name:"정대리", subscriberCount: 9999)
var devJeongClone = devJeong // devJeong을 복사해서 만든것, 값을 바꿔도 devJong에 영향없음 , 값 복사
print("devJeongClone.name : \(devJeongClone.name)") //정대리
devJeongClone.name = "호롤로로"
print("devJeongClone.name : \(devJeongClone.name)") // 호롤로로
print("devJeong.name : \(devJeong.name)") // 정대리

//클래스 : 스트럭트 같이 데이터 덩어리
//클래스는 서로 연결ㅡ 같은 메모리공간 사용
class YoutubeClass{
    var name : String
    var subscriberCount : Int
    //생성자- 메모리에올린다
    //init으로 매개변수를 가진 생성자 메소드를 만들어야 매개변수를 넣어서 그값을 가진 객체를 만들 수 있다
    init(name: String, subscriberCount : Int){
        self.name = name
        self.subscriberCount = subscriberCount
    }
}
var jeongdev = YoutubeClass(name:"정대리", subscriberCount: 9999)
var jeondevclone = jeongdev
print("값 넣기전 jeong.name : \(jeondevclone.name)")
jeondevclone.name = "호롤로로"
print("devJeongClone.name : \(jeondevclone.name)") // 호롤로로
print("devJeong.name : \(jeongdev.name)") // 호롤로로 ->clone을 바꾸면 본래 jeongdev도 바뀌게 된다

//day 7 옵저버
var myAge = 0 {
    willSet{
        print("값이 설정될 예정이다 my Age :\(myAge)")
    }
    didSet{
        print("값이 설정 my Age : \(myAge)")
    }
}
//출력 0, 10 -> 10, 20 이런식으로 바뀐다
myAge=10
myAge=20

//day 8 함수 매개변수 이름
//함수,메소드 정의
func myFunction(name:String) -> String{
    return "안녕하세요? \(name)입니다!"
}
//함수, 메소드 호출 : call

myFunction(name: "은아")
//이름을 바꿔줄때
func myFunctionsecond(with name:String) -> String{
    return "안녕하세요? \(name)입니다!"
}
myFunctionsecond(with: "헬로")
//method 이름 정의하지 않고 호출하기
func myFunctionThird(_ name:String) -> String{
    return "안녕하세요? \(name)입니다!"
}
myFunctionThird("헬로")

//day 9 제네릭 <> 보통 제네릭 <T>
//어떠한 자료형이든 받을 수 있다
struct Myarray<SomeElement>{
    //제네릭을 담은 빈 배열
    var elements : [SomeElement] = [SomeElement]()
    //t생성자
    init(_ elements : [SomeElement]){
        self.elements = elements
    }
}
struct Friend{
    var name : String
}
struct ppakCoder{
    var name : String
}
var mysomearray = Myarray([1,2,3])
print("mysomearray : \(mysomearray)") //mysomearray : Myarray<Int>(elements: [1, 2, 3])


var myStringarray = Myarray(["가","나","다"])
print("myStringarray = \(myStringarray)")//myStringarray = Myarray<String>(elements: ["가", "나", "다"])


let friend_01 = Friend(name: "정수")
let friend_02 = Friend(name: "지희")
let friend_03 = Friend(name: "환희")
var myFriendarray = Myarray([friend_01,friend_02,friend_03])
print("myfriendarray : \(myFriendarray)")//myfriendarray : Myarray<Friend>(elements: [__lldb_expr_28.Friend(name: "정수"), __lldb_expr_28.Friend(name: "지희"), __lldb_expr_28.Friend(name: "환희")])

//day 10 클로저
//string을 반환하는 클로저
let myName : String = {
    //myname으로 들어간다
    return "제리"
}()
print(myName)
//클로저 정의
let myRealName : (String) -> String = {(name : String) -> String in
    return "개발하는 \(name)"
}
myRealName("제리")
//반환하는 값이 없다면
let myRealNamelogic : (String) -> Void = {(name : String)  in
    print("개발하는 \(name)")
}
myRealNamelogic("제리")
