Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540449;
	b=CL6nOiQf8M2A1bipcov9TCblUbWGukEuIzhxnM0zEJ8mr+9Yh2+1WaHmg0UZoGpDBNRy
	 lFqPvw9xMZcHFvMjdyLA/Y7ASPpCrTmzFFmTYuDP7zvBlPxqkidpam4f2hk/ENEx4xwyT
	 ioJwwKIbxjyvaYt7HEaeEh6DuR+CAFhgeYlbJSLUscRfZFyOOSg7I1gL0uFJ/FkcfEpfU
	 +q/4hsd01iYVuvoFw8Xn6E2N/m/Yv27qkujDW80RCw8w5iVN7ggwNYjM9IYNS5Y+XSkAc
	 5CNxpduGd5xqLxj/Af2j3k778E1sgnLI3XSsa8gB5MTSlbOBatL+D/N09s9GNmdM/Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540449;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xBUgoBwiCo/I8dngiw0+NDPru7g85bUah1y5hMNGY4g=;
	b=qQne/PnMX5q4SYUIc9su2qMHBrUSqhqKIe/P+dVA0YiISp1qt/wTBScj8jx9Gl3YQLBD
	 z9hOgk/njoTnaEWQo/EGLeI2ChUcOESbOrAdHgFunLXVmRD9OrwGqtHL/ooaLbP8c59GB
	 TMUh3KORp9F9zJ7VsfZ94W4B5UGpxf+02W19wxQG+w70GNCjsz9Da5J+REQm0cGqm+GLB
	 wN3ceCz5lne2mASBLtI8ZUKyzEBxz/vF5qX6BBUsTxKYsr/8JBcRSgkltqRaQnaR/QiUC
	 XSjfV7xqwL8/36nbz1aogta1MdH/UyUlMdRfaQw5M47+fYwVV7tq24p55TfShgcWF8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=rnxf8nub;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=rwD7HPtM;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD6606A321
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFD6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=rnxf8nub;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=rwD7HPtM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795540441;
	bh=lyYhJk/nsWiXYh0fWBAr2VZpmntRWGWBvDtb+aYHIT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rnxf8nubXUW8tKaaOifNkYoxMtQyfoMs6VYFTVwEFdE5gBZ2vCHwfaElp0jSYxg+/
	 //mfThsX5sIrEy9hT6cUIPNPjIPTRnDNnVWAYpkMeI/r/nSSx2wYPXFlooFd2RlCni
	 VswrV/smOfkh93NtRzBQXLr2YPdqmRV1sjsy3JYWpmcnhp5WSEqRj6R8TKYQaFh3v6
	 tBoOl2M9GzQi0dK+fko1/bn9CVJ5a+a8BIB0W4KBw2Vzngqw6jBJ3q1EMiHa2zGrcG
	 r5XPX/lsEpnifmdX8Tt04szNuz2NJ4ke/ihrOErL/vk9R86VTNTIXX3W76uNXVoDwB
	 kGZJg5S5xr+Xw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 591E1495E9; Tue, 24 Nov 2026 17:14:01 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795540440;
	bh=lyYhJk/nsWiXYh0fWBAr2VZpmntRWGWBvDtb+aYHIT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rwD7HPtM7SH7rkO1/epTjwtXW2afcfLxLnnsPohG05TgNM1twaiQgC1u6hsaYt6Rm
	 A93hQxdSO2hyB2AT9Nt1/cb5g4uU6bI2jBVbUM5OE7PHp3RpxeR/x3TeG8BhescspZ
	 V2o965Efug1lNhiPRoNhPoPS5sJvIhMTylE+3+ds8WkTqfEYkAXdCj0D2fD1thKUT3
	 JZJNqWtsNiuqPCDW7ropG1P5SRfdBQWELdiiwcDBnLiGJr9tU5WYm79k7OxyXsUvTv
	 DmQGiFtLTEhV1VsPsZPgdEMe78VnVSNUvywM+fXqulBlm30YvhHRFqNmgj5704upXh
	 tbEB2/mFy3V1A==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 5AF5E495E2;
	Tue, 24 Nov 2026 17:14:00 +0000 (UTC)
Message-ID: <fee1ad7f-298e-4233-8e76-fbd104175aee@birger-koblitz.de>
Date: Tue, 24 Nov 2026 18:14:01 +0100
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
Subject: Re: [PATCH net-next v2] aqc111: Fix rx/tx_fixup issues
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261122-aqc111-v2-1-52d5ddb17a37@birger-koblitz.de>
 <sashiko-outbox-229100@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-229100@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 12:10 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: usb: aqc111: unnecessary skb_copy_expand() in
>    aqc111_tx_fixup()
> --
> 
> commit 72c72c17e1d18f31f018cbdd222d6325ba34956e
> Author: Birger Koblitz <mail@birger-koblitz.de>
> 
> aqc111: Fix rx/tx_fixup issues
> 
> This commit uses unaligned little-endian helpers for RX and TX descriptors,
> checks for cloned skbs in aqc111_tx_fixup(), and validates minimum packet
> length in aqc111_rx_fixup().
> 
>> diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
>> index 12a99df77f0d3..ee7c8bb858458 100644
>> --- a/drivers/net/usb/aqc111.c
>> +++ b/drivers/net/usb/aqc111.c
> [ ... ]
>> @@ -1224,7 +1225,8 @@ static struct sk_buff *aqc111_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
>>   	headroom = skb_headroom(skb);
>>   	tailroom = skb_tailroom(skb);
>>   
>> -	if (!(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
>> +	if (skb_cloned(skb) ||
>> +	    !(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
>>   		new_skb = skb_copy_expand(skb, sizeof(tx_desc),
>>   					  padding_size, flags);
>>   		dev_kfree_skb_any(skb);
>> @@ -1236,7 +1238,7 @@ static struct sk_buff *aqc111_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
>>   		skb_put_zero(skb, padding_size);
>>   	/* Copy TX header */
>>   	tx_desc_ptr = skb_push(skb, sizeof(tx_desc));
>> -	*tx_desc_ptr = cpu_to_le64(tx_desc);
>> +	put_unaligned_le64(tx_desc, tx_desc_ptr);
> 
> [Severity: Medium]
> Does checking skb_cloned(skb) unconditionally force skb_copy_expand() on
> every TCP packet even when padding_size == 0?
> 
> Outgoing TCP skbs arrive cloned from __tcp_transmit_skb(), but
> tcp_skb_entail() calls __skb_header_release(), so skb_header_cloned(skb)
> is false and the headroom reserved via needed_headroom is unshared.  When
> padding_size == 0, aqc111_tx_fixup() only pushes tx_desc into headroom and
> never touches the tail, yet this check now copies and linearizes all such
> TCP packets (including nonlinear SG/TSO packets when dev->can_dma_sg is
> set) under GFP_ATOMIC instead of transmitting their fragments via
> build_dma_sg().
> 
> Should this check skb_header_cloned(skb) || (padding_size &&
> skb_cloned(skb)), matching asix_tx_fixup()?
> 

I will change the check to be finer-grained as suggested.

Birger
