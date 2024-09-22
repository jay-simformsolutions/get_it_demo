class StringConstants {
  static const getItDemo = 'get_it_demo';
  static const loginTitle = 'Login';
  static const signUpTitle = 'Sign up';
  static const nameHintText = 'Enter name';
  static const emailHintText = 'Enter email';
  static const uerNameHintText = 'Enter Username';
  static const passwordHintText = 'Enter Password';
  static const makePayment = 'Make Payment';
  static const accessPayment = 'Access Payment';
  static const generateBill = 'Generate bill';
  static const payBill = 'Pay bill';
  static const emptyString = '';
  static const emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const userNameError = 'Username should not be empty';
  static const passwordError = 'Password should not be empty';
  static const nameError = 'Name should not be empty';
  static const emailError = 'Email should not be empty';
  static const enterValidEmailError = 'Please enter valid email';
  static const objectIsNotRegister =
      'You can\'t access properties which is not registered in get_it scope';

  static String greetUser(String username) => 'Hi, Welcome $username';
  static const singletonDependenciesDemo = 'Singleton Dependencies Demo';
  static const placeHolderImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZzHDbVL49ogGcSz6il6oYJkaYXbQvVwr1tw&s';
  static const descriptionNotAvailable = "Description is not available";
  static const contentNotAvailable = "Content is not available";
  static const titleNotAvailable = "Title is not available";
  static const databaseServiceReadyToUse = 'Database is ready to use';
  static const sharedPrefReadyToUse = 'Shared Preference is ready to use';
  static const languageRefReadyToUse = 'Language Service is ready to use';
  static const articles = 'Articles';
  static const registerAsyncFactory = 'Register Async Factory';
  static const scopes = 'scopes';
  static const accessScopeVariable = 'Access Scope Variables';
  static const popularArticles = 'Popular Articles';

  /// Shared_Preference key strings
  static const kLoginUser = 'login_user';
  static const kLoginPass = 'login_pass';
  static const kReadCount = 'read_count';

  /// Get_It scope name and instance name
  static const paymentScope = 'payment_scope';
  static const repositoryInstanceName = 'repository';
}
