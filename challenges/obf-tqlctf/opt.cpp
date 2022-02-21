#include<bits/stdc++.h>

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

typedef trinum<18> trint;

trint op(int id,trint x,trint y)
{
	switch(id){
		case 0:return x+y;
		case 1:return binop(binop_or,x,y);
		case 2:return binop(binop_or1,x,y);
		case 3:return binop(binop_orT,x,y);
		case 4:return binop(binop_and,x,y);
		case 5:return binop(binop_and1,x,y);
		case 6:return binop(binop_andT,x,y);
		case 7:return binop(binop_xor,x,y);
		case 8:return binop(binop_xor1,x,y);
		case 9:return binop(binop_xorT,x,y);
		case 10:return x*y;
	}
	return x;
}

struct uop
{
	int id,ri,xt,xi,yt,yi;
}s[1919810];

int n,m,sa,sb,sc;
std::vector<std::vector<int>>f;
std::vector<int>p[1919810];
int deg[1919810],si[1919810];

void adde(int x,int y)
{
	p[x].pb(y);
	deg[y]++;
}

int main(int argc,char**argv)
{
	std::mt19937_64 ran(111);
	std::mt19937_64 ran2(112);
	freopen("data.txt","r",stdin);
	freopen("dataw.txt","w",stdout);
	scanf("%d%d%d",&sa,&sb,&sc);
	while(~scanf("%d%d%d%d%d%d",&s[n].id,&s[n].ri,&s[n].xt,&s[n].xi,&s[n].yt,&s[n].yi))
	{
		si[s[n].ri]=n;
		repr(m,s[n++].ri);
	}
	m++;
	
	int N=atoi(argv[1]),topoalg=atoi(argv[2]);
	
	if(N)
	{
		fo0(i,N)
		{
			f.emplace_back(m,0);
			std::vector<int>&ft=f.back();
			ft[sa]=trint::fromint(ran()&0xffffffffffff).toint();
			ft[sb]=trint::fromint(ran()&0xffffffffffff).toint();
			ft[sc]=trint::fromint(ran()&0xffffffffffff).toint();
			fo0(j,n)
			{
				trint x=trint::fromint(s[j].xt?s[j].xi:ft[s[j].xi]);
				trint y=trint::fromint(s[j].yt?s[j].yi:ft[s[j].yi]);
				ft[s[j].ri]=op(s[j].id,x,y).toint();
			}
			if(i%10==9)fprintf(stderr,"status:%d/%d\n",i+1,N);
		}
		std::map<std::vector<int>,int>g;
		auto locate=[&](int x){
			std::vector<int>t;
			for(auto&u:f)t.pb(u[x]);
			if(g.count(t))return g[t];
			return g[t]=x;
		};
		fo0(j,n)
		{
			if(!s[j].xt)s[j].xi=locate(s[j].xi);
			if(!s[j].yt)s[j].yi=locate(s[j].yi);
			locate(s[j].ri);
		}
	}
	
	fo0(i,n)
	{
		if(!s[i].xt)adde(s[i].xi,s[i].ri);
		if(!s[i].yt)adde(s[i].yi,s[i].ri);
	}
	std::vector<int>q,seq;
	q.pb(sa),q.pb(sb),q.pb(sc);
	while(q.size())
	{
		int p,mi=1e9;
		if(topoalg==0)
		{
			fo0(pt,q.size())if(repl(mi,q[pt]))p=pt;
		}
		else if(topoalg==1)
		{
			std::mt19937_64 ran3(ran2());
			fo0(_,seq.size()<10500?37:36)
			{
				int pt=ran3()%q.size();
				if(repl(mi,q[pt]))p=pt;
			}
		}
		std::swap(q[p],q.back());
		int x=q.back();q.pop_back();
		seq.pb(x);
		for(int y: ::p[x])if(!--deg[y])q.pb(y);
	}
	//fprintf(stderr,"%d %d\n",seq.size(),n);
	//assert(seq.size()==n+3);
	
	for(int i:seq)
	{
		if(i==sa||i==sb||i==sc)continue;
		int j=si[i];
		//if(!s[j].xt)s[j].xi=locate(s[j].xi);
		//if(!s[j].yt)s[j].yi=locate(s[j].yi);
		//locate(i);
		printf("%d %d %d %d %d %d\n",s[j].id,s[j].ri,s[j].xt,s[j].xi,s[j].yt,s[j].yi);
	}
}
