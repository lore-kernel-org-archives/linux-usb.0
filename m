Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7288345ED1
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546964; cv=none; b=UVkq/pmYwPNi/J/ou5qIospaXmHNJi1o6E68JX6i+YDymoBSa1vlhIFVYJZT6Bm7PHqSPpJD5KFoIOiagPVvrKmprSLBEmsoPpuLnzfIfo5qzc0QYJmGgctYUfYSy9koEgpTr11kIbJ+pASS6pQTPcS+JoAXyhn0m/6E8q9xCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546964; c=relaxed/simple;
	bh=P5DcjewuX8maw0JP6QOsw+RzcVQfrHT3SGrqsYsm8pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZsiWPiMiQ9becW5HqZyRNo82OeDfPTbwF2Bohq/cb9lV/aVqajXC5q8RB+KkS1pX0ECURh0AinNO5/n8A8QChgHkmvcWMOjRSOIpSReSxgSgv67uaGw3fumpsZa9wdbWXhqWsNsJgPoKEkwLh181FUPgfo9AMGcPUKCAlREGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUG2PBht; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUG2PBht"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-48a0ca07c38so963808b6e.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 18:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785546962; x=1786151762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5DcjewuX8maw0JP6QOsw+RzcVQfrHT3SGrqsYsm8pc=;
        b=EUG2PBhtzmnPToycy9YV17Sgre1g2YTm4OMWJUqch279MoleH2d/7qowQsEyYbz3w/
         ggOE4zNqAjq9/QExBCUGQ1jOkudJzs6F8iZcjUfpiRBdJDLp4duyg3dMwlO6b3CwH4tw
         Xu/BYa6h3ktkqtWeZyf+d+NxsYdoH/xgFgawhmp5Q1H39P1LNsK6imFJ16sFUDA2riQX
         N/ciYxsIYjBx9TynY/lsNhs2ob3UrFAtlCFTuOYq9LzJt9r99M8ffs3KY++C9AhshxV1
         KPKRufWCexH/F2e7hQ304v6pHVZp0S62yT4Ce4+B1FBGMVAbVu5cIN4xSx7cqCmqpYgL
         5LFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785546962; x=1786151762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5DcjewuX8maw0JP6QOsw+RzcVQfrHT3SGrqsYsm8pc=;
        b=a1E2nuFvG6HCOkSdPHks4GBFuyuyxerfu9lO25iGA/onjaJjk17hIk8bGiWQ1JIntr
         4Qvjk583hZFC2LoD/3yyfKCaeN9wylLPG4GZGPrN2qdG63Uej6WmC9BZB4UhznDOah3K
         HWsXv+xI4X/oYkJ8bWPV6CByuRnTR48wRZ7/soT+Qjmklu/H/w93AA677eYgB3O8U7Oh
         Q+fR1ls0+hPjpCWH8xpIaCvkXtjvRwaiCsiE2HIFc/C1vfnmFZgN4YhACoh+LMfoKarF
         G3rpn68sxguRstYD1jKtNlNY6yrVonFk5xOMcqjalTISkSlcUY2ll1F+UATBz4aHVOV7
         xd2g==
X-Forwarded-Encrypted: i=1; AHgh+RqRFf/D8AfYYAQfR1wRp5kZpLpQS04nsLIkFrm0NfEpJu6++FBYQxqNu26+Omdw1m8q4Zlju/WYtEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPXVKK5mMLPmHxded7GZXbDRlnP43YBThiADMDZoU/N9eXUp63
	rTy6WsG7iPnHJ/9kHlxV1iOPYq22/qyeVHU/LWTiq+4A7I5H97Nx6U8s
X-Gm-Gg: AR+sD13tbHGuXHPyOn9/7L+DJE1TQRVK2gtAyyGD3S5Kxn97+mD7eX5TagR1Xm0HB3A
	blfvx8tpUeHhYpsJA6p/FYY9k3xBBZUxESeoLj4z8xyyVe6q2nCk/TunRmGvCevOwfk2fvuScxa
	Ay7IJnYhs5El1PYzVwnaRqPg/jC1fkVn3wQlLOaypjahiTEMpWHQV/bWTozN/2Qq4NK7nZAFX4q
	obeWI36MyjJXcXGEJSZtB/u0cojKfeHMxqc5obgx59VaNKOzYWgRMrr3y67SE5N2eXyyFYHKh8e
	sAmFLQ2cTL7VGyKlKNWqDzWNGZx11ZcSfQHT743bHdNSSS7tlQgb3lYd5ap6YKIdw239KVzQc8e
	eTnuyIT4WkZz04mDsm72hyi+mkJ1n+nsOHzfy18obMx+OK7lWifUDFs+cfVM/TgbVOcp1WTi31Y
	o3ribc3VGRhEDBIeyBsYydvkm9f8a0rs329TWZKCfe8Pqpa44zcuKy79qWZg==
X-Received: by 2002:a05:6808:384c:b0:4a3:f4b7:cbdf with SMTP id 5614622812f47-4af5e2725cemr4182772b6e.15.1785546961793;
        Fri, 31 Jul 2026 18:16:01 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58ce3e8esm1904627b6e.3.2026.07.31.18.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 18:16:01 -0700 (PDT)
Message-ID: <1da0b5a8-336c-455f-9098-a8c834721039@gmail.com>
Date: Sat, 1 Aug 2026 09:15:55 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
 <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
 <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
 <7792f017-42b0-4a09-9941-5259138e21b1@gmail.com>
 <CAJZ5v0jCFFNuG7WtCE2CG+hP=YNsYMdXH_945QgkgAUcr4Lryg@mail.gmail.com>
 <37daa35f-06aa-49d0-bf0a-1b5ac9f44c89@gmail.com>
 <CAJZ5v0jyy0+hqU3=gmBrgMzLBVhdUQwDj8d0_jGCqZwqyWT=_g@mail.gmail.com>
 <588c2e18-e6fb-4fc1-95d5-7a5dd0f556fe@gmail.com>
 <CAJZ5v0gXtKEaNDdSRqd57zg9GbFN-VDHrU5-=EEQPdSa9Zk-xw@mail.gmail.com>
 <CAJZ5v0g4ctzLpEro2Mu7EbSo8RNmYUCM6+J2p_ExCXseQAx13Q@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0g4ctzLpEro2Mu7EbSo8RNmYUCM6+J2p_ExCXseQAx13Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-31 22:11:15, Rafael J. Wysocki (Intel) wrote:
> The attached patch (on top of the current mainline) should prevent
> cpuidle governors from requesting idle states deeper than C1E when
> intel_idle is used until all of the device_initcall()s are done.
> Please see if this helps.

Thanks for the patch. There is no more -110 error after applying this.
Feel free if you need other info or test.
