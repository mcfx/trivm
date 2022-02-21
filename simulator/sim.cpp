#include<cmath>
#include<cstdio>
#include<cstring>
#include<sstream>
#include<iostream>
#include<algorithm>
#include<utility>
#include<functional>

typedef __uint128_t ulll;typedef __int128_t lll;
#define xx first
#define yy second
#define mp(a,b)std::make_pair(a,b)
#define pb push_back
#define I __attribute__((always_inline))inline
#define mset(a,b)memset(a,b,sizeof(a))
#define mcpy(a,b)memcpy(a,b,sizeof(a))
#define fo0(i,n)for(int i=0,i##end=n;i<i##end;i++)
#define fo1(i,n)for(int i=1,i##end=n;i<=i##end;i++)
#define fo(i,a,b)for(int i=a,i##end=b;i<=i##end;i++)
#define fd0(i,n)for(int i=(n)-1;~i;i--)
#define fd1(i,n)for(int i=n;i;i--)
#define fd(i,a,b)for(int i=a,i##end=b;i>=i##end;i--)
#define foe(i,x)for(__typeof((x).end())i=(x).begin();i!=(x).end();++i)
#define fre(i,x)for(__typeof((x).rend())i=(x).rbegin();i!=(x).rend();++i)
typedef unsigned int uint;typedef long long ll;typedef unsigned long long ull;typedef double lf;typedef long double llf;
typedef std::pair<int,int>pii;template<typename T>T max(T a,T b){return a>b?a:b;}template<typename T>T min(T a,T b){
return a<b?a:b;}template<typename T>T abs(T a){return a>0?a:-a;}template<typename T>T sqr(T x){return x*x;}template<
typename T>bool repr(T&a,T b){return a<b?a=b,1:0;}template<typename T>bool repl(T&a,T b){return a>b?a=b,1:0;}template<
typename T>T gcd(T a,T b){T t;if(a<b){while(a){t=a;a=b%a;b=t;}return b;}else{while(b){t=b;b=a%b;a=t;}return a;}}

typedef signed char trit;

std::pair<trit,trit> add(trit a,trit b)
{
	if(a==0)return mp(b,0);
	if(b==0)return mp(a,0);
	if(a==b)return mp(-a,a);
	return mp(0,0);
}

std::pair<trit,trit> add3(trit a,trit b,trit c)
{
	std::pair<trit,trit>s=add(a,b);
	if(c==0)return s;
	if(!s.yy)return add(s.xx,c);
	if(c!=s.xx)return mp(0,s.yy);
	return mp(s.yy,0);
}

char toc(trit x)
{
	if(x==0)return '0';
	if(x==1)return '1';
	return 'T';
}

