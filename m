Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756900;
	b=IUvZ0ogvitxKwAalAvssfaYBCfb6v7hjYgdH+fyEpMYq8RlTJ8pcAJTgpoyGmeZ5XQI2
	 78up7TXaNFsiqgaCoWBa3v/lHLzIvSAgZzZ9ARuVzf9+NTCSqspJqKTfy7jWuOoMNcBd5
	 5M5lH2t0GPM/tFf3mSo3AOub0EXgt34WMng5IcOcEzwkWdBSnqn97u+6d7k/vzS6//4/4
	 zKn3z3aVkEQSFsPZh/ECgJWwrDPFx+LjyViY5iJG+b1p524vZeawIkGo3i4jBZfU+4oBS
	 8UwYSiq2DTQ4vi770JJwGNRkVum3ELGc9IEkOKLyArEh9mpC5DUA5tnQD8wyhrtFt0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756900;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wji3yn7VV9nR/QwZZ+br1h3ip/Rn0VMCGoD6PbW2SRM=;
	b=xPvf28XFNLH/uHi2xtiDibK9T0kXMM5tQ8ToAe1qwZvLs+oBeVTOWT7gZ9DZy4h8wvoi
	 GemqPHulIPbkpqDSiRUieAqyAavped5KLvA9w9TMob1a2PNko0geR9OGVA0BYdsAXS/VP
	 bEyffPxCHegt5qtBI9mqB01WGQYNLbGvjg0XluZ7JAWKPcNgl7aX3oH5UcJEcmUwUSVWb
	 7iww0vXATV1bqtmlb6iQhqLDZLVVuYjbhlDBpRlbIemGBmB8OWhc4pb9dzlH0gtFQ5laA
	 vckmsoJRUh2/3J7JQAlB3rph05YaAEt6okAR6MLboAj/nviOVrS1d27eA7jnkvIdPhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B62GuVUo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E1606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 01:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B62GuVUo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338EB1F00919;
	Wed,  4 Nov 2026 01:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793756900;
	bh=wji3yn7VV9nR/QwZZ+br1h3ip/Rn0VMCGoD6PbW2SRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B62GuVUoQi/U7quIUiTwnjrKbUKlxjmowjc2lq8Xrq9ySohTdtrB1+nh6ZW/t4Amy
	 apmKXbopDktvR/5Moybck4TCcR/MAMYwvwWSYttzMkRKCCgGIId/h/LoCK4om9kDDO
	 PeOLlCW1KHxktsDlIl/0kK7EaEBcZiO5vh9VGJ+9d24ns/THaf7iWzxI65o/JNKlfx
	 vptUMb4EUK7ozhd4pg1YBxRDn6O9eeiRPYF5lASkA7ITn4SIeShxXyZj0D5gCYphIK
	 05Kx9UHFuZNdSejMZlj6eyzAHYdvng+tLPp707YXywih3opiGbtI9j7pBxh8kirMCv
	 j3bvBAy2krfiA==
Message-ID: <sashiko-outbox-196385@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104013221.3223-1-25031212351@stu.xidian.edu.cn>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104013221.3223-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 01:48:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] usb: xhci: commit message says CLEAR_FEATURE instead of SET_FEATURE
--

commit 8ca4e8a9c32024fa63955a4430862a58450a721c
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

usb: xhci: Fix use-after-free race in xhci_stop_device()

This commit fixes a use-after-free race in xhci_stop_device() by checking
xhci->devs[slot_id] and virt_dev->udev under xhci->lock, and clearing
virt_dev->udev under the same lock in xhci_free_dev().

