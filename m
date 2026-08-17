Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6417451993;
	Mon, 17 Aug 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985487; cv=pass; b=C6QZu0nGsx5CTW04IRgILnoSitMVlz+4f5syokIcA3C37Ju5Ye2mCvinVJNAa5KOxBHceWqFk+bPcbicgwdwH15+5nDDOHDkhShI+Ke8yxtLOzSisNmtrrdBAie2jO4BObsPfxyFkovlHTIhFUo2+X4DjKWFcDRdC+31Bc6Ma3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985487; c=relaxed/simple;
	bh=KyXVWOSX4dh6aslASAdQkhPTqAjbvMQN5LypY6fgL2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHDUqvoIGpXljC9YC76jtzrkLHHVCKH1veoz/ghuYOM3rnQb4/r+GGmI7SkL0eMbnu9Fzy98DuPcR3KJHSeQSSQrNxTi4lF7OzwJY1Hqa5Kwglou9CjlGHTSVpLAzFVKnEs3VaAQVBiXbRCf03zEnM959e8LaNzqFhy2c59NAU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=dhWaKPrB; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="dhWaKPrB"
ARC-Seal: i=1; a=rsa-sha256; t=1786985444; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EZkKHJPVurUQDXKaVt/m0NoukL/HAQCAECxB89aVZXrDrJGKhQj0JEdRpLjuaPFW12cTyVM7zN+68Y3LeBhzbYvAAZezftXl/OI4uwcJd/Jy5BLrKUk7Bg0dCp7ENy0L22dImPYJW5iTPkOvNXrXnvlxK7b/riKzh95Csvsa9J8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786985444; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p8BZPxQ0vjdM5ZAqdpodk/sQuicx5+EqnBVZoatnyUw=; 
	b=KAXnjCklo1HB7ter3rjySfraFGngAMJDcSJsmMy2ez0k0NKymd1cmPZxtwZmM9tFKHx3fo5flqFxfH/bYrM+wm0RG+KlJXmGPXU1BXAHoDv6CEvB7D/tDhp+GR70LxVkLb654yV62G00nUm1pfpHDNt+SVdy/eKth4c5XmnRnIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786985444;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=p8BZPxQ0vjdM5ZAqdpodk/sQuicx5+EqnBVZoatnyUw=;
	b=dhWaKPrBowXvCR3m0H6MhzbCgJ2sxmBVrFIa4RHVPxBRQKKI7U7f/JeUYcoTKnno
	pS6cBHVvjWM3tTeCIP2dlUMLG/ns/Ac/abXY3rmVYnrjh3C7CKEM8wJAkV9zaS9yNdm
	NiUzK4h5lvbB5JWBWagb/FvSz1PNi94dwDB1G9mc=
Received: by mx.zohomail.com with SMTPS id 1786985441065941.6995277721651;
	Mon, 17 Aug 2026 09:50:41 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id CE641182033; Mon, 17 Aug 2026 18:50:34 +0200 (CEST)
Date: Mon, 17 Aug 2026 18:50:34 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, William Wu <william.wu@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Message-ID: <aoM5PBrT5pBPS63N@venus>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260815121608.64818-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idisms6hiinp7qil"
Content-Disposition: inline
In-Reply-To: <20260815121608.64818-1-royalnet026@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.975.6
X-ZohoMailClient: External


--idisms6hiinp7qil
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
MIME-Version: 1.0

Hello Igor,

On Sat, Aug 15, 2026 at 02:16:01PM +0200, Igor Paunovic wrote:
> Hi Sebastian,
>=20
> I retested v14 on my Orange Pi 5 Plus, this time covering the phy-core
> notifier patch and the new dwc3 glue patches (28/38-31/38), which do not
> carry my tag yet.
>=20
> Test kernel: 7.2.0-rc7, built from your rockchip-devel branch at
> ea51774c5c42 ("usb: typec: mux: initialize mux switch array"), which
> already contains the whole v14 series (I checked that 1/38 and 28/38-32/38
> are in that history, plus all 32 "phy: rockchip: usbdp:" commits are
> ancestors of it).
>=20
> On top of that base I carry 50 local commits - display, GPU, media and
> platform work. None of them touch drivers/usb/, drivers/usb/typec/ or
> phy-rockchip-usbdp.c, but two are worth naming so you know exactly what
> was under test:
>=20
>   - drivers/phy/rockchip/phy-rockchip-snps-pcie3.c: a one-line fix to the
>     PCIe combo PHY SRAM-init check. Unrelated to this series.

