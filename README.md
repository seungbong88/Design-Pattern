## [Inflearn] 코딩으로 학습하는 GoF의 디자인 패턴



1️⃣ [객체 생성 관련 디자인 패턴]



### 1. 싱글톤 패턴 - Singleton Pattern

인스턴스를 오직 한 개만 제공하여 글로벌하게 접근하는 클래스

- 사용 예 : 오직 하나의 정보만 존재해야 하는 것!

  - ex) 게임 세팅 값, 세션 값

- new 를 사용해서 생성하면 기존과 다른 새로운 객체가 생성되기 때문에 안됨

- 클래스 내에 private 생성자를 만들어 밖에서 인스턴스를 만들 수 없도록 한다.

- 내가 알던 싱글톤 사용 법

  ```swift
  class Settings {
      private static var instance: Settings?
  
      static var shared: Settings {
          if instance == nil {
              instance = Settings()
          }
          return instance!
      }
  }
  
  // 호출
  let setting1 = Settings.shared
  let setting2 = Settings.shared
  print(setting_1 === setting_2) // true
  ```

  또 아래처럼 사용하기도 한다.

  ```swift
  class Settings {
      private static var instance = Settings()
  
      static var shared: Settings {
          return instance
      }
      
      private init() {}
  }
  ```

  - `===` 은 동일한 참조값을 가지는지를 비교하는 방법

- 그런데 이렇게 되면 Setting 클래스 밖에서 아래와 같이 생성할 수 가 있다.

  ```swift
  let setting3 = Settings()
  ```

  - 이것을 방지하기 위해 클래스 내에 private 생성자를 선언해주면 밖에서 생성할 수 없게 된다.

    ```swift
    class Settings {
          private init() { } // 빈 private 생성자 선언
    }
    ```

    

- 그러나 위 방법은 멀티스레드 환경에서는 이 방법이 안전하지 않을 수 있다. (thread safe 하지 않음)

  - 이유 : 하나의 스레드가 `if instance == nil` 을 통과하고, 다음 줄의 인스턴스 생성 코드를 실행하기 전에 다른 스레드가 `if instance == nil` 을 통과한 경우, 다른 참조값을 가지는 객체 두 개가 생성될 수 있음!

  - 해결 방법

    1. [java 기준] 하나의 스레드만 들어올 수 있도록 하는 `synchronized` 키워드 사용하기

       - 단점 : 하나의 동기화를 위해 하나의 스레드가 들어오면 lock을 걸고, 작업을 마치면 lock을 해제하는 과정에서 성능이 저하될 수 있음

       - Objective-C 에는 `@synchronized` 키워드가 있지만, swift 에는 해당 키워드가 존재하지 않기 때문에 아래와 같이 직접 lock 해주는 방법을 이용할 수 있다.

         ```swift
         class Settings3 {
             
             static var instance: Settings3?
             
             static var getInstance: Settings3 {
                 sync(lock: self) {
                     if instance == nil {
                         instance = Settings3()
                     }
                 }
                 return instance!
             }
             
             private init() { }
         
             static func sync(lock: Any, closure: ()->Void) {
                 objc_sync_enter(lock)
                 closure()
                 objc_sync_exit(lock)
             }
         }
         ```

         

    2. 이른 초기화(eager initialization) 사용하기

       ```swift
       // 2. Eager Initialization
       class Settings2 {
           
           static var instance = Settings2()
           
           static var getInstacne: Settings2 {
               return instance
           }
           
           private init() { }
       }
       ```

       - 클래스가 생성되는 시점에 static 객체를 미리 만듦으로서 중복으로 생성되는 여지 자체를 없애는 방법
       - 단점 : 인스턴스를 만드는데 비용이 많이 드는 경우에 비효율이 초래될 수 있음

    3. [java 기준] Double Chekced Locking 사용하기

       ```java
       public static Settings getInstance() {
         if (instance == null) {
           synchronized (Settings.class) { // 
             if (instance == null) {
               instance = new Settings();
             }
           }
           return instance
         }
       }
       ```

       - 1번 방법이 객체 호출 시 마다 동기화에 걸리는 비용을 줄이기 위해 위와 같이 객체가 null인 경우에만 클래스를 lock 하여 사용할 수 있다.
       - 근데 synchronized 안에서는 null체크를 추가로 안해도될 것 같은데 왜 하는지 궁금하다
       - 장점 : 인스턴스가 필요할 때 생성할 수 있다.

    4. static inner 클래스 사용하기

       - 객체가 필요할때 생성하는 lazy 로딩도 가능하고, thread safty 한 방법

         ```swift
         // 5. Static Inner Class
         class Settings5 {
             
             private class SettingsHolder {
                 static var instance = Settings5()
             }
             
             static var getInstace: Settings5 {
                 return SettingsHolder.instance
             }
             
             private init() { }
         }
         ```

         

