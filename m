Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002480;
	b=lROMIV/Oy0/TbhQK1RjCQcOEUqDtMKP2vY5kxswRGO/efvRy3ojKhPeXF3UFNMJs6UV/
	 FfX7yxTXn13wM11IO7hDmbUElMZGj1UKs6P6pbxh8oFAioyBtxfYGu+gQUGQT4zIknqhr
	 QwPEhzyXg0/mQdxbGfMCHwnQCCtBOwQXG8PO9ld5UJzpYhMbkXzn1CsapgP7KeztFewXq
	 skbfhnSZ/1Tl9FqKUADOEKpx/6qlULExr5h5oReZ3eSeR7/CUdSs1ADYg2ENMSfh5KDW5
	 rHjhYW6IPPqE+FyxS/EOarmyR7lMbPawH9mLa7zZRkF3wXOl/BDiu378Wxm8jygD4+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nMnb5Mjf0h9nzGDSWN8FC/0AlVDe4mx+4VWYIJz3fcQ=;
	b=271Ee/5Z5IC9ZD83ycrS7nD1Kx6C59ygSb8qliGuAuk5QTtupIFzwcabIfXl8uD6vClm
	 97pqOszje+zktVMWA0YfnhaMc0Gt9ntVP5ZPboOiz3W4uye2pSQpqZsviuK24U1v0f+Q/
	 sX+n9ztFbVxtM+XQ+ObR65ms3vsO/SqcJ0PhkmzQLebFvytQ4xDrW3y6pMtQz2O2sg2G+
	 NoNGdcXAQdpgn4/2tB8G3+d6RmcR8X5UcoHqcV4mPfGvDZ1IJx3heaISOn84Q3s+rOlUa
	 mDzX+3wW2dlMUXdW1Qzzo9N01eFO3R6ed9kUF73G669cyhSPefHIt/V5hb5hiyLtuCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xf5ehGNO;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A973C606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 22:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A973C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xf5ehGNO
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so774625e9.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 14:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794002478; x=1794607278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMnb5Mjf0h9nzGDSWN8FC/0AlVDe4mx+4VWYIJz3fcQ=;
        b=Xf5ehGNOrswVDrkVVZ5rWXa49AFJNa+w43VuuLZ8oYzOwW+X/aCGVTXnzQ2I+KPD82
         vSexOhhxLzemjlmHrS+l6odgsho01oMD5OwHmy8kkad4+GXlbam4gO0rFbBFIdlbaOje
         bUC2s7miJW64uO4ZxNfpZMfFRyvHXPHRqf6gh7I4u/kmfcCurnPFLo2NJ4RUdqPC42NV
         ftYZJ7S/uQIh7sgvPyrtBPdVL5vNojGqdYpkBbeviAlw5VM6QXdGwy+B80cT4Ox8TVnt
         /Fugt/Jahvir3bMEoKaV3CSMvRwQLAEFo7iVUEccL66mA0nzZlIXnB4K0D9oTa2yDXp7
         IN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002478; x=1794607278;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMnb5Mjf0h9nzGDSWN8FC/0AlVDe4mx+4VWYIJz3fcQ=;
        b=lOTaf7Jyf2c72WtWPghHLFoRrWRZcw4HxHK4h6ECAChiAoQ2gn8ZP4W6yF+6VDbeS/
         2Lwu8uqbqyGdMsTpOy/4AFgC1p86/zwEdCGlZavtJwAUinRVnufJO/dCht7Nw+ue6Dxq
         Bl6pNkY6p+gjgqUoX1MBqnwt4Mn7YU317mXXDScxsZal0KlUPvehAxkB/hoNCuwQ9jpR
         cMW1Zt8DozE6tMcpnOC3BLQXnDpt1CiEr2z3Yx7LalPG4SLewEcXyt00GGzXU40eS/Vm
         YWLpbg6mlFM4avGr0j2EdvoglMv8/dZPmuCGh2p/RkO4WdqeGqCHKkxFqBa/E9L9N4jE
         Itjw==
X-Forwarded-Encrypted: i=1; AKwUvBxpe46o0rQFkQocJpV2vD6KlStG4t7Uh94vcppFH0w4YARi73ejXaZ64SWLmFI+8v4avF0Oa/uOxhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qILJV0nrsFa2YKdq9qcWiTJnYKVBYH92+NOOgH1ZxtxlPSOal
	eJRQiiuiq18Cv9yZYxR49hcyyNjwv72wvYffONu7V78zJwqn34sZw4V6
