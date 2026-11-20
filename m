Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184456;
	b=gv2VxLxlT7q1FoNmXx0Rn55xGxDRAxrSEmyIR343UVLgYZ6DoAa1Pw2oFXisX5Ij+z+0
	 CSfs+6RQasTvXOJSBmYjgzopqqoU91OtgoDThcC0Akp9TIPR+N8fXb+SBfaMh53otLicb
	 M39sDizOuAjsBJia69cdfDq0g/SpA3MJlJtUMpvonfJvcJn/ffFIew4j6u1D43ECu7mm2
	 N8Bu/ufLNYhtRVVgDOrYcz2Wk5BIprObqE4vf9lI8b+cHDcqlKqNDq63KWJvFbcnRFNwj
	 M6yrMardvdEXIrgPbBEElcCakIQbBxeov/0TJqikJ+iHbEMdpQcfuC3NwyAKxqbWJ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184456;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vTQ4E2JgOTpZe0dib1eo5BcGfkwG6YBsKTtMFnWJdVs=;
	b=blFhWs4ezmkwZsZNBUY9YgldwbESfk2kX12FlxdP1/0Jse1UcNGfE6zQKSm1fhI17lX6
	 f4NoE1nypMoDBYyH68JoNJI8Sm12uiaXWmX4kQNfNoqo1OndHRvxI4CzcbzYUtgVlPaJR
	 e7FNJ0g+Zkk+C+SmuF+cWACsknl+CzZk4GUyHeblzTHHabZfGfnj9wOrMXaF3KsG2prTN
	 Qc7R8+27sSHPsMh6rYRQoNUbCS1Iwp/gatjuFaqA1D0jklvjyj7tzAujpsJhL9mUTxu/k
	 O89klt/BmpTstK0+mJHuv2EVI9pt+TxVxo6OVO8jrggHa6Tgoe2huxj0NJEBxpMT/hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=nlVZAP5t;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R3t6QVPq;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FCD606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 14:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FCD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=nlVZAP5t;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R3t6QVPq
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id CB4621D004F6
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:20:54 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 20 Nov 2026 09:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1795184454; x=1795270854; bh=vTQ4E2JgOT
	pZe0dib1eo5BcGfkwG6YBsKTtMFnWJdVs=; b=nlVZAP5tC2kFKEt/YRH4MoOk1b
	KOiMTw0RTs/hwUoIbhY8EdigVvr2y97QulUBE4DJTsNo1Nu8fNp9I8M/u1p3/95U
	xnMDE9F+W91uX5zsltbQpqi5xutBp4Zj8o3B31wfwxhwpH8kus+vPevhHs1He3l9
	eMhT5EYXTwdoOPwRGbnkl/mBpoRXJ64RhbbAf5lySUmZIU9Y9uuLCBKpB3f4C0G2
	fgOpGRuONyx4X/6AhtKs4eDWn087LmHmMHDwC2C90ccmqRwvGW8W8ZmP15vFd7WL
	WD0kLuM/q9TcAaGRfakU2nEfhDFrZ7Pt4tluBofntg4+aE44ePF6MxKwHpvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795184454; x=1795270854; bh=vTQ4E2JgOTpZe0dib1eo5BcGfkwG6YBsKTt
	MFnWJdVs=; b=R3t6QVPq+zXQ5xBKZfZOWk7bXp/6p3rcrVOAclCSWWBN6mknU5L
	c3xgwB/PlzxUJv/Po75+qFHh5VUFMK9nWmp2RnJphdfsGZJlzUg9W25o5W4101hT
	p7vMN5tgNBnpaxsNULvqAUtFfxNrKJB0RHFP6imObkfl4w4uVJn+A3dgAsqJsy/W
	bZijFGubvb++oQFg88FL6FT5Moeql9DfAPWtj/M5XuG+8P+khuxr998/ubRVe7YI
	0woLHYFVZJYMSfFqkQqeXDlg+To5blz0WZEbe7xIZr9hz8X7dZeyjY0wFYG4MxKf
	aIW5QjPtS84R1N/dYkgySyDs1016eO32Pfg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795184454; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:d2gzw8sY48cYz9eWrpU6Z5u3y7VWuVsJYESlAvlxv668i5D
	TUu+A4tzJ4ejUtdNLnD5SkrC/EBJPu+X0a7oZQnaa28qxSq0AWnlENqWE8i7Z/wi
	fTlTK3Sab8VbDPsoKv1lRTe45+l+9GE4sPcpVdFD77BLrEdEZjJ2pCce85DuuphE
	M60iGlWY4yglljCL5X0ghGkP7/GzRhZDKmadkrYzg0LOwVLNX2icD8egIe54+3pj
	laOtZSIWG3k5d/EIlSZsrtUvTokF9Cp1orLVs2z6f3FUCajdGFbtpZnpHoo/qsz2
	EY1MtAAcdThKNdMt+rGqGAyk8MVqCoHAWiGTh1w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:10OOwfHanLGyvJXV4Bcjvvs+9je8p+0OqKqMSMUTDqU=:x+SezIyNLy9Fjjuka6QAhFaautpL2/BTBPmmGUxiupo=;