template<int n>struct trinum
{
	trit s[n];
	trit&operator[](int x){return s[x];}
	const trit&operator[](int x)const{return s[x];}
	
	trinum&operator+=(const trinum&x)
	{
		trit carry=0;
		fo0(i,n)
		{
			auto t=add3(x[i],s[i],carry);
			s[i]=t.xx;
			carry=t.yy;
		}
		return *this;
	}
	
	trinum operator+(const trinum&x)const
	{
		trinum t=*this;return t+=x;
	}
	
	trinum operator-()const
	{
		trinum t;
		fo0(i,n)t[i]=-s[i];
		return t;
	}
	
	trinum&operator-=(const trinum&x)
	{
		return *this+=-x;
	}
	
	trinum operator-(const trinum&x)const
	{
		return *this+(-x);
	}
	
	trinum&operator<<=(int x)
	{
		repl(x,n);
		if(x<0)return *this >>= -x;
		fd0(i,n-x)s[i+x]=s[i];
		fo0(i,x)s[i]=0;
		return *this;
	}
	
	trinum operator<<(int x)const
	{
		trinum t=*this;return t<<=x;
	}
	
	trinum&operator>>=(int x)
	{
		repl(x,n);
		if(x<0)return *this <<= -x;
		fo0(i,n-x)s[i]=s[i+x];
		fo0(i,x)s[i+n-x]=0;
		return *this;
	}
	
	trinum operator>>(int x)const
	{
		trinum t=*this;return t>>=x;
	}
	
	trinum&operator*=(trit x)
	{
		if(x==0)fo0(i,n)s[i]=0;
		else if(x==-1)fo0(i,n)s[i]=-s[i];
		return *this;
	}
	
	trinum operator*(trit x)const
	{
		trinum t=*this;return t*=x;
	}
	
	trinum operator*(const trinum&x)const
	{
		trinum r;mset(r.s,0);
		fo0(i,n)r+=*this*x[i]<<i;
		return r;
	}
	
	trinum&operator*=(const trinum&x)
	{
		return *this=*this*x;
	}
	
	trinum abs()const
	{
		int p=n-1;
		while(p>=0&&!s[p])p--;
		if(p<0)return*this;
		if(s[p]==-1)return *this*trit(-1);
		return*this;
	}
	
	bool operator==(const trinum&x)const
	{
		fd0(i,n)if(s[i]!=x[i])return 0;
		return 1;
	}
	
	bool operator!=(const trinum&x)const
	{
		return !(*this==x);
	}
	
	bool operator<(const trinum&x)const
	{
		fd0(i,n)if(s[i]!=x[i])return s[i]<x[i];
		return 0;
	}
	
	bool operator>(const trinum&x)const
	{
		return x<*this;
	}
	
	bool operator<=(const trinum&x)const
	{
		return !(*this>x);
	}
	
	bool operator>=(const trinum&x)const
	{
		return !(*this<x);
	}
	
	static trinum fromint(ll x)
	{
		trinum r;
		fo0(i,n)
		{
			int u=(x%3+3)%3;
			if(u==2)u=-1;
			r[i]=u;
			x=(x-u)/3;
		}
		return r;
	}
	
	ll toint()const
	{
		ll r=0;
		fd0(i,n)r=r*3+s[i];
		return r;
	}
	
	template<int p,int m> trinum<m> extract()const
	{
		trinum<m>res;
		fo0(i,m)res[i]=s[p+i];
		return res;
	}
	template<int m> void set(int p,trinum<m>o)
	{
		fo0(i,m)s[p+i]=o[i];
	}
	template<int m> trinum<m> extend()const
	{
		trinum<m>res;
		fo0(i,min(n,m))res[i]=s[i];
		for(int i=n;i<m;i++)res[i]=0;
		return res;
	}
	
	static trinum frompack(ll x)
	{
		trinum r;
		fo0(i,n)
		{
			int u=x&3;
			if(u==3)u=-1;
			r[i]=u;
			x>>=2;
		}
		return r;
	}
	
	ll topack()const
	{
		ll r=0;
		fd0(i,n)r=r*4+(s[i]&3);
		return r;
	}
};

// a->b->c
template<trit a,trit b,trit c> trit binop_chain(trit x,trit y)
{
	if(x==c||y==c)return c;
	if(x==b||y==b)return b;
	return a;
}

trit binop_xor(trit x,trit y)
{
	return add(x,y).xx;
}

template<trit u> trit binop_xorg(trit x,trit y)
{
	if(x==0)return y;
	if(y==0)return x;
	if(x==y)return 0;
	return u;
}

constexpr auto binop_or=binop_chain<-1,0,1>;
constexpr auto binop_or1=binop_chain<0,-1,1>;
constexpr auto binop_orT=binop_chain<0,1,-1>;
constexpr auto binop_and=binop_chain<1,0,-1>;
constexpr auto binop_and1=binop_chain<1,-1,0>;
constexpr auto binop_andT=binop_chain<-1,1,0>;
constexpr auto binop_xor1=binop_xorg<1>;
constexpr auto binop_xorT=binop_xorg<-1>;

