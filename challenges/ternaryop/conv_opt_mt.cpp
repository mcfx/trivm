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

int*s1,*s2,*s3,*s4;

void read(int*&s,int x)
{
	s=new int[43046721];
	FILE*f=fopen(("arr_"+std::to_string(x)+".txt").c_str(),"rb");
	fread(s,4,43046721,f);
	fclose(f);
}

int umod(ll x)
{
	const int P=387420489;
	int t=x%P;
	return t<0?t+P:t;
}

int imod(ll x)
{
	const int P=387420489;
	int t=umod(x);
	return t>193710244?t-P:t;
}

void conv_andT_trans(int*a,int n)
{
	if(n==1)return;
	int m=n/3;
	fo0(i,3)conv_andT_trans(a+i*m,m);
	for(int i=0;i<m;i++)
	{
		a[i+m*2]=umod(a[i+m*2]+a[i]);
		a[i+m]=umod(a[i+m*2]+a[i+m]);
	}
}

void conv_andT_itrans(int*a,int n)
{
	if(n==1)return;
	int m=n/3;
	fo0(i,3)conv_andT_itrans(a+i*m,m);
	for(int i=0;i<m;i++)
	{
		a[i+m]=umod(a[i+m]-a[i+m*2]);
		a[i+m*2]=umod(a[i+m*2]-a[i]);
	}
}

void conv_andT_fast(int*a,int*b,int*r,int n)
{
	int*au=new int[n];
	int*bu=new int[n];
	fo0(i,n)au[i]=a[i];
	fo0(i,n)bu[i]=b[i];
	conv_andT_trans(au,n);
	conv_andT_trans(bu,n);
	fo0(i,n)au[i]=umod((ll)au[i]*bu[i]);
	conv_andT_itrans(au,n);
	fo0(i,n)r[i]=umod(r[i]+au[i]);
	delete[] au;
	delete[] bu;
}

void conv_andT(int*a,int*b,int*r,int n)
{
	return conv_andT_fast(a,b,r,n);
	if(n==1)
	{
		r[0]=umod(r[0]+(ll)a[0]*b[0]);
		return;
	}
	const int g[3][3]={
		{0,1,2},
		{1,1,1},
		{2,1,2},
	};
	int m=n/3;
	fo0(i,3)fo0(j,3)conv_andT(a+i*m,b+j*m,r+g[i][j]*m,m);
}

void test_conv_andT()
{
	int n=243;
	int*a=new int[n];
	int*b=new int[n];
	int*c=new int[n];
	int*d=new int[n];
	fo0(i,n)c[i]=d[i]=0;
	std::mt19937 ran(111);
	fo0(_,100)
	{
		fo0(i,n)a[i]=ran()%200000000;
		fo0(i,n)b[i]=ran()%200000000;
		conv_andT(a,b,c,n);
		conv_andT_fast(a,b,d,n);
		//out,c[0],' ',d[0],'\n';
		fo0(i,n)assert(c[i]==d[i]);
	}
}

void trans_34(int*a,ll*r,int n,int n4,const int g[3][4])
{
	if(n==1)
	{
		r[0]=a[0];
		return;
	}
	int m=n/3,m4=n4/4;
	auto work=[&](int i){trans_34(a+i*m,r+i*m4,m,m4,g);};
	if(n>=177147)
	{
		std::thread o[4];
		fo0(i,3)o[i]=std::thread(work,i);
		fo0(i,3)o[i].join();
	}
	else
	{
		fo0(i,3)work(i);
	}
	for(int i=0;i<m4;i++)
	{
		ll t[4]={};
		fo0(j,3)fo0(k,4)t[k]+=r[i+j*m4]*g[j][k];
		fo0(j,4)r[i+j*m4]=t[j];
	}
}

