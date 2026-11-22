Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344960;
	b=q88OZo4sEVkQbFjQI5QJpmH4K+Xqmp79KaV+chDKBJA+HOAFGX8PHPEGcI3NrnCF1oLv
	 Ra2TJTJMof2Ek6NZhY+4tX+1xAb7GxKJLq8XGFsgLgGs0DxjaY3uUO3U/Fbc+pOWbg6DS
	 dYrCJ7ZKsfjN6InRHig/+D8punPrJRNTchucl1FZlxutm/QPr72V9RJ8c0wfpeEb+ntzy
	 3Hx3eaF3dlPfGWwaJ3eSoDdNa44iG2KodF5Iq13PPt0arotFpKrUhqD0xM6HU1guGHlN0
	 QwYpfLFx8vi6XHza4XUYOBRHPpobzZp+KNEk9iVoaqfoCVu5Jd3ryEZbk6kO2CmXbhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344960;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=H6PLSHBCppuIJbDfjpgsQ31eOv68QnQOgp6JlsgD8/8=;
	b=K9xkw1KVs7Qv3xSaHAs07IjTsGPSkGVdh+sRrmg7/GLWrcB8OICtnt3p/rQLGB6YBPWK
	 JGE1pqhiF5vTtxc8eHBgkZZR9ygTK0S+AyLQAs6HK/siNjFsdKu1jkrZCK9fg/fv7f+x1
	 QggKwZUW4jjmkqOvbD6cyCu/fnTL8sMmhSJH56iTRlhrxfwO/TfLPjaulRofvEdY9DLTg
	 6Gn4samMA9xONm5wjcBkzLC54Z8na49SxHSzUeyFlh7w+KiDkSiWU/mw6L2ZYZZPFQd72
	 mAWmk8+86mAPmCeKag3eRITW/Gd6Ce377yDO/PfUbUesRhvWPjVuC1ZLBvxxtXSFOkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=mAPn7ct7;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=j3yzXMNe;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49781606A320;
	Sun, 22 Nov 2026 10:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49781606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=mAPn7ct7;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=j3yzXMNe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795344958;
	bh=3ACaoL9PZS9jkgQWfykiNuYcNcvJU/UPaeZmhzEbc0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mAPn7ct7AvkqSYb6k18vxq/Gu87QvibFADN4bDnNx1depkkd3h6+fvqbGaDo1S6EZ
	 QcfMwEpAVB+/UJ8j6NgZ/e71eslxCF28nB2JBfSwavHc9waH/yZWvk6aYAB8IZsqFZ
	 h6hgRAX4EMaGkJ9FUcSfyy2CGAcW2PyEAHFBmShKmGIxLcCgzIolRo10jfBTwvdJn1
	 IslaSiIxDgpFyjv2ajA+ifgfdcOGOajMNC8KYPt7UeQdWB2cZARQx6jbv6uhUY+S3v
	 eeLWRISiVh4UDu7PIu+458LoCLA9rekFd5rhnD6xYhOU5o9Yiu05wI37jHsm9N0XH8
	 GLDTfjitWgCOg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 7332D495A8; Sun, 22 Nov 2026 10:55:58 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795344957;
	bh=3ACaoL9PZS9jkgQWfykiNuYcNcvJU/UPaeZmhzEbc0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j3yzXMNevJMYuk+s7ws/PZHI8tBxmxx216BEyzb+VBDW9g6etESZhj8hMbDlIHseY
	 wNF/SwwLw81nNb/BwnMFamoKOJLhx4j/UclLDueYX3X11TcURjByR/TMU84sg3J2Cs
	 GgpNuRF8jwQGsYwQfil9arw6WJpq4cxE9xoNxpSNWd+tcrcFn/thXXWY6B1pBCJ7Ni
	 MmvzN4XJpE5t0iXNk4f4cgQvS3r6QNsdxfgdmGVNb32PNUMroWd//Nw86SfmdU23HH
	 WwX1+P1Wq1C/Y2ZaTwuY3z+GJ2WDSuap+X0A2QZ+sZH9MUjza6RGegll6NjXrUSL0y
	 N8ZpmOxeBqrGQ==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 23E304869D;
	Sun, 22 Nov 2026 10:55:57 +0000 (UTC)
