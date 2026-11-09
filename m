Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226926;
	b=wco5fqZ+asV+AUA65Mf1AMzCl2xl5fQTnl7CSfdKZK05fYFZUTEAmCHxdITWqUmCyJ9q
	 0WVLlO91RQiRQf79Dm9O5J/TbvD+x8BxcGz6SQUNz+XV7EBx6nAt3ARN8xEsb0YEEi3Wp
	 aQdf/S91bqxhLE1f4UKQRrYk7n/d74AzfCzSL5otqy8pKOfI3JF6lozLfVrkfmtr2l8Fg
	 nNp8NA1Xti2/SoBagIwLdpFpNDIOYMIYc5+zhbweOLTdHzcGtgfi6XCY5LFFiTZXb6UkW
	 tZ8++HmyXr1HXu2veJbByD7FIbwk4jGixYfw7FWsr9t38VkAcGSHU2Y1iUwt7jrvDvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226926;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=esmahqWWX3lbOBUEAswa61iBNjt5LluFUR5AJfK3fMQ=;
	b=ZZPFG8pMmF3fKLsMN16WfbayWAXj5glOe9Ez91CNaCBffOcdFoO1XpPbh9QqTjZxedol
	 rDQ2TShoExoyMYLIpfaWpnjRh+eKZ5N4tA2FezoRogc67DSarSuGxI4/kzS49iYHXUztx
	 rRojPfk91U6Kd2OIw8Fbwu2IxkpXPoVGvX8jI9MwHplOZJnFYChTJKRoCJrsWdaRLMQUs
	 fVgEfk6oNMu2LyeGaBOVYqEQ0fqzZbvhwcTbl9DPYK2QcSQPlTAc7ZBQvLwH30Yv8gi9B
	 nQHfE7ns/eQ2YYASs/F5J5u1SAQnRG+fWC1MWMJ7I39z2M9xBtPdxZCtaBstBSn3CFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+jblWW6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E8606A334
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+jblWW6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829CD1F008A1;
	Mon,  9 Nov 2026 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226925;
	bh=esmahqWWX3lbOBUEAswa61iBNjt5LluFUR5AJfK3fMQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Z+jblWW62c0Z5CHmdpQ5KLev8f845Tvys6qY537zSBJyrmv81GRmEM7yqHYXrXflP
	 f6/AQYg8nRr75f46wJvldfUBKK79fauML1L6kFH7ssqtfMoCHprYnDdFol9HZGF2nx
	 RZTPlLRfidBTqFgMO8VSlwOZwk/gQC0bymFxDUgipUV9Ml0LaPCVQyxhdsmYz6OUxq
	 t/XSYi9elTPPV4X4oD+/f/3U1w+0kduXuY3/8NnnAv82leNB00ZCSIfmaAzu6DinTv
	 Izsv0+I752zlBo7iP6h+8zWSId7kv4YysZcVV0aKooX0FFVXqpjroELEemBKCEoV4J
	 ya5JgNP2VtHGQ==
Message-ID: <sashiko-outbox-204926@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: lpc32xx_udc: handle interrupts with an
 empty queue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fang Xieyan" <fangxy@xiaopeng.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261109121035.34561-1-fangxy@xiaopeng.com>
References: <20261109121035.34561-1-fangxy@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 12:22:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A request can be dequeued after a DMA transfer has completed and filled
> both endpoint buffers, while the delayed endpoint or DMA interrupt is
> still pending.  lpc32xx_ep_dequeue() removes the request from ep->queue
> and gives it back via done() without clearing the pending endpoint or
> DMA interrupt status.
>=20
> When the interrupt handler then runs with an empty queue,
> list_entry(ep->queue.next, ...) derives an invalid request pointer from
> the list head; list_entry() does not return NULL.  Passing that pointer
> to done() in udc_handle_eps(), or dereferencing req->dd_desc_ptr in
> udc_handle_dma_ep(), results in invalid memory accesses and can crash
> the kernel.
>=20
> Check whether the request queue is empty before touching the request in
> both handlers.  In udc_handle_eps(), do this before sending the deferred
> ZLP and disable the endpoint interrupt when there is nothing to
> complete.  In udc_handle_dma_ep(), still disable the DMA channel and
> clear the pending EOT/NDDRT (and SYSERR) interrupt status so the
> interrupt does not keep firing, without dereferencing the missing
> request.
>=20
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Cc: stable@vger.kernel.org
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109121035.3456=
1-1-fangxy@xiaopeng.com?part=3D1

