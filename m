Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,17/22] hv_netvsc: fix return type of ndo_start_xmit function
From: Haiyang Zhang <haiyangz@microsoft.com>
Message-Id: <BN6PR21MB016115A6ACD7D2685DC0070DCA130@BN6PR21MB0161.namprd21.prod.outlook.com>
Date: Thu, 20 Sep 2018 14:40:20 +0000
To: YueHaibing <yuehaibing@huawei.com>, "davem@davemloft.net" <davem@davemloft.net>, "dmitry.tarnyagin@lockless.no" <dmitry.tarnyagin@lockless.no>, "wg@grandegger.com" <wg@grandegger.com>, "mkl@pengutronix.de" <mkl@pengutronix.de>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "madalin.bucur@nxp.com" <madalin.bucur@nxp.com>, "pantelis.antoniou@gmail.com" <pantelis.antoniou@gmail.com>, "claudiu.manoil@nxp.com" <claudiu.manoil@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "sammy@sammy.net" <sammy@sammy.net>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "nico@fluxnic.net" <nico@fluxnic.net>, "steve.glendinning@shawell.net" <steve.glendinning@shawell.net>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, "w-kwok2@ti.com" <w-kwok2@ti.com>, "m-karicheri2@ti.com" <m-karicheri2@ti.com>, "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>, "jreuter@yaina.de" <jreuter@yaina.de>, KY Srinivasan <kys@microsoft.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "arvid.brodin@alten.se" <arvid.brodin@alten.se>, "pshelar@ovn.org" <pshelar@ovn.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "dev@openvswitch.org" <dev@openvswitch.org>
List-ID: <linux-usb.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFl1ZUhhaWJpbmcgPHl1ZWhhaWJp
bmdAaHVhd2VpLmNvbT4KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDIwLCAyMDE4IDg6MzMg
QU0KPiBUbzogZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZG1pdHJ5LnRhcm55YWdpbkBsb2NrbGVzcy5u
bzsKPiB3Z0BncmFuZGVnZ2VyLmNvbTsgbWtsQHBlbmd1dHJvbml4LmRlOyBtaWNoYWwuc2ltZWtA
eGlsaW54LmNvbTsKPiBoc3dlZXRlbkB2aXNpb25lbmdyYXZlcnMuY29tOyBtYWRhbGluLmJ1Y3Vy
QG54cC5jb207Cj4gcGFudGVsaXMuYW50b25pb3VAZ21haWwuY29tOyBjbGF1ZGl1Lm1hbm9pbEBu
eHAuY29tOyBsZW95YW5nLmxpQG54cC5jb207Cj4gbGludXhAYXJtbGludXgub3JnLnVrOyBzYW1t
eUBzYW1teS5uZXQ7IHJhbGZAbGludXgtbWlwcy5vcmc7Cj4gbmljb0BmbHV4bmljLm5ldDsgc3Rl
dmUuZ2xlbmRpbm5pbmdAc2hhd2VsbC5uZXQ7IGYuZmFpbmVsbGlAZ21haWwuY29tOwo+IGdyeWdv
cmlpLnN0cmFzaGtvQHRpLmNvbTsgdy1rd29rMkB0aS5jb207IG0ta2FyaWNoZXJpMkB0aS5jb207
Cj4gdC5zYWlsZXJAYWx1bW5pLmV0aHouY2g7IGpyZXV0ZXJAeWFpbmEuZGU7IEtZIFNyaW5pdmFz
YW4gPGt5c0BtaWNyb3NvZnQuY29tPjsKPiBIYWl5YW5nIFpoYW5nIDxoYWl5YW5nekBtaWNyb3Nv
ZnQuY29tPjsgd2VpLmxpdTJAY2l0cml4LmNvbTsKPiBwYXVsLmR1cnJhbnRAY2l0cml4LmNvbTsg
YXJ2aWQuYnJvZGluQGFsdGVuLnNlOyBwc2hlbGFyQG92bi5vcmcKPiBDYzogbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4gY2FuQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51
eHBwYy0KPiBkZXZAbGlzdHMub3psYWJzLm9yZzsgbGludXgtbWlwc0BsaW51eC1taXBzLm9yZzsg
bGludXgtb21hcEB2Z2VyLmtlcm5lbC5vcmc7Cj4gbGludXgtaGFtc0B2Z2VyLmtlcm5lbC5vcmc7
IGRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5vcmc7IGxpbnV4LQo+IHVzYkB2Z2VyLmtlcm5lbC5v
cmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgZGV2QG9wZW52c3dpdGNoLm9yZzsK
PiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4gU3ViamVjdDogW1BBVENIIG5l
dC1uZXh0IDE3LzIyXSBodl9uZXR2c2M6IGZpeCByZXR1cm4gdHlwZSBvZiBuZG9fc3RhcnRfeG1p
dAo+IGZ1bmN0aW9uCj4gCj4gVGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQg
YXMgcmV0dXJuaW5nIGFuICduZXRkZXZfdHhfdCcsIHdoaWNoIGlzCj4gYSB0eXBlZGVmIGZvciBh
biBlbnVtIHR5cGUsIHNvIG1ha2Ugc3VyZSB0aGUgaW1wbGVtZW50YXRpb24gaW4gdGhpcyBkcml2
ZXIgaGFzCj4gcmV0dXJucyAnbmV0ZGV2X3R4X3QnIHZhbHVlLCBhbmQgY2hhbmdlIHRoZSBmdW5j
dGlvbiByZXR1cm4gdHlwZSB0byBuZXRkZXZfdHhfdC4KPiAKPiBGb3VuZCBieSBjb2NjaW5lbGxl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzY19kcnYuYyB8IDEwICsrKysrKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzY19kcnYuYyBiL2RyaXZlcnMvbmV0
L2h5cGVydi9uZXR2c2NfZHJ2LmMKPiBpbmRleCAzYWY2ZDhkLi4wNTZjNDcyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbmV0L2h5cGVydi9uZXR2c2NfZHJ2LmMKPiArKysgYi9kcml2ZXJzL25ldC9o
eXBlcnYvbmV0dnNjX2Rydi5jCj4gQEAgLTUxMSw3ICs1MTEsOCBAQCBzdGF0aWMgaW50IG5ldHZz
Y192Zl94bWl0KHN0cnVjdCBuZXRfZGV2aWNlICpuZXQsIHN0cnVjdAo+IG5ldF9kZXZpY2UgKnZm
X25ldGRldiwKPiAgCXJldHVybiByYzsKPiAgfQo+IAo+IC1zdGF0aWMgaW50IG5ldHZzY19zdGFy
dF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZXQpCj4gK3N0
YXRpYyBuZXRkZXZfdHhfdAo+ICtuZXR2c2Nfc3RhcnRfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2ti
LCBzdHJ1Y3QgbmV0X2RldmljZSAqbmV0KQo+ICB7Cj4gIAlzdHJ1Y3QgbmV0X2RldmljZV9jb250
ZXh0ICpuZXRfZGV2aWNlX2N0eCA9IG5ldGRldl9wcml2KG5ldCk7Cj4gIAlzdHJ1Y3QgaHZfbmV0
dnNjX3BhY2tldCAqcGFja2V0ID0gTlVMTDsgQEAgLTUyOCw4ICs1MjksMTEgQEAKPiBzdGF0aWMg
aW50IG5ldHZzY19zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2
aWNlICpuZXQpCj4gIAkgKi8KPiAgCXZmX25ldGRldiA9IHJjdV9kZXJlZmVyZW5jZV9iaChuZXRf
ZGV2aWNlX2N0eC0+dmZfbmV0ZGV2KTsKPiAgCWlmICh2Zl9uZXRkZXYgJiYgbmV0aWZfcnVubmlu
Zyh2Zl9uZXRkZXYpICYmCj4gLQkgICAgIW5ldHBvbGxfdHhfcnVubmluZyhuZXQpKQo+IC0JCXJl
dHVybiBuZXR2c2NfdmZfeG1pdChuZXQsIHZmX25ldGRldiwgc2tiKTsKPiArCSAgICAhbmV0cG9s
bF90eF9ydW5uaW5nKG5ldCkpIHsKPiArCQlyZXQgPSBuZXR2c2NfdmZfeG1pdChuZXQsIHZmX25l
dGRldiwgc2tiKTsKPiArCQlpZiAocmV0KQo+ICsJCQlyZXR1cm4gTkVUREVWX1RYX0JVU1k7CgpG
b3IgZXJyb3IgY2FzZSwgcGxlYXNlIGp1c3QgcmV0dXJuIE5FVERFVl9UWF9PSy4gV2UgYXJlIG5v
dCBzdXJlIGlmIHRoZSAKZXJyb3IgY2FuIGdvIGF3YXkgYWZ0ZXIgcmV0cnlpbmcsIHJldHVybmlu
ZyBORVRERVZfVFhfQlVTWSBtYXkgY2F1c2UgCmluZmluaXRlIHJldHJ5IGZyb20gdGhlIHVwcGVy
IGxheWVyLgoKVGhhbmtzLAotIEhhaXlhbmcK
