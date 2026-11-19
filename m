Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795082604;
	b=cl1SbMtsNEEoD/IA6U2aIQ4tASD5zupo1fSGRdg9yV/W9GDSMYjDMKA88qRoltsHC9XA
	 FvQUOBTVu0ugjbj7o6sEkH4nxFlf7tf4ugD/0hG7P9e/aNuC81jmLV/lGABwEtOUR3CEL
	 o0p1W6il3v/ryGNYXVZ8rKS/qF1eCj7wGrquy92rtEB32NjhxOfVR08G6EyQsYk8Q3xi/
	 7Jzi8RGiQu/gMph0lH6jG2Z1G2nT7tOSC6B5dHpKFv9L1AQAQM2tjS57ThAJ2XUT4VTPk
	 Jc6CC3CVPhstBXI1Yg1kuNMBXs2XrB/4uncRXtr7YiEeK/bExUgCJYpsYxpahcONXOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082604;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=qpnpb/DbFPYWEl8ZMKRc5qzA+2nyosjDCbcMAe2fdIE=;
	b=WGHbtwBV0dHvXUuqPOOdcZWrRIX4fQ4Bk9gup7WeE7/2DLeLFXPFMOAMPLZ1WaEUZbO9
	 +iV75ALigWDJ9+BKYj4Dqb6ON3j4FV3CLfYtD27uwN8dtso5NoMPQGfEujK4KrEMtP+J3
	 TG2KpnntpFrXT1HU5PxhTOdjpM86FA0iN5yFmTER+51e5vuWzzhEowFJrZkuWiOfr7nss
	 RDQLEnTygbVn6/fbtp2pIjYHL6fyzrxtQ92mADa/go1Gz8LM2ISdUy3Ym/6VxGuD0iIXI
	 T/zsMi2KObVpSkmFil/VewFyOxZLf6twboO/7EtnaIGFnLLE51gm3LIQWmie4Pdl5Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THq0gMl7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD00606A320;
	Thu, 19 Nov 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THq0gMl7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795082604;
	b=FlwLWTEfRwN8M+31o5cyw//2Lcu/Grf9fJghawTfjwfiYmOnm3rzT3dsMMq7fPPKR4m8
	 5wzBh3PMAEEgoUgyxLrslWMW7uKNgRF+JJUm/Bj8HspQLeBVuwCt4drwoXbpgrTwJYNN5
	 xF9nS+WTwHV/DeDAa1OE4DXGskaqW4olJtt+cJJqy0suqgjgv31ELw4K40ZxFoI5u3uO+
	 0OOxj2F6YVVxGFkPjc26MvGMH2qRvqSeM/BkEOLUimTxXlqb+khWXPfUMDtoi2kYwCMyh
	 T2kJVSwXrJ76Tpiifw25tlXogQfPdyikfpWUB64tpNFhUJr5bHC5gZp80sU0AT+z9wQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082604;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=qpnpb/DbFPYWEl8ZMKRc5qzA+2nyosjDCbcMAe2fdIE=;
	b=I86Hfh0SxdHiiNUrcG9T2ZbHpfWYeEl2r4QxfowtCFY2+FkBAma5Q6Jb8Fiq11e8CNoT
	 DdJjitzFgq4DsJzz0nl5zVwRWXQgJPhuJBu9tAmwQDa99/kIXBuMDD6WLGQUUxnIgGwFS
	 We0yBuOMmr2bNf3xAeXMJ+X4FEcK9DD5UP05DS7AdPUmHQLyXe3JkYCIeauR4ycw9kPq8
	 YxzE3Dx3PaLsNYNwx1M2GF4wcGG4Lu0hxv3xtOVzthJRiNj4Hi4L2Pl4XCDFWoI14aLLa
	 DwpiE1tnSsJSdzgY+qL97aECz2GcQ/Me/YUg+6uDUp3RM2Z7JkLqsdES7DEcYkU8kag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98F851F000C5;
	Thu, 19 Nov 2026 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082604;
	bh=qpnpb/DbFPYWEl8ZMKRc5qzA+2nyosjDCbcMAe2fdIE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=THq0gMl73/joF15mOhXw1p3LsKuEDk7efkND6XONRKoIDkFlKq09N+pZJCttYlqzi
	 MFgU2LceFku816NuBNSxRt0oVH/nJo/EjD6Ftn2TUJIhfaGGRMloDdUv5tMEH3MVk7
	 expqFUleexqK/KEXQYkzOh4RM0timXeUoXn5QUQPCOuB7sYAxTjOnU4fun/EiX7VDd
	 szCRT9j2KTnKgaOo0gBnIfgRxoznA30lUnXmHORtJHcdJFcgOxfeDo/4dymYvpRC47
	 g6Q06G7+MqLDdIljyiEyz6uBAh02dK8+IFMvF0Gg/+/LlIe5gG+FRQwU+kVFyr7Lkj
	 BnW7E9bvRC6Ig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ECB684B208;
	Thu, 19 Nov 2026 10:03:22 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v6 0/3] usb: core: Pair ports of different host controllers
 through their connector
