Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591004;
	b=O8xsGk/4goihesh/9Q/e0C/XTz44m/y//yya3Pq0DEG10xpTcAxVUiJBaPSZNwBGd5fU
	 wZhMQt7npBS0owdIhAB7Tofgu7OdtRx6k4ARqo3WbMeH8LXVtusJT0wrFmXzlxqRBsmx/
	 0rzO+0u0YygNEGFrTXBmTW6zmxQ7wcK+akR6ne2U2jKpNQb94W9/9oyFH0ha8/yFYQ8Wo
	 +cnyxw61jDEx6BgY8F1Sfwd1ZnJyu4VbMV1wbF0n9yl0n8qs1SYs+NHWcfSfrvAtI07Q/
	 DRt8oNz1Z7tKBmHsaLfoKxQdlZ5D9LQfnM8pA4r0yO0+uQTrcrpsmrJSk/jWtbC3jPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
	b=S/nv/VVKHYGSzTuTr4DytRjt8RxscidfQZc77HeaTb+1xlrUPP/pJxpYt0U9l5rQzKmQ
	 QzbYFsAt8rf5guDuKG7IdAc6KIYx7eVaQe0DZiNXm9ruO6ALmR2P7WiTI9q4jl+a4qd+y
	 /b62gha/7ng/Se6w7l4oDyGLOErEGwlZSm3e8eK4X2UHGvJICWl3EHNwXuLybP+98hbkZ
	 8e42RA/jiNFI8F44IQQk14/TZWWf2aJLgE0DMs77jsu7ySBXc23htS6VL647WdXFrdxgc
	 IBvCPizWTM1AilUWzwUJ2sCnCPENuBmaehEkIP4MUO2c/wrshelMtd7oujU/JUHyL7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DKH9uDE7;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3950E606A324
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 03:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3950E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DKH9uDE7
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-6f9b24c99b6so989873eaf.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 19:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591003; x=1794195803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
        b=DKH9uDE7Q9rddhrZPsvUKZGrNH65QChDq7i5j/79CM1XXs4/s8CRFyFHc2XzBCVt71
         4nqZZzL9YK1IBAX3QgK0krlyFeauysN7+E33ndqtO+Ppqf8XaGrH8/Qvt8r3UXrz7eVd
         DtfMVxP3Nc/CCRO77leMamDRyRsxm+yZUYjhSzJapwDX8nZuMkBxrQBKQytrNGTIF3TF
         yZN99t1CVO2W5zjEFoj++z46XfpbslAVaN7ShiHry/NBGHHp7pimfgSd4lRTvM48mEWY
         Z3CZrhvKlJIh57QD8rXz99Bri68a/nGyzmWUJA6l/ds0YIUoFL0yf/SPseFdWBHBmM8L
         gTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591003; x=1794195803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
        b=JqWaH6EQYakerm6iXuv9LksITcVJ7kdnO1FZ+8484b07a+oBuxdYf+LvUjGbS0zWxs
         TeFC0K+C5oKODgvylADzgIHx6gAya3w5z6ZV07u7PzyylKderb63xYBAH7M1QerTme8H
         9PJLosP9Y+7mQT5LzkXzSSuEedHRQ2Jn5aesW2J3yo14CjYnDRw67uSMt+HJ18W7frj3
         FeaGR+ZysvCIjrSPoX5kyg7vH2jQWGVq6/SOXRdaPP8+gQlvBuiEvyyINuRhlbAcTX56
         S2ByGux5fG7mLyAEwZv66hpk3o3Q3HuXaVa2G6zQ8VbIeVAzeI636T7mq1ITNpSv0FHl
         7ohA==
X-Gm-Message-State: AFq9FYL2BB04RRAqpB0o0yvKLgveEY0ckl2FdgRhl+JDVFeleGnUtpDf
	VFYTeHgJPlgmDxgma849B9Q6BliDiWp+HvwYdCMELh1ZZdS/gE2BybHX
X-Gm-Gg: AYBFou2wA3WKv49o26+6GR1rqQkL0sULtJueYzROurnqSnwqYlMGYycQ/KlznaLQX0D
	cNxLD7yCAgp1IfrdEFJbAusUtD7VoZ73SOkmioCxa/L5qj5XRb4ao0ev/q/CY19J8YEYkhgmPot
	eFiBMj/Ra3fNfrEJG9UotgtXLID0FLXR5NnXK1ZxkNLZDUb3N5+g1XTl4fyC8OCl1dqK3ARcnRh
	TnE36a1OeBxS4gIIIj1DKm8Z9ga7p7Qii0vBqDkbN/tapjXBQH44i5FtjrrYahSsxTWQ7jmGGUe
	lHhY+AKYPlQ2dfi8ibh5EhiN2pfWPJDBiPdiNy+XOtW0Ie+8oghxsKH+dyczdQr0+XQ+5Gi8Sjq
	onGdlKv6FQ11OS8Zy7bClMjjjkt0BqlFshsrhsyO1iVJdtT1afrxq75z/pBdOYXBcJcjwqW5wBv
	yRCw9WoQFQ2XWR4094GFcHLFK80SR/wMFak1j+/fFuevZDqCN5DI8q92S6WiLig37wBn9sASBEr
	/kXBg9cxKrjF1845YYyl4zma9y1gMzF7PMopy6WB1KsPuBLXTFglebFv0S+rHMm/L4CQtfozyuQ
	P1rHkvCsr116iJwTUWCg0dpkEYIopGLX9khuMeZ1t72F
X-Received: by 2002:a05:6820:f008:b0:6b8:ce67:77e9 with SMTP id 006d021491bc7-714f1fd628dmr4883384eaf.12.1793591003181;
        Sun, 01 Nov 2026 19:43:23 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2d16197sm7682911eaf.6.2026.11.01.19.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:43:21 -0800 (PST)
Message-ID: <416aaa7a-aebb-4129-8af9-e2895ac9f78a@gmail.com>
Date: Sun, 1 Nov 2026 21:43:20 -0600
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
Subject: Re: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

Gentle ping on this one, there hasn't been any replies since the resend 
on Sept 29. It fixes system suspend on MT8173 in gadget mode after a 
soft disconnect. I've been running it on an Amazon Fire HD 10 (2017) 
since September.

Thanks,
Ryan
