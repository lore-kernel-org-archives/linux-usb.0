Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2523BED56
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440321; cv=none; b=m9hCQY8YZP4/H2Ai3nC6OzSme/4ocPGxhshVmr58RU2mJI0OKJvYXIQML4EsVctV6Ml2UVfiOXB8yy025VfCWgEhs102Y9P0ZOKSLADhaJMZAkG290Q/In5A/r1lme6QCxUMYE+o48Ei00ASpIiGXe0sZXoPrFtMPPgkXCJO1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440321; c=relaxed/simple;
	bh=WFfQV2nx8dXE7bNI3OJYcwiwD+Zg9ALgEFg6qbUBlH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOKY73d6TTE+6lj0s0dmGSSt4gln/lj6xpPloiAJQtPSkSwiQWNiUBQbymU4eGjloGD4+gOgiFNnB48e2vsbo9Yj7lPd0ffQH3fdbD/WqU1dmpOI8eT0rfEBuU9HkUVknbda4/gYMfXRzXXXMshdaPHtxfvgxbQo3Fjobn9E86M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnxrPQfC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnxrPQfC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so22310875e9.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791440318; x=1792045118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0aYWP1M8Odxq1oNSexxsa21jO6jl297TmiFo20Nq/g=;
        b=AnxrPQfC2+y7QX7rScjPXkMG8K2lboV57Z0ntgYWxT3/fVx07Xj1ve/fPKEXYdFNrw
         ZT6SoCqW9XwVQ+PMxtJr3GDhOH5sCluFG3uuisNJrzVhwFjt4V9a5RG+f/uVcnQSZkp1
         EO+5g0nyHrBS+4S0vvWQAfaQbDWuFZQeFApjVhlgqDactEchzJtYR2n4BBYHB+s5lEMD
         CyVJzSKwuA3fa2kJS/bebEbK/7bN+cBz8ixorO/HOt8xKW+2EPZPkYYjCUYrcjsalUtq
         8w0BHZpl2Zo10mC6lxkmS7o1mdf5pVm/+yGwdUP/jWBo5JmrH5zfO92nb+PGjOts7M+S
         asTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440318; x=1792045118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0aYWP1M8Odxq1oNSexxsa21jO6jl297TmiFo20Nq/g=;
        b=lvuU60I8NiEE18Wfb0AkWijBqK0Up6iGwrKgHaAXOAGOcXLNfVSaIPgDVubGQOWZvL
         JsUPYKU7sMSVjcvE0fPXSkxQubkF0gLb5ZAGXnWoeqmXJqeiu5W4UdfoNABYYmF6qM/5
         pxZOupS+YjVzn84dLz2YgtYLbUwlZ1sBbpvesFGIAXR8XkIKjAsq+Sbw4pTC0kUCkeQZ
         2t9KeYaVvVrSuab5WocjQZ07f5Uy/BpR+jgPCVqvQLJlXDvwRCPG+i+zp9Fpx/5yilOq
         1YtTZI1MX5atPuw1hQcoRukKykv3i+0/KJx3Ax2oJI/1X5l+YqK9/QH/JzMf4fcl8fGc
         CIEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVpRRGbH8IrA61IRJdIbdk+wRp3D1Z7DybkjgcA29/v5aaJGTSTXFgIVKoiSwu1HMaHHWbaIxIOec=@vger.kernel.org
X-Gm-Message-State: AFuF++k41kI7s/0ToysK7pNJJyesrDelr8cfW+rL7LysCynnVfcNEtMd
	FvQvEJkzyL1B7qbJtTQombZdD4YLLDkykXO6MgKa1RTsIjjidYFTIv+179dq5AF9
X-Gm-Gg: AYBFou1A2S1WCni4HUOQBjFlufc9jDTDi46z+7Qlp4QOIYOS+4pgkLIeitMEWNKH6D6
	VbuPXyR02BxKIsVy2XqCts+oUEFyV4JkEmYcXniwAYHVOftixyNpud/Pns5FyorwZHNL3WD8AOP
	iiEolT5fvmPKNa1Kt9Ed4Adcaqw3mTEpeyE6tfL2Vi+Tg4vtM7lmPbSb+GrIJ628rgNczEjZH/X
	XiImsaFnxn+N7zz/tNrYvMs6mPdiiZIfHZjtNUlOk6g1LRnmKuFFzGPmzEcsGZ6vuo3OkP6yQfm
	BmGsdZQr8MGwIzS/N6LVk5yD5r3mews/8eTy7QRaYNubTKdS2mNoVPnNiFZemvU9oAdN5n6TtG9
	f5InABIK40zdyRtG/Qbh7KUtaccL7OU+U7AHwcuCotfz9T5pCWiv8wvBDknz9ps/ShXtFdy7GWd
	cZjItOEMHxcUejkH3b7isnx25Abh1kVhN0PPUM/9Ihvh/HTA/Uk7DTTAVb2caG6zuwrFAsjsSiH
	LZpgRlEC+4S7CdzEkNiOnltxGLXqLqpFY/cNKAMR2aEGDx8m0wzZxSMJcsNDxikRHqaHdG+Vs9R
	NgWqvUlnGtn7kmZxwZGiMsSfbqiyQZwCSOb9cm8iijzZfCSylGHwE+dNy5lH9QFKdXBFEa1CeqN
	9lrG+aohvwUQVBk4=
X-Received: by 2002:a05:600c:6095:b0:4a0:2835:6fd3 with SMTP id 5b1f17b1804b1-4a18041c519mr79148635e9.17.1791440317478;
        Wed, 07 Oct 2026 23:18:37 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843dbc6bsm50087615e9.11.2026.10.07.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:18:37 -0700 (PDT)
Date: Thu, 8 Oct 2026 08:18:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: r8a66597-hcd: fix buffer overflow on odd-length
 FIFO reads
Message-ID: <asczg8KoUgHPxh5n@gmail.com>
References: <20261005212823.55737-1-kmehltretter@gmail.com>
 <2b0a2d9afa8e2dbd1d6e8ea8f88a4627816ae2d6.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b0a2d9afa8e2dbd1d6e8ea8f88a4627816ae2d6.camel@physik.fu-berlin.de>

On Wed, Oct 07, 2026 at 11:12:46AM +0100, John Paul Adrian Glaubitz wrote:
> > Fixes: 5d3043586db4 ("USB: r8a66597-hcd: host controller driver for R8A66597")
> > Cc: stable@vger.kernel.org
> > Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > Closes: https://lore.kernel.org/linux-sh/3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de/
> > Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > Assisted-by: LLM
> 
> I was wondering: Would it maybe be better if you disclosed what LLM you used?
> I have seen that many others have done so and I'm not sure if it's actually
> prepared to have the model disclosed.
> 

The generic Assisted-by: LLM format is fairly new. Christian Brauner
proposed simplifying the attribution in July [1], and it is now the
documented format [2]. I expect we may see more patches using it as
people adopt the change.

I prefer the generic Assisted-by: LLM tag. It acknowledges the
assistance without advertising a particular vendor. 

A model name alone also leaves out the harness and settings, and I
sometimes use different models for implementation and review. Tracking
and listing all of that would make the attribution rather cumbersome.

[1] https://lore.kernel.org/r/20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org/
[2] https://docs.kernel.org/process/coding-assistants.html#attribution

Thanks,
Karl