Date: Thu, 19 Nov 2026 10:03:22 +0000
Message-Id: <20261119-usb-port-pairing-v6-0-32bd7e36e426@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTW7DIBAF4KtErEsEw49DVrlH1AWGwaFqbAscq
 1XkuxcnG2RZXT7pzffmSTKmiJmcD0+ScI45Dn0J+uNA3M32HdLoSybAQHPOGX3klo5DmuhoY4p
 9R21gQevAbAtIytmYMMSfF3n9fOf8aL/QTauzNm4xT0P6fW3OfO39w8+cMmoEaxCMB/Rw6e42f
 h/dcCcrP0MNwA4ABZAqKMstmMDDFhA1IHYAUQCvnUbfSiG52wKyBtQOIAsAygtnrHcO+BZQNXD
 aAVQBVCj/6+ZkoGE1sCzLH5uCoEfGAQAA
X-Change-ID: 20261110-usb-port-pairing-af0f66f0ab2e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082602; l=2316;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=6CIS3Zz+uxxB5Ymy9015y4VAUN2CMOYvUFqsT9mtKDk=;
 b=3DQ4h/0Fas3BsxHJQkWNbWc+qo9pYsJq/nAG5sclV/uGQG3RsVaDAojjuSqdSBEZVpra4FIRt
 1DNMMJTzRd6DVtx/MRPxIrIpqxGXhny4MZPIcCf/PYAf92w6BBOBmAA
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

On the RK3588, the USB 2.0 lines of the USB 3.0 host 2 connector go to
a separate EHCI, so the USB core pairs its SuperSpeed port with the
wrong USB 2.0 port, and a USB 3 device present at boot stays at 480 Mb/s.

Patch 1 pairs the ports through their usb-connector. Patch 2 fixes the
connect_type of a dwc3 SuperSpeed port with a USB 2.0 device node. Patch
3 resets the USB 2.0 port of such a device once, so that it retries
SuperSpeed. The Orange Pi 5 DT follows separately and needs Chen-Yu
Tsai's usb-hcd binding [1].

Tested on an Orange Pi 5 (7.3-based kernel with KASAN): a USB 3 disk
that enumerated on the USB 2.0 port moved to 5 Gb/s in 3/3 boots, 6/6
xHCI rebinds and 2/2 runtime-suspended resets. With DT overlays: ports
whose connector peer is not a USB node are paired by default, and a
SuperSpeed port shaped like the lckfb one reads hotplug. Not tested with
an external USB 3 hub; a device that stays at high speed was tested on
v5 only.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

[1] https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/

---
Changes in v6:
- Patch 1: take a connector peer only if it is or is under a "usb" node
  (Sashiko)
- Patch 1: connector_peer as a :1 bitfield, set before the port is
  registered (Alan Stern, Sashiko)
- New patch 2: dwc3 SuperSpeed port connect_type from the graph first (Sashiko)
- Link to v5: https://patch.msgid.link/20261118-usb-port-pairing-v5-0-5f1a26789270@gmail.com

---
Arun Iyengar (3):
      usb: core: Pair ports of different hubs through their connector
      usb: core: Prefer the graph for a dwc3 SuperSpeed port's connect_type
      usb: hub: Retry SuperSpeed for a device stuck on its USB 2.0 peer

 drivers/usb/core/hub.c  | 158 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/hub.h  |   5 ++
 drivers/usb/core/of.c   | 148 ++++++++++++++++++++++++++++++++++++++++-----
 drivers/usb/core/port.c |  89 ++++++++++++++++++++++++---
 include/linux/usb/of.h  |  13 ++++
 5 files changed, 390 insertions(+), 23 deletions(-)
---
base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
change-id: 20261110-usb-port-pairing-af0f66f0ab2e

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


