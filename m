Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862917;
	b=A8bIrZYLesEdJOmuqo22HuhziHyOHpDIB7iNKINI6+nS2Xfzo/DuIFfafGFIkwjYJEZi
	 qBT28AQWLfM3b8RCVMyYqIcjyMULdqPaLqa7Ihw9KWHa41FsWxfGRjzB+59xYZac5rAKQ
	 KpRFkdQTSQ+Z4IujfPNlVo5Khq5YHFhXlSRpuEOsHJWG/FU/wgETkmF+6gWKa3Zfcqw92
	 S7QxV8e/9klmPIJUYplAIvQc43U9CytSfFRbn2UYGhI9AmL6b9k1w29d93Tp6qQWkqPCu
	 bMlmQaOcbVFZNOU5Xb+GdRx1TsvVeeP6nnOiD+FdGYypRgYfzSdFsHiwPHXuB6DpIqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
	 X-Originating-IP:Content-Type:Content-Transfer-Encoding;
	bh=VzZICWgvtwUsOj7HwUeSetfuU1+NwVe6kKdGB3d8lvE=;
	b=TMAezy2jxtBD854z7YJM4nLMcaNt/vhHQ/0EpkYhPAHlex7dVkZxX8SOLYR9DB/eACcB
	 W0jFVqgv+Ekb0xWdOJuxhzccyyFacG+dDmmmbC+Xq3Gw5+vipeTnSwAu2vPZAUrLyOifl
	 fBnP3KdCarsoxFlmAKEBNAgJdHx782UTC787PGo+TGTuhg0RTwaDKo6kHpCjs5rBKnFMX
	 UmoOm7yyl19G1EdTWVdYe29m/HTsQPuru7QYx+qdo4/UAS2828dHE8px25p+Mymnw3dty
	 fJFfeTu6h9VOABuqd2mHbv8XS52/0Q91Uw+oNnLflchFuSnm6VaQ7Xupmaj89e6PtFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=NIIe5xyX;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E48606A88A
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E48606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=NIIe5xyX
Received: from webmail.iinet.com (web1.iinet.com [52.129.46.51])
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPA id 9F97BB405A0;
	Mon, 16 Nov 2026 13:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1794862916; bh=VzZICWgvtwUsOj7HwUeSetfuU1+NwVe6kKdGB3d8lvE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NIIe5xyXiHLTh+ZoJX36OkDKhDpMqG4TshgOn85iPrczil+A1ppXJRsI6QWUEiAEe
	 /krKbrDtGryiULpAqKaYviVn5ItAjtI+lMwpQWn2DnQn9siHmmpsBHYQMYZtNNdFtP
	 Skg5g7mxHi0cgHK7qHku+oxFHm4T3KU76bvl2z44n6LmsDBMl6GxI3UCEADVqKD4P1
	 TAo3trWeR4Jz+9PmbghZucwRKjndpLquWuGBPXyuN9lUyakETo8T6UcUEnahZQTSa6
	 ghlcxqIxOBipuCo6+UaY4zvoHGqIRS20iqXwZHOcnxuECulLsUllGXNOjoA6GMv966
	 JMd8uPOxUeLzA==
Received: from c-98-203-133-45.hsd1.wa.comcast.net ([98.203.133.45])
 by webmail.iinet.com
 with HTTP (HTTP/1.1 POST); Mon, 16 Nov 2026 13:01:53 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 13:01:53 -0800
From: kaf@nwlink.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_audio: don't exceed maxpacket when adding
 a residue frame
In-Reply-To: <20261026231026.721536-1-kaf@nwlink.com>
References: <20261026231026.721536-1-kaf@nwlink.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <db18fcc4f778afbf515fed81a4a13488@nwlink.com>
X-Sender: kaf@nwlink.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-26 16:10, Kyle Farrell wrote:
> u_audio_iso_complete() clamps the base packet size to ep->maxpacket
> and accumulates fractional-frame residue in p_residue_mil. Once a
> whole frame has accumulated, it is appended to the packet without
> checking whether it fits within ep->maxpacket.
> 
> Only append the extra frame if it fits. Consume the accumulated
> residue whether or not the frame is sent, preventing it from growing
> when the additional frame cannot fit. When the frame fits, behavior
> is unchanged. Otherwise, the stream cannot sustain the requested
> sample rate.
> 
> For example, with 27 channels of 32-bit samples at 19200 Hz on a
> high-speed link with p_hs_bint=3, the required packet size of 1080
> bytes is capped at 1024. The base packet is 972 bytes, but appending
> a residue frame increases it to 1080 bytes, exceeding the allocated
> request buffer by 56 bytes.
> 
> Fixes: 9bb87f168931 ("usb: gadget: f_uac2: send reasonably sized 
> packets")
> Link: 
> https://lore.kernel.org/linux-usb/sashiko-outbox-174688@kernel.org/
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c
> b/drivers/usb/gadget/function/u_audio.c
> index f0ee83abcebc..f73d1085c1d1 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -230,9 +230,13 @@ static void u_audio_iso_complete(struct usb_ep
> *ep, struct usb_request *req)
>  		do_div(div_result, uac->p_interval);
>  		do_div(div_result, 1000000);
>  		if ((unsigned int) div_result >= uac->p_framesize) {
> -			req->length += uac->p_framesize;
> +			/* req->length is bounded by ep->maxpacket above. */
> +			if (uac->p_framesize <= ep->maxpacket - req->length) {
> +				req->length += uac->p_framesize;
> +				pr_debug("increased req length to %d\n", req->length);
> +			}
> +
>  			uac->p_residue_mil -= uac->p_framesize * p_interval_mil;
> -			pr_debug("increased req length to %d\n", req->length);
>  		}
>  		pr_debug("remains uac->p_residue_mil %llu\n", uac->p_residue_mil);
> 
> 
> base-commit: bdf12cde30830d46a8ef1ba93986356f1164b4f1

This patch also is suitable for stable backporting, as it fixes a 
potential out-of-bounds write in existing configurations.  Please add 
the following trailer when applying:

Cc: stable@vger.kernel.org

Thanks,
Kyle Farrell
