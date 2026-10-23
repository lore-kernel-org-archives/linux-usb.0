Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741280;
	b=jt4mouRdE2kujEOFCd4R6ZMcdvZkOZBOK7ekQYqW2NFXxL4ARap4SPUCToT1Rryr2yLd
	 Z8Z/yG2SczmO+TOeJNWR2OjcpBERAi+X583RLhUdxL0g/sIeAh2ZJoHxs99Spvuoipc86
	 ahoNfRvBDNDKmFjtodv6doxT+KCpBQri9zsYQs9U5DeEiFX3Zc26Q9FisSUSFGnhgBScR
	 JsFG3dov6mYv5VkEf0ObHzxNGm35R1f2eshGKzWw03BWtiUbrj1MYyv1d1y0VTH4IR2Pm
	 jv+GRTXsQjmFO0OKerPnGG046kp/8bkYpWnOIhpa229s+IVUrfhR/CE68sOuyVg4ijw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741280;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+dsoznRxSp7V+XRLHNGIOq1noAIhAQobst7a2BsKmpU=;
	b=skQvk0f/GEOh5RY/pJWrsA2BIb6hQ1YnOPZl1w9ICgYZyJYQdV+bIvAXSDXTAdwqSAHJ
	 WxHXgikvnjaIJn5XMWNyY3hICk3kDZxyc/P4Ux4csN02TpQo02DCxTTsKku5kqUkVtD2e
	 wNJ1k5OLduZEuhjfREGT4FydJ30ikAiR7JiXC0D5ORI1VZVOTHIQ6LCJkz0QA8N23wgkm
	 nDqhg82aEFXAKfs85iSf9FFEKASa5X5v6N5SRITVan7FMqmc1Fot0nnAp8whJEiXnb0cf
	 owc+3HEtIncvbrB+ZiR9usrx/aq0HH2/dZtwOpOSDn+vHWwuyQsUgzCCLihUKWyxkrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YOYtDTmd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A4A606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YOYtDTmd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACA11F01825;
	Fri, 23 Oct 2026 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792741280;
	bh=+dsoznRxSp7V+XRLHNGIOq1noAIhAQobst7a2BsKmpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YOYtDTmdKtTACp4lmpYXjw6JV7GocAwUhqXqE4P1MYuvfk9sFaQWLNok3XpzLjhfI
	 sxDq0XCymFnKd6orAb1/guFWfreqAOvWe3zNLITIouaVC9T1z604sRozcrLje9EwQ8
	 utXSyI+8SfPhDsYIKUZE8jc+t6F1a1q+HQ2OJH668mCvfEBRve9RLgSjOJGLE24XWz
	 cdMMtLCK2oRSOVUlEXUw2akqwPfRp+By+6XeJy1z21PfB/cqk6f8lHj1rPvtZNM/Il
	 pDx+NOQrk1OkfeVsIEyXFuPdpHIdmhgZynIdlfP1vtaIx/EQMFDPjC9mW1UiSAL/ed
	 GC61XiW2ET6QA==
Message-ID: <sashiko-outbox-182430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Fix wild pointer dereference
 on empty EP0 queue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Ximo" <lixicaicai@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023073131.637062-1-lixicaicai@gmail.com>
References: <20261023073131.637062-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 07:41:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Wang Haoran <haoranwangsec@gmail.com>
>=20
> list_first_entry() does not return NULL when the list is empty; it
> returns the result of container_of() on the list head, i.e. a non-NULL
> wild pointer pointing into the enclosing struct xusb_ep rather than to
> a valid request. This was found by code audit.
>=20
> xudc_ep0_out() and xudc_ep0_in() are reached from the endpoint 0
> interrupt handler xudc_ctrl_ep_handler() purely based on the hardware
> FIFO status bits, without checking whether ep0->queue actually holds a
> request. The queue can be empty at that point: the gadget driver's
> setup() callback may not queue a request for every control transfer
> stage, and xudc_done() removes the request once it completes, after
> which bus timing can raise another FIFO ready/free interrupt. The
> unconditional list_first_entry() then yields a wild pointer, and the
> subsequent accesses to req->usb_req.actual, req->usb_req.buf and
> req->usb_req.length read or write unrelated kernel memory, leading to
> memory corruption or a crash. On real hardware this is triggerable by
> an external USB host controlling the token timing. Note that the
> enqueue side __xudc_ep0_queue() already guards the same queue with
> list_empty(), which shows the queue can legitimately be empty; the
> dequeue side was simply missing the symmetric check.
>=20
> Switch both functions to list_first_entry_or_null() and return early
> when no request is queued, mirroring the existing list_empty() guard
> on the enqueue side.
>=20
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023073131.6370=
62-1-lixicaicai@gmail.com?part=3D1

