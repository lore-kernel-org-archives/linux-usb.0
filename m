Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [Bug,197863] Thinkpad X240 resume dramatically slower on kernels 4.13+
From: "Rafael J. Wysocki" <rafael@kernel.org>
Message-Id: <CAJZ5v0jN2cQUmwWRQ=Rvb+dQpMg+Q+GuaDtt-X-tXWNThUx-NQ@mail.gmail.com>
Date: Wed, 7 Feb 2018 23:44:15 +0100
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Greg KH <gregkh@linuxfoundation.org>, Markus Demleitner <m@tfiu.de>, Lv Zheng <lv.zheng@intel.com>, Andreas Lindhe <andreas@lindhe.io>, Gjorgji Jankovski <j.gjorgji@gmail.com>, Damjan Georgievski <gdamjan@gmail.com>, Fernando Chaves <nanochaves@gmail.com>, Tomislav Ivek <tomislav.ivek@gmail.com>, "Denis P." <theoriginal.skullburner@gmail.com>, All applicable <stable@vger.kernel.org>, "open list:ULTRA-WIDEBAND \(UWB\) SUBSYSTEM:" <linux-usb@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBGZWIgNSwgMjAxOCBhdCA2OjA2IFBNLCBSYWZhZWwgSi4gV3lzb2NraQo8cmFmYWVs
Lmoud3lzb2NraUBpbnRlbC5jb20+IHdyb3RlOgo+IE9uIDIvNS8yMDE4IDM6MTQgUE0sIEJqw7hy
biBNb3JrIHdyb3RlOgo+Pgo+PiAiUmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWwuai53eXNvY2tp
QGludGVsLmNvbT4gd3JpdGVzOgo+Pj4KPj4+IE9uIDIvNC8yMDE4IDk6MjggUE0sIEJqw7hybiBN
b3JrIHdyb3RlOgo+Pj4KPj4+PiBCdXQgSSBkbyB3b25kZXIgaWYgdGhlIGF0dGFjaGVkIChjb21w
bGV0ZWx5IHVudGVzdGVkISEpIHBhdGNoIG1ha2VzCj4+Pj4gdGhpbmdzIGFueSBiZXR0ZXI/Cj4+
Pgo+Pj4gSSBkb24ndCB0aGluayBzbywgdGhlIG1hY3JvIGlzIG5lZWRlZCB0b28uCj4+Cj4+IERv
aCEgT2J2aW91c2x5LiAgRG9uJ3Qga25vdyBob3cgSSBtYW5hZ2VkIHRvIG1pc3MgdGhhdC4KPj4K
Pj4+IEknbGwgcXVldWUgdXAgYSBmdWxsIHJldmVydCBvZiA2NjI1OTE0NjFjNGI5YTFlM2IuCj4+
Cj4+IFN0aWxsIHdpdGggdGhlIGFkZGl0aW9uYWwgZXhjZXB0aW9uIGZvciAiZWMgPT0gZmlyc3Rf
ZWMiPwo+Pgo+Cj4gTm8sIGp1c3QgYSBmdWxsIHJldmVydCBmb3Igbm93LgoKVGhhdCBkb2Vzbid0
IHdvcmssIGJlY2F1c2Ugd2UgbWFkZSBzb21lIGNoYW5nZXMgb24gdG9wIG9mIHRoaXMgY29tbWl0
LgoKSSdsbCBzZW5kIGEgcGF0Y2ggdG8gdHJ5IHRvbW9ycm93LgoKVGhhbmtzLApSYWZhZWwKLS0t
ClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmli
ZSBsaW51eC11c2IiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5r
ZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcv
bWFqb3Jkb21vLWluZm8uaHRtbAo=
