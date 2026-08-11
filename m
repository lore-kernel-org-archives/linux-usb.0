Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226393101D8
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 01:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786410076; cv=pass; b=JQuB8QGmOI1poakA2eu6jNSgLd+RgnGeE+GkYU9y8sZV5o1isQhmNJ5hjtVV/tsQ7bN95r5VJGICM7gH/yKv2zEMJVbRSNhL1opBVCbuKjRbl3Gi4kS9PCSW6colhNrQq8qyMJA90YmDEB2n7VlzRJPdvvnMB1Rt8zaLa0mae+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786410076; c=relaxed/simple;
	bh=ikrzNW38DkKxIYMT7Nc6jYhcaAg6y6pu4BvBD+PGUTM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=D4Mk9R22mIyKUhhPIxRXsQa+VlMpX/SJ/HBdpbK3CQ25vOvRwkTrMViEPqZSMUjhVrguoaiKys/GNHuO7BtM7b/b+fkxCm26WL/T5pMVqHUneJzNUxVcNxSPBGZxvSTUYyj/ZLxKRD5g5XAkKe1P34BBkwJpAAxmCxyJ2hCQ+Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmZSvNyx; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmZSvNyx"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso342652a12.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 18:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786410071; cv=none;
        d=google.com; s=arc-20260327;
        b=GXJkR4KDXUBtyYm4nwcGIXdmIEjcxCRsY93+I81rhjGG09HmzZFCTCJUanlIvwbS2Q
         hK7Z49UN74TXfyxxBC9Y91NqFOrf9ar1Gw5ICsUw5zxI2x8jDaGXtKpEjewdqWJFjbWp
         aJbw5T2itnfgU2LWETZaMi8Gn1v3bB3Crv+EIBOIKk5srWR70QcNNNNSF22WNJ6iajqp
         pDX5XtTSVht1xFtuOV0HLH3FMUTZI0JtMj1oHGu0UI5NkAJgEN97OUb5RrLq9vmqojqA
         NPJvLqRzEPTyBa5xF7L2Ssosg/zl/7r2pW2FW9IN7OAYjR0GPVh1iFf+WxYZ3qpR2b2p
         O71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=ikrzNW38DkKxIYMT7Nc6jYhcaAg6y6pu4BvBD+PGUTM=;
        fh=6ePAY9MspvEgcy56ihZjCh1jSrNynNIHmRI7/X30PIk=;
        b=WhsWUJ2ZiemioUAdXF7E53Wblum4cXLB+BO1orIl2tSCT55Elgon3uCPvLZOngyKPk
         plXKh4ZQW+EcvFO3lxAUWEBiDs/rtpvo4/IdPApHzzT78C20doxbsxP+5Ru/TeAZ57VD
         lX4OU2saL57eqIfpWDKpbtd6dvewam1uVWgAakwH+5pxqWcgHU4xe4Fs7+AFFuRkkida
         oI4daPuM6ZxRG/KXsJRYFk7uJU7SSB/QA4aIbwktlGnPFV2X5cbDzeP0gZtYCPNGqW50
         1zXI6/fPeTPXOFunypsLUs0m5ARwKKyCmnz6qeHo7psW7v9PwNSujzapcL83HFLz7rQ9
         jCGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786410071; x=1787014871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikrzNW38DkKxIYMT7Nc6jYhcaAg6y6pu4BvBD+PGUTM=;
        b=mmZSvNyxP2sE6G/+zr/OjA9jUFVxuG1rmfsK/031T2mJDEb64U+RRdXS1VINrlQJvR
         fwUutK7lnb7nq3lxwfpOKnmznJisZbWddu5pK2U4Y8WZrQCa+pnkIKxU7LGU8l8pbza5
         K2HoTiURMp6hACBoEZRJ3G50CN29U31p7CL72tlmWAuQEkzBGlHvXUy8oPOQYLWiLrvG
         gj2WOMX84k+JmYnOHIuUFBaNc+0OHqV8BTGT1H+bC8Y1PmX2YmbIWwnP5vf+LJcMRuLH
         07iBqu5J4K+fgVHEkLkObqTtwg/QyOgMEvPikg2rySq3YxE1vCjoIzeQ2xJGgGfzQnXH
         8hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786410071; x=1787014871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikrzNW38DkKxIYMT7Nc6jYhcaAg6y6pu4BvBD+PGUTM=;
        b=a/yYpm6+eqjQpmI2CTwmpZ7+QBEpNPtYhBYhk1UyGwt0CIvfbU6/QYFviVm+MbAtqU
         sSYdMCGf3w6uziXiUNu3LpQc7j34v0IzL69cPLH6+fZpfq1CoNw0w3ol2qfJ1dzLD+Rc
         2hLZdLhAwDlaZQVeYcPm03ZM4DrlGGDi5yz3wa4+AYXsofwqSwjirJERkMJDJzdWz+l8
         OWFUPPP+QA0bBWOWWhCWb96gtyKwxK/nqKirGLXWXWLwfsHyf8Dg7hzHKBsvjYfaht+5
         E/E3+qYxh+vL4P0u6fLwu7VzI80CLewJelJENnu8HOX9vnYeicW7z1u5aanuVV9G5E8M
         JuRw==
X-Forwarded-Encrypted: i=1; AHgh+RpEqpguokvM1IXcdpOt8BPNn84dpGYDudcovvxyQy2Zvf3clnxP/QbE6b+56O0VdqaHElf+c01Jscs=@vger.kernel.org
X-Gm-Message-State: AOJu0YygZ9wsqjbQB4UK0feElT5nIcOwLka/70FJbPWCryT9JQ8QscyD
	MrXaBVmUB1HqJQrjm/6bBxP6F1y9TJDNQApITcNUelJT81h+24ZzHTcN4vcd/8MIQ1HLzPW8pwN
	k0fIa1RSQwNQ/6jWsxK1xXkzoOqAdjPg=
