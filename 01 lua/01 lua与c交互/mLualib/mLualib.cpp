
#include "stdafx.h"

//需要注意的是：函数参数里的lua_State是私有的，每一个函数都有自己的栈。当一个c / c++函数把返回值压入Lua栈以后，该栈会自动被清空。

static int averageFunc(lua_State *L)
{
	int n = lua_gettop(L);
	double sum = 0;
	int i;

	/* 循环求参数之和 */
	for (i = 1; i <= n; i++)
		sum += lua_tonumber(L, i);

	lua_pushnumber(L, sum / n);     //压入平均值  
	lua_pushnumber(L, sum);         //压入和  

	return 2;                       //返回两个结果  
}

static int sayHelloFunc(lua_State* L)
{
	printf("hello world!");
	return 0;
}

static const struct luaL_Reg myLib[] =
{
	{ "average", averageFunc },
	{ "sayHello", sayHelloFunc },
	{ NULL, NULL }       //数组中最后一对必须是{NULL, NULL}，用来表示结束      
};

int luaopen_mLualib(lua_State *L)
{
	luaL_register(L, "ss", myLib);
	return 1;       // 把myLib表压入了栈中，所以就需要返回1  
}