Message-ID: <a6cac285-5df6-4440-bd58-99e29c71b0df@birger-koblitz.de>
Date: Sun, 22 Nov 2026 11:55:57 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] aqc111: Correct endianness handling in
 rx/tx_fixup
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
 <179515614261.3136.9007298128427052621@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <179515614261.3136.9007298128427052621@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/11/2026 7:29 am, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new `skb_cloned(skb) ||` term in aqc111_tx_fixup()
>    (drivers/net/usb/aqc111.c:1223) sends every cloned TX skb to…
> - [Low] The commit message misdescribes the change.
> - [Low] The patch fixes real runtime bugs but has no Fixes: tag and no
>    stable Cc, and its message reads like a sparse cleanup.
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but
>    aqc111_rx_fixup() takes pkt_len from the device-controlled per-packet…
> 
> --
> 
> aqc111: Correct endianness handling in rx/tx_fixup
> 
> This commit moves the RX and TX descriptor accesses in aqc111_rx_fixup()
> and aqc111_tx_fixup() to __le64 pointers with get_unaligned_le64() and
> put_unaligned_le64(), to address sparse warnings. It also makes
> aqc111_tx_fixup() always copy cloned skbs via skb_copy_expand().
> 
>> aqc111: Correct endianness handling in rx/tx_fixup
> 
> [Severity: Low]
> Does "endianness handling" accurately describe what changes here?
> 
> The old code already got the byte order right. le64_to_cpup() is
> le64_to_cpu(*p), and the TX path stored cpu_to_le64(tx_desc). Sparse was
> only complaining about the missing __le64 annotations.
> 
> The runtime changes in the patch are different, and the message doesn't
> describe them:
> 
> - Plain 64-bit loads and stores become get_unaligned_le64() and
>    put_unaligned_le64(), which is an alignment fix. aqc111 never sets
>    EVENT_NO_IP_ALIGN, so RX skbs carry the NET_IP_ALIGN offset, and
>    desc_offset is a multiple of 8. On NET_IP_ALIGN=2 architectures, the
>    trailing descriptor header and the descriptor array both sit at 2 mod 8.
>    On TX, skb->data - 8 is normally 2 mod 4.
> 
> - aqc111_tx_fixup() now always copies cloned skbs, and the message covers
>    that with only this sentence:
> 
>> Fix these problems and additionally also make sure that cloned
>> skbs are always copied for expansion.
> 
> Could the subject and body describe the alignment change and the
> cloned-skb change, so the patch isn't mistaken for a cosmetic sparse
> cleanup?
I will adapt the commit message and subject and make sure this is not 
misunderstood as cosmetics.


