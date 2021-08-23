# Design-Pattern



### GoF 디자인 패턴

- 생성 패턴

  - [Abstract Factory](#1.-추상-팩토리(abstract-factory)-패턴)
  - [Builder](#2. 빌더(Builder) 패턴)
  - Factory Method
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



### 0. 예제 프로젝트 - 미로 맵 생성 

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
     /// 추상팩토리 패턴을 이용한 미로 게임
     class AF_MazeGame {
       
       func startGame() {
         // 일반 미로 게임 생성
         let maze = createGame(factory: MazeFactory())
         
         // 폭탄 미로 게임 생성
         let boomedMaze = createGame(factory: BoombedMazeFactory())
       }
       
       // 방 두 개 짜리 맵을 생성
       private func createGame(factory: MazeFactory) -> Maze {
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
   
     - 이처럼 사용자는 factory를 생성하여 각각의 생성자를 이용해 초기화하지 않고 타입을 파라미터를 넘기는 방법으로 다른 객체를 생성할 수 있다.
     - 또한 상세 factory를 추가로 구현함으로써 다른 종류의 factory 를 생성해 비슷한 종류의 다른 객체를 간단하게 생성할 수 있다.





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
       class MazeGame {
         func createMae(builder: MazeBuilder) -> Maze {
           builder.buildMaze()	// 각 Builder에서 구성요소를 만드는 함수를 호출한다.
       		builder.buildRoom(num: Int)
       		builder.buildWall()
           
           return builder.getMaze()
         }
       }
       ```

   - Builder (Abstract Builder)

     - 객체의 각 구성요소를 생성하기 위한 추상 인터페이스를 제공한다.

       ```swift
       protocol MazeBuilder {
         func buildeMae()
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
       class BoombedMazeBuilder: MazeBuilder {
       	var currentMaze: Maze?
         
        	func buildeMae() {
       		currentMaze = BoombedMaze()
         }
         
         func buildRoom(num: Int) {
       		currentMaze.makeRoom(num: num)
           currentMaze.makeRoom(num: num)
         }
         
         func buildWall() {
           currentMaze.makeWall()
         } 
         
         func getMaze() -> Maze {
           return currentMaze
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
       var maze: Maze			// 만들고자 하는 Product
       var game: MazeGame 	// Director
       var boombedBuilder: BoombedBuilder // Concrete Builder
       
       game.createMaze(builder: boombedBuilder)
       maze = builder.getMaze()
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

   