That's a completley unrelated :)

>   - arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts: in mainline
>     this board still has the old single-"port" graph for usbdp_phy0 and no
>     altmodes node on the usb-c-connector, so there is no DP alt mode to
>     exercise at all. I carry a local DT patch that converts usbdp_phy0 to
>     the four-port "ports" graph and usb_host0_xhci to the two-port graph
>     your bindings describe, and adds an altmodes/displayport node
>     (svid 0xff01) to the connector. That DT change is mine, it is not in
>     mainline and not part of v14 - so everything below is your v14 code,
>     unmodified, driven by that DT.

Sure, Otherwise you cannot test.

> The USB-C link runs through an Epico EC65 "UltraLink 8K/60Hz HDMI to
> USB-C" cable - an active DP alt-mode to HDMI converter (GsCooLink chip,
> USB VID 0x3679) - into the HDMI input of a Samsung Odyssey G70B. So the
> DP link partner your code negotiates with is that converter, not a
> monitor directly.

Correct, the most important part is the DP to HDMI adapter in your
case.

> What I actually exercised, running this kernel as my daily driver since it
> booted on 2026-08-14 at 20:09 local time (17+ hours of continuous uptime
> when I ran these checks):
>=20
> - The new glue driver is bound to both controllers:
>=20
>     /sys/bus/platform/drivers/dwc3-rockchip/fc000000.usb
>     /sys/bus/platform/drivers/dwc3-rockchip/fc400000.usb
>=20
> - DisplayPort alt mode is active at the Type-C layer:
>=20
>     /sys/class/typec/port0-partner/port0-partner.0/svid   =3D ff01
>     /sys/class/typec/port0-partner/port0-partner.0/mode   =3D 1
>     /sys/class/typec/port0-partner/port0-partner.0/active =3D yes
>=20
>   driving DP-1 at 3840x2160@120 with HDR, simultaneously with two HDMI
>   outputs: HDMI-A-1 to a Sony TV at 3840x2160@60 and HDMI-A-2 to a second
>   Odyssey G70B at 3840x2160@120, both with HDR.
>=20
>   Two caveats about DP-1, both pre-existing on my setup and unrelated to
>   your series: the converter emits a broken Y420VDB block, so I feed the
>   connector a corrected EDID through edid_override, and after the EDK2
>   firmware hand-off DP-1 comes up "disconnected" with the cable present,
>   so a boot script does one unbind/bind of the fusb302 i2c device to kick
>   it. Neither workaround was touched during the hotplug test below.

obviously completley unrelated to USBDP PHY.

> - Hot unplug/replug of the USB-C cable. The xHCI host controller was
>   re-registered and the DisplayPort output came back on its own, with no
>   manual intervention:
>=20
>     13:00:56  kernel: xhci-hcd xhci-hcd.6.auto: USB bus 4 deregistered
>     13:00:57  kwin_wayland_drm: Removing output
>     13:01:26  kernel: xhci-hcd xhci-hcd.6.auto: xHCI Host Controller
>     13:01:26  kernel: xhci-hcd xhci-hcd.6.auto: Host supports USB 3.0 Sup=
erSpeed
>     13:01:29  kwin_wayland_drm: New output on GPU /dev/dri/card0: Odyssey=
 G70B
>=20
>   (kernel and compositor lines interleaved, abridged.) Note the ~30 s
>   between disconnect and re-registration - PD/alt-mode negotiation with
>   this converter is slow. After the replug the connector is back at
>   3840x2160@120 with HDR.