X-Gm-Gg: AR+sD12lLIcgbPUpjJpqEjxpLY+Uf7mOHDYd4exRZiXtkFqPnNwfEEnC2kjfTZcxpcU
	c/86ZPFHPrmUSyKsWi0NkRyaO000eAhdByej17WUcvx28bR+g+nMAMNspq+wNX2LnDTlTllZiqJ
	J4R1NMlwmazEXK96ZKsCQFAW5J/IB7P6AYyE7cNWuGBUZ4cM6ybrst+k7iT1NZAhsAraVhJgN+E
	y5tIhR/VR6JDNIQIEzXPKRhGzq9dZRq8DTuVdmQ40aTRSgswH7s9ej1WeR9waPIM4VRZ1mweh8P
	fBJDx/ykB1sjaalap3zGLAa+wk1fdOY1mM7TMfGFGax3
X-Received: by 2002:a05:6a20:6f04:b0:3b2:8674:9830 with SMTP id
 adf61e73a8af0-3cc22f3a917mr2527771637.14.1786410071036; Mon, 10 Aug 2026
 18:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Max Stevens <thinker.healer@gmail.com>
Date: Mon, 10 Aug 2026 20:00:59 -0500
X-Gm-Features: AUfX_myCFEgdwEKjmTFvdmSjhpfg_YFpKnd-DekweJSD1mBc-ikP--wRPue04JM
Message-ID: <CADoo8uyrmw_GkNgNf+bV_pieYN_gn5i49rOF8jUvSsfPOcqCJA@mail.gmail.com>
Subject: =?UTF-8?Q?Pericom_PI7C9X2G608_=2812d8=3A2608=29_missing_from_ACS_qui?=
	=?UTF-8?Q?rk_=E2=80=94_breaks_Renesas_uPD720202_USB3_cards_when_IOMMU_is_on?=
To: linux-pci@vger.kernel.org
Cc: bhelgaas@google.com, nathan@nathanrossi.com, 
	nicolas.cavallari@green-communications.fr, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to report that the Pericom PI7C9X2G ACS erratum handled by
pci_fixup_pericom_acs_store_forward() also affects the 6-port variant
of the switch, PI7C9X2G608GP (12d8:2608), which is not covered by the
existing quirk (2404/2304/2303, and b404 recently proposed by Nicolas
Cavallari). On this switch the erratum is severe enough to make an
entire class of consumer USB 3.0 cards completely non-functional on
any system with the IOMMU enabled.

Hardware

StarTech PEXUSB3S44V-style 4-port USB 3.0 card ("one dedicated channel
per port", widely sold ~2016 for Oculus Rift sensors). Topology:

00:1d.0 Intel Z690 PCH root port 07:00.0 Pericom PI7C9X2G608GP switch
upstream [12d8:2608] (x4 gen2) 08:01.0 - 08:04.0 switch downstream
ports [12d8:2608] 09:00.0 - 0c:00.0 4x Renesas uPD720202 xHCI
[1912:0015] (rev 02)

System: Alder Lake / Z690, kernel 6.18.43 (Void Linux), VT-d enabled,
booted with iommu=3Dpt (default domain: passthrough). Firmware for the
uPD720202s is the correct v2.0.2.6 image (sha256 177560c2...) and
uploads successfully on every probe.

Symptom

With the IOMMU on, the kernel enables ACS on the switch's downstream
ports (ACSCtl: SrcValid+ ReqRedir+ CmpltRedir+ UpstreamFwd+). The four
xHCI controllers then probe cleanly, register their buses, upload
firmware, and report port connect status normally =E2=80=94 but any device
plugged into any port fails enumeration with:

xhci-pci-renesas 0000:09:00.0: Error while assigning device slot ID:
Command Aborted xhci-pci-renesas 0000:09:00.0: Max number of devices
this xHCI host supports is 32. usb usb3-port1: couldn't allocate
usb_device

All four controllers fail identically. xhci debugfs portsc shows the
port stuck at "Connected ... Link:Polling" while the Enable Slot
command times out. Posted writes from the endpoints still work (MSI-X
interrupts for port change events are delivered), but the controllers
appear unable to complete DMA reads (command ring fetch) =E2=80=94 consiste=
nt
with the known PI7C9X2G packet-buffering erratum when P2P Request
Redirect is enabled. No AER/DMAR errors are logged for the failed
requests.

Confirmation

Clearing ACS control on the downstream ports at runtime and rebinding
the drivers immediately and fully fixes the card:

for p in 08:01.0 08:02.0 08:03.0 08:04.0; do setpci -s $p
ECAP_ACS+6.w=3D0x0000 done

+ unbind/rebind xhci-pci-renesas for each 0x:00.0

After this, all four controllers enumerate devices normally and the
card works (tested with HID devices, hubs, and mass storage).
"pci=3Ddisable_acs_redir=3Dpci:12d8:2608" is my current persistent
workaround.

Given that the 2G404/2G304/2G303 (and b404) already have the
store-and-forward fixup, could 12d8:2608 be added as well? I'm happy
to test a patch, and can provide full lspci -vv dumps, dmesg, or
register reads from the switch on request. I can't say whether the
store-and-forward vendor register of the smaller switches exists at
the same offset on the 2G608, but I'm glad to poke it under
instruction.

These cards were sold in large numbers and every Linux report I can
find about them (Arch, FreeBSD, Proxmox, Unraid forums) describes
unexplained failures or dropped input events with no root cause
identified =E2=80=94 this quirk gap likely explains most of them.

Thanks, Maximo Paulino