template<int n,int m> trinum<n> binop(const std::function<trit(trit,trit)> trit_func, trinum<n> x, trinum<m> y)
{
	fo0(i,m)x[i]=trit_func(x[i],y[i]);
	return x;
}

template<int n,int m,int m2> trinum<n> binop3(const std::function<trit(trit,trit)> trit_func, trinum<n> x, trinum<m> y, trinum<m2> z)
{
	return binop(trit_func,binop(trit_func,x,y),z);
}

typedef trinum<6> tryte;
typedef trinum<18> trint;
typedef unsigned short ptryte;

const int W=387420489;

ptryte mem[W];

tryte mem_read_tryte(trint addr)
{
	return tryte::frompack(mem[addr.toint()+W/2]);
}

void mem_write_tryte(trint addr,tryte value)
{
	mem[addr.toint()+W/2]=value.topack();
}

trint mem_read_trint(trint addr)
{
	trint x=trint::fromint(1);
	tryte a=mem_read_tryte(addr-x);
	tryte b=mem_read_tryte(addr);
	tryte c=mem_read_tryte(addr+x);
	x.set(0,a);
	x.set(6,b);
	x.set(12,c);
	return x;
}

void mem_write_trint(trint addr,trint value)
{
	trint x=trint::fromint(1);
	mem_write_tryte(addr-x,value.extract<0,6>());
	mem_write_tryte(addr,value.extract<6,6>());
	mem_write_tryte(addr+x,value.extract<12,6>());
}

const int MAX_FD=100;

struct wrap_file
{
	FILE*f;
	bool mode; // 1->trivm 0->direct
	void putc(tryte x)
	{
		ptryte u=x.topack();
		if(mode)fwrite(&u,1,2,f);
		else fputc(x.toint(),f);
	}
	tryte getc()
	{
		if(mode)
		{
			ptryte u;
			fread(&u,1,2,f);
			return tryte::frompack(u);
		}
		return tryte::fromint(fgetc(f));
	}
	void detect()
	{
		char s[4]={0};
		fread(s,1,4,f);
		if(s[0]=='T'&&s[1]=='R'&&s[2]=='V'&&s[3]=='M'){
			mode=1;
			return;
		}
		fseek(f,0,SEEK_SET);
	}
	void flush()
	{
		fflush(f);
	}
}fds[MAX_FD];

struct cpu
{
	trint reg[27],pc;
	void execute();
	std::string disasm();
	void print();
	trint reg_read(trinum<3> x)
	{
		if(x.toint()==0)return trint::fromint(0);
		return reg[x.toint()+13];
	}
	void reg_write(trinum<3> x,trint v)
	{
		reg[x.toint()+13]=v;
	}
	void reset()
	{
		fo0(i,27)reg[i]=trint::fromint(0);
		pc=trint::fromint(0);
	}
};

