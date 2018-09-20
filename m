Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,19/22] net: plip: fix return type of ndo_start_xmit function
From: YueHaibing <yuehaibing@huawei.com>
Message-Id: <20180920123306.14772-20-yuehaibing@huawei.com>
Date: Thu, 20 Sep 2018 20:33:03 +0800
To: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, dev@openvswitch.org, YueHaibing <yuehaibing@huawei.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtl
IHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCnRoaXMgZHJpdmVyIGhhcyByZXR1cm5zICduZXRk
ZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCnJldHVybiB0eXBlIHRvIG5l
dGRldl90eF90LgoKRm91bmQgYnkgY29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9wbGlwL3BsaXAuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9wbGlwL3BsaXAuYyBiL2RyaXZlcnMvbmV0L3BsaXAv
cGxpcC5jCmluZGV4IGZlYjkyZWMuLjBiMzU0ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3Bs
aXAvcGxpcC5jCisrKyBiL2RyaXZlcnMvbmV0L3BsaXAvcGxpcC5jCkBAIC0xNDYsNyArMTQ2LDcg
QEAKIHN0YXRpYyB2b2lkIHBsaXBfaW50ZXJydXB0KHZvaWQgKmRldl9pZCk7CiAKIC8qIEZ1bmN0
aW9ucyBmb3IgREVWIG1ldGhvZHMgKi8KLXN0YXRpYyBpbnQgcGxpcF90eF9wYWNrZXQoc3RydWN0
IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldik7CitzdGF0aWMgbmV0ZGV2X3R4
X3QgcGxpcF90eF9wYWNrZXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2Ug
KmRldik7CiBzdGF0aWMgaW50IHBsaXBfaGFyZF9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
c3RydWN0IG5ldF9kZXZpY2UgKmRldiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBzaG9ydCB0eXBlLCBjb25zdCB2b2lkICpkYWRkciwKIAkJCSAgICBjb25zdCB2b2lkICpz
YWRkciwgdW5zaWduZWQgbGVuKTsKQEAgLTk2Miw3ICs5NjIsNyBAQCBzdGF0aWMgX19iZTE2IHBs
aXBfdHlwZV90cmFucyhzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
KQogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm5sLT5sb2NrLCBmbGFncyk7CiB9CiAKLXN0YXRp
YyBpbnQKK3N0YXRpYyBuZXRkZXZfdHhfdAogcGxpcF90eF9wYWNrZXQoc3RydWN0IHNrX2J1ZmYg
KnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgbmV0X2xvY2FsICpubCA9
IG5ldGRldl9wcml2KGRldik7Cg==
