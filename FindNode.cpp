#include <Rcpp.h>
#include <string>
using namespace Rcpp;

// [[Rcpp::export]]
bool Exists(DataFrame parent, std::vector< std::string > strings) {
  // for (int i = 0; i < branchingFactor; i++){
  //   CharacterVector child = CharacterVector::create("1")
  // }
  //List child = "1";
  //CharacterVector child = parent["1"];
  bool node = false;
  //Rcout << (strings[0]);
  int subposition = 0;
  std::string str;
  CharacterVector df =parent[0];
  //Rcout << as<std::string>(df[7]);
  
  for (int i =1; i<df.size(); i++){
    std::string temp = as<std::string>(df[i]);
    int pos = temp.find('--');
    std::string str3 = temp.substr(pos+2);
    
    std::string::iterator end_pos = std::remove(str3.begin(),str3.end(), ' ');
    str3.erase(end_pos, str3.end());
    
    
    if(str3 == strings[0]){
      node = true;
    }
    //Rcout << strings[0];
    //Rcout <<'-'+strings[0]+'\n';
  }
  /*
  CharacterVector onames = parent.attr("names");
  
  CharacterVector ch = wrap(parent.attributeNames());
  for (int i =0; i<parent.size(); i++){
    if(onames[i] == strings[0]){
      node = true;
    }
    print(ch);
  }*/
  return node;
  // List out(parent.size());
  // CharacterVector onames = parent.attr("names");
  // CharacterVector names(parent.size());
  // for (int i = 0; i < parent.size(); i++){
  //   out[i] = parent[i];
  //   names[i] = onames[i];
  // }
  // out.attr("class") = parent.attr("class");
  // out.attr("row.names") = parent.attr("row.names") ;
  // out.attr("names") = names ;
  // return out;
}