template<int c>void itrans_43_ll(ll*r,int n,int n4,const int g[4][3])
{
	if(n==1)return;
	int m=n/3,m4=n4/4;
	auto work=[&](int i){itrans_43_ll<c>(r+i*m4,m,m4,g);};
	if(n>=177147)
	{
		std::thread o[4];
		fo0(i,4)o[i]=std::thread(work,i);
		fo0(i,4)o[i].join();
	}
	else
	{
		fo0(i,4)work(i);
	}
	for(int i=0;i<m;i++)
	{
		ll t[3]={};
		fo0(j,4)fo0(k,3)t[k]+=r[i+j*m4]*g[j][k];
		//fo0(j,3)assert(t[j]%c==0);
		fo0(j,3)r[i+j*m4]=t[j]/c%25389989167104ll;
	}
	fo0(i,m)r[i+m]=r[i+m4];
	fo0(i,m)r[i+m*2]=r[i+m4*2];
}

template<int c>void itrans_43_128(lll*r,int n,int n4,const int g[4][3])
{
	if(n==1)return;
	int m=n/3,m4=n4/4;
	auto work=[&](int i){itrans_43_128<c>(r+i*m4,m,m4,g);};
	if(n>=177147)
	{
		std::thread o[4];
		fo0(i,4)o[i]=std::thread(work,i);
		fo0(i,4)o[i].join();
	}
	else
	{
		fo0(i,4)work(i);
	}
	for(int i=0;i<m;i++)
	{
		lll t[3]={};
		fo0(j,4)fo0(k,3)t[k]+=r[i+j*m4]*g[j][k];
		//fo0(j,3)assert(t[j]%c==0);
		fo0(j,3)r[i+j*m4]=t[j]/c;
	}
	fo0(i,m)r[i+m]=r[i+m4];
	fo0(i,m)r[i+m*2]=r[i+m4*2];
}

const int xor1_g1[3][4]={
	{1,-1,1,-1},
	{1,-1,-1,0},
	{1,1,0,0}
};

const int xor1_g2[3][4]={
	{1,-1,1,-1},
	{1,-1,0,-1},
	{1,1,0,0}
};

const int xor1_b[4][3]={
	{0,1,1},
	{0,1,-1},
	{-2,2,0},
	{2,-2,0},
};

ll mulmx(ll a,ll b)
{
	const ll P=25389989167104;
	return (__int128_t)a*b%P;
}

void conv_xor1_fast(int*a,int*b,int*r,int n)
{
	int n4=1,t=n;
	while(t>1)t/=3,n4*=4;
	ll*au=new ll[n4];
	ll*bu=new ll[n4];
	trans_34(a,au,n,n4,xor1_g1);
	trans_34(b,bu,n,n4,xor1_g2);
	fo0(i,n4)au[i]=mulmx(au[i],bu[i]);
	//fo0(i,4)out,au[i],' ';out,'\n';
	itrans_43_ll<2>(au,n,n4,xor1_b);
	//fo0(i,3)out,au[i],' ';out,'\n';
	fo0(i,n)r[i]=umod(r[i]+au[i]);
	delete[] au;
	delete[] bu;
}

const int xor_g1[3][4]={
	{1,-1,2,1},
	{-2,-1,-1,1},
	{1,2,-1,1},
};

const int xor_g2[3][4]={
	{2,-1,-1,1},
	{-1,2,-1,1},
	{-1,-1,2,1}
};

const int xor_b[4][3]={
	{-2,1,1},
	{-1,-1,2},
	{-1,2,-1},
	{3,3,3},
};

