Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956912D595B
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782604; cv=none; b=sBfpCehYITG+awE20/Cx5iDmkytf5fvQ4ESr8XdMNxihgVxjdqZ7X1FOOiuAbNlDjCHcODuXKOuUlv28/O+mBnN51muE5mt50pr8lX1Qv6ZW0mQrFok4GGHM+GLq3BkVN66ErXc1IqUeb7eHzQyRGSpHVyxTqcuulFMKmmRWUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782604; c=relaxed/simple;
	bh=GFEitaZtSI0of6G/HotnOpYkEfurTRmThEFPcqgfBZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMSinaNW+utFjp0m6r/A20nSzhoM2wnBqH+ppzLXpANGUruXTXdJWGatzvqw5x4FsnsFcljVqpT1SXKedN9aH73wfPijI5W2Q0jw0chnYHRzGJJelnZw3xmYz8AncIeDMXA2WtGO/zbypeCnemiVhN6an6Ni+5ja2xp3wYoPtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlKPO8TJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlKPO8TJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c19bad03so15699985e9.2
        for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783782601; x=1784387401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFEitaZtSI0of6G/HotnOpYkEfurTRmThEFPcqgfBZU=;
        b=TlKPO8TJBkmfo5vopxBT4m1YtiDyiP+ASJKkje6/j9kBZVbEuDONkHYHIvHr7QijAE
         5dorHivyUV1L5NuVh9l7vXO4Zshc8sTRntsnXDBMtHVhTlwM+XbhVXy6NYe/a/QlLxVq
         o9koNnKz6cyPaRLLCH1xbG0lHPyenIiCmuJDNeEWsNbyUYRFriEtpJo3vO5EI3vmBBtf
         l0TMOXyAQHHdCx2cnEbAfSUk0PkXPrAvKSFb9DCCz0I8PAqjwst4kLeWjlX02oRKsvxh
         UhJCikoR7WiYbe3iQXqS728J0DCzymFYWf03cCKgPDiEdV2IGzOK7bNcCQ79gmHBD0Zy
         GSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783782601; x=1784387401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GFEitaZtSI0of6G/HotnOpYkEfurTRmThEFPcqgfBZU=;
        b=Z1VWq+D/CnqxTfZ9c+OTjRCDSKx20nBiz6Tz7mEoqrh0s+4AccKgYY3b25oHd0MZ4M
         R5u6xkn99mwSHvkC9iqkdEQ/QIwDi2O24pm0yQlCAdYMhPRUv9eVx5I+a59zTcEbaOBs
         vl9EbsA8EX3hQQmi5PcoDgeTIOlk//S2di5owTnpW/G4jgXaoprcwUpz9UXdRCDTVGZS
         PyFJNAQ0UWMbjbnsGyLCNzWYwqsSMcSzkUaTeb3cZ4aUQ+1tJ2fdS9pJcJudCSs0QDnG
         CNEFYGW2YF6VaV9E2V9SS61Z++VG0DUY0um9cNqQpBuKZIGxtzY9cMtUPMPK3LLQQ9+n
         xFHA==
X-Gm-Message-State: AOJu0Yx3QZNZEAZNmi6R9wHGZG9kqAduXTKUOWscUjspT60jKLNe0de2
	z9Y1ygn3AgJ97h7qfoaaSbwJItB8xIB5lYrQnk4ZX6sfvXKazdS19WQ+
X-Gm-Gg: AfdE7cnjCUxg9AE2bI1yzP2O/KomjS/pG+ONvhQ0+cehBZ6gPQBa5JgroqO4Squ/Zdk
	D1HJ8Pu0ggZwDugRsUPE35uHdgqbu86qplLVFi2WTirDd7C2azPqiMMLfqXxpVIJWJUsKWpCGiS
	Eqbyc6orOPG/VoqZqM6oZgi5XfyHxuSOtzr3NR6eGhpcsEd2wwwxyNuShXPjZVtMicNy70lVc19
	ykLZcILDi+VrOlxEIHW+dEl0KONLR6CEt7T0QXh/ANragbjYiMeAFPd8gDcBHXV5oaxRLALkGAe
	548f3EHdqB0mulcNQ5zkHtpDZxp1PKlNMJn5skoEi5J8T2cuHeEilFrM4iZu6JBYW8dMTdvhLKm
	rwKGFEg/upGFg19vEWWQgvmk/AGgj1XiY27DLN36GL4lyHkaFe1EhtGYDOJ3kbTkmGkg1b0btta
	xQcdigW4FL1NTFmts6Jj5kYdvwCaLa1y5kMPmFO1MzWG+nzFAUhyNesTY0OZqr/xuOv6mhCSLtj
	i8/9KaI
X-Received: by 2002:a05:600c:1d0a:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-493f8784930mr25830905e9.0.1783782600610;
        Sat, 11 Jul 2026 08:10:00 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f86556acsm58653585e9.1.2026.07.11.08.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:10:00 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1705e4f2-a0a3-4be0-a033-eacc1d54fcc7@gmail.com>
Date: Sat, 11 Jul 2026 16:09:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: musb: fix dead select of USB_MUSB_DUAL_ROLE
To: Arnd Bergmann <arnd@arndb.de>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, claudiu.beznea@microchip.com,
 Jassi Brar <jassisinghbrar@gmail.com>, a.zummo@towertech.it,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, wsa@kernel.org,
 ben.dooks@codethink.co.uk, heinrich.schuchardt@canonical.com
References: <20260711130349.592545-1-julianbraha@gmail.com>
 <f4ef4d30-51de-4b58-807a-0fed243b2fe4@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <f4ef4d30-51de-4b58-807a-0fed243b2fe4@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 7/11/26 15:39, Arnd Bergmann wrote:
> Good catch, but I wonder if this is actually a real dependency
> at all. What would happen if you just remove the 'select' line
> here and build a polarfire kernel that only supports
> host or gadget mode but not dual-role?

The kernel builds just fine for me with USB_MUSB_POLARFIRE_SOC=y and
USB_MUSB_DUAL_ROLE=n

But I don't have this hardware so I don't know what would happen at
runtime.

I've CC'd more people involved in patches to this config option.

- Julian Braha
