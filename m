Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746836;
	b=1NrwE+T8fZr0fyRhAanVD0Vnb3HmlxcPci28mLCfn7H8ko7Cv/OSSsQIawX5o4b9DuO1
	 4VAk6TM4XDTL7VWTJPwnvuSAOi1CEhUKD8cEDOc9cuNKDWT6EXcVMbepah+OOfLmyB7pq
	 49Ykv0vyx/uzP6QfJmcVnB64x9Nsac07GDTODRH4P3xMSBsJJtcXWxMyPgAns3xdkerYM
	 nFTjvnII8fvBZkNBdKNQwEp5tW+iUOptzObBWv04yWiPRq/HSdCfn+vrOYJ+AsJV5wg9b
	 GQqUYecl0PvQ60jE0zxtTBOigws3z3atBrKt0pUVwbbQuVcByW9o/R33pSwuI2Z6pjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ng/QrrM3y10w8XPOybnoxA8wkETs3t+fZhj0GSFzGJo=;
	b=VHsMRSYD/glEEBCuyf3H93b24FZWeBriNsA88KUOja6HN7CCl3DAPo0gDlXNea5WgKGO
	 sfJXtIF0V4rJbFkP6ujzeCBsSs5USwvt/3vwCH2w0IUQhlFF4tmRaW6vRiPu9mi+9HH1l
	 FHR5J3Xj8E95EToY4iApk2DqwRi/a28BvJ7Bc4/3JJLRVXgKiZWuC/p7mmvDEtZGJmLGd
	 cmaNImcQge2OJpexU+C5Kl4IKKmJ5BLgHRakRlbhmriZjiLKznO/+sIHNqV5FGlYtaI5z
	 yyC2E7Dc+GxSoM92yh+6gQbVQpKpivPWsVfguRRqcwhEOK0CddRw8pKFQJCzfoQ25QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yi2h096L;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3C606A328
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D3C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yi2h096L
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso54540f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 15:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746835; x=1794351635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ng/QrrM3y10w8XPOybnoxA8wkETs3t+fZhj0GSFzGJo=;
        b=Yi2h096La6CM0yNxmdC0FckitQOFkyAF2UnvBmIDgwxQe0uyl68LgQQfqy5qdTMG4u
         auejbXu3iGS9LNEll0lZIIQ3QXxZp7CH5gKrh2IeFeIxHeomwn3JgYWvcZeWDNWkZ/tH
         7vofdmHef4MEuIkg8HPmeTwWQ5SBRfa+dZnstVYdk4CrcS/yq4UTLbk7psS0nXHnd3DF
         e1WlzX735C9Yya2oCNN6/9AVdD/4QiRphhLSE1Spoov2keMlHGAHKoOM0dLtzeTix5Md
         m+UknyVkWnYMhovQ3towt8WvNpe3C1gyl/4wsvB99/SGPHgZSJWtlyqxzs3jVKWHB2rq
         VtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746835; x=1794351635;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ng/QrrM3y10w8XPOybnoxA8wkETs3t+fZhj0GSFzGJo=;
        b=z3SoCWqXidGGo2H5nQXRSrDgCcBTQKUlmSvnIurmfAnP2qK43HK8pTPd0SslJnN40C
         ZwAbrs71HlGEDFt+my93EkGK53Jf4ETBg8II8xu+orjCPKP4ofnykDaL+sMdOaSBH+Yw
         /cNwDwc9TmfLYnzCbahIUehguBoPF/LUoEWnv1bXKgO6pxpQppKeXMUotDkXcSKPEUaw
         Ilp38OARhQTGOnkUtY8Cx7tPazNcUsctY8qfao3rR9kSlo28/DD2HbIGVTM68svTfSvH
         yFVY4yZKKDgxPgY5ljn5ctKtsgrJPTQkfz3ihavUoOvdpR+uMaP3WL6EFTMSHFl5LQPn
         c/0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/a3xv3AhsmjcFoeWcPb/AFLTeM+OrDUEeLLItqxYm2HDowYXYgo06G9bpFb5AfqnDyyGXHgNNcfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rAOKAUEMi26FlrA1MEcsZpdS50LenJLvg9/ee7Uq7PotxmX4z
	K+rSZA2gh0moa1tpzz6Aj12kwxuLXRh2PyrAb2DnLUQc3dXSRiYvCGEDAURVnscH
