class Person {
  String name;

  int age;

  Person(this.name, {this.age});

  String getString([String userName]) {
    return "name:$name+',age:'+$age";
  }
}


class UserData<T> {

  T getUserData(T t){
    return t;
  }

}
