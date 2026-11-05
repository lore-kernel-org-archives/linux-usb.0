Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868162;
	b=q53df+IOt9yiLYuWgH079APZB0EpVMwIXuMy4ay/1lI+/Xd6kvXDx71ZnfRt2EydEc4c
	 6LcJDj8x7WknuVGliHJwH0B8ZOo3ro/eR29q7sW5xqCQUvOInYQy4GlHv1ulOCLKGDI6b
	 gPWhfJoxe1Tp33JgX9UipXg2RfWovgCcGsURcdXdcookbA8XV0Qw7sVysoSswBTi6q5ag
	 EL2c/4TFvSuF7RgWXbpgE0G2YmZVerWwguDzdhpzbyuDxQTjRttvmJijb3LB7exHDn5OC
	 ZMycmhe2qyIlZUeZjHuRWcEI1wvVmW5VtU7XKuhW86Xqp4Z1nGwUbwjBokXH5rhS77w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868162;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=bHqBGhnJycSgsq2YOWCzLosFglvrJexSdwgpxlJd234=;
	b=Jam6Xb8ufwRAjcXWKcYak7pbWl9c91kLe6pjnGfPXfuFbHUzJeo/PgfukGFT5/sSmt1I
	 ZDP2FfOmJHZSb1HXN8QKf9j9m8E7YBZGRAs6ejz1bRbQTKWQbzKRG/RPGahdb7f5VMe+y
	 G7aLo21kG9GoNT49o+supK/Ve2KnK4O6WugBGRF18t2MaqkZFhpzolifM6y4nsBPS/V7Y
	 ZCCNAGwndUJ8bhbVjmqdVEw8N0lC7b9rxvNUTHGesVH/R9qCcznjndSgh3x4acEiOouT8
	 cnXRK0rPT+oohF6FfB8BqYrYqMbkwnCXFTpu79uDEr/qBSNm0Y2RB+zQ1dMHAJpqRHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tWfflMfm;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B8F606A328
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 08:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B8F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tWfflMfm
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bHqBGhnJycSgsq2YOWCzLosFglvrJexSdwgpxlJd234=;
	b=tWfflMfmVVCfMc1ZNeVuiJni+J7wzQtM1EZ8EIkLqVVD81/6t48A2EEjxXHyfedASbm8jaREF
	sJDsUvidiQQhM8Jca++bRGeohxgQ6V9IUz1XBSjp4RcpepKTuJE8blXDvz/sHjfT2E9tJBX++XS
	AFWPMJXviQ0FenxeeQWY/qY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jKwmM71VhzRhS8;
	Thu,  5 Nov 2026 16:42:27 +0800 (CST)
Received: from whupemk100010.china.huawei.com (unknown [7.152.184.41])
	by mail.maildlp.com (Postfix) with ESMTPS id C2C4440538;
	Thu,  5 Nov 2026 16:42:34 +0800 (CST)
