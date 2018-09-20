Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,18/22] can: xilinx: fix return type of ndo_start_xmit function
From: YueHaibing <yuehaibing@huawei.com>
Message-Id: <20180920123306.14772-19-yuehaibing@huawei.com>
Date: Thu, 20 Sep 2018 20:33:02 +0800
To: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, dev@openvswitch.org, YueHaibing <yuehaibing@huawei.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtl
IHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCnRoaXMgZHJpdmVyIGhhcyByZXR1cm5zICduZXRk
ZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCnJldHVybiB0eXBlIHRvIG5l
dGRldl90eF90LgoKRm91bmQgYnkgY29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9jYW4veGlsaW54X2Nh
bi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvY2FuL3hpbGlueF9jYW4uYyBiL2RyaXZlcnMvbmV0
L2Nhbi94aWxpbnhfY2FuLmMKaW5kZXggMDQ1ZjA4NC4uNmRlNTAwNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9uZXQvY2FuL3hpbGlueF9jYW4uYworKysgYi9kcml2ZXJzL25ldC9jYW4veGlsaW54X2Nh
bi5jCkBAIC02MTIsNyArNjEyLDcgQEAgc3RhdGljIGludCB4Y2FuX3N0YXJ0X3htaXRfbWFpbGJv
eChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqbmRldikKICAqCiAgKiBS
ZXR1cm46IE5FVERFVl9UWF9PSyBvbiBzdWNjZXNzIGFuZCBORVRERVZfVFhfQlVTWSB3aGVuIHRo
ZSB0eCBxdWV1ZSBpcyBmdWxsCiAgKi8KLXN0YXRpYyBpbnQgeGNhbl9zdGFydF94bWl0KHN0cnVj
dCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KQorc3RhdGljIG5ldGRldl90
eF90IHhjYW5fc3RhcnRfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2Rldmlj
ZSAqbmRldikKIHsKIAlzdHJ1Y3QgeGNhbl9wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7
CiAJaW50IHJldDsK
