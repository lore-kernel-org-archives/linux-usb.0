Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,16/22] usbnet: ipheth: fix return type of ndo_start_xmit function
From: YueHaibing <yuehaibing@huawei.com>
Message-Id: <20180920123306.14772-17-yuehaibing@huawei.com>
Date: Thu, 20 Sep 2018 20:33:00 +0800
To: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, dev@openvswitch.org, YueHaibing <yuehaibing@huawei.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtl
IHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCnRoaXMgZHJpdmVyIGhhcyByZXR1cm5zICduZXRk
ZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCnJldHVybiB0eXBlIHRvIG5l
dGRldl90eF90LgoKRm91bmQgYnkgY29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC91c2IvaXBoZXRoLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC91c2IvaXBoZXRoLmMgYi9kcml2ZXJzL25ldC91c2IvaXBo
ZXRoLmMKaW5kZXggNzI3NTc2MS4uNTNlYWI2ZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3Vz
Yi9pcGhldGguYworKysgYi9kcml2ZXJzL25ldC91c2IvaXBoZXRoLmMKQEAgLTQxMyw3ICs0MTMs
NyBAQCBzdGF0aWMgaW50IGlwaGV0aF9jbG9zZShzdHJ1Y3QgbmV0X2RldmljZSAqbmV0KQogCXJl
dHVybiAwOwogfQogCi1zdGF0aWMgaW50IGlwaGV0aF90eChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBz
dHJ1Y3QgbmV0X2RldmljZSAqbmV0KQorc3RhdGljIG5ldGRldl90eF90IGlwaGV0aF90eChzdHJ1
Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqbmV0KQogewogCXN0cnVjdCBpcGhl
dGhfZGV2aWNlICpkZXYgPSBuZXRkZXZfcHJpdihuZXQpOwogCXN0cnVjdCB1c2JfZGV2aWNlICp1
ZGV2ID0gZGV2LT51ZGV2Owo=