X-Gm-Gg: AYBFou0mQxKuW4NSbxWiBVuAV7SecxIlgL/CQAzrvvz8UoTARztbikQgVA4mnarS6Pv
	Un5ohbGw9mEkmq7lbyEYDbaHG0fqXnm9V6zOgzsHOf+FV3KSjf5bgx4JVyFRgfDfrg2XHhc68al
	ByrMlfluPrcfRyBhoYT+PKzM0HxqofqF7o14fgbUd5+kWIYOeIVhqg9pxUGz+Iiniex3tkqdfvc
	EdYLe7JAqtfarKAqslEYUNYp48kInrB7ND3pZ4bWdd/sR5IafDb6C8AukIcLttTDzIC71wXiaf6
	wCV/4hWzZ3PCX6pBRymcKhI+2OOyT4UvUE0Z8AmIzLX5USpomzVXWpyzlcJZbjwA/GH2USr5t+W
	VNr1IQcyfTC3/IDfttFb12vy6wz+WvYKvfwL2qW+PekmmrP/ZkH51/b+2PfsE9kF3oWwAKZyUWl
	CYXOmaKywt7t8jUOEWYWqNdd8JfSDPCC89tPua4EST/6jZqrrkDalxNuXnQhqDjnfSrgBRM7RNL
	53TDnGRN5gZP6AMOcgi/2g4Ig4l8Xwf3CjFYIg409uvLFVsCqGpGuhnBfY1HCNFRcfRU87/G8Gk
	M+81K3lnE2mgFZ8n8EsUbLzWwUbNwRJKlRpp+0c=
X-Received: by 2002:a05:600c:3487:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4b8190f41a5mr5245105e9.5.1794002477885;
        Fri, 06 Nov 2026 14:01:17 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm13568375e9.4.2026.11.06.14.01.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 06 Nov 2026 14:01:17 -0800 (PST)
Date: Fri, 6 Nov 2026 23:01:13 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: "Pengfei Lv" <lvpengfei20@huawei.com>
Cc: sashiko-reviews@lists.linux.dev, linux-usb@vger.kernel.org, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v2] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <20261106230113.7d2b8eae.michal.pecio@gmail.com>
In-Reply-To: <sashiko-outbox-200650@kernel.org>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
	<20261106031625.1824732-1-lvpengfei20@huawei.com>
	<sashiko-outbox-200650@kernel.org>
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

On Fri, 06 Nov 2026 03:34:55 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can calling usb_ep0_reinit(udev) here before hub_enable_device() or
> hub_set_address() trigger an invalid Evaluate Context command when
> the xHCI slot has been new

Okay, I stand corrected. Omitting the "if (!initial)" check in this
patch would cause even more warnings about failed xHCI commands.

usb_ep0_reinit() after alloc_dev() or certain reset_device() cases,
but before enable_device() or address_device(), causes xhci-hcd to
attempt some pointless nonsense, a known issue never fixed because
things still work despite the warnings.

You can work around it by adding usb_ep0_reinit() calls before the
two get_bMaxPacketSize0() calls which need them; by that time enough
setup has been done that xhci-hcd works right.

I will also look into fixing the xHCI bug because it's already being
triggered by "old scheme" enumeration on full-speed devices and it's
just lame. If the patch won't be too scary maybe we could get it to
stable and then this code would work unchanged.

> Furthermore, if a previous attempt in xhci_setup_device() failed with
> COMP_USB_TRANSACTION_ERROR, it reallocates the slot via xhci_alloc_dev() and
> calls xhci_setup_addressable_virt_dev(xhci, udev), which populates
> vdev->in_ctx (including setting slot_ctx->dev_info and initializing in_ctx
> ep0) while vdev->out_ctx remains zeroed. If hub_port_init() retries and calls
> usb_ep0_reinit(udev) before the next xhci_setup_device(),
> xhci_check_ep0_maxpacket() overwrites vdev->in_ctx ep0 from the zeroed
> vdev->out_ctx while leaving slot_ctx->dev_info non-zero:
> 
> drivers/usb/host/xhci.c:xhci_setup_device() {
> 	...
> 	if (!slot_ctx->dev_info)
> 		xhci_setup_addressable_virt_dev(xhci, udev);
> 	/* Otherwise, update the control endpoint ring enqueue pointer. */
> 	else
> 		xhci_copy_ep0_dequeue_into_input_ctx(xhci, udev);
> 	...
> }
> 
> Wouldn't xhci_setup_device() then skip xhci_setup_addressable_virt_dev() and
> submit Address Device with a zeroed ep0 context (EP_TYPE == 0)?

And this here looks like another related bug which may cause real
functional failure if it can be triggered.

Regards,
Michal
