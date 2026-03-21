#include<list>
#include<string>
#include<iostream>

using namespace std;

int 
main(void)
{
	list<string> list;
	list.push_back("Hello");
	list.push_back("World");
	cout << "List size = " << list.size() << endl;
	return 0;
}

