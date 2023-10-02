// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract mapping3{
    
    //TR
    //Mapping, Solidity'de bir değeri başka bir değerle ilişkilendirmek için kullanılan
    // bir veri yapısıdır. Temelde bir anahtar-değer çifti koleksiyonudur 
    //ve bir anahtarı (key) kullanarak buna karşılık gelen bir değeri (value) bulmanızı sağlar.
    //once mapping yapimizi olusturalim.
    
    //ENG
    //Mapping is a data structure used in Solidity to associate one value with another value.
    //It is basically a collection of key-value pairs 
    //and allows you to use a key to find a corresponding value.
    //at the begining, lets build our mapping structure
    
    mapping(address => string) private whatsdis;

    //TR
    //fonksiyon disaridan bir adres aliyor ben de mapping kullanarak bu adresi bir isimle iliskilendiriyorum
    //ancak fonksiyon parametresini kullanamadigim icin de ayri bir degisken belirledim.
    
    //ENG
    //The function receives an address from outside and I associate this address with
    // a name using mapping.
    //but since I can't use the function parameter, I set a separate variable.
    
    address userAddress;
    
    //TR
    //fonksiyon disaridan bir adres ve kullanici ismi alir
    //bunu cuzdan adresi ve kisinin ismi olarak dusunebiliriz.
    
    //ENG
    //function gets an address and user name
    //we can think of it as a wallet address and a person's name.
    
    function setname(address UserAddress, string memory _name) public{
        whatsdis[UserAddress] = _name;
        userAddress = UserAddress;
    }

    //TR
    //burada da getter fonksiyonumuz var.
    // mapping yapisi ile o adresin ilisigi olan ismi yazdiriyoruz.
    
    //ENG
    //Here we have the getter function.
    //With the mapping structure, we print the name associated with that address.
    
    function getname() public view returns(string memory){
        return (whatsdis[userAddress]);
    }
}