#include<bits/stdc++.h>
#ifdef __SIZEOF_INT128__
typedef __uint128_t ulll;typedef __int128_t lll;
#define Fr128 I Fr&OP,(lll&x){RX;if(f)x=-x;RT}I OP lll(){lll x;TR}I Fr&OP,(ulll&x){RU;RT}I OP ulll(){ulll x;TR}
#define Fw128 I Fw&OP,(lll x){WI(39,ulll);RT}I Fw&OP,(ulll x){WU(39);RT}
#else
#define Fr128 
#define Fw128 
#endif
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
#define OP operator
#define RT return*this;
#define RX x=0;char t=P();while((t<48||t>57)&&t!='-')t=P();bool f=0;if(t=='-')t=P(),f=1;x=t-48;for(t=P();t>=48&&t<=57;t\
=P())x=x*10+t-48
#define RL if(t=='.'){lf u=.1;for(t=P();t>=48&&t<=57;t=P(),u*=0.1)x+=u*(t-48);}if(f)x=-x
#define RU x=0;char t=P();while(t<48||t>57)t=P();x=t-48;for(t=P();t>=48&&t<=57;t=P())x=x*10+t-48
#define TR *this,x;return x;
#define WI(S,T)if(x){if(x<0){P('-'),x=-x;if(x<0){*this,(T)x;RT}}unsigned char s[S],c=0;while(x)s[c++]=x%10+48,x/=10;\
while(c--)P(s[c]);}else P(48)
#define WL if(y){lf t=0.5;for(int i=y;i--;)t*=0.1;if(x>=0)x+=t;else x-=t,P('-');*this,(ll)(abs(x));P('.');if(x<0)x=-x;\
while(y--){x*=10;x-=floor(x*0.1)*10;P(((int)x)%10+48);}}else if(x>=0)*this,(ll)(x+0.5);else*this,(ll)(x-0.5);
#define WU(S)if(x){char s[S],c=0;while(x)s[c++]=x%10+48,x/=10;while(c--)P(s[c]);}else P(48)
typedef unsigned int uint;typedef long long ll;typedef unsigned long long ull;typedef double lf;typedef long double llf;
typedef std::pair<int,int>pii;template<typename T>T max(T a,T b){return a>b?a:b;}template<typename T>T min(T a,T b){
return a<b?a:b;}template<typename T>T abs(T a){return a>0?a:-a;}template<typename T>T sqr(T x){return x*x;}template<
typename T>bool repr(T&a,T b){return a<b?a=b,1:0;}template<typename T>bool repl(T&a,T b){return a>b?a=b,1:0;}template<
typename T>T gcd(T a,T b){T t;if(a<b){while(a){t=a;a=b%a;b=t;}return b;}else{while(b){t=b;b=a%b;a=t;}return a;}}I bool
IS(char x){return x==10||x==13||x==' ';}template<typename T>struct Fr{T P;I Fr&OP,(int&x){RX;if(f)x=-x;RT}I OP int(){int
x;TR}I Fr&OP,(ll&x){RX;if(f)x=-x;RT}I OP ll(){ll x;TR}I Fr&OP,(char&x){for(x=P();IS(x);x=P());RT}I OP char(){char x;TR}I
Fr&OP,(char*x){char t=P();for(;IS(t)&&~t;t=P());if(~t){for(;!IS(t);t=P())*x++=t;}*x++=0;RT}I Fr&OP,(lf&x){RX;RL;RT}I OP
lf(){lf x;TR}I Fr&OP,(llf&x){RX;RL;RT}I OP llf(){llf x;TR}I Fr&OP,(uint&x){RU;RT}I OP uint(){uint x;TR}I Fr&OP,(ull&x){
RU;RT}I OP ull(){ull x;TR}void file(const char*x){P.file(x);}Fr128};struct Fwp{int p;};Fwp prec(int x){return(Fwp){x};}
template<typename T>struct Fw{T P;int p;I Fw&OP,(int x){WI(10,uint);RT}I Fw&OP,(uint x){WU(10);RT}I Fw&OP,(ll x){WI(19,
ull);RT}I Fw&OP,(ull x){WU(20);RT}I Fw&OP,(char x){P(x);RT}I Fw&OP,(const char*x){while(*x)P(*x++);RT}I Fw&OP,(const Fwp
&x){p=x.p;RT}I Fw&OP,(lf x){int y=p;WL;RT}I Fw&OP()(lf x,int y){WL;RT}I Fw&OP,(llf x){int y=p;WL;RT}I Fw&OP()(llf x,int
y){WL;RT}void file(const char*x){P.file(x);}void flush(){P.flush();}Fw128};
#ifdef LOCAL
struct Cg{I char operator()(){return getchar();}void file(const char*f){freopen(f,"r",stdin);}};struct Cp{I void
operator()(char x){putchar(x);}void file(const char*f){freopen(f,"w",stdout);}void flush(){fflush(stdout);}};struct Cpr{
I void operator()(char x){fputc(x,stderr);}void file(const char*f){freopen(f,"w",stderr);}void flush(){fflush(stderr);}}
;template<typename T>struct Fd{Fw<T>*o;template<typename P>I Fd&OP,(P x){(*o),x,' ';RT;}~Fd(){(*o),'\n';}};template<
typename T>struct Fds{Fw<T>*o;template<typename P>I Fd<T>OP,(P x){(*o),x,' ';return(Fd<T>){o};}};Fw<Cpr>err;Fds<Cpr>dbg{
&err};
#else
#define BSZ 131072
struct Cg{char t[BSZ+1],*o,*e;Cg(){e=o=t+BSZ;}I char operator()(){if(o==e)t[fread(o=t,1,BSZ,stdin)]=0;return*o++;}void
file(const char*f){freopen(f,"r",stdin);}};struct Cp{char t[BSZ+1],*o,*e;Cp(){e=(o=t)+BSZ;}I void operator()(char p){if(
o==e)fwrite(o=t,1,BSZ,stdout);*o++=p;}void file(const char*f){freopen(f,"w",stdout);}void flush(){fwrite(t,1,o-t,stdout)
,o=t,fflush(stdout);}~Cp(){fwrite(t,1,o-t,stdout);}};
#endif
Fr<Cg>in;Fw<Cp>out;

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

