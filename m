Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156143;
	b=zfpI9xNPBY715zM/4RZx9yNLxmxdKB4+0K1adcrR2Ux/dsekzboKeZHKK/F9Rm80lr2h
	 IPGI5Vib4cL5ONS/Wg/dUNVFTSZ/f+rui0/q3dyvnnIPIRdBQ0xJfr25RYlk7k14Jm8iG
	 W/+u+f2UJ3SAVqW3ap3wovj30b35E0D47Q2Qkr4mD4F4lBKr8VGDEn9YdZkL7Kj33ljIK
	 Uh+OdiYcNlNZeUfdExuGRn42F1L2ecrCOGihSq4J3ju6dPXRUgsTkm9lF7bHGuKEKsNRE
	 uuuwPjThfB754PYQhldf9KEtu9dYebRajbNxzlfa6qqjMsaSlqXuOrBaS/+zvyJ1oEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156143;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6r5YdkdPx0JHlq1kqBAhLW8GKPt7jP2c9Sj28z24pgs=;
	b=W67raXLD1ZtGo4S48BJDSHy/e/Hf8C1JNcWz+WC16/rY/Rox3h5sfV5rmUAT7jUiKgRO
	 bxmnNDOUASfwltqb5KxhYNxhN7qccI8793bv+AwBxlqBX6/sZhS1m3RiILCleXu7WgO3X
	 ZFXpblWFQVdvZoapYjfIjvZ4QW8A1Gw/KdNn/JJwb7sETR+x5zYXzF/Jdc59zv0YpRRUo
	 iecqgq4ywfUmXQ9CctTbwE7zmXWRvYMyWmFCF7atcn29SrVa+SHHQ15kc6T2Z6NnijyXX
	 0xzsR4KobJshFNtA73ZSIWIrSx6CelgRavimNH03N7JMpvPv5HL8w5vIq1ff87gUgnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZ94YtnX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB43606A326;
	Fri, 20 Nov 2026 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZ94YtnX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B2C1F000CA;
	Fri, 20 Nov 2026 06:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156143;
	bh=6r5YdkdPx0JHlq1kqBAhLW8GKPt7jP2c9Sj28z24pgs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TZ94YtnXIq4+7GYPfXrnA15pnUcyJJT4Uhk4mbYxQFYWC+ApHuvM6FdnVMEvOsk1j
	 HhW+eYM4QAzbxqi3kOgjRnigNDfI1oAkze89PTok80UXcMMOfW5tDO/Q3FjNV3IGp2
	 tsG6XDlcwQTs2WY1fybmk+hPyhlEqJ6GKouDmfWtNx+M9VPqDdF/7pXMKf4vQhcFuD
	 3sJtRAFiXHBsc0oVidL2N4nWPgKjYrj9CH/buT2PZ9d79siEbD3o1OW9sAm+oTp91j
	 2QBiyG/JgoZxiUXWsV3m/mJfO83hSeYFLQ2Po+NI2+QP16RQP3b87+Oj9XqO1vyzlf
	 HxnTfUlKYvY7g==
Subject:
 Re: [PATCH net-next] aqc111: Correct endianness handling in rx/tx_fixup
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 06:29:02 +0000
Message-ID: <179515614261.3136.9007298128427052621@kernel.org>
In-Reply-To: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
References: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new `skb_cloned(skb) ||` term in aqc111_tx_fixup()
  (drivers/net/usb/aqc111.c:1223) sends every cloned TX skb to…
- [Low] The commit message misdescribes the change.
- [Low] The patch fixes real runtime bugs but has no Fixes: tag and no
  stable Cc, and its message reads like a sparse cleanup.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  aqc111_rx_fixup() takes pkt_len from the device-controlled per-packet…

--

aqc111: Correct endianness handling in rx/tx_fixup

This commit moves the RX and TX descriptor accesses in aqc111_rx_fixup()
and aqc111_tx_fixup() to __le64 pointers with get_unaligned_le64() and
put_unaligned_le64(), to address sparse warnings. It also makes
aqc111_tx_fixup() always copy cloned skbs via skb_copy_expand().

> aqc111: Correct endianness handling in rx/tx_fixup

[Severity: Low]
Does "endianness handling" accurately describe what changes here?

The old code already got the byte order right. le64_to_cpup() is
le64_to_cpu(*p), and the TX path stored cpu_to_le64(tx_desc). Sparse was
only complaining about the missing __le64 annotations.

The runtime changes in the patch are different, and the message doesn't
describe them:

- Plain 64-bit loads and stores become get_unaligned_le64() and
  put_unaligned_le64(), which is an alignment fix. aqc111 never sets
  EVENT_NO_IP_ALIGN, so RX skbs carry the NET_IP_ALIGN offset, and
  desc_offset is a multiple of 8. On NET_IP_ALIGN=2 architectures, the
  trailing descriptor header and the descriptor array both sit at 2 mod 8.
  On TX, skb->data - 8 is normally 2 mod 4.

- aqc111_tx_fixup() now always copies cloned skbs, and the message covers
  that with only this sentence:

> Fix these problems and additionally also make sure that cloned
> skbs are always copied for expansion.

Could the subject and body describe the alignment change and the
cloned-skb change, so the patch isn't mistaken for a cosmetic sparse
cleanup?

