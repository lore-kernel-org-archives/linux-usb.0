Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EA12931FC
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 02:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032819; cv=none; b=tuxLkjhP0OBZ1rQu2LwIj7uMYrqj1OMKxEgg1Q9qYfQNO2hZXHfWCrMrq+aq3i/eFGCYF9OtdXuNysWj+JxxxexLFNBG7FLjwAjQIrcM4SpslmIOlHsqTSfkIBSRyR/HU/NV6tZAv9I/ZqS2e+FlWhfSpOcP1k+YSib5DVygy2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032819; c=relaxed/simple;
	bh=1zPyNOWSJ2TBcbLb2D2HzE7t1jFfnJsyPG1/RqHpMhg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=IqncvRtM+fIzf3pV8VC97lvzKmqaufZ8bH0zVOHCWTc0gOUYex0rOhJwmyP2AgAshUrnFXqMIaDcc/k0Wrr+sKjXQf/w49QYJK5bjLgVY3MxLuB/vHQX+vHzuSJ36ZB9uiWMKr5Spr/ctuoM79MILZq3rIsdedVwMH5n6z8mriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpW+p2r8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpW+p2r8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330491F000C4;
	Thu, 15 Oct 2026 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792032818;
	bh=0aR5XUzTNQ9gUwMdANFb84ywD5+M9fs7ZAY4kTSQ548=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bpW+p2r8BvEe4GRaR6R/TCGd5EUiWIQqRdiElqdJRXRj5zQD2ByyQyFEf0z9JcoJT
	 8wBP0HwOCv1gLuVjiUiuZBHo4sprKCiBV2mmphZENkqBmTG0LrYmpWBayQ1unZ3b0W
	 oaLrQE77hf01XeGs1R1JSfWvgZr/Z1FNmR5SPsaM3gsOehz4eRf1b4i0dtZfB5UC56
	 vTjftVpYq/JMxqenRtA+bzxdY6jMRjdxeQD3stFPPvL7tamGSC3EM5GXjeHZvbpzJl
	 nIjHhtTg/kjtD93N/5jDVUdKa0LylSYNPhqZSYwLJaKX0RASP3IA1uQAovukcb37jD
	 qCjjDEa+TURIw==
Message-ID: <sashiko-outbox-172185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 1/2] net: usb: pegasus: do not advance rx_skb->data
 on dropped frames
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014025307.25233-2-law.wei.jie@gt.tech.gov.sg>
References: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
 <20261014025307.25233-2-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 02:53:37 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

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

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014025307.2523=
3-1-law.wei.jie@gt.tech.gov.sg?part=3D1