std::function<trit(trit,trit)> binops[9]={
	binop_or,binop_or1,binop_orT,
	binop_and,binop_and1,binop_andT,
	binop_xor,binop_xor1,binop_xorT,
};

typedef trinum<6> tryte;
typedef trinum<18> trint;
typedef unsigned short ptryte;

const char bc[9][4]={"|","||","|||","&","&&","&&&","^","^^","^^^"};

struct ures
{
	std::vector<trit> s;
	std::string u;
	bool isconst;
	ll const_v;
};

const int n=4,m=81;

ures base[n];
std::mt19937_64 ran(111);

std::string redstr(ll x)
{
	const int M=387420489;
	return "("+std::to_string((x%M+M+M/2)%M-M/2)+")";
}

ures rand_gen(int dep)
{
	if(dep==0)return base[ran()%n];
	int depl=ran()%dep,depr=dep-1-depl;
	ures l=rand_gen(depl);
	ures r=rand_gen(depl);
	int id=ran()%9;
	ures t;
	fo0(i,m)t.s.pb(binops[id](l.s[i],r.s[i]));
	if(l.isconst&&r.isconst)
	{
		ll u=binop(binops[id],trint::fromint(l.const_v),trint::fromint(r.const_v)).toint();
		t.const_v=u;
		t.isconst=1;
		t.u=redstr(u);
		return t;
	}
	t.u="("+l.u+bc[id]+r.u+")";
	t.isconst=0;
	//out,t.u.c_str(),'\n';
	//fo0(i,9)out,int(t.s[i]),' ';out,'\n';
	return t;
}

const int P=387420489;

std::vector<ll>f[m],g[m];
std::vector<std::string>h;