30 seconds for PD negotiation is indeed very slow. Usually it's at
least 10x faster. Have you checked for the root cause via TCPM log?
Also you might want to check if there are firmware updates available
for your adapter.

> - No messages at all from dwc3, dwc3-rockchip or the usbdp PHY for the
>   whole uptime, before or after the replug.
>=20
>   For completeness, the DP controller does print a burst of 32
>   "dw-dp fde50000.dp: timeout waiting for AUX reply" right after the cable
>   is pulled - that is the DRM side probing a dead link, it clears on
>   replug and is not from your code. The converter's billboard device also
>   logs one "cdc_acm 3-1:1.1: probe with driver cdc_acm failed with error
>   -22" per connect - a converter quirk, seen daily on this setup since
>   long before this kernel.

The billboard device should be on USB2, so this series does not
affect it.

> One thing I should not hide: I do get a WARN from tcpm, but I trigger it
> myself and it is not from this series:
>=20
>   WARNING: drivers/base/devres.c:1184 at devm_kfree+0xb8/0xd0
>   Call trace:
>     devm_kfree
>     tcpm_port_unregister_pd [tcpm]
>     tcpm_unregister_port [tcpm]
>     devm_tcpm_unregister_port [tcpm]
>     devm_action_release / release_nodes / devres_release_group
>     i2c_device_remove / device_release_driver_internal / unbind_store
>
> (trace abridged.) It fires when the boot script mentioned above explicitly
> unbinds fusb302 (i2c 6-0022), i.e. on the devres teardown path introduced
> by 48bf0f5f9ec8
> ("usb: typec: tcpm: add device managed port registration") and fcdd23c198=
4e
> ("usb: typec: fusb302: Switch to device managed resources") in
> rockchip-devel. Those are not part of v14 and I have not root-caused this,
> but since they are in the branch I tested I thought you would rather know.
> It does not fire on a normal cable unplug/replug, only on an explicit
> driver unbind.

That's unrelated to this series, but I fixed it up in rockchip-devel.

> I am sending the Tested-by tags as separate replies to 28/38, 29/38, 30/38
> and 31/38, so that they land on exactly those patches.
>=20
> I am deliberately not tagging 32/38 ("fix USB-C reconnect in gadget mode"=
).
> I have never used this board in gadget mode, so I cannot claim to have
> tested that path.
>=20
> One build issue to report, starting at 31/38
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The new glue driver cannot be built as a module once 31/38 is applied.
> 29/38 alone is fine - the glue it introduces only pulls in module.h,
> platform_device.h, pm_runtime.h and glue.h. It is 31/38 that adds
> #include "io.h" and the dwc3_readl()/dwc3_writel() calls.
>=20
> Reproducer: ea51774c5c42, arm64 defconfig plus CONFIG_USB_DWC3=3Dy,
> CONFIG_USB_DWC3_ROCKCHIP=3Dm, CONFIG_TRACEPOINTS=3Dy. The build then fail=
s at
> modpost:
>=20
>   ERROR: modpost: "__tracepoint_dwc3_readl" [drivers/usb/dwc3/dwc3-rockch=
ip.ko] undefined!
>   ERROR: modpost: "__traceiter_dwc3_readl" [drivers/usb/dwc3/dwc3-rockchi=
p.ko] undefined!
>   ERROR: modpost: "__tracepoint_dwc3_writel" [drivers/usb/dwc3/dwc3-rockc=
hip.ko] undefined!
>   ERROR: modpost: "__traceiter_dwc3_writel" [drivers/usb/dwc3/dwc3-rockch=
ip.ko] undefined!
>   make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
>   [...]
>=20
> dwc3_readl()/dwc3_writel() call trace_dwc3_readl()/trace_dwc3_writel(),
> and the dwc3 tracepoints are not exported - there is no
> EXPORT_TRACEPOINT_SYMBOL* anywhere in drivers/usb/dwc3/ - so a separate
> module cannot reference them. With CONFIG_TRACEPOINTS=3Dn the trace_* cal=
ls
> become empty inlines and this should not trigger; I only tested
> CONFIG_TRACEPOINTS=3Dy.
>=20
> dwc3-rockchip.c is the only glue driver in drivers/usb/dwc3/ that calls
> the core's dwc3_readl()/dwc3_writel(). dwc3-st.c also includes io.h, but
> it reads through its own st_dwc3_readl()/st_dwc3_writel(), and e.g.
> dwc3-keystone.c defines kdwc3_readl()/kdwc3_writel() - though those all
> access their own glue registers, not the core register block.
>=20
> Two ways to fix it, whichever you prefer:
>=20
>   - EXPORT_TRACEPOINT_SYMBOL_GPL(dwc3_readl) and (dwc3_writel) in
>     drivers/usb/dwc3/trace.c, or
>   - open-code the access in the glue, e.g.
>     readl(dwc->regs + DWC3_GUSB3PIPECTL(port) - DWC3_GLOBALS_REGS_START),
>     at the cost of losing the dwc3_readl/dwc3_writel trace events.
>=20
> I worked around it locally with CONFIG_USB_DWC3_ROCKCHIP=3Dy, which is how
> the kernel I tested above was built. Note that "default USB_DWC3" means
> the glue follows the core: with CONFIG_USB_DWC3=3Dy the default is =3Dy a=
nd
> the problem stays hidden, but with CONFIG_USB_DWC3=3Dm the default would =
be
> =3Dm. I have not build-tested the CONFIG_USB_DWC3=3Dm case. The Kconfig e=
ntry
> added by 29/38 does promise "Say 'Y' or 'M' if you have such device."