> 
> [Severity: Low]
> Should this carry Fixes: tags, and maybe be split into an alignment fix and
> a cloned-skb fix?
> 
> Two problems are fixed here. The 64-bit descriptor accesses in
> aqc111_rx_fixup() and aqc111_tx_fixup() are misaligned. aqc111_tx_fixup()
> also writes the TX descriptor and padding in place into the headroom and
> tailroom of cloned skbs. Both go back to the original aqc111 RX/TX data
> path commits.
> 
> Without Fixes: tags or a stable Cc, these fixes may not reach stable
> kernels, and the patch may go to net-next instead of net.
> 
>> diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
>> index dd53f413c38f6..39d8755ca8e7b 100644
>> --- a/drivers/net/usb/aqc111.c
>> +++ b/drivers/net/usb/aqc111.c
> 
> [ ... ]
> 
>> @@ -1116,10 +1116,10 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
>>   		goto err;
>>   
>>   	/* Get the first RX packet descriptor */
>> -	pkt_desc_ptr = (u64 *)(skb->data + desc_offset);
>> +	pkt_desc_ptr = (__le64 *)(skb->data + desc_offset);
>>   
>>   	while (pkt_count--) {
>> -		u64 pkt_desc = le64_to_cpup(pkt_desc_ptr);
>> +		u64 pkt_desc = get_unaligned_le64(pkt_desc_ptr);
>>   		u32 pkt_len_with_padd = 0;
>>   		u32 pkt_len = 0;
> 

I will keep this together but describe the fix better. The fix comprises 
very few spot changes and should also be understandable as is.

> [Severity: High]
> This is a pre-existing issue, not one introduced by this patch, but is
> aqc111_rx_fixup() missing a lower bound on pkt_len?
> 
> pkt_len comes from the device-supplied descriptor, and only an upper bound
> is checked:
> 
> drivers/net/usb/aqc111.c:aqc111_rx_fixup() {
>      ...
> 		if (pkt_desc & AQ_RX_PD_DROP ||
> 		    !(pkt_desc & AQ_RX_PD_RX_OK) ||
> 		    pkt_len > (dev->hard_mtu + AQ_RX_HW_PAD)) {
>      ...
> 		skb_put(new_skb, pkt_len);
> 		memcpy(new_skb->data, skb->data, pkt_len);
> 		skb_pull(new_skb, AQ_RX_HW_PAD);
>      ...
> 		usbnet_skb_return(dev, new_skb);
>      ...
> }
> 
> A malicious or broken USB device can report a pkt_len below
> ETH_HLEN + AQ_RX_HW_PAD and still keep pkt_total_offset equal to
> desc_offset. When pkt_len < 2, the skb_pull() above silently fails.
> 
> The runt skb then goes through usbnet_skb_return()->eth_type_trans(), which
> doesn't check the length. The 14 byte ethhdr is read from bytes that were
> never written, so skb->protocol and pkt_type come from uninitialized
> memory. The skb is then passed to netif_rx() without ETH_HLEN having been
> pulled.
> 
> If the device is bridged, br_dev_queue_push_xmit() calls
> skb_push(skb, ETH_HLEN) into headroom that was never written. That could
> transmit about 12 bytes of stale kernel memory on another port. An
> AF_PACKET reader could also get uninitialized bytes in sll_addr.
> 
> Would rejecting pkt_len < ETH_HLEN + AQ_RX_HW_PAD in the drop condition
> above prevent this?
> 
I will add this fix.

> [ ... ]
> 
>> @@ -1220,7 +1220,8 @@ static struct sk_buff *aqc111_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
>>   	headroom = skb_headroom(skb);
>>   	tailroom = skb_tailroom(skb);
>>   
>> -	if (!(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
>> +	if (skb_cloned(skb) ||
>> +	    !(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
>>   		new_skb = skb_copy_expand(skb, sizeof(tx_desc),
>>   					  padding_size, flags);
>>   		dev_kfree_skb_any(skb);
> 
> [Severity: Medium]
> Does this new skb_cloned() check force a full payload copy for every TCP
> data skb?
> 
> TCP transmits clones from __tcp_transmit_skb(), so skb_cloned() is true
> for these skbs by the time they reach ndo_start_xmit. TCP also marks them
> nohdr, so skb_header_cloned() is false. Writing the 8 byte descriptor into
> their headroom was therefore already allowed.
> 
> skb_copy_expand() allocates a new linear buffer of
> 8 + skb->len + padding_size using the caller's GFP flags. It then copies
> the whole payload, including the frags.
> 
> This bites hardest when usb_device_no_sg_constraint() sets can_dma_sg in
> aqc111_bind() and AQ_SUPPORT_FEATURE enables NETIF_F_SG and NETIF_F_TSO.
> In that case the skb_linearize() call earlier in aqc111_tx_fixup() is
> skipped.
> 
> Before this patch, a nonlinear TSO skb with padding_size == 0 went straight
> to skb_push(). Now it gets a linearizing copy of up to about 64KB. That
> needs a high-order atomic allocation, and the packet is dropped if the
> allocation fails.
> 
> Linear cloned skbs are copied too, for example every packet while an
> AF_PACKET tap is active. Nonlinear skbs that need padding were already
> copied before this patch, because skb_tailroom() returns 0 for them.
> 
> The sibling ax88179_tx_fixup() only unshares the head:
> 
> drivers/net/usb/ax88179_178a.c:ax88179_tx_fixup() {
>      ...
> 	if ((skb_header_cloned(skb) || headroom < 0) &&
> 	    pskb_expand_head(skb, headroom < 0 ? 8 : 0, 0, GFP_ATOMIC)) {
>      ...
> }
> 
> Would skb_header_cloned() plus pskb_expand_head(), sized for the
> descriptor and the padding, be enough here?
The change fixes a definite error in case the skb was cloned. The fix 
may be relatively resource-intensive in case it is triggered, however it 
is preferable for the code to be correct. I cannot further optimize this 
code as I do not have actual hardware to test.

> 
> The commit message also doesn't say which problem the cloned check fixes.

I will add this.