void cpu::execute()
{
	trint insn=mem_read_trint(pc), nextpc=pc+trint::fromint(3);
	trinum<3> opcode=insn.extract<0,3>();
	trinum<3> xrd=insn.extract<3,3>();
	trinum<3> xrs1=insn.extract<6,3>();
	trinum<3> funct3=insn.extract<9,3>();
	trinum<3> xrs2=insn.extract<12,3>();
	trinum<3> imm3=insn.extract<15,3>();
	trinum<6> imm6; imm6.set(0,imm3); imm6.set(3,xrs2);
	trinum<12> imm12; imm12.set(0,imm6); imm12.set(6,insn.extract<6,6>());
	trint rs1=reg_read(xrs1);
	trint rs2=reg_read(xrs2);
	#define rd(v) reg_write(xrd,v)
	switch(opcode.toint()){
		case 0:{ // 000
			switch(funct3.toint()){
				case 0: rd(rs1+rs2+imm3.extend<18>());break;
				case 1: rd(rs1-rs2+imm3.extend<18>());break;
				case 9: rd(binop3(binop_xor,rs1,rs2,imm3));break;
				case 10: rd(binop3(binop_xor1,rs1,rs2,imm3));break;
				case 8: rd(binop3(binop_xorT,rs1,rs2,imm3));break;
				case 12: rd(binop3(binop_or,rs1,rs2,imm3));break;
				case 13: rd(binop3(binop_or1,rs1,rs2,imm3));break;
				case 11: rd(binop3(binop_orT,rs1,rs2,imm3));break;
				case 6: rd(binop3(binop_and,rs1,rs2,imm3));break;
				case 7: rd(binop3(binop_and1,rs1,rs2,imm3));break;
				case 5: rd(binop3(binop_andT,rs1,rs2,imm3));break;
				case 3: rd(rs1<<(rs2+imm3.extend<18>()).toint());break;
				case 2: rd(rs1>>(rs2+imm3.extend<18>()).toint());break;
				case -3: rd(rs1==rs2?trint::fromint(1):trint::fromint(0));break;
				case -2: rd(rs1!=rs2?trint::fromint(1):trint::fromint(0));break;
				case -1: rd(rs1<rs2?trint::fromint(1):trint::fromint(0));break;
			}
			break;
		}
		case 1:{ // 001
			switch(funct3.toint()){
				case 0: rd(rs1+imm6.extend<18>());break;
				case 9: rd(binop(binop_xor,rs1,imm6.extend<18>()));break;
				case 10: rd(binop(binop_xor1,rs1,imm6.extend<18>()));break;
				case 8: rd(binop(binop_xorT,rs1,imm6.extend<18>()));break;
				case 12: rd(binop(binop_or,rs1,imm6.extend<18>()));break;
				case 13: rd(binop(binop_or1,rs1,imm6.extend<18>()));break;
				case 11: rd(binop(binop_orT,rs1,imm6.extend<18>()));break;
				case 6: rd(binop(binop_and,rs1,imm6.extend<18>()));break;
				case 7: rd(binop(binop_and1,rs1,imm6.extend<18>()));break;
				case 5: rd(binop(binop_andT,rs1,imm6.extend<18>()));break;
				case 3: rd(rs1<<(imm6.extend<18>()).toint());break;
				case 2: rd(rs1>>(imm6.extend<18>()).toint());break;
				case -3: rd(rs1==imm6.extend<18>()?trint::fromint(1):trint::fromint(0));break;
				case -2: rd(rs1!=imm6.extend<18>()?trint::fromint(1):trint::fromint(0));break;
				case -1: rd(rs1<imm6.extend<18>()?trint::fromint(1):trint::fromint(0));break;
			}
			break;
		}
		case -1:{ // 00T
			switch(funct3.toint()){
				case 0: rd(mem_read_tryte(rs1+imm6.extend<18>()).extend<18>());break;
				case 1: rd(mem_read_trint(rs1+imm6.extend<18>()));break;
				case 3: mem_write_tryte(rs1+imm6.extend<18>(),reg_read(xrd).extract<0,6>());break;
				case 4: mem_write_trint(rs1+imm6.extend<18>(),reg_read(xrd));break;
			}
			break;
		}
		case 3:{ // 010
			switch(funct3.toint()){
				case 0: if(reg_read(xrd)==rs1)nextpc=pc+(imm6.extend<18>()<<1);break;
				case 1: if(reg_read(xrd)!=rs1)nextpc=pc+(imm6.extend<18>()<<1);break;
				case -1: if(reg_read(xrd)<rs1)nextpc=pc+(imm6.extend<18>()<<1);break;
			}
			break;
		}
		case 4:{ // 011
			rd(nextpc);
			nextpc=pc+imm12.extend<18>();
			break;
		}
		case 2:{ // 01T
			trinum<9> tmp; tmp.set(0, imm6); tmp.set(6, funct3);
			rd(nextpc);
			nextpc=rs1+tmp.extend<18>();
			break;
		}
		case -3:{ // 0T0
			rd(imm12.extend<18>()<<6);
			break;
		}
		case -2:{ // 0T1
			rd(pc+(imm12.extend<18>()<<6));
			break;
		}
		case 9:{ // 100
			switch(reg_read(trinum<3>::fromint(3)).toint()){
				case 0:{ // read(fd, buf, count)
					ll fd=reg_read(trinum<3>::fromint(4)).toint();
					trint buf=reg_read(trinum<3>::fromint(5));
					trint count=reg_read(trinum<3>::fromint(6));
					ll countc=count.toint();
					if(fd>=0&&fd<MAX_FD&&fds[fd].f&&countc>=0){
						trint res=trint::fromint(0);
						fo0(i,countc){
							tryte tmp=fds[fd].getc();
							mem_write_tryte(buf,tmp);
							buf+=trint::fromint(1);
							res+=trint::fromint(1);
							if(tmp.toint()==10&&fds[fd].f==stdin)break;
						}
						reg_write(trinum<3>::fromint(3),res);
					}else{
						reg_write(trinum<3>::fromint(3),trint::fromint(-1));
					}
					break;
				}
				case 1:{ // write(fd, buf, count)
					ll fd=reg_read(trinum<3>::fromint(4)).toint();
					trint buf=reg_read(trinum<3>::fromint(5));
					trint count=reg_read(trinum<3>::fromint(6));
					ll countc=count.toint();
					if(fd>=0&&fd<MAX_FD&&fds[fd].f&&countc>=0){
						fo0(i,countc){
							fds[fd].putc(mem_read_tryte(buf));
							buf+=trint::fromint(1);
						}
						fds[fd].flush();
						reg_write(trinum<3>::fromint(3),count);
					}else{
						reg_write(trinum<3>::fromint(3),trint::fromint(-1));
					}
					break;
				}
				case 2:{ // open(pathname, flags == 0, mode)
					// mode can be O_RDONLY(0) O_WRONLY(1)
					int res_fd=-1;
					for(int i=0;i<MAX_FD;i++)if(!fds[i].f){
						res_fd=i;
						break;
					}
					if(res_fd==-1){
						reg_write(trinum<3>::fromint(3),trint::fromint(-1));
						break;
					}
					trint pathname=reg_read(trinum<3>::fromint(4));
					ll mode=reg_read(trinum<3>::fromint(6)).toint();
					std::string path;
					while(1){
						ll t=mem_read_tryte(pathname).toint();
						if(!t)break;
						path.pb(t);
						pathname+=trint::fromint(1);
					}
					FILE*ff=fopen(path.c_str(),mode==0?"rb":mode==1?"wb":"");
					fds[res_fd].f=ff;
					fds[res_fd].detect();
					reg_write(trinum<3>::fromint(3),trint::fromint(res_fd));
					break;
				}
				case 3:{ // close(fd)
					ll fd=reg_read(trinum<3>::fromint(4)).toint();
					if(fd>=0&&fd<MAX_FD&&fds[fd].f){
						if(fds[fd].f==stdin||fds[fd].f==stdout||fds[fd].f==stderr);
						else fclose(fds[fd].f);
						fds[fd].f=0;
						fds[fd].mode=0;
						reg_write(trinum<3>::fromint(3),trint::fromint(0));
					}else{
						reg_write(trinum<3>::fromint(3),trint::fromint(-1));
					}
					break;
				}
				case 4:{ // exit(status)
					ll status=reg_read(trinum<3>::fromint(4)).toint();
					exit(status);
					break;
				}
			}
			break;
		}
		case 10:{ // 101
			switch(funct3.toint()){
				case 0: rd(rs1*rs2+imm3.extend<18>());break;
				case 1: rd(((rs1.extend<36>()*rs2.extend<36>()).extract<18,18>()+imm3.extend<18>()));break;
			}
			break;
		}
	}
	pc=nextpc;
	#undef rd
}

