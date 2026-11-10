Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279633;
	b=JeN/ThUph4If4k3uvOsCW7KCUi/pbJlpBxcxsY7Vtgq+Nm8vMtbBkFYRWUwdeVkMkAnC
	 KfV9O3dDKCbcsEbaLygmI+KGyLo2Q2CerfBdIbCM1AELsbt75m/XkdZUO776ccOlNAXjK
	 5JwW4MKMkk1nlt37lw/R44fyWJdkZsZGqdIaGaVN3nzDi9tm6pNZKrg0Lwjwqrd/kDZa3
	 u9FGmffNgolbbgTQqEVDKb+FnveuMRChJ+nKuI321nYz2JxK3gNm56j5O35QfHEQxsarM
	 63I/iQ3QTcucBEctjAE6yHsyKM3JPvuvnmr5QZug3qH9RNUwmUxYASME/D7zh7U05SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4wBXUZ6FpdwTYkG0jag9ba1skQI+CQfpR4wutPYZULU=;
	b=YWLAn3zggw64dKErvUUrrWtU5XKcLsN4qb8qZKHfP8gyR5luasCwVsFK1vPikmSjMSVW
	 PiVmcprE4LRfmxrRZn27jkNBbqYrNYnDTuCWtPRVOWuAW0pxdQ4C3EsOJjI1iP5gHlP6X
	 xxwqSPxsZkMsagv2n8TTcHVBPE6RWd3SbOVu8pXWFTpN/vKg5Pe3J0Vg42YIBGI/UlJX6
	 +xBcu93NBKcGUxfosPM/d1QVpx9sjz5IHUT4MIe45US5tYnfFI7DA263f5+/8UALlVIli
	 0i+K4qtcC3FKqw1dhVLYu8yVr7XL0M78VM5ZgnRZw7T5LCjfht5ou7SH+kMgN0lFz8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=pQmSb3gf;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B21606A326
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=pQmSb3gf
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ec14f4369so16679706d6.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 19:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794279632; x=1794884432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wBXUZ6FpdwTYkG0jag9ba1skQI+CQfpR4wutPYZULU=;
        b=pQmSb3gfLqpuEfsLBm1LR5zUz9XYLmKQzpAiD5nGQZQWa8EMFU7bkUSQtaCJmU+Pl8
         hUFh39i7QuRUOPA4YnZjm3jVwIGvrn12Tjruy8C/94/6dhkHViwJlNfAenaA2GDJN1HY
         5pABHMLSWRgX/3mAXR6HOrozb5CcQgK1VGmbClFLcWLtSg20aqNFbiE8gaOLy5F4UPn8
         FSOnDl5z8LlhZNPWePXLCXP20aPpPkYIEp6HPP5wBdT0v5EXOm7tTcA988JHZEPhgHeY
         ZRU2qe/k40k5cNRwyFipHNiVogP/rgC+sP01NEv5otoocKnfI2PNSnq2A8Z97QHAYjLq
         cQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279632; x=1794884432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wBXUZ6FpdwTYkG0jag9ba1skQI+CQfpR4wutPYZULU=;
        b=aNmM7zG7O6Mr2aATwGCllAAdN6SQTmAbHm5FKRkrwq2AyLXNrfLBSqh0LPeIMAXz1Y
         W1HbghmWe6hkSvwFGGeiiNWfGdH/XVp71txggs7l8Hcjv6llhzpIYm+iMgltFZnUTMlw
         p2VOZUH4W8zNvbiUkLVapPYDHmqbphkuR8guDdh6XZXWh9doxiU0VITW/zORhHUy9j3n
         pL8+iX91Tirr3LLfDzhqxh3FMt/++80MckhwWg+PQM74N4Jkei023hrCwxuLymArAUMp
         Vg5C38OIU/SCuJdxw10Uql2Fr2G0SNlDOo2OQUvAA9Lf1gxUCe3hlrshaN+QngmdJDI/
         ihHA==
