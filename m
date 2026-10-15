Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A0529BD9A
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 02:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032820; cv=none; b=Qox7AfWZ4NbG9p40NqvSx34LsUo5aA3hCny+vpvJ6zSm9qKmFW98eDU4FBd+q+qBE28mnTU1K9fk8+TfLqsMxEjB0pym4Zg5Bt4cIdJf1AE2QFr9c3F0ej8Gw0qEGWHadqKw/GnAnut9rIuV6qypClRuLXdBssVvy7vtGBvuB1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032820; c=relaxed/simple;
	bh=nyCq+9oDU6mBGAQ1mxoLkuBt74UFXk9k+qZEb8k4Zfg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CPNeF4Yhi/Lowy4Pq5XAsaZbCmfdUFq3/P9g2YyCBVu9MquFl6h41YSAQ1f3+z6R12me1Zz/5TJ1C3WZgpcz0sjI9F/fx2/iGNMex9rHFrIVL+quL3TDHs+1S7cuHEEfE1xR9BPDGklJ+iZGcGXYLRSV0O+lmeRgbPx2+r5kGxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyorU1LB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyorU1LB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57DE1F000C5;
	Thu, 15 Oct 2026 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792032819;
	bh=I6OJjvd09kUWzibTCj7QanRWWbjb3xQ6jCdbi/Zsw0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eyorU1LBNXyv8tFStOoQmXpJJU213J6JaR40qM1kvJ8xZlJeaEKhn8Z7q6uRzs8Hn
	 U/wf7oh644RaR76FSATgd2zmTkbEiKlPpG/7fHffE6psAr1uHEq8SsMVcrXUUI0PBN
	 87BUdc8CjPRjkczMgf4HQS0kzTJM7ku+0+QaRt1CaWziXOWbdTua7sw8iDVA/U4Ypf
	 n8Jh4sV9WlYcrkTncXhuK0L79TfJb1Fe1Rzyu52nk0DNN6mZ04D270b7zqfzkdvYoK
	 dDIpp17mV3051EVDoLeZnldQHu0F52l9RYk0ZBfOdXCzl+D/opIqg42mzX9J+0g1VB
	 s1L/eCSOxRSSg==
Message-ID: <sashiko-outbox-172186@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] net: usb: pegasus: check rx pkt_len against the
 received length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014025307.25233-3-law.wei.jie@gt.tech.gov.sg>
References: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
 <20261014025307.25233-3-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 02:53:38 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: usb: pegasus: uninitialized memory read in eth_type_trans o=
n short packets
--

commit 35f61a0523edaec588769ea008eada12f3c5521e
Author: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>

net: usb: pegasus: check rx pkt_len against the received length

This commit modifies the receive path in the pegasus driver to drop frames
where the claimed packet length plus the receive header offset exceeds the
actual received byte count. It prevents packets from being processed with
uninitialized buffer data when a short transfer claims a long frame.

> diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
> index 7c7d6b69998f2..7bc9312eaa9ec 100644
> --- a/drivers/net/usb/pegasus.c
> +++ b/drivers/net/usb/pegasus.c
> @@ -520,10 +520,11 @@ static void read_bulk_callback(struct urb *urb)
>  	}
> =20
>  	/*
> -	 * If the packet is unreasonably long, quietly drop it rather than
> -	 * kernel panicing by calling skb_put.
> +	 * If the packet is longer than what was actually received, quietly
> +	 * drop it rather than kernel panicing by calling skb_put or passing
> +	 * up stale buffer contents. count is at most PEGASUS_MTU.
>  	 */
> -	if (pkt_len > PEGASUS_MTU - rx_offset)
> +	if (pkt_len + rx_offset > count)

[Severity: Medium]
Does this length validation adequately prevent undersized packets from pass=
ing?

If a small transfer arrives with count =3D 4, pkt_len =3D 0, and rx_offset =
=3D 2,
the check (pkt_len + rx_offset > count) evaluates to false since 0 + 2 <=3D=
 4,
allowing the packet to proceed.

The function then calls skb_put() and passes the buffer to eth_type_trans()
further down in read_bulk_callback():

	skb_put(pegasus->rx_skb, pkt_len);
	pegasus->rx_skb->protocol =3D eth_type_trans(pegasus->rx_skb, net);

Because eth_type_trans() unconditionally reads ETH_HLEN (14 bytes) to parse
the MAC header, providing it with an empty or undersized socket buffer
results in an uninitialized memory read of 12 bytes.

Could an additional check be added to ensure the calculated pkt_len is at
least ETH_HLEN before passing the packet up the stack?

>  		goto goon;
> =20
>  	/*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014025307.2523=
3-1-law.wei.jie@gt.tech.gov.sg?part=3D2
