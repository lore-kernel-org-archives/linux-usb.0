Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AF135BDA4
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 04:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783398595; cv=none; b=UegLFLBFc/evPmWjViECaKEx26ACTRTwAjaHJqqoKM+pJGI57VO3NYLLCQtHol/T804xrfnxjie1twYm2ATefGuR7znJhAH0nwc0mYp68PEyTASc4h1y2QYcn5zjHsXu3yskzHGZBSfvROE2lBgGTNRjn3IHX9jXfzSzWMBLYsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783398595; c=relaxed/simple;
	bh=GPkIW7D9VHENG/9q675O21ctdDUs6U7u68ERmXjj3v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7t1hSfIIFeLt9WqzL7vI2QqTL/JJz7yRQU4W3s+pweBbwfheZAmV5GAakSvjcd/kbF3GCxd6eP/4JZIFHZGB1hf9MIWEIcV6KB09xxvagS0LTW9zUgwzWxcxcjtiZWJLHKx0sZMQ5yzKr+qZ40TZKHkmx05osJ8UiW4wNqVLy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=gQ6haL1p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B9cKdxT9; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="gQ6haL1p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B9cKdxT9"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 19E297A0168;
	Tue,  7 Jul 2026 00:29:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 07 Jul 2026 00:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1783398592; x=1783484992; bh=8HSGMgwlcr
	qfnasSnCWGHog9QJZ4DyBfEE91n/FE6Y0=; b=gQ6haL1pV149sra78O683/Ahp4
	eYpHE0lnd7UKww5ZvUYB+IGwQtkNp9sZWiLlVSi1GuxOOzu2QHsRpcH4lJoM6Dnk
	xKxtNodTxDOiRdxHqjtkeY6slztJGioay4fVvDU5NiVN9dvaJhWBKekqL9sPXORI
	YJ9b0QmGyZ85U1cShQXDkrUugwF5iJQuJcJU/b5I83YyMyR5IhKk+ikIbHg6h8qZ
	exeSgWAueUqF05WSMjYl03LOUgXutJVN8DAXySmJkGctQBqrO7e/uniDipuyLZyY
	QH3xd+T2IciLb6Z7RNaGr+YfU2HoDga+An/NL3+pxbEEIkXbRUZG9Cizr8+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783398592; x=1783484992; bh=8HSGMgwlcrqfnasSnCWGHog9QJZ4DyBfEE9
	1n/FE6Y0=; b=B9cKdxT9PNAyfOkgeMU2/RqxCn/kpsqewx1BzpaMb1XcUvFSFr8
	G37UoAxSiTig/hAfOEGxufZkgpg2hjOPONpfRKjEogASr+iHL4xWp42+B7c/yKG/
	acP7kL2Nbwf+OYokavPq9FP0/bL2R6xnNTN0pRqX/dtE6SUA7W7snO3pUYQHPd/V
	X+ImeEif9MVMTL2UkvOpXOcPKTw8SPzZ9nLfrsPGzxfyiFvAO+rKI4g5gfXs2wft
	sAbaCAqUrMdjVxR2/PYIjfMSLFYV/vEZe/u1vn+YdEj8rE07Qrwe3F+ufne8KFaN
	HkvQQcjxcfA/v653TCeNfLzMhThk1RF7d/w==
X-ME-Sender: <xms:wIBMagh8hxycS_k5mUTr5X5hFoze57TS3ogJV9RGxXRTJtuG-LhZmw>
    <xme:wIBMam0Nn_-iSCQ87ryYqeIExq_do2YFGUNIuw6mxTgoD5SB8okBd3fR5NqQGE_EX
    OxQm-pPXAEgbVs_JV2qte4LioqLDb6YZhYdYg29gidBH_DD>