X-Forwarded-Encrypted: i=1; AL+hErEkjRv+zXtPDARcsMXZ3b1pIT2bOnfDsNnbkOP8Q44TC/1oAVvn1jcweWuX7BlQ7UCWnlLed4Hb9H0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fN2BA0EogtgDxyZi3E9gFQwaZ5T309bj8YLEs7ACqECYEHjRk
	KTzP0VwDPQWLK0mB9QdWCYc8cVoYKArbS8VtOEGyDDWzQDCkkgrVRFV0ZF5tnC0nMw==
X-Gm-Gg: AYBFou1JN+2OpQ2dSUkZfG47u0BJv84zCzPr8JcflSo/D4vRt5vsvsjTaNS1CGNEoKp
	AT+W/MzLnuDJCm4gWXdtdhvBhfAf6P2u3IKOzTvk7S97BS7un6gUCvea0c5hZAkh2FXs9D+wU3a
	nBwk/7vU+hyckz0fOXvE/zptzgcJosQNDeqSZ2O647kbzMuz/47Rt8nNwZy267mUUA5ky9KbNV5
	B5yQ25i3ZsZP+PAcIajjZAoc4LRau2wF7yL17LGKQQqI2ACeppGDEf9aFASLw3PAxQa0lzZNuqU
	S0geiGrLr1asZNlChguiMZzNl84aDd57RtnBmNqE603eA2TsAjFpXcil1uxrCuvAnaBNPtezY1L
	tWdh7cScXRXaYcosqy6cM97HuPmjcrHp59mIj764WsYPc6hmZnCZNcj+2zIGWhvdOjP2UegwUf8
	5rThV8dtZpf4jQGgFtU0UGHqRRzEBse/l7b+uy+CSu07Ptj3VzisJiOCwascmHVcQXZlZVevsR9
	dUXhftsoGCnQwuz13qHOx+WI47kltRtnrI55g+O817y/f9LDrV+Omfh+OnE2PNkvI9DmFeE9rOW
	2WlNNVyCqu+l971XwNLSx923/DxE
X-Received: by 2002:a05:620a:890a:b0:939:5cd5:e243 with SMTP id af79cd13be357-9479f1b9ef3mr232773385a.6.1794279631842;
        Mon, 09 Nov 2026 19:00:31 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7ae756sm121214985a.27.2026.11.09.19.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:00:29 -0800 (PST)
Date: Mon, 9 Nov 2026 22:00:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, xuhaiyang5@hisilicon.com,
	xuetao09@huawei.com, caiyadong@huawei.com,
	suzhuangluan@hisilicon.com
Subject: Re: [PATCH v3] usb: core: hub: Re-guess ep0 maxpacket size after
 reset
Message-ID: <1df531f4-380d-4762-ae01-4554acef2c89@rowland.harvard.edu>
References: <20261106031625.1824732-1-lvpengfei20@huawei.com>
 <20261109093935.2634235-1-lvpengfei20@huawei.com>
 <3daf18d4-4936-4ed7-8846-b67f1664be13@rowland.harvard.edu>
 <20261109213437.5c693895.michal.pecio@gmail.com>
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
In-Reply-To: <20261109213437.5c693895.michal.pecio@gmail.com>

On Mon, Nov 09, 2026 at 09:34:37PM +0100, Michal Pecio wrote:
> On Mon, 9 Nov 2026 11:05:30 -0500, Alan Stern wrote:
> > Not here.  And not inside the retry loop -- ep0_reinit should be
> > called only once since the maxpacket value is changed only once.
> 
> Sashiko pointed out that xhci-hcd may not perform ep0_reinit() properly
> until address_device() or enable_device() is called.
> 
> So it's either this kludge, or dependency on an xhci-hcd patch which
> didn't exist until today:
> 
> https://lore.kernel.org/linux-usb/20261109112846.04bfeb0f.michal.pecio@gmail.com/

If you're asking my opinion, I say merge both patches.

Alan Stern
