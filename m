Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544050;
	b=2UWoJ2qYK+IabTMfz9O1DuOKjk4sQ+ffKPhBxjEbrAwOcOc70qkGcJHvmk2mZQGrHj43
	 J4Ju6irSEgpFPIGyUQFq3Zo7ghjyU/f2VqSi4HTsUUaO0EzvnlKxUGefYl219AhJy6jgR
	 k1IeeVQHKhijmQNi6ulYSoMyuDNt8JUzb4Ny+bktVqcvLs7jr+E9pHgfsXoo5ttwfED5y
	 ylRFuBRKdT4aiRXPdET15Cal56ts9wKfWUqaAg/IAtD9KOL4XhhW17Cnvu02tIQ7lBP+b
	 9PGgdG0FvyQAHSH7VlwUN6mrK4L3eSEwAANRRcaVRX//mQ5SfBtF++GBwTi008R+HOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544050;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SygTZOFSgaYHKuNvLPb+JOg5Eg0WlImlJhfqmcVbP0U=;
	b=sGK1Pi3rG2aGRvvvt0tSCM9ZeBgi7kOWZOCH4R73NOZxKUkBPUqE3ZJf80GwmbAzdeiV
	 eqo5EnSv4nkMWMHtUfN/+K+LePRJbTsyUJOweWi/w7tj042QGf2WgekPP19wb2huyCVhX
	 lzX2hR/RHg+Kc9wJ6hqO69TxVwtxqjR0laX2PQwgct1h9mub7LrsGe4XEs4MamkNsewt9
	 xvMdomL5cZNj/oRqi9gE3r8GaN1WWr9r+YvHnD0Bj5vl848CHY1Ax4xrS8o+/9IjHGvOe
	 uPjOGzk5Mv3WX6HnFWUIjPCAmuw0opDCzsr27IxvRsMTbQ/RuXb3lK+jw1AAipGD0fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijirJcpD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E7606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 04:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijirJcpD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7BC1F000C5;
	Fri, 13 Nov 2026 04:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794544050;
	bh=SygTZOFSgaYHKuNvLPb+JOg5Eg0WlImlJhfqmcVbP0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijirJcpDCLRtGezhEKDtX0sSxReTCxhk4oTGqpCbuJP+pMB+m8rPpOvNJrQqt2oaY
	 306t1AP0BUo/kjGu1p+/sHvszbPRGHaDZLwHhaDak0JNO6pp6EqDCgJ6mDxGP6/OEJ
	 CPmk0mTGwXB2DFL6MYBdltHfWSPum6zDpDGrASHsp1irGe2a1N8LmXPgSDz6RfAocw
	 pr0MYRXm5osGMXQKtI8PCN5Y2VZZX8gS4lzFdcFlkrwl9Qk0ib5JNT2B67fv4TBxYQ
	 /izKiEX8CktSaC9clF5J3DFPBC8E0tRbKveo45sQoAWWzn7/eOhiSCkMnV0rMbTWYl
	 mQ9hwxnAONnUg==
Message-ID: <sashiko-outbox-212168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] xhci: Give back URB under lock in
 xhci_urb_dequeue()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chien Kun Niu" <rickyniu@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113041948.1280304-3-rickyniu@google.com>
References: <20261113041948.1280304-1-rickyniu@google.com>
 <20261113041948.1280304-3-rickyniu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 04:27:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Before commit 36dc01657b49 ("usb: host: xhci: Support running urb
> giveback in tasklet context") set HCD_BH, usb_hcd_giveback_urb() ran
> urb->complete() synchronously, so xHCI had to drop xhci->lock before
> giving back an URB. That commit updated xhci_giveback_urb_in_irq() to
> keep xhci->lock held across usb_hcd_giveback_urb(), covering normal
> completions, xhci_process_cancelled_tds(), and xhci_hc_died(), while
> the open-coded err_giveback path in xhci_urb_dequeue() was missed.
>=20
> Dropping xhci->lock between usb_hcd_unlink_urb_from_ep() and
> usb_hcd_giveback_urb() breaks per-endpoint giveback serialization: a
> concurrent xhci_urb_dequeue() or xhci_hc_died() can acquire xhci->lock
> and queue a later URB onto bh->head ahead of this one, completing URBs
> out of order. When spinlocks disable interrupts, unlocking first also
> causes a redundant IRQ restore/save bounce into bh->lock, and without
> an IRQ-safe bh->lock it exposed task-context unlinks to a same-CPU
> deadlock.
>=20
> Move usb_hcd_giveback_urb() before spin_unlock_irqrestore(&xhci->lock,
> flags) in err_giveback to match xhci_giveback_urb_in_irq().
>=20
> Fixes: 36dc01657b49 ("usb: host: xhci: Support running urb giveback in ta=
sklet context")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chien Kun Niu <rickyniu@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113041948.1280=
304-1-rickyniu@google.com?part=3D2