std::string regname(int x)
{
	if(x==0)return "zero";
	if(x==1)return "ra";
	if(x==2)return "sp";
	if(x>=3&&x<11)return "a"+std::to_string(x-3);
	if(x>=11&&x<19)return "s"+std::to_string(x-11);
	return "t"+std::to_string(x-19);
}

std::string cpu::disasm()
{
	trint insn=mem_read_trint(pc), nextpc=pc+trint::fromint(3);
	trinum<3> opcode=insn.extract<0,3>();
	trinum<3> xrd=insn.extract<3,3>();
	trinum<3> xrs1=insn.extract<6,3>();
	trinum<3> funct3=insn.extract<9,3>();
	trinum<3> xrs2=insn.extract<12,3>();
	trinum<3> imm3=insn.extract<15,3>();
	trinum<6> imm6; imm6.set(0,imm3); imm6.set(3,xrs2);
	trinum<12> imm12; imm12.set(0,imm6); imm12.set(6,insn.extract<6,6>());
	int rs1=(xrs1.toint()+27)%27;
	int rs2=(xrs2.toint()+27)%27;
	int rd=(xrd.toint()+27)%27;
	std::stringstream ss;
	switch(opcode.toint()){
		case 0:{ // 000
			switch(funct3.toint()){
				case 0: ss<<"add";break;
				case 1: ss<<"sub";break;
				case 9: ss<<"xor";break;
				case 10: ss<<"xor.1";break;
				case 8: ss<<"xor.T";break;
				case 12: ss<<"or";break;
				case 13: ss<<"or.1";break;
				case 11: ss<<"or.T";break;
				case 6: ss<<"and";break;
				case 7: ss<<"and.1";break;
				case 5: ss<<"and.T";break;
				case 3: ss<<"sll";break;
				case 2: ss<<"srl";break;
				case -3: ss<<"seq";break;
				case -2: ss<<"sne";break;
				case -1: ss<<"slt";break;
			}
			ss<<" "<<regname(rd)<<", "<<regname(rs1)<<", "<<regname(rs2)<<", "<<imm3.toint();
			break;
		}
		case 1:{ // 001
			switch(funct3.toint()){
				case 0: ss<<"addi";break;
				case 9: ss<<"xori";break;
				case 10: ss<<"xori.1";break;
				case 8: ss<<"xori.T";break;
				case 12: ss<<"ori";break;
				case 13: ss<<"ori.1";break;
				case 11: ss<<"ori.T";break;
				case 6: ss<<"andi";break;
				case 7: ss<<"andi.1";break;
				case 5: ss<<"andi.T";break;
				case 3: ss<<"slli";break;
				case 2: ss<<"srli";break;
				case -3: ss<<"seqi";break;
				case -2: ss<<"snei";break;
				case -1: ss<<"slti";break;
			}
			ss<<" "<<regname(rd)<<", "<<regname(rs1)<<", "<<imm6.toint();
			break;
		}
		case -1:{ // 00T
			switch(funct3.toint()){
				case 0: ss<<"lt";break;
				case 1: ss<<"lw";break;
				case 3: ss<<"st";break;
				case 4: ss<<"sw";break;
			}
			ss<<" "<<regname(rd)<<", "<<imm6.toint()<<"("<<regname(rs1)<<")";
			break;
		}
		case 3:{ // 010
			switch(funct3.toint()){
				case 0: ss<<"beq";break;
				case 1: ss<<"bne";break;
				case -2: ss<<"blt";break;
			}
			ss<<" "<<regname(rd)<<", "<<regname(rs1)<<", "<<(imm6.extend<18>()<<1).toint();
			break;
		}
		case 4:{ // 011
			ss<<"jal "<<regname(rd)<<", "<<imm12.toint();
			break;
		}
		case 2:{ // 01T
			trinum<9> tmp; tmp.set(0, imm6); tmp.set(6, funct3);
			ss<<"jalr "<<regname(rd)<<", "<<regname(rs1)<<", "<<tmp.toint();
			break;
		}
		case -3:{ // 0T0
			ss<<"lui "<<regname(rd)<<", "<<(imm12.extend<18>()<<6).toint();
			break;
		}
		case -2:{ // 0T1
			ss<<"auipc "<<regname(rd)<<", "<<(imm12.extend<18>()<<6).toint();
			break;
		}
		case 9:{ // 100
			ss<<"ecall";
			break;
		}
		case 10:{ // 101
			switch(funct3.toint()){
				case 0: ss<<"mul";break;
				case 1: ss<<"mulh";break;
			}
			ss<<" "<<regname(rd)<<", "<<regname(rs1)<<", "<<regname(rs2)<<", "<<imm3.toint();
			break;
		}
	}
	return ss.str();
}