- 즉, 비용이 많이 들지 않은 경우에는 이른 초기화방법을 사용하는 것이 가장 깔끔한 방법인 것 같다. 객체 초기 생성에 비용이 많이 드는 경우에는 Static Inner Class 를 사용하면 좋을 것 같다.



### 2. 팩토리 메소드 패턴 - Factory Method Pattern

구체적으로 어떤 인스턴스를 만들지를 서브클래스에서 정하는 것



### 3. 빌더 패턴 - Builder Pattern



### 4. 프로토타입 패턴 - Prototype Pattern



---

[2️⃣ 구조관련 디자인패턴]



### 1. 어댑터 패턴 - Adapter Pattern

1. 개념

   - 기본 코드를 클라이언트가 사용하는 인터페이스의 구현체로 바꿔주는 패턴

     - 상이한 인터페이스를 가지는 객체를 연결할 수 있도록 하는 어댑터 객체를 만드는 방법
       (각각 다른 인터페이스를 가지는 A, B 객체를 이어주는 C 어댑터 객체를 사용하는 방법)

     - 패키징 되어있는 라이브러리처럼 수정이 불가능한 경우에 별도의 어댑터 객체를 생성하여 수정할 수 있다.

2. 장점

   1. 기존 코드 (상이한 다른 인터페이스 객체)를 변경하지 않고 재사용할 수 있다.
      - 변화에는 닫혀있고, 확장에는 열려있다는 객체지향 원칙을 지킬 수 있음
   2. 기존 코드가 하던 일고, 새로운 인터페이스와 연결하는 클래스를 각각 분리하여 관리할 수 있다.
      - 단일 책임의 원칙을 지킬 수 있음



### 2. 브릿지 패턴 - Bridge Pattern

1. 개념

   - 추상적인 것(Abstract)과 구체적인 것(Concrete)을 분리하여 연결하는 패턴
   - 보통은 상속을 통해서 하나의 구조 안에서 추상적 개념을 상세화 하는데, 이렇게 되면 특징들이 늘어날수록 많은 종류의 상세클래스를 생성해야 한다.
   - 브릿지 패턴은 확장성에 용이하도록 하나의 구조가 아닌 독립적인 계층구조로 발전시키는 것

2. 예시

   - 스킨을 가지는 챔피언 객체

     - 스킨과 챔피언 종류가 여러개인 롤 캐릭터 챔피언을 생성한다고 할 때, 스킨이 생성될 때마다 해당 스킨에 해당하는 챔피언을 새로 생성해줘야 한다.

       ```swift
       - 좀비 카이사
       - 좀비 누누와윌럼프
       - 크리스마스 카이사
       - 크리스마스 누누와 윌럼프
       ```

     - 위와 같은 방법을 사용하면 스킨이 늘어나거나 챔피언 종류가 늘어날 때마다 추가해줘야하는 서브 클래스가 많아진다.

       (케인 캐릭터가 추가된다고 하면 크리스마스 케인, 좀비 케인을 추가해줘야 하며, 하와이 스킨이 추가된다고 하면 그에 해당하는 챔피언들을 추가해줘야 한다.)

     - 여기서 Skin 클래스를 Abstract 클래스로 분리하여 Champion 클래스에서 참조하도록 하여 구현이 가능하다.

   - Shpae 클래스

     - Shpae 하위클래스 Circle, Square 가 있을 때 Color 를 갖는 Shpae 클래스를 만드는 경우

       (BlueCircle, BlueSqare, PinkCircle, PinkSqare 등 많은 서브클래스를 생성해야 함)

     - Color 클래스와 Shpae 클래스를 각각 나누어 추상화를 하고, Shpae 객체가 Color 객체를 참조하게끔 함하여 브릿지 역할을 할 수 있다.

