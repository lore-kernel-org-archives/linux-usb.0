Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041014;
	b=wgDGD7DMVmaD1bLxZHUm/p6y1lwJHhssrCA94mdeGElffO+aAxJlRRyf4NMe8JBY5eEc
	 CcIohjWL9xZ48IRPKQ5F/cPRmMJEIHSlAShtQdkOEqdjouUaP5OvQ2Yw/NJGvYqR5dwB5
	 5Xh9uPCBCfTQS4Sgb/JEmNcFXE2AOA57ili/IMLvw8+g0xEIHiBKW6/w6tcj7Y1WkYWQG
	 7IH+LKuaiERKnrseKS/F/8pZGwK3VX83EoXkgxUKI8XpLJHu8Ker5qjY3Ulrvh5sFCLtV
	 bF5kaD76yJnw+RFTkeJKA6dkXfa9TEUrNr0DkhChOrHQmOYj7w1QD5lspvq2czNLb3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JVqMtBFMHOwzO9zLQ8YijBa8OnqMBR6c1nFkc71SUv4=;
	b=AvNf4A/7sT90kX+uCV1crEXjd5HIhsNdZ16vW2HKw7ZC1rdrZ+35lh51NCoWVuUOldor
	 yeg8MV3TK/nVENdu5fhsjEYvIVLHxX4UK/qDAC6h/ykpWKb94VpoDIr3lskqbcV0bWj1X
	 ntHxXd/vkF4HmrQ7npZ7Suv4Py5gPu0TSQ+vVrSl0bqB5xzYEHTmAeKzTcFMC285W0E3M
	 oxhz/LDZ57lhgipIQEHZPvqtIIPHJNYnqotABmMW1d21lpF2OxX4Fe23SMyHQdNZm4jqh
	 hGBnnhcS3FYWZse1kUhaziWEJ+yB6KB1HzkcYigFwjBd6bAezUJAaItSkhNp7le6NfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eWN+RTDn;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C0D606A31D
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 18:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C0D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eWN+RTDn
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f1cf92c9eso411023885a.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793041013; x=1793645813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVqMtBFMHOwzO9zLQ8YijBa8OnqMBR6c1nFkc71SUv4=;
        b=eWN+RTDnPwRrB1Cs4pxlUHsL4eZddIVHNBCHeQSLpuYvaiV2sLL8b7lVlWruDh0+Fz
         m1u8FE31ss6IJED8FCppsMJT4poKKllv+1Yl3ysgwCSlSMKMv8r1wjvkiPcP+9wlNENn
         ZHgej7w2/Vz3jyegRKH3ObIQRvfwkzpjTe1HmLpFEA5LgsOa8qUCStp5qfRMphAVJxjN
         QYGOcvvwNH2BhCCdRnvgYEeKT9doxM7jdsibrSblGWGvyLkXOz7FwCw2NK4OPff5xY6G
         ADeaR5C3nxRyKKqbRJS8zywtvnLD7LpkRskokU8LXCvWuY1o4hYLNT0l28IzjCNuZfGH
         1Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041013; x=1793645813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVqMtBFMHOwzO9zLQ8YijBa8OnqMBR6c1nFkc71SUv4=;
        b=SSKAgqztfJ+zRqTsxkiMivu2fmkH76bppVdk59xUM9DXclummcO2P+dgB6AylhBQ9N
         4196/Du6UFMkR4Posad6I0tuNQnxbHE5sasKeslQyTIZdxm7oC2y+XMBgu1REw4gT9Ur
         6dY+hhuvHwFaMxFyFJ/Mm/BRxsKU8UhE4gs5YeuEfDA8zA1GWGJD9us1D+sUYAYorPWx
         JkXHen7l79MuG8/ZgSw/V9+jOibgbDdkIVGPLv9Twg8DVRu/C9Ol7lAf/lPTnS5XuLH5
         3cYKyYSwZHkQi6HspQrUP7s835pCKA+MKDrOrhTz1k7L+kkDJsHadRAK+CvfgJnALIH4
         h78g==
