# Design-Pattern



### GoF 디자인 패턴

- 생성 패턴

  - [기본 예제 코드](#기본 예제 코드 - 미로 맵 생성 )
  - [객체 생성 패턴 vs 클래스 생성 패턴](#0.-객체-생성-패턴-vs-클래스-생성-패턴)

  - [1. Abstract Factory](#1.-추상-팩토리(abstract-pattern)-패턴)
  - [2. Builder](#2.-빌더(builder)-패턴)
  - [3. Factory Method](#3.-팩토리 메서드(factory-method)-패턴)
  - Prototype
  - Singleton

- 구조 패턴

  - Adapter
  - Bridge
  - Composite
  - Decorator
  - Facade
  - Flyweight
  - Proxy

- 행위 패턴

  - Chain of Responsibility
  - Command
  - Interpreter
  - Iterator
  - Mediator
  - Memento
  - Observer
  - State
  - Strategy
  - Template Method
  - Visitor



---


### 기본 예제 코드 - 미로 맵 생성 

> 기본 미로 맵 생성 클래스

1. MapSite : 맵 각 요소에 대한 정보를 가지고 있는 프로토콜 
2. Room : 맵 요소 중 방 클래스, MapSite 를 채택한다. 연결된 네 공간에 대한 정보를 가지고 있다.
3. Wall : 맵 요소 중 벽 클래스, MapSite 를 채택한다. 이동할 수 없는 공간이다.
4. Door: 맵 요소 중 문 클래스, MapSite 를 채택한다. 연결된 두 방에 대한 정보를 가지고 있다.

5. Maze : 방에 대한 정보를 가지고 있는 클래스
6. MazeGame : 사용자가 접근하는 클래스. 



 

> 기본 미로 맵의 createGame 메소드

```swift
public class MazeGame {
  
  // 방 두 개 짜리 맵을 생성
  private func createGame() -> Maze {
    let maze = Maze()
    let room1 = Room(roomNumber: 1)
    let room2 = Room(roomNumber: 2)
    let door = Door(room1: room1, room2: room2)
    
    maze.addRoom(room: room1)
    maze.addRoom(room: room2)
    
    room1.setSide(direction: .east, site: door)
    room2.setSide(direction: .west, site: door)
    
    return maze
  }
}
```

- 문제점 : 방, 문, 벽에 대해 각각의 생성자를 이용해 만들어 주도록 하드코딩 되어있음 (객체 생성을 유연하게 하지 못함)

  



---

### 0. 객체 생성 패턴 vs 클래스 생성 패턴

- 객체 생성 패턴
  - 인스턴스로 만들 클래스를 다양하게 만득ㄹ기 위한 용도
  - 상속을 사용
- 클래스 생성 패턴
  - 인스턴스화 작업을 다른 객체에게 위임



### 1. 추상 팩토리(Abstract Factory) 패턴

1. 개념
   - 상세화된 서브클래스를 정의하지 않고도 서로 관련성이 있거나 독립적인 여러 객체 종류을 생성하기 위한 인터페이스를 제공하는 생성 패턴
   - 생성자를 이용해 서브클래스를 각각 생성하지 않고 팩토리 객체를 이용해 내부에서 각각의 서브 클래스를 구현하도록 하는 방법
   - 비슷한 종류의 객체 중 하나를 선택해 구현해야 하는 경우에 사용됨
2. 장점
   - 상세 클래스를 생상 방법을 사용자와 분리 하고 인터페이스만 제공할 수 있다.
   - 종류가 다른 상세클래스를 쉽게 대체할 수 있다. (ex_ Door과 Room 객체를 생성할 때에는 Factory의 함수로 접근하여 바로 생성할 수 있다.)

3. 구조
   - AbstractFactory : 객체를 생성하는 인터페이스를 제공

     ```swift
     // Abstract Factory
     class MazeFactory {
       func makeMaze() -> Maze {
         return Maze()
       }
       func makeRoom(num: Int) -> Room {
         return Room(roomNumber: num)
       }
       func makeWall() -> Wall {
         return Wall()
       }
       func makeDoor(room1: Room, room2: Room) -> Door {
         return Door(room1: room1, room2: room2)
       }
     }
     ```

   - ConcreteFactory : AbstractFactory를 상속하여 상세 객체를 생성하는 연산 수행

     ```swift
     // Concrete Factory
     class BoombedMazeFactory: MazeFactory {
       override func makeWall() -> Wall {
         return BoombedWall()
       }
       
       override func makeRoom(num: Int) -> Room {
         return RoomWithBoomb(roomNumber: num)
       }
     }
     ```

   - AbstractProduct : 각 Product 종류별로 필요한 연산들에 대한 인터페이스 제공 (종류마다 하나씩의 Abstract Product 필요)

     ```swift
     // Abstract Product
     public class Wall: MapSite {
       func enter() {
         print("벽 입니다. 들어갈 수 없습니다.")
       }
     }
     ```

   - ConcreteProduct : 구체적으로 팩토리가 생성할 객체 정의, AbstractProduct를 채택하여 인터페이스를 구현하는 클래스

     ```swift
     // Concrete Product
     class BoombedWall: Wall {
       override func enter() {
         print("폭탄이 터졌습니다. 사망하였습니다.")
       }
     }
     ```

   - Client : AbstractFactory와 AbstractProduct 에 정의된 연산만을 이용하여 사용

     ```swift
     /// 추상팩토리 패턴을 이용한 미로 게임 생성
     class AF_MazeGame {
     
       // 방 두 개 짜리 맵을 생성
       func createGame(factory: MazeFactory) -> Maze {
         let maze = factory.makeMaze()
         let r1 = factory.makeRoom(num: 1)
         let r2 = factory.makeRoom(num: 2)
         let door = factory.makeDoor(room1: r1, room2: r2)
         
         maze.addRoom(room: r1)
         maze.addRoom(room: r2)
         
         r1.setSide(direction: .east, site: door)
         r2.setSide(direction: .west, site: door)
         
         return maze
       }
     }
     ```

     ```swift
     // 폭탄 미로 게임 생성
     let factory = BoombedMazeFactory()
     let gameManager = AF_MazeGame()
     maze = gameManager.createGame(factory: factory)
     ```

     - 실제로 사용자가 미로게임을 생성할 때에는 아래의 소스코드만 작성하면 된다.
     - 구현할 Product를 생성하는 Factory 생성 후 팩토리를 파라미터로 넘겨 그에 맞는 Product를 생성한다.





### 2. 빌더(Builder) 패턴

1. 개념

   - 복잡한 객체를 생성하는 방법과 표현하는 방법을 정의하는 클래스를 별도로 분리하여, 서로 다른 표현이라도 이를 생성할 수 있는 동일한 절차를 제공하는 패턴
     - 복잡한 객체란 다양한 구성요소를 갖는 객체를 의미한다.
       예를 들어 House 라는 객체를 생성할 때 집 객체를 구성하는 구성요소로는 지붕, 창고, 베란다, 방, 부엌.. 등 여러가지가 있다. '성' 을 생성할 때에 지붕은 돌로 되어야겠지만, 아파트는 콘크리트, 통나무집은 나무를 이용할 것이다. 그렇다고 House라는 객체를 상속받는 각각의 클래스를 두게 되면, `let castle = House(windows: 4, doors: 3, rooms: 2, bethroom: 1, roop: "나무", balcony: 0....)` 
       위와 같이 생성자 파라미터가 많아지는 아주 깨끗하지 못한 코드를 사용해야만 한다.
   - 복잡한 구성요소를 차례차례 생성하는 패턴

2. 참여자

   - Director

     - Builder 인터페이스를 사용하여 빌더에게 각 구성요소를 생성할 것을 요청한다.

     - 빌더의 구성요소 생성 단계를 호출한다.

       ```swift
       class MazeCreator {
         func createGame(builder: MazeBuilder) -> Maze {
           builder.buildMaze() // 각 Builder에서 구성요소를 만드는 함수를 호출한다.
           builder.buildRoom()
           builder.buildWall()
           
           return builder.getMaze()
         }
       }
       ```

   - Builder (Abstract Builder)

     - 객체의 각 구성요소를 생성하기 위한 추상 인터페이스를 제공한다.

       ```swift
       protocol MazeBuilder {
         var currentMaze: Maze? { get set }
         
         func buildMaze()
         func buildRoom()
         func buildWall()
         
         func getMaze() -> Maze
       }
       ```
       
       - 설명에 의하면 MazeBuilder 는 세부 구현방법을 정의하지 않은 추상클래스이기 때문에 `class` 가 아닌 `protocol` 을 사용하였다.

   - Concrete Builder

     - Builder 클래스에 정의된 인터페이스를 구현하는 상세 클래스

     - 각 객체 타입에 맞는 Concrete Builder 를 생성해 사용한다.
   
       ```swift
       final class BoombedMazeBuilder: MazeBuilder {
         var currentMaze: Maze?
         
         func buildMaze() {
           currentMaze = Maze()
         }
         
         func buildRoom() {
           currentMaze?.addRoom(room: BoombedRoom(roomNumber: 1))
           currentMaze?.addRoom(room: BoombedRoom(roomNumber: 2))
         }
         
         func buildWall() {
           guard let maze = currentMaze else { return }
           
           if maze.rooms.count > 0 {
             let targetRoom = maze.rooms.first!
             targetRoom.setSide(direction: .east, site: BoombedWall())
           }
         }
         
         func getMaze() -> Maze {
           return currentMaze!
         }
       }
       ```
   
   - Product 
   
     - 생성할 객체
   
     - 개념에서 설명했듯 구성요소가 많은 복잡한 객체가 주로 사용된다.
   
       ```swift
       class Maze {
         .... 
       }
       ```
   
   - Client
   
     - Client는 Dicrector와 ConcreteBuilder 객체를 선언하여 원하는 Product를 생성한다.
   
     - 이때 클라이언트는 객체 구성요소를 어떤 방법으로 생성하는지 알지 못한다. (은닉화되어있기 때문)
   
       ```swift
       // 마법 미로 게임 생성
       let builder = EnchantedMazeBuilder() 					// Concrete Builder
       let director = MazeCreator() 									// Director
       maze = director.createGame(builder: builder) 	// 만들고자 하는 Product
       ```



3. 특징
   - **장점1**. 사용자는 Builder를 통해서 제품 생성에 대한 코드만 작성하면 되며, 구체적은 내용은 Builder 내에서 처리되기 때문에 유지보수가 용이하다.
   - **장점2**. 복잡한 객체의 생성 절차를 단계별로 나눌 수 있다.
     - Director는 Builder의 각각 구성요소를 생성하는 함수를 호출하기 때문에 구성요소 생성 절차를 정의하고 모듈화할 수 있다.



4. 추상팩토리 패턴 vs 빌더 패턴

   | 추상팩토리 패턴                              | 빌더 패턴                                            |
   | -------------------------------------------- | :--------------------------------------------------- |
   | 유사한 객체 종류가 존재할 때 사용(ex. UIKit) | 각 구성요소의 생성 단계에 초점을 맞춤                |
   | 객체 생성 즉시 반환                          | 각 단계별 구성요소 생성 후 마지막 단계에서 객체 반환 |

   - 둘 모두 객체 생성 패턴





### 3. 팩토리 메서드(Factory Method) 패턴

1. 개념
   - 객체를 생성하기 위해 인터페이스를 정의하지만, 어떤 클래스의 인스턴스를 생성할지에 대한 결정은 <u>서브클래스</u>가 내리도록 하는 패턴
   - 객체의 실제 생성을 서브클래스에게 위임하는 '클래스 생성 패턴'
   - 어떤 클래스의 인스턴스를 구현할지는 생성자의 매개변수를 이용하여 판단한다.
2. 참여자
   - Creator
     - ConcreteProduct 객체를 반환하는 <u>팩토리 메서드</u>를 선언
     - ConcreteCreator 메서드를 호출하여 그에 맞는 인스턴스를 반환한다.
   - ConcreteCreator
     - Creator 에서 선언한 메서드를 <u>재정의</u>하여 ConcreteProduct객체 반환
     - 타입에 맞는 인스턴스를 실제로 생성하여 반환한다.
   - Product
     - 생성하고자 하는 인스턴스를 만들기 위한 추상클래스
   - ConcreteProduct
     - Product의 서브클래스. Product에서 선언한 인터페이스를 실제로 구현
3. 구현 방법
   - Creator를 생성하는 방법에는 두 가지가 있다.
     1. Creator 를 추상클래스로 사용하는 방법
        - 실제로 구현을 담당하는 상세클래스가 반드시 있어야 하므로 유연하지 못함 (자주 사용하지 않음)
     2. Creator 를 구체클래스로 사용하고, 이를 상속한 서브클래스에서 재정의하는 경우
        - 서브클래스가 필요 없는 경우에는 Creator 만으로 객체를 생성하는 방법으로 유연한 대처 가능
   - 팩토리 메서드를 매개변수화 하여 사용할 수 있다.
     - 팩토리 메서드가 매개변수를 받아 어떤 객체를 생성할지 결정하는 방법
     - Creator 에서 매개변수에 따라 객체를 반환하도록 하고, 서브클래스에서는 이를 재정의할 경우 새로운 타입을 추가하거나 기존 타입을 다른 객체로 치환하여 반환하는 등 제품을 쉽게 확장하거나 변경할 수 있다.





.. 라고 했는데 검색해본 걸 정리하면

1. 팩토리 메서드 패턴

   - 객체를 생성하는 공장인 팩토리 객체를 두고, 타입에 따라 각각 다른 객체를 반환하도록 한다.

     ```swift
     // AS-IS
      func createCompWithoutFactory() {
     	let comp1 = UIButton()
     	let comp2 = UISwitch()
     	let comp3 = UIDatePicker()
        
     	comp1.isEnabled = true
     	comp2.isEnabled = false
     	comp3.isEnabled = true
     }
       
     // 팩토리 메서드 패턴
     func createCompWithFactory() {
     	let factory = NavigationComponentFactory()
     	let cmp1 = factory.createComponent(type: .uiButton, isEnabled: true)
     	let cmp2 = factory.createComponent(type: .uiSwitch, isEnabled: false)
     	let cmp3 = factory.createComponent(type: .uiDatePicker, isEnabled: true)
     }
     ```

     - 비슷한 객체를 생성할 때 생성자를 이용해 각각 만들어주는 것이 아니라 팩토리라는 객체 안에서 각 타입에 맞게 생성할 수 있도록 하는 것
     - 생성자가 변경될 때에 팩토리 한 곳에서만 변경해주면 된다.
     - 객체가 어떻게 생성되는지 사용자는 몰라도 된다.
   
2. 추상 팩토리 패턴

   - 팩토리 메서드 패턴을 한 단계 더 추상화한 패턴

   - 비슷한 객체가 있는 경우에는 Factory를 추상화하여 서브클래스에서 각각의 타입에 맞는 객체들을 생성하는 방법

     ```swift
     enum ComponentType {
       case uiButton
       case uiSwitch
     }
     
     // MARK:- Abstract Factory
     protocol ComponentFactory {
       func createComponent(type: ComponentType, isEnabled: Bool) -> UIControl
     }
     
     // MARK:- Concrete Factory
     final class LightThemeFactory: ComponentFactory {
       func createComponent(type: ComponentType, isEnabled: Bool) -> UIControl {
         switch type {
         case .uiButton:
           let button = LightButton()
           button.isEnabled = isEnabled
           return button
         case .uiSwitch:
           let switchh = LightSwitch()
           switchh.isEnabled = isEnabled
           return switchh
         }
       }
     }
     
     final class DarkThemeFactory: ComponentFactory {
       func createComponent(type: ComponentType, isEnabled: Bool) -> UIControl {
         switch type {
         case .uiButton:
           let button = DarkButton()
           button.isEnabled = isEnabled
           return button
         case .uiSwitch:
           let switchh = DarkSwitch()
           switchh.isEnabled = isEnabled
           return switchh
         }
       }
     }
     ```





### 4. 프로토타입 패턴





### 5. 싱글톤 패턴

```swift
class Singleton {  
  var singleton: Singleton?
  var shared: Singleton {
    if singleton == nil {
      singleton = Singleton()
    }
    return singleton!
  }
}
```