3. 역할

   <img src="./images/BridgePattern.png" alt="CompositePattern" style="zoom:40%;" />

   - **Abstraction**(Champion) : 최상위 클래스. 추상 개념에 대한 인터페이스를 제공하고, 객체 구현자(implementor) 에 대한 참조자를 관리한다.
   - **RefinedAbstraction**(Skin) : 추상적 개념에 정의된 인터페이스를 *확장*하는 역할을 한다.
   - **Implementor**(DefaultChampion) : 구현 클래스에 대한 인터페이스를 제공한다. 실질적인 구현을 제공한 서브클래스들에게 공통 연산에 대한 메서드를 제공한다.
   - **ConcreteImplementor**(ZombieNoonoo) : Implementor 인터페이스를 구현해 실질적인 내용을 담은 클래스.

   Abstraction 과 Implementor 만 있었던 관계에서 RefiendAbstraction을 추가하여 확장에 용이하도록 한 것이고, 인터페이스의 공통된 영역만 구현한 것이 Implementor, 상세화한 것이 CompleteImplementor 로 보면 되는 듯 하다.

3. 장점

   - 추상적인 코드(abstract)를 구체적인 코드(concrete) 변경없이도 독립적으로 확장할 수 있다.

     즉, 하나의 클래스에서 추상클래스와 구체클래스를 구분하여, 확장에는 열려있고 변화에는 닫혀있도록 하는 객체지향 원칙을 지킬 수 있음

참고 : https://icksw.tistory.com/



### 3. 컴포짓(복합체) 패턴 - Composite Pattern

1. 개념

   - 트리구조에서 주로 쓰이며, 사용자 입장에서 구조에 상관없이 내부에 있는 객체에 접근할 수 있도록 하는 방법
   - 사용자(Client) 입장에서 전체나 부분을 구분하지 않고 모두 동일한 컴포넌트로 인식할 수 있는 계층구조를 만든다. (Part-Whole Hierachy)

2. 역할

   <img src="./images/CompositePattern.png" alt="CompositePattern" style="zoom:30%;" />

   - **Component** : 집합 관계에 정의될 모든 객체에 대한 인터페이를 정의한다. 실제 구현할 객체에서 공통적으로 사용할 공통 요소, 행동을 정의한다. 필요하다면 인터페이스를 구현한다.
   - **Leaf** : 서브클래스가 없는 최하위 클래스. 객체의 요소 및 행동을 구현한다.
   - **Composite** : 서브클래스가 있는 클래스. 객체의 요소 및 행동을 구현한다.
   - **Client** : Component 인터페이스를 통해 복합 구조 내의 객체들에 접근한다.

