Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548530;
	b=Nuc5U5VXxQD+JjeaadegXsMRI3GUC/CBCkWI6MAyRXf8BvjKmLw2PDQMBj6WedZ8kq+x
	 BT4jctsEGU8fzIAQ+OG8wbd9OQLUh0w5w6sjWFkbtfmmgeo0z2ZvQCdpLTtx0oQVXyhn2
	 rtBaY2rhAsL8G0h9wTSIjG5hOz+KxXsgzs4LBQNtF4gOMmh+O1di3afsjA1nMfFVhQJlB
	 Z9D4VQsM29akK014xPJEjC/mPU5RSh8U5UqR5+IZDKH+xrKJtx+ZjOZuxtSZoM7rDK0uC
	 Ha6AHykcHyrOV39wAicRbnEkzzCNMD1NMvj6D1F+3/CImx4iGOU6yIznAaF310oTg/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548530;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SL3IaPpKCZ8TFbeg3qNzQg8k17VQKbnip5ncLRJcQCE=;
	b=ekeWDmeMxA2MdjNX6HD2B3n1PxOqzqhrJufQ3EFvtG14S0YWPaY7otsOUIx+bxM9bEiH
	 GCO++ZTM5kTHaDZZNazyoqekHaNAaYP3565gQMYDr0vh4u+hXljGZ7YVOtE3bfQXUWorA
	 xddHsnJmKiAmjUvnTnZJEKBZ6NVN7up9JbyKKOQu8T14Q0Vtz6OZSPwlIuITj/aZxF0tV
	 CJPM6RqUzB4S07cMrySpGRreP7cug2w0wZzYvUcJ2tf33lu2TzkjUFzXadFF3RzEY7Dbl
	 xE5mXw8LbQ85LViYSUj8gcsl870rLWNJziX2/VrzV1Xm1eL6b4DKRtiRFfwfJw3bp9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXJZS6lH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD3606A31F
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXJZS6lH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBE51F000CA;
	Wed, 21 Oct 2026 02:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548529;
	bh=SL3IaPpKCZ8TFbeg3qNzQg8k17VQKbnip5ncLRJcQCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXJZS6lHBhXBcbtund23TYdur3Ipt13PYdXiW1zRDY0/FY8Est67ZF+XHKSiZJao7
	 i4JPeibhXL0XIZADJUemKYduOOWDgNXw3RMkS8eqt1nTC5z9q+urU4uyXBvzfvpHwT
	 N05RsFrBxA3ARJGWaIMqA03GLFrcMfSGM4bcm49Fom+LjrevvfkuzFJEDvV3nI2Gkr
	 35ACFx9w5lotJZxtoTGbUjorK3KZgHY2smOuM1YxlKNa9ts8B4GhuazKv7NRxRBE/1
	 g31jvjGnLEH1oMQmvOzCzhxdAoQ1YaltFcXjTgIqhMHd+iBLWB0O4Pap2tS7cyKlcs
	 wOG+IxTcyfN0A==
Message-ID: <sashiko-outbox-179685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 2/2] net: usb: pegasus: check rx pkt_len against
 the received length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021020310.34045-3-law.wei.jie@gt.tech.gov.sg>
References: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
 <20261021020310.34045-3-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 02:08:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> read_bulk_callback() takes the frame length from the device, from the
> receive header on the 0x8513 and from the trailing status bytes on the
> other chips, and only checks it against PEGASUS_MTU before passing that
> many bytes up the stack. In two cases the stack then uses bytes that the
> device did not send:
>=20
> - A device that sends a short transfer but claims a long frame gets the
>   stale or uninitialized remainder of the receive skb delivered as
>   packet data.
>=20
> - A device that claims a frame shorter than an Ethernet header gets
>   past the check as well. eth_type_trans() takes pkt_type from h_dest
>   and the protocol from h_proto without checking skb->len. If the
>   transfer is also short, those come from bytes left in the skb by an
>   earlier transfer, or from uninitialized memory.
> [ ... ]
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021020310.3404=
5-1-law.wei.jie@gt.tech.gov.sg?part=3D2

