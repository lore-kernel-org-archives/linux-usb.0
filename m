Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,20/22] rionet: fix return type of ndo_start_xmit function
From: YueHaibing <yuehaibing@huawei.com>
Message-Id: <20180920123306.14772-21-yuehaibing@huawei.com>
Date: Thu, 20 Sep 2018 20:33:04 +0800
To: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, dev@openvswitch.org, YueHaibing <yuehaibing@huawei.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtl
IHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCnRoaXMgZHJpdmVyIGhhcyByZXR1cm5zICduZXRk
ZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCnJldHVybiB0eXBlIHRvIG5l
dGRldl90eF90LgoKRm91bmQgYnkgY29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9yaW9uZXQuYyB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvcmlvbmV0LmMgYi9kcml2ZXJzL25ldC9yaW9uZXQuYwppbmRl
eCBlOWYxMDFjLi5kZTM5MWM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9yaW9uZXQuYworKysg
Yi9kcml2ZXJzL25ldC9yaW9uZXQuYwpAQCAtMTcwLDcgKzE3MCw4IEBAIHN0YXRpYyBpbnQgcmlv
bmV0X3F1ZXVlX3R4X21zZyhzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAq
bmRldiwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCByaW9uZXRfc3RhcnRfeG1pdChzdHJ1
Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqbmRldikKK3N0YXRpYyBuZXRkZXZf
dHhfdAorcmlvbmV0X3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9k
ZXZpY2UgKm5kZXYpCiB7CiAJaW50IGk7CiAJc3RydWN0IHJpb25ldF9wcml2YXRlICpybmV0ID0g
bmV0ZGV2X3ByaXYobmRldik7Cg==
