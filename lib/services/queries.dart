
// OTP
const qNumber = r'''
  query Number($num : String!){
  number(num: $num){
    number
    code
  }
}
''';

const mRequestCode = r'''
    mutation RequestCode($number:String!){
      requestCode(number: $number)
    }
''';

const mVerifyCode = r'''
    mutation VerifyCode($number:String!, $code:String!, $id:String!){
        verifyCode(number: $number, code: $code, id: $id)
    }    
''';


// USERS

const mCreateUser = r'''
  mutation CreateUser($name:String!, $email:String!, $id:String!){
    createUser(name: $name, email: $email, id: $id)  
  }
''';

const mUpdatePhone = r'''
  mutation UpdatePhone($id:String!, $phone:String!){
    updatePhone(id: $id, phone: $phone)  
  }
''';

const mUpdateProfile = r'''
  mutation UpdateProfile($id:String!, $name:String!, $email:String! ){
    updateProfile(id: $id, name: $name, email: $email)  
  }
''';

const mUpdateAvatar = r'''
  mutation UpdateAvatar($id:String!, $url:String!){
    updateAvatar(id: $id, url: $url)  
  }
''';

const qLoadProfile = r'''
  query LoadProfile($id : String!){
  loadProfile(id: $id){
    name
    phone
    email
    avatar
  }
}
''';

