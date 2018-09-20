Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,13/22] net: xen-netback: fix return type of ndo_start_xmit function
From: Wei Liu <wei.liu2@citrix.com>
Message-Id: <20180920140549.xdowevpqjw45otjx@zion.uk.xensource.com>
Date: Thu, 20 Sep 2018 15:05:49 +0100
To: YueHaibing <yuehaibing@huawei.com>
Cc: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, dev@openvswitch.org
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBTZXAgMjAsIDIwMTggYXQgMDg6MzI6NTdQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBUaGUgbWV0aG9kIG5kb19zdGFydF94bWl0KCkgaXMgZGVmaW5lZCBhcyByZXR1cm5pbmcg
YW4gJ25ldGRldl90eF90JywKPiB3aGljaCBpcyBhIHR5cGVkZWYgZm9yIGFuIGVudW0gdHlwZSwg
c28gbWFrZSBzdXJlIHRoZSBpbXBsZW1lbnRhdGlvbiBpbgo+IHRoaXMgZHJpdmVyIGhhcyByZXR1
cm5zICduZXRkZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCj4gcmV0dXJu
IHR5cGUgdG8gbmV0ZGV2X3R4X3QuCj4gCj4gRm91bmQgYnkgY29jY2luZWxsZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+CgpBY2tlZC1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
