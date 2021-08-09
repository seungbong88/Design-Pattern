# Design-Pattern



### GoF 디자인 패턴

- 생성 패턴

  - 추상 팩토리
  - 팩토리 메서드
  - 싱글턴

- 구조 패턴

  - 컴퍼지트
  - 데커레이터

- 행위 패턴

  - 옵저버
  - 스테이트
  - 스트래티지
  - 템플릿 메서드
  - 커맨드  



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



### 1. 추상 팩토리 패턴

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



