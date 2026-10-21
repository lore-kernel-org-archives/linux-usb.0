Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548529;
	b=NRZ4pl7FF5LT7LZ9R93/RmHREgFosVmIBGPlD855h8crhNiQ680OBtEfp2JBa+Jb6ypY
	 y4ersFJIJ7BhDL/X/G5A1lH05je7BmaL0LaXcl1mDTl8bQwXJPE+juKC32yUw1zdBwOPH
	 WaMlYS/v8uxqOQjQbBQ/S/RvNQOkXnFPf/nCzjKn0YJT53wNI4yZZHwd3wprlgA3+WhTj
	 6axe4xi4Q0uyFC7MT3ORifu4tV62t/GbBya/ot4hrU9RDRq3zL9IJUo9S74uOZqr9kPNG
	 Lqm7Cm2YfHaVdoDqMuVR97QOeYrJzhlIDqFAbvj4eewnPIVx+AMGM2jQF2wDdw9RVGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548529;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DgbtL2ThUzBqa5INZ/y5ocVeMQPF6GNw2hwZdSGvJjE=;
	b=pUrorfoXTc1uX8AZqPjXI6iSUqDAwzInOfIwluwZRNi2sPeqSeoyBgVGjA96o7kkI8JD
	 KCTQRzpKSNqCNDoZEVjUlKKxSc313EAZ/ihLL6kSGQ3Zcvc7zokQIQAeJJUtlauig6h4D
	 ph292ju1dzrIW+oYlMgkqxAOoqGSWv1ZBnq3Nauug77Sluv/AWXd+UxK76B1I5lWANOAl
	 6le8dCzASpcHhans7wDZtE9blQI7KE9UkHkoRe/5aT2RmX3yFaINy3kftbOOkj5FLxIfj
	 Je5bUhE/PeP0MwWCnI29Qbz7ddqWZEtlYutq4jkgzuIKUJoKnTkxCOR9+Lj/8Egd8ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sb+0C8nU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E104606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sb+0C8nU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F3A1F000CC;
	Wed, 21 Oct 2026 02:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548529;
	bh=DgbtL2ThUzBqa5INZ/y5ocVeMQPF6GNw2hwZdSGvJjE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sb+0C8nUoVdSTZ8w7z0/IB6rBD49MPC0ah5bAuAhz04HVg2vC2M+AFuzFLqWLAGPV
	 A1uv7NwAxMOxVul83VmFeq9gpqJxdRhQ/2xGOOM+KvcXipWTDRuZDuqSejPF2F6Tfo
	 2PUBjxiSKL8MnHyg07801m12gt0oEjHArwC4v6zne2skJDxP2K654dnR0Q09XROZhQ
	 uVS/NU+TlI76lPvWXcr8uYJLHinQE6Nk9VO0y/0A09iIbuN4KjatAkoxin+FS2pQZ7
	 I5XV1SmXDzuBdbiJP08fnBN+T9pp8fE5dhbLgykFRIkydaAWkN7p3GtGl7ht8AdMeP
	 Gt+jsuJkX0tXQ==
Message-ID: <sashiko-outbox-179684@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 1/2] net: usb: pegasus: do not advance
 rx_skb->data on dropped frames
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021020310.34045-2-law.wei.jie@gt.tech.gov.sg>
References: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
 <20261021020310.34045-2-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 02:08:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> For the 0x8513 chip, read_bulk_callback() skips the 2-byte receive
> header by advancing pegasus->rx_skb->data in place. This is done before
> the pkt_len > PEGASUS_MTU check, and when that check drops the frame
> the goon path resubmits the same skb with the advanced rx_skb->data as
> the transfer buffer, still PEGASUS_MTU bytes long.
>=20
> Every frame with an oversized length field therefore moves the receive
> buffer two more bytes towards the end of the skb data area. A device
> that keeps sending such frames makes the host controller write received
> data over skb_shared_info and past the end of the allocation, and the
> corrupted skb_shared_info is used when the skb is eventually freed.
> With an emulated device sending frames filled with 0x5a on a KASAN
> kernel:
>=20
>   BUG: KASAN: slab-out-of-bounds in dummy_timer+0xade/0x3f00 [dummy_hcd]
> [ ... ]
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021020310.3404=
5-1-law.wei.jie@gt.tech.gov.sg?part=3D1