X-Gm-Gg: AYBFou3OLqkP6mYNxlHGLcEBqVIbr3WE/z4PXNBBpubmP74Rq9wR3+H/sVJfW51Iamr
	Du67gZfclRMtnw0bvmeozMnB3Px6+OJ1UbE7NbjOkp1f9PQVynMOQokJTrU20890vYvMEykPUBP
	DF+xc0W7vA7gj+G+cC35cGbWesEu/M7h7rVrYpnWwcnDjzKveWXQEoenSBfpZ8A30w5se2M3NDA
	A91ZkU5u9VutlSxYZ1xIctZOJ7KB3zpTUEOvCmsHL96gJwxuldraf1nyjvyya4VEYRRX8EANLfv
	3q9Z9EQ5Mo0BfsRh0TlwGz7HDTpfJBkPe8SIb3XLWWdkNtdahKRzpOSI6fqInxkELu0ZHbM2wct
	tF7IyzKEj+UheatlGnrPmWFN7P6SOLdbea/r7VTlZV7AaaiC0W472owDbDtBTjAt9skejAUO15i
	1zw8MczM0O55H4tcQFpRk9qWxUOJPgiGTCRDOQJm/OxNVPQ4ktXKL/Mz0GveqlX6uGxh8xUJmdP
	EprMHLOtbmrLecSMNBJ7T/YON97NtfckxTJ2eEllN/cLYwsu1Bei6WcI5giWOGV/6I8RZCUEvbE
	iqWELA5UeEygA7ztsXe7ZZ+X7Z5/wmVo7jbzDYw=
X-Received: by 2002:a05:6000:1acb:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-48e6e4f56dbmr31204523f8f.41.1793746834692;
        Tue, 03 Nov 2026 15:00:34 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm415342f8f.52.2026.11.03.15.00.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 03 Nov 2026 15:00:34 -0800 (PST)
Date: Wed, 4 Nov 2026 00:00:31 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Bin Yu
 <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v3] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <20261104000031.679944e7.michal.pecio@gmail.com>
In-Reply-To: <20261103160100.23190-1-25031212351@stu.xidian.edu.cn>
References: <3ca5cced-f429-42d9-9bbb-f5111acd9665@linux.intel.com>
	<20261103160100.23190-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Nov 2026 00:01:00 +0800, YuanZhe Liu wrote:
> A KASAN slab-use-after-free read was observed in xhci_stop_device():
> 
>   BUG: KASAN: slab-use-after-free in xhci_stop_device.constprop.0.isra.0+0x395/0x430
>   drivers/usb/host/xhci-hub.c:479
>   Read of size 8 at addr ffff88804e85d2f0
> 
>   Freed by task 585700:
>    kfree+0xf8/0x390 mm/slub.c:6566
>    xhci_free_virt_device+0x3f/0x50 drivers/usb/host/xhci-mem.c:881
>    xhci_free_dev+0x286/0x350 drivers/usb/host/xhci.c:4131
>    usb_disconnect+0x6b6/0x910 drivers/usb/core/hub.c:2391
>    ...
>    usbdev_ioctl+0x6f05/0x86d0 drivers/usb/core/devio.c:2826
> 
>   Allocated by task 572283:
>    xhci_alloc_virt_device+0x171/0xb70 drivers/usb/host/xhci-mem.c:986
>    xhci_alloc_dev+0x475/0x840 drivers/usb/host/xhci.c:4271
>    usb_alloc_dev+0xe8/0xdc0 drivers/usb/core/usb.c:661
>    hub_event+0x1c82/0x4050 drivers/usb/core/hub.c:5953
> 
> xhci_stop_device() reads xhci->devs[slot_id] without xhci->lock and
> keeps using the pointer across xhci_alloc_command(GFP_NOIO), which may
> sleep.  All callers (the port suspend and bus suspend paths in
> xhci_hub_control() and xhci_bus_suspend()) drop xhci->lock before
> calling it, so a concurrent usb_disconnect() -> xhci_free_dev() can
> clear xhci->devs[slot_id] and free virt_dev under xhci->lock in that
> window.  The endpoint loop then dereferences the freed virt_dev.

Hi,

Good job crashing a real driver and not just dummy-hcd as usual.

But is it not a bug in the first place that we are suspending a device
which is being deleted or deleting one which is being suspended?

Would you mind revealing your secret sauce and posting complete stack
traces of how you got there, including xhci_stop_device()? What kernel
version was that? Those line numbers don't match current code.

As you are .edu, perhaps you have a reproducer for this bug?

> commit 88716a93766b ("usb: xhci: Fix panic if disconnect") added a
> NULL check for this case, but that only helps when the device was
> already freed before the check; it does not close the window.

That's an old bug, not sure how such things can still be happening?
It seems that xhci_free_dev() doesn't return until everything is
cleared, and I would naively expect USB core not to suspend the bus
until all devices are suspended or finished disconnecting.

In testing, I see xhci_bus_suspend() 100 ms after disconnection, so
this race seems tricky to trigger. How have you done it?

Regards,
Michal

> Look up xhci->devs[slot_id] only after taking xhci->lock, and bail out
> if it is NULL or if the device is already being torn down.  The
> tracepoint reloads virt_dev->udev, so it moves under the lock and only
> runs while the device is still attached.
> 
> xhci_free_dev() clears virt_dev->udev without xhci->lock, and only
> later detaches the device from xhci->devs[] in xhci_free_virt_device(),
> also under the lock.  Take xhci->lock when clearing ->udev so that
> xhci_stop_device() can rely on it while holding the same lock.
> xhci_free_virt_device() clears xhci->devs[slot_id] and frees the device
> under xhci->lock, so a device found there while holding the lock stays
> alive until xhci_stop_device() drops the lock, after which virt_dev is
> not used anymore.
>
> Fixes: be88fe4f4dda93e3 ("USB: xHCI: port power management implementation")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
