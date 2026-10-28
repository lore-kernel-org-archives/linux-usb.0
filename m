Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153684;
	b=Qdbr2/KPiipi84uyeIZW0to/ejI7NPTLWySj95QvjAX6WKVDJea4nWGUDYfrBg/OVZP9
	 pY+Xl2WpMu0vaFpuuhUCZW5pUP322aXc5knveoOph5MTiu4iGXnwmSfQrfyvaGnMwz5n4
	 a5L/kPoureR8zPBnm7KjHJijby7PiC94BKUu+fCz1dsv61xhXS4jIeQbq9SHq0PGPPHbY
	 Aw2eN9/CP1X79MMQMIKL9VCYFvUs4nJep68sEwnXTmXH3VwFu/H/9JRsL0Ils/gR0X7/8
	 WbOEp9izg+XXpcapjZmGKMjVSbLCPYFVyKQUNlXImxoGYNwwARa1X0iJahPevAeMkNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2sMylfiDg5PVa8CBcEvy/aiAAbN75HPdTduGWQKdiJw=;
	b=JRBct53tEXaazDAX33x92GDunRm8Ew1nGt0z/+qk/YonReEOgIiJD7bNDogEVUrVkFWh
	 FoviHmdTHZb2JYAS1iXLmidWXNMrANvOZRzStCI6I3fhu+vqDIceXSDUnRS8o2GU/WOJp
	 i1NF5SEBiJt8gYvPLcA56dPQMm3ZpNbdGCZSI9ib4kwk59l2/Kg7Gyh+id2YjJMheSLDP
	 IsmpQn78gLRS6Yf5SXjXLAbXIeQ2PLC47lZqYJ8O8MaB65UD4Z3TXhtyB/8cuwh/63Lzd
	 NdpTzvlalX6foPFKCYaGDAVJwJt67BlqwsrEJZpq0AVyblRFJydKMrz16hGgN/UcqQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=SrhoAmWZ;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D281606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 02:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D281606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=SrhoAmWZ
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c60e30054so5809356d6.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 19:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793153683; x=1793758483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2sMylfiDg5PVa8CBcEvy/aiAAbN75HPdTduGWQKdiJw=;
        b=SrhoAmWZSjAOtf4JK+nwJRgtyR2qrlhcek9QP3jvqLmY1ORqVXbtz2sRbnqvPAT4ag
         QVsT9/4/ufDMC95GUZ5fmWRSMQmXGE2PdSSMuyOfXFZ18Yc2kb84NtMA2qfmEIx2pjbU
         v8FuayP6J/EFesLHQKcezrHBh4Vb7vYlWsthuz8b9zQtOx+9vleUkqjyfGbDGdExXr8E
         Qyuaoy5nEOKpVqv8URn7GDs9FTu5kWZwzYNoJCqzMB/lAcr0x9jBvE6w4D92y56SNpQo
         zLGSCKwslvC5Q72dY+Tiz3JfI96F4rbLGpG1Zq1WXgW69NiMcvRaSooHzvd2sDnYrNzu
         Qqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153683; x=1793758483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2sMylfiDg5PVa8CBcEvy/aiAAbN75HPdTduGWQKdiJw=;
        b=HDlzJgX3gX12YN3JOE/vIMO562IHxqrzKuQME0lN0DL1cComVvVoel17nf8nJ12p+i
         eYZ5Etr2JeIJp6NGiEAHjvUdCOgk3BI86eh//UIkDC9rU00fLCwCAwd8a2cQ/ZceHw3u
         3DHbvLuWcBxaHataRvo1xCu2oIky226rQenHkFFeZ/mAnpuN5k404lcpzDExdV6wqjjn
         pKY5tzTeUVPYmVRrjZQxFfmmXJ/U7O2DuKaT7EqhqmrqfCTEx+ya9xDFOijiYB5fxhGa
         ZQBUBccZT40yBY+FlSN71xDC65SR9emRj7v1EccY1gpEY9E6Pn6tlp+TFUzNHPrFadcb
         kO9Q==
X-Gm-Message-State: AFq9FYLCcy+GhrnBNuNUb2Y0a0fj3qx8GY/TohM1FE9Vf/tWHSmqUV6S
	sUsOB5iq5IE/roal2+ji05rBwjwS1WMzDMZYZgWBIj7Sjm+1H5EOoefftMcRwvLPnA==
X-Gm-Gg: AYBFou0CcC9xYo1s1s+gTDzg1Teo14k9wOMsEqDmo/6YcmOSWyMs3+Ij20BAKuXeTgo
	dcx6bzIoSbYmOHOR8jnzOw1j9wkKHhwzhSILR0vzi7lGbZX9truLGIvKJr40CWZgFv4ODj5r7fr
	5ODK0voPLjL1VqEhaYzTxexqYL1mnRjF+r13Jv/BYlxgVyqzMkm6lDofBMIhw7Bk7xS0v4YGH0p
	y76/7B2dTW7jBpkPTH1y9N5LOsSAIbqJD61CTO1/2OB6PBZKGBJqXd84CoFRb/ZAUIAdym+vfj3
	QRO9geu+xgAGhzQrUpGfZ5SsrPHgPQo7lbnWocJn+RP1y+qEH/DCcYdMjEQlBjoAFK8RRxUm3oq
	AmzmiLz6v13/Oa0bb1nHHnHyaCNjf7k29uKuxLfVlTRqzKAxHn9UkLkics5uRNCD4u1tdoses9c
	L/SqysqmBJ2zLX491xUTBD8YQQCbiha29Wd0fxPehh0TfSBi6XBrzJt02NFj16S8zZVPdGfORNU
	JhV+y2CtCYimtkGwfjX3T4xoKjqQQ/dptD3O1fyhfbybNU0WB3HbgkuW5WaDt/4pG40m07JgcMo
	92Pjyzci9uwHR+Jaip8rskehHEsVLw==
X-Received: by 2002:a05:6214:5286:b0:91b:ec0b:9671 with SMTP id 6a1803df08f44-91c7d22e1c4mr15841966d6.52.1793153682937;
        Tue, 27 Oct 2026 19:14:42 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c7e272e35sm6032706d6.1.2026.10.27.19.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:14:42 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:14:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: SIMON BABY <simonkbaby@gmail.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: QUESTION] EHCI async QH/qTD lifetime on old 2.6.32.y, Octeon+
 with ISP1564
Message-ID: <10a1cb15-d3cf-4a87-88db-87177fe60ae0@rowland.harvard.edu>
References: <CAEFUPH3_w2CNccQxr70qi8yv9zbcN9a9FvOt98m9vGvBL2H_pw@mail.gmail.com>
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
In-Reply-To: <CAEFUPH3_w2CNccQxr70qi8yv9zbcN9a9FvOt98m9vGvBL2H_pw@mail.gmail.com>

On Tue, Oct 27, 2026 at 07:06:21PM -0700, SIMON BABY wrote:
> Hello,
> 
>  We are chasing a memory-corruption and stall problem on an embedded
> system and would value your view on whether it matches anything known
> in ehci-hcd. We understand 2.6.32 is very old, so we are asking about
> known behavior, not asking you to debug our kernel.

You're kidding, right?  You don't seriously believe that anybody could 
remember the detailed behavior of a complicated driver from seventeen 
years ago, do you?

Or did I misunderstand your intention?  If you're asking whether 
current, up-to-date kernels exhibit any of the symptoms you mentioned, 
the answer is: No, not as far as I know.

Alan Stern
