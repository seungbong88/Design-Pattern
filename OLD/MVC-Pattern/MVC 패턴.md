## MVC 패턴

*[20.08.25] 첫번재 커밋에서는 기본적인 Mode/ View/ Controller 구조만 나눠놓고, 아래 각각 통신하는 방법을 차례로 구현해볼 것이다.*

1. Model 

   - 데이터에 관한 로직 , 응용프로그램의 객체

     ex) 계산기 객체 --> 계산하는 로직

2. View

   - 사용자에게 보여지는 화면, 유저 인터렉션을 담당하는 부분
   - UI와 관련된 로직 (투명도 조절, 뷰 라운드 조절 등)
   - '어떻게' 보여줄 것인지만 담당하고, '무엇을' 보여줄지에 대해서는 관장하지 않음

3. Controller

   - View와 Model을 이어주는 역할
   - Model과 View 간의 동작 관리, 사용자 인터페이스가 사용자 입력에 반응하는 방법을 정의 (옵저버패턴)
     - 하나의 모델을 여러 뷰에서 가져다 쓰는 복합뷰의 경우 객체의 값이 변경되었을 때 모든 뷰가 알아서 이를 반영하는 방법

   - `Outlet` 을 통해 View와 연결되어있음 (Controller → View)

   

   

#### Model, View, Controller 간 통신 방법

#### 1-1. <u>Controller → View</u> 

- `IBOutlet` 을 통해 Controller는 View와 소통할 수 있다. (뷰를 변경해줄 필요가 있을 때 이 `IBOutlet` 을 이용한다.)

  ```swift
  @IBOutlet weak var topView: UIView!
  
  override func viewDidLoad() {
  	super.viewDidLoad()
  	topView.backgroundColor = .yellow // 연결된 IBOutlet으로 뷰에 변화를 준다. 
  
  ```

#### 1-2. <u>View → Controller</u>

- `IBAction` 을 통해 View 는 Controller에게 인터렉션을 전달할 수 있다.

  ```swift
  @IBAction func clickedConfirmButton(_ sender: Any) {
  	// IBAction에 연결된 이벤트가 발생할 때 동작한다.
  }
  ```

- `Delegate` 를 통해 View 는 Controller에게 인터렉션을 전달할 수 있다.

  ```swift
  extension ViewController: UIScrollViewDelegate {
      func scrollViewDidScroll(_ scrollView: UIScrollView) {
          // 사용자의 scroll이 끝났음을 알려준다.
      }
  }
  ```



#### 2-1. <u>Controller→  Model</u>

- Model의 `인스턴스`를 만들어 데이터를 변경하거나 내부 로직을 실행한다.

####2-2. <u>Model → Controller</u>

- `Notification` 을 이용해 Model은 자신의 데이터가 변하면 이를 Controller에게 알려준다. 