X-ME-Sender: <xms:RVcAaxOH9DuvFYbVo85mOKvzp4zTdJ4mUe3ilRsQV78Zk1I1Zkpk4A>
    <xme:RVcAawrhpkXmPx5-xKGmPjDM62OFz44Zes7zgpOgSOK4dUF8gSSeDK_1XRUyJr0yz
    k3fK2s9L3R-WRThB4nLGrd7KVRpmxnQ5fcrrN8SbrbmbU787QU>
X-ME-Received: <xmr:RVcAa0KwYjHpWWblM3u2lSi5y9g2_VSxHF8J0Kl_LE4xjmXOrONYMW2VsFhiHxauUpXchcAwDY6LnKKUimSrIRBvNqtA_8ZCAnzV8Vz2znI>
X-ME-Proxy-Cause: dmFkZTFQvFPS8uzFw3fizoTJiHl4+yszpt9afFpYdF9q1dr+wRPIuZWxdM+KRSug6iCh6h
    Hipe1vK+8TH7a4AaHTzHgl6l0Zp6xgMbAxQiZSCg6HfpX4Hj2FuHp69N5mKed4AHqMQJCV
    PbJRvWr7lERxihA7Nyfdfmj5XHWlr8boIn0XHONiNPjbv4Ri0SZ7jC5bQIOwbRrR8PiLLK
    Zt/cT5vRdvNxn4vdsafaURH4jANnOWsFTcZaNcpmlR9ecuqlAcIVVUw82F3/OJa76eilC5
    m1uwAXxqeYSLGMG282U2B1/B1YUfxc9HuFxHJ5h3t4C3YRCgMmJBjpqaFmeSnj8MvQ+aD0
    KNZyChj8qgVsLMKI1c1W7daIp8+SdYvMzrTSEVEb8y9lvbbzDS5qhIjjNkQ7CRH1abhEmA
    S2OP7dyGKK/nL2y8Ti7F3L3kFapVDl9umpqmZr5zIdEgQB1NNHuWWtM8C5jIScPuD6LlsX
    2XGldj+zFHZultdFEepjuX+ZIxiwl3Yj4Gahvn03cLilwPZwri1SVOo3fr7rcIN6b6/k79
    19evwBYDHGrljw5SmlN6h99g3cLL/iAMFalw9/7ChWrCTMz4cXBdVl8MUx+kxcGF3aHi0q
    PL9b+ka2d9e9z+0o9xURta4WA06Fg3lCLtp9WE1hmAKbf5SyD851RDFXFREQ
X-ME-Proxy: <xmx:RVcAa31L_gcvns9YhPXMr1-fz0Y4P2VJpLBI5sqzjVKtFLtXqD2IWQ>
    <xmx:RVcAa9W_y6PXEBvAA4hSLzRDrfBGLgwUB9VgZquBo8ps2fqV4Nel_w>
    <xmx:RVcAayxT9ooD70_FRCdG62nIwEflWWVAEE2nIMBepYh_fcf6N2Dxsg>
    <xmx:RVcAa8x5lW2qUTwA7kSxQ7pzLHVudlitobUTxpHy3ElEJt0nPWNn0g>
    <xmx:RlcAa1-At5BlWKsuSCodmZlMU5Tyre2auX7bpi3MONwiF1OO8mwN8wG3>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 09:20:53 -0500 (EST)
Date: Fri, 20 Nov 2026 15:20:51 +0100
From: Greg KH <greg@kroah.com>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: vz@mleia.com, piotr.wojtaszczyk@timesys.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: lpc32xx_udc: Fix a race in
 lpc32xx_get_frame()
Message-ID: <2026112029-eloquent-slimy-c43f@gregkh>
References: <20260922065357.18103-1-ginger.jzllee@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922065357.18103-1-ginger.jzllee@gmail.com>

On Tue, Sep 22, 2026 at 02:53:57PM +0800, Ginger Li wrote:
> lpc32xx_get_frame() tests udc->clocked before it takes udc->lock, but
> udc->clocked is cleared by udc_clk_set() with the lock held, for example from
> lpc32xx_vbus_session() when the session is disconnected, which also gates the
> UDC clock.
> 
> When the test passes on a stale value, udc_get_current_frame() then reads UDC
> registers whose clock has already been turned off.  Check udc->clocked inside
> the critical section so that the state can not change between the check and
> the register access.
> 
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> ---
>  drivers/usb/gadget/udc/lpc32xx_udc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

How was this found and tested?

> 
> diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> @@ -2403,10 +2403,12 @@ static int lpc32xx_get_frame(struct usb_gadget *gadget
>  	unsigned long flags;
>  	struct lpc32xx_udc *udc = to_udc(gadget);
>  
> -	if (!udc->clocked)
> -		return -EINVAL;
> +	spin_lock_irqsave(&udc->lock, flags);

guard()?
