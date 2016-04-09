#include <stdio.h>  

extern "C" {
#include "lua.h"  
#include "lualib.h"  
#include "lauxlib.h"  
}

//Lua��C / c++����ͨ�ŵ���Ҫ������һ���޴����ڵ�����ջ��ջ���ص����Ƚ������
//��lua�У�lua��ջ����һ��struct����ջ�����ķ�ʽ����������Ҳ�����Ǹ����������ǣ���������1��Զ��ʾջ�ף��������� - 1��Զ��ʾջ����
// ջ��
//4    -1
//3    -2
//2	   -3
//1	   -4
//ջ��

/* ָ��Lua��������ָ�� */
lua_State* L;
static int average(lua_State *L)
{
	/* �õ��������� */
	int n = lua_gettop(L);
	double sum = 0;
	int i;

	/* ѭ�������֮�� */
	for (i = 1; i <= n; i++)
	{
		/* ��� */
		sum += lua_tonumber(L, i);
	}
	/* ѹ��ƽ��ֵ */
	lua_pushnumber(L, sum / n);
	/* ѹ��� */
	lua_pushnumber(L, sum);
	/* ���ط���ֵ�ĸ��� */
	return 2;
}

//��c++��дһ��ģ�麯����������ע�ᵽlua�������У�Ȼ����c++ȥִ�����ǵ�lua�ļ���Ȼ����lua�е��øո�ע��ĺ�����

int main(int argc, char *argv[])
{
	/* ��ʼ��Lua */
	L = lua_open();

	/* ����Lua������ */
	luaL_openlibs(L);
	/* ע�ắ�� */
	lua_register(L, "average", average);
	/* ���нű� */
	luaL_dofile(L, "avg.lua");
	/* ���Lua */
	lua_close(L);

	/* ��ͣ */
	printf("Press enter to exit��");
	getchar();
	return 0;
}