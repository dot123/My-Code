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
	//1.����Lua״̬  
	lua_State *L = luaL_newstate();
	if (L == NULL)
	{
		return;
	}

	//2.����lua�ļ�  
	int bRet = luaL_loadfile(L, "hello.lua");
	if (bRet)
	{
		cout << "load file error" << endl;
		return;
	}

	//3.����lua�ļ�  
	bRet = lua_pcall(L, 0, 0, 0);
	if (bRet)
	{
		cout << "pcall error" << endl;
		return;
	}
	printTop(L);
	//4.��ȡ����  
	lua_getglobal(L, "str");
	printTop(L);
	string str = lua_tostring(L, -1);
	cout << "str = " << str.c_str() << endl;        //str = I am so cool~  
	//5.��ȡtable  
	lua_getglobal(L, "tbl");
	printTop(L);
	lua_getfield(L, -1, "name");
	printTop(L);
	str = lua_tostring(L, -1);
	cout << "tbl:name = " << str.c_str() << endl; //tbl:name = shun  
	// ����Ҫ���õ�ֵ���õ�ջ��  
	lua_pushstring(L, "����һ����˧����");
	printTop(L);
	// �����ֵ���õ�table�У���ʱtbl��ջ��λ��Ϊ2��  
	lua_setfield(L, 2, "name");
	printTop(L);
	// �����ֵѹ��ջ��
	lua_getfield(L, 2, "name");
	printTop(L);
	cout << lua_tostring(L, -1) << endl;

	//6.��ȡ����  
	lua_getglobal(L, "add");        // ��ȡ������ѹ��ջ��  
	lua_pushnumber(L, 10);          // ѹ���һ������  
	lua_pushnumber(L, 20);          // ѹ��ڶ�������  
	int iRet = lua_pcall(L, 2, 1, 0);// ���ú�������������Ժ󣬻Ὣ����ֵѹ��ջ�У�2��ʾ����������1��ʾ���ؽ��������  
	if (iRet)                       // ���ó���  
	{
		const char *pErrorMsg = lua_tostring(L, -1);
		cout << pErrorMsg << endl;
		lua_close(L);
		return;
	}
	if (lua_isnumber(L, -1))        //ȡֵ���  
	{
		double fValue = lua_tonumber(L, -1);
		cout << "Result is " << fValue << endl;
	}

	// ����һ���µ�table����ѹ��ջ  
	lua_newtable(L);
	// ��table������ֵ  
	lua_pushstring(L, "Give me a girl friend !"); //��ֵѹ��ջ  
	lua_setfield(L, -2, "str"); //��ֵ���õ�table�У�����Give me a girl friend ��ջ  
	lua_getfield(L, -1, "str");
	cout << lua_tostring(L, -1) << endl;

	//���ˣ�ջ�е�����ǣ�  
	//=================== ջ�� ===================    
	//  ����  ����      ֵ  
	//   4   int��      30   
	//   3   string��   shun   
	//   2   table:     tbl  
	//   1   string:    I am so cool~  
	//=================== ջ�� ===================   

	//7.�ر�state  

	//lua_getglobal(L, "var")��ִ������������1.��var����ջ�У�2.��luaȥѰ�ұ���var��ֵ����������var��ֵ����ջ�����滻var����
	//lua_getfield(L, -1, "name") �����õȼ��� lua_pushstring(L, "name") + lua_gettable(L, -2)

	//���������������Ƚ�������ջ��������ջ��Ȼ����lua_pcall���ú�������ʱջ��Ϊ������ջ��Ϊ����������ջ���̴��»��ǣ�������ջ->�������->������ջ->�������->������ջ->���ú���->���ؽ����ջ��
	//���ƵĻ���lua_setfield������һ�����ֵ���϶�Ҫ�Ƚ�ֵ��ջ�����棬��ȥ�ұ��λ��
	lua_close(L);
	getchar();
	return;
}