X-ME-Received: <xmr:wIBMaijbhVC2RlGaiIRT5OE7FvlQ389xR57ZARXmuVNCtGPo0XXs0ONfvwiEK79V3pIHVr20dUV4eq1FGWjWoiWa5g>
X-ME-Proxy-Cause: dmFkZTFv7iPcIdHbloI5nK1YMH5lXlRxp/gWNwAiUYYLoCTC8GekGJTU6GuT2LtrT4JXSZ
    R06nuLyGJRQ2dwCdj9VmQ5nxV1QBNwHaIVRsmyrX1vQ8Rv5L77cxfnPIEeQ2D/01aPUXzi
    6RT6NoP7ZMi1LvKSlEejraBWxWREzikNxs4Vl4GLKacpB0jPsa7y5D46a/PQb+TakUZc3U
    0fOKe42b8x2G/ydGkkhOs/C7/5r9j1mflNMh+SI7fFTvmdiUSVwbIPEnTcWX7XlVogH1v+
    SLYwuJ6KZxhTLNf6cpBx1BLmi8J4AogmN/J8V+lKGm+1p8wMrKv1TkbXwkGyQdgZIWqdgX
    iFVwZmc2HjympL1DO91+P0EObM+nMPtJ365DIRyq3EPvVSR/UbA2DFaoMCwvCdSYISO751
    zAhsEtIGHFeWPAPYm34/9Txv5v0ZbMWfeUpqUUe1qCklFB0fG+1k6ahRy3fgnBmengpj9z
    dItxSZjxthTsfAEXvdhWdDTEiPnhnyWy8gadtgB2j3rO0KdR9C5Af/3io+4ImQRt0ItFlD
    lXUe6G2Fx5b+p5Qj0gYos0/fBa/unEXIYCX9UcoKQXx3+GOXX8zmxDaGff6YwimNBWO8I2
    ByL3iYz2hL2hl/XTxHNytL+Vzo6ElGUXCeMrhLrPoWhzpAOUCCGRTQyISCpw
X-ME-Proxy: <xmx:wIBMaueNWpNaerptE-Qrc7gTX0IYzLY87VSOYe-W44I-V-gQyY9Usg>
    <xmx:wIBMatkI68NVB_xP-CTivchUS2zwvbeKHoARrtXIQPrEHV5kizhoDw>
    <xmx:wIBMavugPgaYjacoEr_RctTq2dpiH29OKoqs3K1nDbodSLAMQJ3PTA>
    <xmx:wIBMar-fwqH8he0IV4fCqdDOupjZ0Z1pXGSv535R9HBZHxdKAbUHkQ>
    <xmx:wIBMaqReXgetDrqN5LxPaJ45Bd286Rdv3_EY5VlmGdoCvbTV5XomMAG4>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jul 2026 00:29:52 -0400 (EDT)
Date: Tue, 7 Jul 2026 06:30:06 +0200
From: Greg KH <greg@kroah.com>
To: dave@synergy.org
Cc: linux-usb@vger.kernel.org
Subject: Re: USB Keypad
Message-ID: <2026070759-research-undefined-aa1f@gregkh>
References: <002001dd0dbd$d4269020$7c73b060$@synergy.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002001dd0dbd$d4269020$7c73b060$@synergy.org>

On Mon, Jul 06, 2026 at 08:08:01PM -0700, dave@synergy.org wrote:
> Excuse me. I have never sent e-mail to the Linux Kernel mailing list before.
> In reading the protocol, I think I should have sent my message to this one,
> instead.
> 
> Hello,
> 	I am working on a mobile device based on Raspberry Pi OS. I am using
> a USB keypad to navigate the UI of my device. I have purchased 2 models. One
> has 19 keys and the other has a few more. I've implemented the user-space
> code to read() the input device. Things are generally working fine. But I
> have one issue. On both models the keycodes I receive are not unique across
> all keys. On one, the key labeled INS and the one labeled 0 both send the
> same code.

That sounds like a broken device, not much the kernel can do about that.

Can you confirm this by looking at the keycodes when plugging the device
into any other "normal" Linux system?

> On the second one, the mapping is even more bizarre. It has
> duplicated Num Locks and other keys, as well. The number keys are always
> readable as such, but the other non-number keys can be aliased.

Again, is this keyboard issue?  Do they work properly anywhere else?

thanks,

greg k-h