[Severity: Low]
Should this carry Fixes: tags, and maybe be split into an alignment fix and
a cloned-skb fix?

Two problems are fixed here. The 64-bit descriptor accesses in
aqc111_rx_fixup() and aqc111_tx_fixup() are misaligned. aqc111_tx_fixup()
also writes the TX descriptor and padding in place into the headroom and
tailroom of cloned skbs. Both go back to the original aqc111 RX/TX data
path commits.

Without Fixes: tags or a stable Cc, these fixes may not reach stable
kernels, and the patch may go to net-next instead of net.

> diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
> index dd53f413c38f6..39d8755ca8e7b 100644
> --- a/drivers/net/usb/aqc111.c
> +++ b/drivers/net/usb/aqc111.c

[ ... ]

> @@ -1116,10 +1116,10 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
>  		goto err;
>  
>  	/* Get the first RX packet descriptor */
> -	pkt_desc_ptr = (u64 *)(skb->data + desc_offset);
> +	pkt_desc_ptr = (__le64 *)(skb->data + desc_offset);
>  
>  	while (pkt_count--) {
> -		u64 pkt_desc = le64_to_cpup(pkt_desc_ptr);
> +		u64 pkt_desc = get_unaligned_le64(pkt_desc_ptr);
>  		u32 pkt_len_with_padd = 0;
>  		u32 pkt_len = 0;

[Severity: High]
This is a pre-existing issue, not one introduced by this patch, but is
aqc111_rx_fixup() missing a lower bound on pkt_len?

pkt_len comes from the device-supplied descriptor, and only an upper bound
is checked:

drivers/net/usb/aqc111.c:aqc111_rx_fixup() {
    ...
		if (pkt_desc & AQ_RX_PD_DROP ||
		    !(pkt_desc & AQ_RX_PD_RX_OK) ||
		    pkt_len > (dev->hard_mtu + AQ_RX_HW_PAD)) {
    ...
		skb_put(new_skb, pkt_len);
		memcpy(new_skb->data, skb->data, pkt_len);
		skb_pull(new_skb, AQ_RX_HW_PAD);
    ...
		usbnet_skb_return(dev, new_skb);
    ...
}

A malicious or broken USB device can report a pkt_len below
ETH_HLEN + AQ_RX_HW_PAD and still keep pkt_total_offset equal to
desc_offset. When pkt_len < 2, the skb_pull() above silently fails.

The runt skb then goes through usbnet_skb_return()->eth_type_trans(), which
doesn't check the length. The 14 byte ethhdr is read from bytes that were
never written, so skb->protocol and pkt_type come from uninitialized
memory. The skb is then passed to netif_rx() without ETH_HLEN having been
pulled.

If the device is bridged, br_dev_queue_push_xmit() calls
skb_push(skb, ETH_HLEN) into headroom that was never written. That could
transmit about 12 bytes of stale kernel memory on another port. An
AF_PACKET reader could also get uninitialized bytes in sll_addr.

Would rejecting pkt_len < ETH_HLEN + AQ_RX_HW_PAD in the drop condition
above prevent this?

[ ... ]

> @@ -1220,7 +1220,8 @@ static struct sk_buff *aqc111_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
>  	headroom = skb_headroom(skb);
>  	tailroom = skb_tailroom(skb);
>  
> -	if (!(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
> +	if (skb_cloned(skb) ||
> +	    !(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
>  		new_skb = skb_copy_expand(skb, sizeof(tx_desc),
>  					  padding_size, flags);
>  		dev_kfree_skb_any(skb);

[Severity: Medium]
Does this new skb_cloned() check force a full payload copy for every TCP
data skb?

TCP transmits clones from __tcp_transmit_skb(), so skb_cloned() is true
for these skbs by the time they reach ndo_start_xmit. TCP also marks them
nohdr, so skb_header_cloned() is false. Writing the 8 byte descriptor into
their headroom was therefore already allowed.

skb_copy_expand() allocates a new linear buffer of
8 + skb->len + padding_size using the caller's GFP flags. It then copies
the whole payload, including the frags.

This bites hardest when usb_device_no_sg_constraint() sets can_dma_sg in
aqc111_bind() and AQ_SUPPORT_FEATURE enables NETIF_F_SG and NETIF_F_TSO.
In that case the skb_linearize() call earlier in aqc111_tx_fixup() is
skipped.

Before this patch, a nonlinear TSO skb with padding_size == 0 went straight
to skb_push(). Now it gets a linearizing copy of up to about 64KB. That
needs a high-order atomic allocation, and the packet is dropped if the
allocation fails.

Linear cloned skbs are copied too, for example every packet while an
AF_PACKET tap is active. Nonlinear skbs that need padding were already
copied before this patch, because skb_tailroom() returns 0 for them.

The sibling ax88179_tx_fixup() only unshares the head:

drivers/net/usb/ax88179_178a.c:ax88179_tx_fixup() {
    ...
	if ((skb_header_cloned(skb) || headroom < 0) &&
	    pskb_expand_head(skb, headroom < 0 ? 8 : 0, 0, GFP_ATOMIC)) {
    ...
}

Would skb_header_cloned() plus pskb_expand_head(), sized for the
descriptor and the padding, be enough here?

The commit message also doesn't say which problem the cloned check fixes.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-aqc111-v1-1-27a54c4b54ca%40birger-koblitz.de
