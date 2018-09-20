Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,12/22] net: ovs: fix return type of ndo_start_xmit function
From: YueHaibing <yuehaibing@huawei.com>
Message-Id: <20180920123306.14772-13-yuehaibing@huawei.com>
Date: Thu, 20 Sep 2018 20:32:56 +0800
To: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, dev@openvswitch.org, YueHaibing <yuehaibing@huawei.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtl
IHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCnRoaXMgZHJpdmVyIGhhcyByZXR1cm5zICduZXRk
ZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCnJldHVybiB0eXBlIHRvIG5l
dGRldl90eF90LgoKRm91bmQgYnkgY29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBuZXQvb3BlbnZzd2l0Y2gvdnBvcnQtaW50
ZXJuYWxfZGV2LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL25ldC9vcGVudnN3aXRjaC92cG9ydC1pbnRlcm5h
bF9kZXYuYyBiL25ldC9vcGVudnN3aXRjaC92cG9ydC1pbnRlcm5hbF9kZXYuYwppbmRleCBiYjk1
YzQzLi4yNmY3MWNiIDEwMDY0NAotLS0gYS9uZXQvb3BlbnZzd2l0Y2gvdnBvcnQtaW50ZXJuYWxf
ZGV2LmMKKysrIGIvbmV0L29wZW52c3dpdGNoL3Zwb3J0LWludGVybmFsX2Rldi5jCkBAIC00Myw3
ICs0Myw4IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZXJuYWxfZGV2ICppbnRlcm5hbF9kZXZfcHJpdihz
dHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KQogfQogCiAvKiBDYWxsZWQgd2l0aCByY3VfcmVhZF9s
b2NrX2JoLiAqLwotc3RhdGljIGludCBpbnRlcm5hbF9kZXZfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAq
c2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KQorc3RhdGljIG5ldGRldl90eF90CitpbnRl
cm5hbF9kZXZfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqbmV0
ZGV2KQogewogCWludCBsZW4sIGVycjsKIApAQCAtNjIsNyArNjMsNyBAQCBzdGF0aWMgaW50IGlu
dGVybmFsX2Rldl94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpu
ZXRkZXYpCiAJfSBlbHNlIHsKIAkJbmV0ZGV2LT5zdGF0cy50eF9lcnJvcnMrKzsKIAl9Ci0JcmV0
dXJuIDA7CisJcmV0dXJuIE5FVERFVl9UWF9PSzsKIH0KIAogc3RhdGljIGludCBpbnRlcm5hbF9k
ZXZfb3BlbihzdHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KQo=
