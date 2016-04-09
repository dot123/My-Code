#include <stdio.h>  

extern "C" {
#include "lua.h"  
#include "lualib.h"  
#include "lauxlib.h"  
}

//Lua和C / c++语言通信的主要方法是一个无处不在的虚拟栈。栈的特点是先进后出。
//在lua中，lua堆栈就是一个struct，堆栈索引的方式可是是正数也可以是负数，区别是：正数索引1永远表示栈底，负数索引 - 1永远表示栈顶。
// 栈顶
//4    -1
//3    -2
//2	   -3
//1	   -4
//栈底

/* 指向Lua解释器的指针 */
lua_State* L;
static int average(lua_State *L)
{
	/* 得到参数个数 */
	int n = lua_gettop(L);
	double sum = 0;
	int i;

	/* 循环求参数之和 */
	for (i = 1; i <= n; i++)
	{
		/* 求和 */
		sum += lua_tonumber(L, i);
	}
	/* 压入平均值 */
	lua_pushnumber(L, sum / n);
	/* 压入和 */
	lua_pushnumber(L, sum);
	/* 返回返回值的个数 */
	return 2;
}

//在c++中写一个模块函数，将函数注册到lua解释器中，然后由c++去执行我们的lua文件，然后在lua中调用刚刚注册的函数。

int main(int argc, char *argv[])
{
	/* 初始化Lua */
	L = lua_open();

	/* 载入Lua基本库 */
	luaL_openlibs(L);
	/* 注册函数 */
	lua_register(L, "average", average);
	/* 运行脚本 */
	luaL_dofile(L, "avg.lua");
	/* 清除Lua */
	lua_close(L);

	/* 暂停 */
	printf("Press enter to exit…");
	getchar();
	return 0;
}