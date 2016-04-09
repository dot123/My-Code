#include <iostream>  
#include <string.h>  
using namespace std;

extern "C"
{
#include "lua.h"  
#include "lauxlib.h"  
#include "lualib.h"  
}

//int   lua_gettop(lua_State *L);            //返回栈顶索引（即栈长度）  
//void  lua_settop(lua_State *L, int idx);   //                
//void  lua_pushvalue(lua_State *L, int idx);//将idx索引上的值的副本压入栈顶  
//void  lua_remove(lua_State *L, int idx);   //移除idx索引上的值  
//void  lua_insert(lua_State *L, int idx);   //弹出栈顶元素，并插入索引idx位置  
//void  lua_replace(lua_State *L, int idx);  //弹出栈顶元素，并替换索引idx位置的值  
//lua_settop将栈顶设置为一个指定的位置，即修改栈中元素的数量。如果值比原栈顶高，则高的部分nil补足，如果值比原栈低，则原栈高出的部分舍弃。
//所以可以用lua_settop(0)来清空栈。

void main1()
{
	//1.创建一个state  
	lua_State *L = luaL_newstate();

	//2.入栈操作  
	lua_pushstring(L, "I am so cool~");
	lua_pushnumber(L, 20);

	//3.取值操作  
	if (lua_isstring(L, 1)){             //判断是否可以转为string  
		cout << lua_tostring(L, 1) << endl;  //转为string并返回  
	}
	if (lua_isnumber(L, 2)){
		cout << lua_tonumber(L, 2) << endl;
	}

	//4.关闭state  
	lua_close(L);
	getchar();
	return;
}