Thanks, I only tested non-modular and defconfig (which is modular,
but does not have CONFIG_TRACEPOINTS=3Dy). I don't see a good reason
for duplicating dwc3 readl/writel. Exporting is the reasonable thing
to do and will be done in the next version.

> This reply was prepared with the help of Claude (Anthropic). The board,
> the tests and the measurements are mine, and I checked every claim above
> before sending.

Ideally you trim down its wall of text in future mails.

Greetings,

-- Sebastian

--idisms6hiinp7qil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqDO88ACgkQ2O7X88g7
+ppLkA/9EPvTTlKH1OgWZB43TAFj/qGbrDbtMl6ILE70Ry9qpwqf0y7vF7Gc3xK5
9A7ryEMJCOFOkGsBIYfH/SkX3FTM3sGZuoSEigh9NwJiNBucPd5SxHWS30aO5+h8
UFHH3kh/FDN4wF0O+Cn/VSe3kF+P2WBUIovZn/w6Bc/SfOP5vWuhVflHuYgSqUXQ
PANLgDpKlqbu96ssBMxAJ1GYoCTFIe7Rya92jdKYJspTmQ8hAZ21PpANKdB+iUNC
qYU42HZlsKcem7MVkJ+RhOMRsV6Cnhn+J1QZVe0wOJrixZVy6b8euDYhF/jsL4RF
cYqgUGYesyR0ui4yzh2iokK938/TgezLKEkae4faLaPy1oSss8iA8ER3Bpx8zUH4
ar9i61Kpfzs3c09RJOAEM3dUS67ZAe5oJ+m8ws6EIwKMcIiwbOcgUrNQH2c3+Zer
vANrXxml6KLrKA0x7Jk8WoijJAhnx8r57P3/SIxh6p3VhtTHDxtHh6OZOcQPdpXi
3fdhhhSDgP8Hi1WgO65AsvpLhC+k0UJWr2AyzwHPx6EzWFbiJegrL4whzSxlt6Od
XLxTu+afmbvGeZsCcgx3mhJOu9jU3QGwCXBT5TclwB/RDGT/+rKypf/4VUbYXvZR
U2s0jB8L7eMgXOlzpfGduQkflh5rBX/5RmhIFX81iDN028V4olU=
=EIL6
-----END PGP SIGNATURE-----

--idisms6hiinp7qil--