void print(cpu&c)
{
	std::stringstream ss;
	ss<<"pc:"<<c.pc.toint()<<' ';
	trint u=mem_read_trint(c.pc);
	ss<<'['<<c.disasm()<<"] ";
	ss<<"ra:"<<c.reg_read(trinum<3>::fromint(1)).toint()<<' ';
	ss<<"sp:"<<c.reg_read(trinum<3>::fromint(2)).toint()<<'\n';
	fo0(i,8)ss<<'a'<<i<<':'<<c.reg_read(trinum<3>::fromint(i+3)).toint()<<(i==7?'\n':' ');
	fo0(i,8)ss<<'s'<<i<<':'<<c.reg_read(trinum<3>::fromint(i+11)).toint()<<(i==7?'\n':' ');
	fo0(i,8)ss<<'t'<<i<<':'<<c.reg_read(trinum<3>::fromint(i+19)).toint()<<(i==7?'\n':' ');
	std::cerr<<ss.str()<<std::endl;
}

int main(int argc,char**argv)
{
	if(argc==1)
	{
		printusage:
		std::cout<<"Usage: "<<argv[0]<<" [-g] program\n";
		return 0;
	}
	
	fds[0].f=stdin;
	fds[1].f=stdout;
	fds[2].f=stderr;
	
	bool isdebug=0;
	int argpos=1;
	if(argv[1][0]=='-'&&argv[1][1]=='g'&&argv[1][2]==0)
	{
		isdebug=1;
		argpos++;
	}
	if(argpos==argc)goto printusage;
	
	cpu c;
	c.reset();
	
	{
		FILE*fi=fopen(argv[argpos++],"rb");
		//FILE*fi=fopen(argv[1],"rb");
		//FILE*fi=fopen("test2.out","rb");
		fseek(fi,0,SEEK_END);
		int fsz=ftell(fi);
		fseek(fi,0,SEEK_SET);
		fds[3].f=fi;
		fds[3].detect();
		if(fds[3].mode)fsz=fsz-4>>1;
		
		c.reg_write(trinum<3>::fromint(3),trint::fromint(0));
		c.reg_write(trinum<3>::fromint(4),trint::fromint(3));
		c.reg_write(trinum<3>::fromint(5),trint::fromint(-1));
		c.reg_write(trinum<3>::fromint(6),trint::fromint(fsz));
		mem_write_trint(trint::fromint(-3),trint::fromint(9));
		c.pc=trint::fromint(-3);
		c.execute();
		c.reg_write(trinum<3>::fromint(3),trint::fromint(0));
		c.reg_write(trinum<3>::fromint(4),trint::fromint(0));
		c.reg_write(trinum<3>::fromint(5),trint::fromint(0));
		c.reg_write(trinum<3>::fromint(6),trint::fromint(0));
	}
	
	c.reg_write(trinum<3>::fromint(2),trint::fromint(-43046721));
	
	while(1){
		if(isdebug)print(c);
		c.execute();
	}
}
