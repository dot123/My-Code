#include <iostream>  
#include <string.h>  
using namespace std;

extern "C"
{
#include "lua.h"  
#include "lauxlib.h"  
#include "lualib.h"  
}

//int   lua_gettop(lua_State *L);            //����ջ����������ջ���ȣ�  
//void  lua_settop(lua_State *L, int idx);   //                
//void  lua_pushvalue(lua_State *L, int idx);//��idx�����ϵ�ֵ�ĸ���ѹ��ջ��  
//void  lua_remove(lua_State *L, int idx);   //�Ƴ�idx�����ϵ�ֵ  
//void  lua_insert(lua_State *L, int idx);   //����ջ��Ԫ�أ�����������idxλ��  
//void  lua_replace(lua_State *L, int idx);  //����ջ��Ԫ�أ����滻����idxλ�õ�ֵ  
//lua_settop��ջ������Ϊһ��ָ����λ�ã����޸�ջ��Ԫ�ص����������ֵ��ԭջ���ߣ���ߵĲ���nil���㣬���ֵ��ԭջ�ͣ���ԭջ�߳��Ĳ���������
//���Կ�����lua_settop(0)�����ջ��

void main1()
{
	//1.����һ��state  
	lua_State *L = luaL_newstate();

	//2.��ջ����  
	lua_pushstring(L, "I am so cool~");
	lua_pushnumber(L, 20);

	//3.ȡֵ����  
	if (lua_isstring(L, 1)){             //�ж��Ƿ����תΪstring  
		cout << lua_tostring(L, 1) << endl;  //תΪstring������  
	}
	if (lua_isnumber(L, 2)){
		cout << lua_tonumber(L, 2) << endl;
	}

	//4.�ر�state  
	lua_close(L);
	getchar();
	return;
}