void conv_xor_fast(int*a,int*b,int*r,int n)
{
	int n4=1,t=n;
	while(t>1)t/=3,n4*=4;
	ll*au=new ll[n4];
	ll*bu=new ll[n4];
	lll*cu=new lll[n4];
	trans_34(a,au,n,n4,xor_g1);
	//out,"trans_34 ok\n";
	trans_34(b,bu,n,n4,xor_g2);
	//out,"trans_34 ok\n";
	fo0(i,n4)cu[i]=(lll)au[i]*bu[i];
	//out,"mul ok\n";
	//fo0(i,4)out,au[i],' ';out,'\n';
	//fo0(i,4)out,bu[i],' ';out,'\n';
	//fo0(i,4)out,cu[i],' ';out,'\n';
	itrans_43_128<9>(cu,n,n4,xor_b);
	//out,"itrans_43 ok\n";
	//fo0(i,3)out,au[i],' ';out,'\n';
	fo0(i,n)r[i]=umod(r[i]+ll(cu[i]%387420489));
	delete[] au;
	delete[] bu;
	delete[] cu;
}

void conv_xor1(int*a,int*b,int*r,int n)
{
	if(n<=14348907)return conv_xor1_fast(a,b,r,n);
	if(n==1)
	{
		r[0]=umod(r[0]+(ll)a[0]*b[0]);
		return;
	}
	const int g[3][3]={
		{1,0,2},
		{0,1,2},
		{2,2,1},
	};
	int m=n/3;
	fo0(i,3)fo0(j,3)conv_xor1(a+i*m,b+j*m,r+g[i][j]*m,m);
}

void conv_xor(int*a,int*b,int*r,int n)
{
	if(n<=14348907)return conv_xor_fast(a,b,r,n);
	if(n==1)
	{
		r[0]=umod(r[0]+(ll)a[0]*b[0]);
		return;
	}
	int m=n/3;
	fo0(i,3)fo0(j,3)conv_xor(a+i*m,b+j*m,r+((i+j+2)%3)*m,m);
}

void test_conv_xor1()
{
	int n=243;
	int*a=new int[n];
	int*b=new int[n];
	int*c=new int[n];
	int*d=new int[n];
	fo0(i,n)c[i]=d[i]=0;
	std::mt19937 ran(111);
	fo0(_,100)
	{
		fo0(i,n)a[i]=ran()%200000000;
		fo0(i,n)b[i]=ran()%200000000;
		conv_xor1(a,b,c,n);
		conv_xor1_fast(a,b,d,n);
		//out,c[0],' ',d[0],'\n';
		//fo0(i,n)out,c[i],' ';out,'\n';
		//fo0(i,n)out,d[i],' ';out,'\n';
		fo0(i,n)assert(c[i]==d[i]);
	}
}

void test_conv_xor()
{
	int n=243;
	int*a=new int[n];
	int*b=new int[n];
	int*c=new int[n];
	int*d=new int[n];
	fo0(i,n)c[i]=d[i]=0;
	std::mt19937 ran(111);
	fo0(_,100)
	{
		fo0(i,n)a[i]=ran()%200000000;
		fo0(i,n)b[i]=ran()%200000000;
		conv_xor(a,b,c,n);
		conv_xor_fast(a,b,d,n);
		//out,c[0],' ',d[0],'\n';
		//fo0(i,n)out,c[i],' ';out,'\n';
		//fo0(i,n)out,d[i],' ';out,'\n';
		fo0(i,n)assert(c[i]==d[i]);
	}
}

int main()
{
	//test_conv_andT();
	//test_conv_xor1();
	//test_conv_xor();
	//return 0;
	read(s1,0);
	read(s2,1);
	read(s3,2);
	read(s4,3);
	int*ta=new int[43046721];
	int*tb=new int[43046721];
	int*tc=new int[43046721];
	fo0(i,43046721)tc[i]=0;
	for(int n=1;n<=43046721;n*=3)
	{
		fo0(i,n)ta[i]=0;
		fo0(i,n)tb[i]=0;
		// tc is not cleared
		conv_andT(s1,s2,ta,n);
		conv_xor(s3,s4,tb,n);
		conv_xor1(ta,tb,tc,n);
		int hash=0;
		fo0(i,n)hash=umod(hash*1337ll+tc[i]);
		out,imod(hash),'\n';
	}
}
