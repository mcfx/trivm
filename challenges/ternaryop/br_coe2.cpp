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

/*const int g[3][3]={
	{0,1,2},
	{1,1,2},
	{2,2,2},
};*/

/*const int g[3][3]={
	{0,1,2},
	{1,0,1},
	{2,1,0},
};*/

const int g[3][3]={
	{1,0,2},
	{0,1,2},
	{2,2,1},
};

lf loss(lf a[3][3],lf b[3][3],lf s[3][3])
{
	const int n=3;
	const lf eps=1e-6;
	lf t[n][n*2];
	fo0(i,n)
	{
		fo0(j,n)t[i][j]=s[i][j];
		fo0(j,n)t[i][j+n]=i==j;
	}
	fo0(i,n)
	{
		int p=i;
		for(;p<n&&abs(t[p][i])<eps;p++);
		if(p==n)return 1e9;
		if(p!=i)fo0(j,n*2)std::swap(t[p][j],t[i][j]);
		lf u=t[i][i];
		fo0(j,n*2)t[i][j]/=u;
		fo0(j,n)if(j!=i)
		{
			lf u=t[j][i];
			fo0(k,n*2)t[j][k]-=u*t[i][k];
		}
	}
	//fo0(i,n){fo0(j,n*2)out,prec(3),t[i][j],' ';out,'\n';}
	lf res=0;
	fo0(i,3)fo0(j,3)
	{
		lf u[3]={},v[3]={};
		fo0(k,3)u[k]+=a[i][k]*b[j][k];
		fo0(k,3)fo0(l,3)v[l]+=u[k]*t[k][l+n];
		//out,i,' ',j,':';
		//fo0(k,3)out,prec(2),u[k],' ';out,'|',' ';
		//fo0(k,3)out,prec(2),v[k],' ';out,'|',' ';
		//fo0(k,3)out,prec(2),s[g[i][j]][k],' ';out,'\n';
		fo0(k,3)res+=sqr(v[k]-(k==g[i][j]));
	}
	return res;
}

void norm(lf s[3][3])
{
	lf t=0;
	fo0(i,3)fo0(j,3)t+=sqr(s[i][j]);
	t=1/sqrtl(t);
	fo0(i,3)fo0(j,3)s[i][j]*=t;
}

std::mt19937_64 ran(11);

lf ranl()
{
	ull t=ran();
	return lf(t&0x1fffffffffffffull)/0xfffffffffffffull-1;
}

int main()
{
	//lf t[3][3]={1,0,2,1,2,1,0,0,1};
	//lf t[3][3]={1,1,1,0,1,1,0,0,1};
	//out,prec(4),loss(t),'\n';
	lf ta[3][3]={1,1,1,1,1,1,1,1,1};
	lf tb[3][3]={1,1,1,1,1,1,1,1,1};
	lf ts[3][3]={1,1,1,1,1,1,1,1,1};
	lf step=1,cur=loss(ta,tb,ts);
	//while(1)
	fo0(_,10000000)
	{
		lf ua[3][3];
		lf ub[3][3];
		lf us[3][3];
		fo0(i,3)fo0(j,3)ua[i][j]=ta[i][j]+ranl()*step;
		fo0(i,3)fo0(j,3)ub[i][j]=tb[i][j]+ranl()*step;
		fo0(i,3)fo0(j,3)us[i][j]=ts[i][j]+ranl()*step;
		//norm(u);
		lf nxt=loss(ua,ub,us);
		if(nxt<cur)
		{
			fo0(i,3)fo0(j,3)ta[i][j]=ua[i][j];
			fo0(i,3)fo0(j,3)tb[i][j]=ub[i][j];
			fo0(i,3)fo0(j,3)ts[i][j]=us[i][j];
			cur=nxt;
			out,prec(5),cur,'\n';
		}
		step*=.999999;
	}
	fo0(i,3){fo0(j,3)out,prec(3),ta[i][j],' ';out,'\n';}
	fo0(i,3){fo0(j,3)out,prec(3),tb[i][j],' ';out,'\n';}
	fo0(i,3){fo0(j,3)out,prec(3),ts[i][j],' ';out,'\n';}
}
