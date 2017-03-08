#include <iostream>

using std::string;
using std::cout;
using std::endl;

/* Fun, unrelated fact: the 'using' keyword can also be used to define aliases
 * For example:
 *
 * using Vec = vector<T, Alloc<T>>; // type-id is vector<T, Alloc<T>>
 * Vec<int> v; // Vec<int> is the same as vector<int, Alloc<int>>
 *
 * */

bool strenCodeCmp(string &a0, string &a1);

int main() {
    string arg0 = "AbZCz";
    string arg1 = "bcdef";

    cout << "arg0 = " << arg0 << endl
         << "arg1 = " << arg1 << endl
         << "Add 1 to ascii value of each char of arg0 (loop at z or Z) and compare to arg1:" << endl;

    if (strenCodeCmp(arg0, arg1)) {
        cout << "\t(" << arg0 << " == " << arg1 << ")" << " is true" << endl;
    } else {
        cout << "\t(" << arg0 << "==" << arg1 << ")" << " is false" << endl;
    }

    return EXIT_SUCCESS;
}

bool strenCodeCmp(string &a0, string &a1) {

    for (auto &&character : a0) {
        if (character != 'Z' && character != 'z') {
            character = (char) (character + 1);
        } else if (character == 'z') {
            character -= (character - 'a'); // if character == Z or character == z, then set character = A or a
        } else {
            character -= (character - 'A');
        }
    }

    return (a0 == a1);
}