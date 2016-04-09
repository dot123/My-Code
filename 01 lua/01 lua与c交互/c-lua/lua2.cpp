#include <iostream>  
#include <string.h>  
using namespace std;

extern "C"
{
#include "lua.h"  
#include "lauxlib.h"  
#include "lualib.h"  
}

void printTop(lua_State *L)
{
	cout << "lua top is "<<lua_gettop(L) << endl;
}

void main2()
{
	//1.创建Lua状态  
	lua_State *L = luaL_newstate();
	if (L == NULL)
	{
		return;
	}

	//2.加载lua文件  
	int bRet = luaL_loadfile(L, "hello.lua");
	if (bRet)
	{
		cout << "load file error" << endl;
		return;
	}

	//3.运行lua文件  
	bRet = lua_pcall(L, 0, 0, 0);
	if (bRet)
	{
		cout << "pcall error" << endl;
		return;
	}
	printTop(L);
	//4.读取变量  
	lua_getglobal(L, "str");
	printTop(L);
	string str = lua_tostring(L, -1);
	cout << "str = " << str.c_str() << endl;        //str = I am so cool~  
	//5.读取table  
	lua_getglobal(L, "tbl");
	printTop(L);
	lua_getfield(L, -1, "name");
	printTop(L);
	str = lua_tostring(L, -1);
	cout << "tbl:name = " << str.c_str() << endl; //tbl:name = shun  
	// 将需要设置的值设置到栈中  
	lua_pushstring(L, "我是一个大帅锅～");
	printTop(L);
	// 将这个值设置到table中（此时tbl在栈的位置为2）  
	lua_setfield(L, 2, "name");
	printTop(L);
	// 将获得值压入栈中
	lua_getfield(L, 2, "name");
	printTop(L);
	cout << lua_tostring(L, -1) << endl;

	//6.读取函数  
	lua_getglobal(L, "add");        // 获取函数，压入栈中  
	lua_pushnumber(L, 10);          // 压入第一个参数  
	lua_pushnumber(L, 20);          // 压入第二个参数  
	int iRet = lua_pcall(L, 2, 1, 0);// 调用函数，调用完成以后，会将返回值压入栈中，2表示参数个数，1表示返回结果个数。  
	if (iRet)                       // 调用出错  
	{
		const char *pErrorMsg = lua_tostring(L, -1);
		cout << pErrorMsg << endl;
		lua_close(L);
		return;
	}
	if (lua_isnumber(L, -1))        //取值输出  
	{
		double fValue = lua_tonumber(L, -1);
		cout << "Result is " << fValue << endl;
	}

	// 创建一个新的table，并压入栈  
	lua_newtable(L);
	// 往table中设置值  
	lua_pushstring(L, "Give me a girl friend !"); //将值压入栈  
	lua_setfield(L, -2, "str"); //将值设置到table中，并将Give me a girl friend 出栈  
	lua_getfield(L, -1, "str");
	cout << lua_tostring(L, -1) << endl;

	//至此，栈中的情况是：  
	//=================== 栈顶 ===================    
	//  索引  类型      值  
	//   4   int：      30   
	//   3   string：   shun   
	//   2   table:     tbl  
	//   1   string:    I am so cool~  
	//=================== 栈底 ===================   

	//7.关闭state  

	//lua_getglobal(L, "var")会执行两步操作：1.将var放入栈中，2.由lua去寻找变量var的值，并将变量var的值返回栈顶（替换var）。
	//lua_getfield(L, -1, "name") 的作用等价于 lua_pushstring(L, "name") + lua_gettable(L, -2)

	//函数调用流程是先将函数入栈，参数入栈，然后用lua_pcall调用函数，此时栈顶为参数，栈底为函数，所以栈过程大致会是：参数出栈->保存参数->参数出栈->保存参数->函数出栈->调用函数->返回结果入栈。
	//类似的还有lua_setfield，设置一个表的值，肯定要先将值出栈，保存，再去找表的位置
	lua_close(L);
	getchar();
	return;
}