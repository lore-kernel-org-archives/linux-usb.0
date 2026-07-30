Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6423643E4BA
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425600; cv=none; b=TvI9v39MJrxNIHbkt2+9P/WzdPoJVAna8Z0B7p35B8jpgmWnfQbHNopdMdI3tcQvenTECvopCNbDiKD19dMq4Ad1foYYLzgYpWWRMIipCH5NQpw/nT+3LuI90xmXRb4dkHbnS3WWibjniMPu6CNkGWCyQLcWsN9xfPk7hgFcIO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425600; c=relaxed/simple;
	bh=vjUxU6DfeHaH3nfWdpw7t9BZ5QMeNWrLnziCSKK+a7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dlk10PTuT2bvSxDs7gUafubER+go0AkYgrOrZrlIh5oqJQwQF+TbIPoO2i7h9HotXaed7AULlC85oXhdu9TRTGStAHhp9osGyI/kbzqwWkjbRmWcCiwsKMf6ERhc4yFjHk4hY+M5O0NrkgPVnfZjXnOiTR7JrXc42UsQgZ5aTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/lVnnS3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/lVnnS3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496b7622a83so14263215e9.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 08:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785425598; x=1786030398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvcYl98Dj1v5Xl2yAUS1oK+AUzC0Thd0BmMktXzpQkc=;
        b=i/lVnnS3wAv8IR21f3Bo0GU3lPLLh9lXG1h3l6gUczCQKf7ts9WECiHUb+gumulx5U
         aA9UFqFXz6ZHkKuEGVYYejw4QyIrzR6eQOf5pzgM/JzY1Jh2ktDlkdbBAdO9XX6dtCPf
         Xf48covjMwvRj9bAXdVMF7gB7X8o64aRoZniObj+ZDe8RUZlCsWW6DXiLkzzAPs+mrUz
         vXI4Bnn3dTHSg1Y8FcjkM2+VxiAKGwl9t/E+Z2O3eL96gBaENLK1XLAo9Gf6WW5Pg3hN
         TjICrwX3EuoJLgXx/YJ58mI22EFcp5OGT074SEOVBOPftSbEd611bDxq2Sl985TP2hRI
         PFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425598; x=1786030398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvcYl98Dj1v5Xl2yAUS1oK+AUzC0Thd0BmMktXzpQkc=;
        b=Uz7iSADEkYeBF2ULBimVljK5IQHY3OvUhid96EXVDPe54vZYkTvNhZFT4Eav6yKJ6m
         b2yw2aysOdr0urilpbORcHvD1oSxMboBpyFptGl4RCpkAImzK2gCSXMYG/Gt7Ui9c36H
         IrGAhE1+EtTlIyXV2HFkQUyNEinMZwKJ9xYQ8pIG4ae5GBPi9cWLujaqrGpZhWKxezNS
         TfzAGnkoULIpz4mMXcDBs15XpFghRc7aUlYhbTJqWeiFZEZY+0E0JBN/5UZnfYXMMrnr
         Nn6x8cPAk7SlR66P6/DC3cugtxyjiFac7Gje9Vrgk8xJhMP6CrsDPA0udrOBxIO/zMSL
         gmwg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1U/Q4LaynniIi4U3YMC6mf4SoMpCel3p6rUD7IIP7lICPfWH6WALE4UhNW/r6zdAKal8BEvaEzuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDtcyDRiqH0WqFlK51mDsp4FM6dGNM2aCwXIw07Y3puPJb2FU
	RBpZX3+fl+v9IVERvSr5qMGGmm6EB/HCEHALEBp/xNiYQykQi+X1nQOK
X-Gm-Gg: AR+sD11uMF8E0owwCfpn0GiN/HdjvXanyxWyo0HOUq/fdCws8z0ob8V16am60Ezy+Xr
	ODarH94oYaMR3qYg1jOAuVTbHGFuqBSGmO5NvEpJReDEMTMuGtw7VIlnxLnNNwgCfBDiq4zdTvw
	TYDK3iH0c4UVVSO0+payx3RjdcXu5rBUCIjtBe97EBYRo9Jz64k1gs/+qNJmhWY027hXnYIemw7
	klhZjJusWH3V1882UgHuotx9CAf4TIi6Yj9BhDcdYdukWQ4Qej4QbakUZ3vDGZhiAdLv/Hb74sb
	slVo6Sla5G+WzgB3nDoXDcJvT1Df3lWcFbbBLhRMKu71whc1OKeBIND3kRvlQXRWvuU4+UvZ2OF
	bXH9/ZQYOAyZBNc7lq/Uzb2aqFZiDAQ2gnUcj3cPcbjWvzEuf4KFgsGFjYOyii6dKHmPJf538G9
	lSPORUyO0bL/NyAdGBvkUFkncNiQPmmh0WMWrHcWms26gWVdZ5ALwjDoFBTw==
X-Received: by 2002:a05:600c:848e:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-49800e7014amr40612605e9.2.1785425597583;
        Thu, 30 Jul 2026 08:33:17 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d8d37sm6622003f8f.8.2026.07.30.08.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:33:17 -0700 (PDT)
Message-ID: <692c652e-2be5-4fdb-b0f2-4d63bc72253b@gmail.com>
Date: Thu, 30 Jul 2026 23:33:11 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <2026073005-rarity-devouring-721a@gregkh>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <2026073005-rarity-devouring-721a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-30 22:06:28, Greg KH wrote:
> Does that option work around the issue?

Yes. USB device works after adding that parameter to kernel 7.1.5
> And that's a very old commit, odd that this just shows up now?
It's a headless server. The USB ports are rarely used;
thus it takes a long time for me to notice.

Other people encountered this issue:
https://discussion.fedoraproject.org/t/usb-2-0-ports-dont-work-in-fedora-43-kde-plasma/188113
https://darkranger.no-ip.org/content/rhel-9-usb-%E5%A4%B1%E6%95%88%E5%95%8F%E9%A1%8C

However, their methods do not work for me. 
Toggling "Legacy USB Support" does not help,
and there is no "EHCI Handoff" option in the BIOS settings