>     usb: xhci: Fix use-after-free race in xhci_stop_device()
>    =20
>     A KASAN slab-use-after-free read was observed in xhci_stop_device():
>    =20
>       BUG: KASAN: slab-use-after-free in xhci_stop_device.constprop.0.isr=
a.0+0x395/0x430
>       drivers/usb/host/xhci-hub.c:479
>       Read of size 8 at addr ffff88804e85d2f0
>    =20
>       Freed by task 585700:
>        kfree+0xf8/0x390 mm/slub.c:6566
>        xhci_free_virt_device+0x3f/0x50 drivers/usb/host/xhci-mem.c:881
>        xhci_free_dev+0x286/0x350 drivers/usb/host/xhci.c:4131
>        usb_disconnect+0x6b6/0x910 drivers/usb/core/hub.c:2391
>        ...
>        usbdev_ioctl+0x6f05/0x86d0 drivers/usb/core/devio.c:2826
>    =20
>       Allocated by task 572283:
>        xhci_alloc_virt_device+0x171/0xb70 drivers/usb/host/xhci-mem.c:986
>        xhci_alloc_dev+0x475/0x840 drivers/usb/host/xhci.c:4271
>        usb_alloc_dev+0xe8/0xdc0 drivers/usb/core/usb.c:661
>        hub_event+0x1c82/0x4050 drivers/usb/core/hub.c:5953
>    =20
>     xhci_stop_device() reads xhci->devs[slot_id] without xhci->lock and
>     keeps using the pointer across xhci_alloc_command(GFP_NOIO), which may
>     sleep.  All callers drop xhci->lock before calling it.  Both sides of
>     the race can come from userspace through usbfs: a hub class
>     CLEAR_FEATURE(PORT_SUSPEND) request to the root hub reaches
>     xhci_stop_device() through xhci_hub_control(), while releasing the hub
>     driver interface through USBDEVFS_IOCTL() quiesces the hub and
>     disconnects the devices below it, ending in xhci_free_dev().  USB core
>     does not serialize those two, and xhci_free_dev() frees virt_dev under
>     xhci->lock, so the endpoint loop can dereference a freed device.
>    =20
>     commit 88716a93766b ("usb: xhci: Fix panic if disconnect") added a
>     NULL check for this case, but that only helps when the device was
>     already freed before the check; it does not close the window.
>    =20
>     Look up xhci->devs[slot_id] only after taking xhci->lock, and bail out
>     if it is NULL or if the device is already being torn down.  The
>     tracepoint reloads virt_dev->udev, so it moves under the lock and only
>     runs while the device is still attached.
>    =20
>     xhci_free_dev() clears virt_dev->udev without xhci->lock, and only
>     later detaches the device from xhci->devs[] in xhci_free_virt_device(=
),
>     also under the lock.  Take xhci->lock when clearing ->udev so that
>     xhci_stop_device() can rely on it while holding the same lock.
>     xhci_free_virt_device() clears xhci->devs[slot_id] and frees the devi=
ce
>     under xhci->lock, so a device found there while holding the lock stays
>     alive until xhci_stop_device() drops the lock, after which virt_dev is
>     not used anymore.
>    =20
>     Fixes: be88fe4f4dda93e3 ("USB: xHCI: port power management implementa=
tion")
>     Cc: stable@vger.kernel.org
>     Co-developed-by: Bin Yu <byu@xidian.edu.cn>
>     Signed-off-by: Bin Yu <byu@xidian.edu.cn>
>     Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
>     Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
>     Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

[Severity: Low]
This isn't a bug in the code, but the commit message says that a
CLEAR_FEATURE(PORT_SUSPEND) request reaches xhci_stop_device() through
xhci_hub_control().

In drivers/usb/host/xhci-hub.c:xhci_hub_control(), ClearPortFeature with
USB_PORT_FEAT_SUSPEND resumes the port and calls xhci_ring_device():

	case ClearPortFeature:
		...
		switch (wValue) {
		case USB_PORT_FEAT_SUSPEND:
			...
			if (!port->slot_id) {
				xhci_dbg(xhci, "slot_id is zero\n");
				goto error;
			}
			xhci_ring_device(xhci, port->slot_id);
			break;

Whereas xhci_stop_device() is called under SetPortFeature with
USB_PORT_FEAT_SUSPEND (or USB_PORT_FEAT_LINK_STATE with USB_SS_PORT_LS_U3):

	case SetPortFeature:
		...
		switch (wValue) {
		case USB_PORT_FEAT_SUSPEND:
			...
			/* unlock to execute stop endpoint commands */
			spin_unlock_irqrestore(&xhci->lock, flags);
			xhci_stop_device(xhci, port->slot_id, 1);
			spin_lock_irqsave(&xhci->lock, flags);

Should the commit message say SET_FEATURE(PORT_SUSPEND) instead of
CLEAR_FEATURE(PORT_SUSPEND)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104013221.3223=
-1-25031212351@stu.xidian.edu.cn?part=3D1