3. 구현

   예시 : 아이템과 아이템을 보관하는 가방 객체가 있고, 아이템의 가격과 가방에 들어있는 모든 아이템의 가격을 가져오는 인터페이스를 만든다.

   - AS-IS 

     ```swift
     class CompositeApp {
         func start() {
             let bluePortion = Item(name: "파란물약", price: 60)
             let infinityGauntlet = Item(name: "인피니티 건틀릿", price: 200)
             
             let bag = Bag()
             bag.addItem(bluePortion)
             bag.addItem(infinityGauntlet)
             
             printPrice(item: bluePortion)
             printPrice(item: infinityGauntlet)
             printPrice(bag: bag)
         }
       
       	func printPrice(item: Item) {
             print(item.price)
         }
         
         func printPrice(bag: Bag) {
             print(bag.items.reduce(0, { return $0 + $1.price }))
         }
     }
     ```

     - 객체지향 측면에서 사용자가 가방의 모든 아이템을 조회해서 값을 얻어오는 것까지 접근할 필요가 없고, 종류에 상관없이 가격만 가져오면 되기 때문에 수정이 필요하다.

   - TO-BE

     ```swift
     // 1. Component
     protocol Component {
         func getPrice() -> Int
     }
     ```

     - 공통 인터페이스인 Component 를 추가해준다.

     ```swift
     // 2. Composite
     class Bag: Component {
         private var items: [Component] = []
     
         func getPrice() -> Int {
             return items.reduce(0, { return $0 + $1.getPrice() })
         }
     }
     ```

     - 하위 클래스인 Bag을 구성요소로 가지는 복합체인 Bag을 구현해준다.
     - 이때 아이템은 Item 이 아닌 Component 객체로 구현해준다. 서브클래스를 순회하여 가격을 가져오면 되므로 공통인터페이스인 getPrice를 이용해 가격을 가져오는 getPrice 함수를 구현한다.

     ```swift
     
     // 3. Leaf
     class Item: Component {
         var name: String
         private var price: Int
         
         init(name: String, price: Int) {
             self.name = name
             self.price = price
         }
         
         func getPrice() -> Int {
             return self.price
         }
     }
     ```

     - Leaf 에서는 위와 같이 공통 메서드인 getPrice()  를 구현해준다.

     ```swift
     // 4. Client
     class CompositeApp {
         func start() {
             let bluePortion = Item(name: "파란물약", price: 60)
             let infinityGauntlet = Item(name: "인피니티 건틀릿", price: 200)
             
             let bag = Bag()
             bag.addItem(bluePortion)
             bag.addItem(infinityGauntlet)
             
             printPrice(component: bluePortion)
             printPrice(component: infinityGauntlet)
             printPrice(component: bag)
         }
       
         // 추상인터페이스인 Component를 파라미터로 받는다.
         func printPrice(component: Component) {
             print(component.getPrice())
         }
     }
     ```

     - 사용자는 트리구조에 대한 추가적인 정보를 알 필요없이 공통 인터페이스인 getPrice() 를 이용해 값을 얻어온다.

4. 장단점

   - 장점
     - 복잡한 트리구조를 편하게 사용할 수 있다.
     - 다형성과 재귀를 활용할 수 있다.
     - 클라이언트 코드를 변경하지 않고 새로운 앨리먼트 타입을 추가할 수 있다.
       - 새로운 타입의 Leaf, Composite이 추가되더라도 클라이언트 코드(`getPrice()`)는 바뀌지 않는다.
       - getPrice를 가지는 새로운 객체가 추가되더라도 기존 코드를 수정할 필요 없이 확장이 가능하다 (Open/Closed Principle)
   - 단점
     - 공통 인터페이스를 정의하여 트리를 만들어야 하므로 지나치게 일반화해야 하는 경우도 생길 수 있다.
       - 추상화된 타입이 아닌 구체 타입에 접근해야 하는 경우에 타입을 체크하는 수고로움이 있는 경우에는 컴포짓패턴을 사용하는 것이 맞는지 한 번 더 고려해봐야 한다.

   

### 4. 데코레이터 패턴



### 5. 퍼사드 패턴



### 6. 플라이웨이트 패턴



### 7. 프록시 패턴



---

[3️⃣ 행동 관련 디자인 패턴]



### 1. 책임 연쇄 패턴

### 2. 커맨드 패턴

### 3. 인터프리터 패턴

### 4. 이터레이터 패턴

### 5. 중재자 패턴

### 6. 메멘토 패턴

### 7. 옵저버 패턴

### 8. 상태 패턴

### 9. 전략 패턴

### 10. 템플릿 메소드 패턴

### 11. 비지터 패턴

