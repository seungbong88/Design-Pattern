## [Inflearn] 코딩으로 학습하는 GoF의 디자인 패턴



> 객체 생성 관련 패턴

### 1. 싱글톤 패턴

- 인스턴스를 오직 한 개만 제공하여 글로벌하게 접근하는 클래스

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



### 2. 팩토리 메서드 패턴

구체적으로 어떤 인스턴스를 만들지를 서브클래스가 정하는 방법



- 생성 방법  : *"확장에는 열려있고, 변경에는 닫혀있어야 한다."*

  - Abstract Creator / Concrete Creator
    - ShipFactory / BlackFactory, WhiteFactory

  - Abstract Product / Concrete Product
    - Ship / BlackShip, WhiteShip



### 3. 빌더 패턴

동일한 프로세스를 거쳐 다양한 구성의 인스턴스를 만드는 방법

- 복잡한 객체를 만드는 프로세스를 독립적으로 분리할 수 있음

- Builder / (optioanl) ConcreteBuilder

  Director

  Product

  Client

- Client는 Director를 통해 Builder 패턴을 이용하여 Product를 생성

- java의 사용 예
  - StringBuilder, StreamBuilder



### 프로토타입 패턴