Received: from vm.huawei.com (7.238.34.231) by whupemk100010.china.huawei.com
 (7.152.184.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 16:42:33 +0800
From: Pengfei Lv <lvpengfei20@huawei.com>
To: <linux-usb@vger.kernel.org>
CC: <stern@rowland.harvard.edu>, <michal.pecio@gmail.com>,
	<gregkh@linuxfoundation.org>, <sashiko@sashiko.dev>,
	<xuhaiyang5@hisilicon.com>, <xuetao09@huawei.com>, <caiyadong@huawei.com>,
	<suzhuangluan@hisilicon.com>, Pengfei Lv <lvpengfei20@huawei.com>
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Date: Thu, 5 Nov 2026 16:41:59 +0800
Message-ID: <20261105084159.1495843-1-lvpengfei20@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104124402.1269650-1-lvpengfei20@huawei.com>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemk100010.china.huawei.com (7.152.184.41)

Alan Stern wrote:
> > xhci_check_maxpacket() sees hw==sw==8 and does not issue an Evaluate
> > Context command.
>
> That's exactly what we want it to do.

Thank you both for the detailed review.  Let me answer the questions
and share what we observed in actual testing, and then address the
concern about initialization raised later in the thread.

This is a real problem observed in production on the 6.6 LTS kernel,
not theoretical.  The device is a Full-Speed USB banking token (U-key)
with bMaxPacketSize0 = 8.  The failure is 100% reproducible in a
virtual-machine USB passthrough scenario: after the VM sends
USBDEVFS_RESET to re-claim the device, the reset re-enumeration hangs
every time on kernels containing ff33299ec8bb.

> Have you observed this problem in actual testing or is it purely
> theoretical?

We captured the bus traffic with an Ellisys analyzer on both a 5.10
kernel (before ff33299ec8bb, works) and a 6.6 kernel (after
ff33299ec8bb, hangs).  The device behavior is identical in both
captures; only the host's short-packet detection differs.

The failing transfer is the 64-byte GET_DESCRIPTOR(Device) that
get_bMaxPacketSize0() issues under the "new scheme".  Here is the
side-by-side comparison of that single control transfer:

  5.10 (works, ep0 max_packet = 64)        6.6 (hangs, ep0 max_packet = 8)
  ---------------------------------------  ---------------------------------------
  SETUP  80 06 00 01 00 00 40 00          SETUP  80 06 00 01 00 00 40 00
  IN (x2, device NAK)                     IN (x2, device NAK)
  IN     12 01 10 01 00 00 00 08          IN     12 01 10 01 00 00 00 08
  OUT    (status stage, transfer done)    IN (x 482748, device never replies)
                                          ... 5 s timeout ...

Both captures show the device returning the same 8-byte packet
(the first 8 bytes of the 18-byte device descriptor; the last byte
08 is bMaxPacketSize0) and then going silent — no more data, no
ZLP.  On 5.10, 8 < 64 is a short packet, so the transfer completes
in < 0.1 ms and enumeration proceeds.  On 6.6, 8 == 8 is not a
short packet, so the host keeps issuing IN tokens (482748 of them)
until the URB times out ~5 s later.

After the timeout the reset-retry path eventually falls back to the
"old scheme", which issues an 8-byte GET_DESCRIPTOR, and the device
becomes usable for that iteration.  But the root cause is still
present, so the next reset — whether triggered by the kernel retry
or by the VM application re-issuing USBDEVFS_RESET — takes the
"new scheme" path again and hangs the same way.  The device is
never reliably usable in the VM.

> > If the device's first data packet is exactly 8 bytes and it sends
> > no ZLP, the xHC does not recognise a short packet, keeps issuing
> > IN tokens for the remaining 56 bytes, and the control transfer
> > hangs in the Data stage until URB timeout.
>
> That is the correct behavior.

> > (A standard 18-byte descriptor returned as 8+8+2 is not affected
> > because the final 2-byte packet is a short packet.)
>
> Quite right.  Why wouldn't the device reply with a standard 18-byte
> descriptor in this situation?

This is the key point, and it also answers the later question about
why the device ever gets through initialization:

  - For a 64-byte GET_DESCRIPTOR (wLength=64, the get_bMaxPacketSize0
    probe), the device sends exactly one 8-byte packet and then stops
    responding to IN tokens.  It relies on the host's short-packet
    detection with max_packet=64 to terminate the transfer after that
    first packet.  Both the 5.10 and 6.6 captures confirm this; the
    device's bus behavior is identical.

  - For an 18-byte GET_DESCRIPTOR (wLength=18, the
    usb_get_device_descriptor() read that runs after SetAddress), the
    same device sends the full 18 bytes as 8 + 8 + 2.  The final
    2-byte packet is a short packet regardless of whether max_packet
    is 8 or 64, so this transfer succeeds on both kernels.

So the two GET_DESCRIPTOR transfers are not the same request and do
not get the same response.  The 64-byte probe is the one that hangs
when max_packet=8; the 18-byte read never hangs because its last
packet is always short.  That is why the device can complete
initialization (the 18-byte read works) yet still hang on reset
re-enumeration (the 64-byte probe does not).

> If the device would hang when asked to send the remaining descriptor
> bytes, how would it ever get through initialization?  The procedure
> does two resets, and after the second reset the device has to send
> the full descriptor.

It sends the full descriptor for the 18-byte read, and that is the
read that runs after the second reset (SetAddress is followed by
usb_get_device_descriptor(), wLength=18).  The transfer that hangs is
the earlier 64-byte probe, which only runs on the "new scheme" path
and only before SetAddress.

To understand why the first enumeration succeeds but a reset hangs,
it helps to track the xHC ep0 max_packet across the lifecycle:

  - First enumeration (power-on): the switch block in hub_port_init()
    guesses wMaxPacketSize=64 for a Full-Speed device, and the
    Address Device command writes that 64 into the xHC ep0 context,
    so the 64-byte probe sees 8 < 64, completes as a short packet,
    and reads the real bMaxPacketSize0=8.  Later in hub_port_init()
    the sw maxpacket is corrected to 8 and usb_ep0_reinit() is
    called; the xHCI driver then sees hw(64) != sw(8) and issues an
    Evaluate Context command that lowers the xHC ep0 context to 8.
    By the end of the first enumeration the xHC ep0 context holds 8.

  - Reset before ff33299ec8bb: the switch block ran *unconditionally*,
    so it re-guessed wMaxPacketSize=64 on every reset.  The ep0
    re-sync then issued an Evaluate Context command to raise the xHC
    ep0 context from 8 back to 64 before the 64-byte probe, so
    8 < 64 was a short packet and the probe succeeded.

  - Reset after ff33299ec8bb: the if(initial) guard skips the
    re-guess, so sw maxpacket stays at 8.  The xHC ep0 context is
    already 8 (left over from the first enumeration), the maxpacket
    check sees hw == sw == 8, issues no Evaluate Context, and the
    64-byte probe sees 8 == 8 — not a short packet — so the Data
    stage hangs.

In other words, before ff33299ec8bb the reset path re-raised the xHC
ep0 context from 8 to 64 (via the re-guess + Evaluate Context) and
the device worked.  After ff33299ec8bb, the re-guess is skipped, the
xHC ep0 context stays at 8, and the 64-byte probe hangs.  This is a
regression introduced by ff33299ec8bb, not a pre-existing device
incompatibility — the very same device on the very same bus works on
5.10 and on 6.6 with old_scheme_first=Y (which skips the 64-byte
probe entirely).

I agree the device is not strictly compliant (it should continue
answering IN tokens for the 64-byte request).  However, this class of
USB banking token is widely deployed in enterprise environments, and
the regression breaks a configuration that previously worked.

Michal Pecio wrote:
> Should we want it, though?  What is the impact?

The impact is that a Full-Speed device with bMaxPacketSize0=8 that
relies on host-side short-packet detection for the 64-byte descriptor
probe becomes unusable across VM USB passthrough resets on 6.6+,
while it works on 5.10 and on 6.6 with old_scheme_first=Y.  The
device is not rare in our deployment; it is the standard enterprise
banking token form factor.

The purpose of ff33299ec8bb was to stop overwriting udev->descriptor
after registration, to fix a syzbot-reported KASAN race.  The ep0
wMaxPacketSize re-guess is a separate concern: udev->ep0.desc is not
part of udev->descriptor and is not the field involved in the
read_descriptors() race.  Would it be acceptable to keep the
descriptor-immutability protection while restoring the wMaxPacketSize
re-guess on the reset path, so the xHC ep0 context stays at 64 until
the real bMaxPacketSize0 is re-read from the descriptor?

Best regards,
Pengfei Lv