X-Forwarded-Encrypted: i=1; AKwUvBzK3BeIf9iBTZg4A6eNWlTHDgVmVJsqM6RqyeMP/sfKssxHUakvtFvBDeUTN55USWKMjLac9RaSYdU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIi1aZqkEsJ+cLtV5o8nRiWlPpNecGpQUxV4MFBppiMhCZQ9LJ
	j1PnonbjLCLprGVPIF3xUfIljUV4Sp1Rovbe+cBTNvSA2l+nvJfJE901wSQvfshH0A==
X-Gm-Gg: AYBFou3kJ+EZIkvfjTkPWRWD5z05Qqokab8cJxLbtksnG+1V7y09aMOQerhPbpqOXFi
	sXA7UxvejDPRvISie3l0Fd9KmpW9qwOCTpa8tca96zO7CaX02CLnF0LHnCz5hQjB1i9d9i8XGBV
	kARivRu7Hn5oYXWjkpJ4NDHrtIBmAcADTADr1s1HYxNyOwWenQIkm1vNw+Fa9K9WoFBdiJzUH5Q
	E/X331rhcoU3m0iAHxNn5mZFSmt0T5n6D+biHfNiJx7EOYS+ispD42KSj5THQ2FoPChNZaHtSHQ
	K9LwiiVW1lzM+r4zXysL0j+ForkMlrfe9lDAjx9bY7jodx5eEhfY3zGnYO6KGEq+gWCAgi/fR4H
	l1dwekoQ8Z9PglXH9HrLa+vWsh0IvNTnhKPQTfxQGgBZpdNxyan7TZCB676hzjySN/Ll/YAByjb
	PWjPIM6aH8rqw1SbnX3fx09Zz1sIS0D6qrSFVs7t33XeHzvnJRoA2LCrLUtbum7mmVkPDBpi0nw
	GIrj54euurLnmACrwU0evLyueFdF1Aq24paY6qJx0GTf9/uPJsJ0Ny0EBqBjHtFLLi9Mr5AkElo
	rKMEFaBzC1uuFBZFzPXkBt0cKxug99h7VKKeWwwMCr6nmSitK8WCz7jEMZHOFOnP2/8oPask
X-Received: by 2002:a05:620a:372c:b0:93c:a191:88fe with SMTP id af79cd13be357-940ef79eed3mr1080853885a.8.1793041012521;
        Mon, 26 Oct 2026 11:56:52 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c54cbdsm79943376d6.26.2026.10.26.11.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:56:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:56:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io>
 <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
 <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
 <20261026105139.6b86cb3c.michal.pecio@gmail.com>
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
In-Reply-To: <20261026105139.6b86cb3c.michal.pecio@gmail.com>

On Mon, Oct 26, 2026 at 10:51:39AM +0100, Michal Pecio wrote:
> On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
> > > But is USB core really resetting a device for which the hub has
> > > reported disconnection? Something isn't as I would expect.  
> > 
> > I suspect udev, xhci virt_dev, and thus xhci ep0 ring stays intact
> > even if device has a short disconnect during reset/enumeration.
> 
> But this doesn't make sense, right? If the port reports connect state
> change, we have no idea if it's still the same device or not, I would
> expect udev to be discarded. Or is this some "USB persist" magic?
> 
> I didn't want to dig into the hub driver or bother Alan, I hope we will
> get that debug log showing what usbcore is doing there.

You can read the login in hub.c:hub_port_connect_change().

Broadly speaking, if the port is enabled after a connect-change event, 
the core tries to resuscitate the child device (and checks whether the 
descriptors have changed).  Also, if the child device was suspended when 
the connect change occurred, the core will try to resuscitate it by 
treating the change as a wakeup event.

Alan Stern
