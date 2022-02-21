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

const int M=54;

struct mat
{
	char s[M][M];
	char*operator[](int x){return s[x];}
	const char*operator[](int x)const{return s[x];}
	mat&operator*=(const mat&o)
	{
		int t[M][M];
		mset(t,0);
		fo0(i,M)fo0(j,M)fo0(k,M)t[i][k]+=s[i][j]*o[j][k];
		fo0(i,M)fo0(j,M)s[i][j]=t[i][j]%3;
		return *this;
	}
	mat operator*(const mat&o)const
	{
		mat t=*this;return t*=o;
	}
}rv;

struct vec
{
	char s[M];
	char&operator[](int x){return s[x];}
	const char&operator[](int x)const{return s[x];}
	vec&operator*=(const mat&o)
	{
		int t[M];
		mset(t,0);
		fo0(i,M)fo0(j,M)t[j]+=s[i]*o[i][j];
		fo0(i,M)s[i]=t[i]%3;
		return *this;
	}
	vec operator*(const mat&o)const
	{
		vec t=*this;return t*=o;
	}
};

void initrv()
{
	mat t;
	fo0(i,M)fo0(j,M)t[i][j]=0;
	fo0(i,18)t[i][i]=1;
	fo0(i,10)t[i+8+18][i]=1;
	fo0(i,14)t[i+18*2][i+4]=1;
	fo0(i,18)if(206999>>i&1)
	{
		fo0(j,M)t[j][i]+=t[j][i];
	}
	fo0(i,18)(t[i+18*2][i]+=1)%=3;
	fo0(i,36)t[i][i+18]=1;
	rv=t;
}

vec extract(int a,int b,int c)
{
	vec r;
	auto et=[&](int x,int p){
		fo0(i,18)
		{
			int t=(x%3+3)%3;
			r[i+p]=t;
			if(t==2)t=-1;
			x=(x-t)/3;
		}
		assert(x==0);
	};
	et(a,0);
	et(b,18);
	et(c,36);
	return r;
}

int getlo(vec s)
{
	int x=0;
	fd0(i,18)
	{
		x*=3;
		x+=s[i]==2?-1:s[i];
	}
	return x;
}

int getlo(vec s,int p)
{
	int x=0;
	fd0(i,18)
	{
		x*=3;
		x+=s[i+p]==2?-1:s[i+p];
	}
	return x;
}

int lstn=1e9;
mat lstv;

void krand(int n,vec&x)
{
	if(lstn>n)lstn=0,lstv=rv;
	while(lstn<n)
	{
		lstn++;
		lstv*=lstv;
	}
	x*=lstv;
}

int korand(int n,vec&x)
{
	krand(n,x);
	x*=rv;
	return getlo(x);
}

int urs(int x)
{
	return (x+1)/3;
}

int as[43046721];

int main(int argc,char**argv)
{
	initrv();
	if(0){
		vec a=extract(-86444584,-90169833,-55155712);
		mat t=rv;
		fo0(i,21008)t*=rv;
		int s[M][M+1];
		fo0(i,M)fo0(j,M)s[i][j]=t[j][i];
		fo0(i,M)s[i][M]=a[i];
		fo0(i,M)
		{
			int t=i;
			while(t<M&&!s[t][i])t++;
			assert(t<M);
			fo(j,0,M)std::swap(s[i][j],s[t][j]);
			if(s[i][i]==2)
			{
				fo(j,0,M)(s[i][j]*=2)%=3;
			}
			fo0(j,M)if(j!=i&&s[j][i]!=0)
			{
				int t=3-s[j][i];
				fo(k,0,M)s[j][k]=(s[j][k]+s[i][k]*t)%3;
			}
		}
		//fo0(i,M)out,s[i][M];out,'\n';
		fo0(i,M)a[i]=s[i][M];
		fo0(i,3)out,getlo(a,i*18),' ';out,'\n';
		return 0;
	}
	int C=atoi(argv[1]);
	vec a=extract(-110945888+C,-125848987+C,48310573+C);
	//fo0(i,27)out,korand(urs(i),a),' ';out,'\n';
	fo0(i,43046721)
	{
		//as[i]=korand(urs(i),a);
		as[i]=korand(urs(urs(urs(i))),a);
		if(i%100000==0)dbg,i;
	}
	FILE*f=fopen(("arr_"+std::to_string(C)+".txt").c_str(),"w");
	fwrite(as,4,43046721,f);
	fclose(f);
}