std::vector<ll> ins(std::vector<ll>a,std::string b)
{
	std::vector<ll>x(h.size(),0);
	x.pb(1);
	h.pb(b);
	fo0(i,m)if(a[i])
	{
		if(!f[i].size())
		{
			f[i]=a;
			g[i]=x;
			return std::vector<ll>();
		}
		while(g[i].size()<x.size())
			g[i].pb(0);
		while(x.size()<g[i].size())
			x.pb(0);
		while(f[i][i])
		{
			ll t=P-a[i]/f[i][i];
			std::vector<ll>nf,ng;
			fo0(j,m)nf.pb((a[j]+t*f[i][j])%P);
			fo0(j,x.size())ng.pb((x[j]+t*g[i][j])%P);
			a=f[i],x=g[i];
			f[i]=nf,g[i]=ng;
		}
		a.swap(f[i]);
		x.swap(g[i]);
	}
	return x;
}

int main(int argc,char**argv)
{
	ran=std::mt19937_64(atoi(argv[1]));
	fo0(i,m)
	{
		int t[n],v=i;
		fo0(j,n)t[j]=v%3,v/=3;
		fo0(j,n)
		{
			base[j].s.pb(t[j]-1);
		}
	}
	fo0(i,4)
	{
		if(argv[i+2][0]<='9')
		{
			base[i].isconst=1;
			base[i].const_v=atoi(argv[i+2]);
			base[i].u=redstr(base[i].const_v);
		}
		else
		{
			base[i].isconst=0;
			base[i].u=argv[i+2];
		}
	}
	/*base[0].u="a";
	base[1].u="b";
	base[0].isconst=base[1].isconst=0;
	base[2].isconst=base[3].isconst=1;
	base[2].const_v=114514;
	base[3].const_v=1919810;
	base[2].u=redstr(base[2].const_v);
	base[3].u=redstr(base[3].const_v);*/
	
	if(0){
		fo0(i,3)ran();
		ures t=rand_gen(20);
		out,t.u.c_str(),'\n';
		fo0(i,9)out,int(t.s[i]),' ';out,'\n';
		return 0;
	}
	
	int cnt=0,cnt2=0;
	//while(cnt<m-1)
	while(1)
	{
		ures t=rand_gen(ran()%3+4);
		std::vector<ll>ts;
		fo0(i,m)ts.pb((t.s[i]+P)%P);
		std::vector<ll>u=ins(ts,t.u);
		//out,t.u.c_str(),'\n';
		if(!u.size())
		{
			cnt++;
			//out,cnt,'\n';
		}
		else
		{
			//for(ll x:u)out,x,' ';out,'\n';
		}
		if(cnt!=m-1)continue;
		bool flag=1;
		fo0(i,m)if(f[i].size()&&f[i][i]!=1)flag=0;
		if(flag)break;
	}
	
	std::vector<std::string>g;
	std::vector<ll>v(m,0);
	
	int A=atoi(argv[6]);
	int B=atoi(argv[7]);
	int C=atoi(argv[8]);
	
	fo0(i,m)v[i]=(v[i]+(ll)A*(-base[0].s[i]+P))%P;
	fo0(i,m)v[i]=(v[i]+(ll)B*(-base[1].s[i]+P))%P;
	fo0(i,m)v[i]=(v[i]+(ll)C*(-binop_xor(base[0].s[i],base[1].s[i])+P))%P;
	//g.pb(base[0].u);
	//g.pb(base[1].u);
	
	fo0(T,11)
	{
		ures t=rand_gen(ran()%10);
		ll u=ran()%P;
		if(T%3==0)u=pow(3,ran()%9);
		fo0(i,m)v[i]=(v[i]+(ll)u*(t.s[i]+P))%P;
		g.pb(t.u+"*"+redstr(u));
	}
	{
		int hc=h.size();
		std::vector<ll>t=ins(v,"");
		assert(t[hc]==1);
		fo0(i,hc)if(t[i])g.pb(h[i]+"*"+redstr(t[i]));
	}
	//out.file("test2.c");
	//for(std::string x:g)out,x.c_str(),'+';
	//out,'\n';
	std::shuffle(g.begin(),g.end(),ran);
	fo0(i,g.size())out,g[i].c_str(),i+1==g.size()?'\n':'+';
}
