Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401047;
	b=GzrR7ouPfOun244s8GE1GI5/Dfp7qI4CJu9W7WUQPHR5NkGOIIsN/4onbHmc0tG18deT
	 8j/wajd9sfXZlwwyOsYcfd6/rK79DtaZHTjgqYP+tiuCaj4ajaxUG8BXGLy0HlFRGRTz2
	 COlHurskwOsCTyFo/DOHJ7r0CJrmFn/85xegKu2sr1f5oaCbchnOxOhRP3jWHGzgOilSm
	 Z/FrtqSXOD3kF7L9qWxVL4PWhuZZwWRGs9rkV2xxt8Mue93i449MYqwwVmImxkugPVV4A
	 u4yoK7bnmb09PDi/ZfsLLfn29aCLkKZM49ouaV3d/16dOetFer4pK+595LWzI3zdtcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401047;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hq63qdaAPwxKDhYo+J26R5uh6eoTmIKFLfQGuaNwahw=;
	b=sAbFMDRN/Ua18Pzyc7XF+YfartmKSP+3PNMmTGtYPnoubGDP1cQ7ArDVdRC1553TCiaN
	 03S2m45SV84a8ZchcXDRjnO3qzEtyX+mQVeVBqb9NG6iVfIJj19iTzg4ysbHmz3EwqMY3
	 yV0IyIkv2l7zrO1WvGrwpZZt+g71tKAQ158XofPhvNL8I58b5NYHx1rv3gdbv9itfWN1u
	 xXi2Ws5/De2gFuoEPH0hgan9XNcvVZ+Pmx882MjPopyQmfNEjFk/oUOdIvaYY32J5EVZ5
	 VMj4l6R9TRn+1v7SjH3TFrGobCPqCwRcr05jobC/VogtvU3RMpZmX2Jbc0bsXAA3MKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abQX3NJg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036CA606A338
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abQX3NJg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5601F000EF;
	Mon, 23 Nov 2026 02:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795401046;
	bh=Hq63qdaAPwxKDhYo+J26R5uh6eoTmIKFLfQGuaNwahw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=abQX3NJgdA5ekfAqm2a7cnwR89IS8II7Lmb4oPgzOXKQuT4BOL3FoM4u1UUyO9ax6
	 E6pwKIDrNchGw9BVZGbfkfjHCABrW1AF2bq13/3tAzpjH8F3EByhpSMt9vwUOia7sc
	 JNf5HiADf4U49J/cDxnBLKYlnzjEMkvx/X70RR6S2S44k7ZfBB9d6KV6ywQElrFvhZ
	 CWZok2zf6bUeGN6kqhw+UDeH+wC6XfxbG8KsPTIjeFxXtqIYV6+3qsHP3JrHV5srhR
	 Pp1gjbXkz35fXoi6CJSw+5R7pGCFv70RlCt9QvizA2zmBzafLMXrpBbvJsnlRs0B8m
	 NEnChkRWPlpjg==
Message-ID: <sashiko-outbox-228552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: mtu3: keep interrupts disabled in gadget
 completion callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122-usb-mtu3-callbacks-irqs-off-v1-1-27733bb678c4@gmail.com>
References: <20261122-usb-mtu3-callbacks-irqs-off-v1-1-27733bb678c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 02:30:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks
> with interrupts disabled") made the threaded mtu3_irq() take mtu->lock
> with spin_lock_bh(). mtu3_req_complete() drops the lock with a plain
> spin_unlock() around usb_gadget_giveback_request(), so the gadget
> function's completion callback now runs with interrupts enabled.
>=20
> That breaks the gadget API, struct usb_request's @complete "will always
> be called with interrupts disabled". u_serial's console relies on it:
> gs_console_complete_out() takes cons->lock with spin_lock(), and
> gs_console_write() takes the same lock with spin_lock_irqsave() from
> printk, which can then interrupt the callback on the same CPU while it
> holds the lock.
>=20
> Keep spin_lock_irqsave() in mtu3_irq() and disable bottom halves around
> it instead, as dwc3 does in commit 84918a89d6ef ("usb: dwc3: gadget: Let
> the interrupt handler disable bottom halves."). netif_rx() then finds
> softirqs disabled and leaves them alone, the completion callbacks run
> with interrupts disabled again, and the softirq netif_rx() raises runs
> at local_bh_enable(), once the lock is dropped and interrupts are on.
>=20
> Tested on an MT8173 tablet with PROVE_LOCKING, copying a 21 MB file over
> USB ethernet three times per arm: with spin_lock_bh(), all 8,333 completi=
on
> callbacks ran with interrupts enabled; with this change, none of about
> 16,000 did, with no lockdep report and every copy intact.
>=20
> Fixes: 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks wi=
th interrupts disabled")
> Cc: stable@kernel.org
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-usb-mtu3-c=
allbacks-irqs-off-v1-1-27733bb678c4@gmail.com?part=3D1
