Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261461;
	b=1B4T2NR4Cd4V7dYn8g0Pa/ycKl0uyTpcQAA5vNvWg62F8FOjnOYcepVpNKV5+1gwTTyg
	 7s/BBXot2xod4HWjL1Y9OiC22XR2rcbsLnSFBVXy4+p8L0nMM2ChQ/7mUoJZENjl1hZDD
	 k3wN3JGQb8/yja6bKAV2E6G1R0BAF5xJtSii8iAcId+EQLl1d0WgTMVaE1e0Eh85iYxZ5
	 aLRDuOQRiAwfvKwFDNaGHycFl5aC8YO0v0ShRV2JrPC8Xq2euzu8wZVSNCFxKEU6laxLa
	 fe6ZMCPB+2qZVIZ8S3lO5ss8cuXdCJ4VHwEl/OC10Q5h73kkAqcR3zuU2heP9laub8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uJZf52C5SVOmAsQhxDSvrQ6mi3k6OZCc4lBLimUZnLg=;
	b=aIbIgPP3WXWfFdsCN+BYQQngzG2szlWxuEgW1bPXZ8LQ+ynsV46I/pq3HZWGfxJCojaO
	 EahX/6lh5XxM9KYA+lLrn7ylanP1/lE8Z9iE6CDTFrEpG4hk2GUX9VfO0rKGkjWFctXAF
	 Yj0tRiQJMxWG9hX8oBaH0m5dgcjuivVUqCJQT9E41jSGmK6Jx+rCNhWGKbA2pN8tAJEjC
	 hXba+yJVtErXTggu9hG/ySHiSoahC8LuaKUK4e6W2vRk6hgHtPgrxX8/Rq6TUjUjKLOUs
	 ecMEHKtmwYHmJcFMo4u5LTV0K6iZIkye6ICn2O52OJv/eaWafuvWJw3xKidzoTBkuCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=TIkLjNiz;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2C606A325
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 11:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C2C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=TIkLjNiz
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso2285167a12.3
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 03:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261459; x=1795866259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJZf52C5SVOmAsQhxDSvrQ6mi3k6OZCc4lBLimUZnLg=;
        b=TIkLjNiz8BhSYYZxkIh9xCzy9zMvVA08mLs6ao/qcFZ3oU9ph/SXkt+ejnty1JfEoA
         myH9aRYhFDI8spBzsWj1t1pkJE4mAH4yjhiIrz4dWTEHyNunweJhT1NtEwkRxGTZ6tG7
         Yi5RjqpyvmQnr3grY6oNUcRXIzdzOupXjmHEvm2KD/usBt39+XFFrpFkQ+jivbaO/8Ji
         wOJEkezYyi5C+ZdRiOMpAGhIlQoaenqtNbWKAS0CPbSxLD7+Uugl17hY8zu5S/omOCo9
         90D/iQnTsIsLtpKtdfniuySVjQt7auoEzQp4p01+2mTEC+HHBW14XXxdFPL8GWOc1aFH
         z1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261459; x=1795866259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJZf52C5SVOmAsQhxDSvrQ6mi3k6OZCc4lBLimUZnLg=;
        b=A0l9/HSVjUNASmNzvb52izNh6k3YDAnAJG1PvrZ9ODIVbuDwCdPFits6G6UtvXw/LS
         I02eKOBCcf0OLyj77TnL0W6h9eviuGt1suYmD7fZaAZKTy3yKjcaK6XFPlHbseZLz6EX
         +Uzhcv9np94Htaz7gbbDK+/9JDgJ/dNTgPCyjOPDTE5WWr9GI2NglTl2xFC7D+VjPX21
         R1zRkfiiw6Xcr4zmnCre5YfEjJK9ghCR7kaGNYOg4ivtmCC6XKB1LuCVHTQpOBULXpKQ
         NhmxNo2ge+Lifw9PgGej8OPTxMqmndawY92XxEeNx/XMF+lpPRy2QaOSfmaAPNBk3tH4
         cAzg==
X-Gm-Message-State: APuU4Z+O10SfowUlY6qWPmqLnSfSeD4+tQfcoYw0wDim+YspkSkfxLiW
	sBgMhpjLdA/AL+IZHWpKPx/5ZCcgXaOw3vDEbYRYj/S6ItgSsosBQz3CvPawszW0cQ==
X-Gm-Gg: AZFdTZdxONY6w5YQiU03FNy+ertt/6rF+/K4e5+PWdKC4BPcwmBvOH0x/yFGGakL1v3
	2HNot0qJKQpQOVhT5QkKXyh8J1KWv23tktszPYKYpk0lZXSxGL6uLY3r283ZO90m5WF5P2ufIYf
	+0cxL77YBimzEuqWaRcaKRX2N3DXUFaiUXYzZ4sjqsrcWpZSZR0YgY8pmSBdXeASRA2xreL553c
	WTQB7teQxI7IVoAKLGMQ7AvH/QetMhgCPYPF6S+s0aIfZpNmM7yVkSMeC9XEBNZnPsVW7qMS6uS
	dhy19T2QYJov3HcqWgcfQzDEdPG53jiWGu+FctvrDYvGKu0cWnyhUhQH5xRkwoKeaTc6Y5MaMhh
	AbB2G71DgleU0kgvFO2sy3IqIENKOI79LB4Vd28DRLvu8Hf3CWggeEXmY6FEnQ/hhLrHVs+wdmV
	L2edvz/dcNpxK5rreskdQKsz2GuksizrGK0lK0Mgb4dFE0v9mdUIbzDqvzH9PRHwpt7NT6jp3ye
	xsRhOCdmWTkPbvpArjPHt7qVdAadgIL6ZUflBhP2CssR4xSgPKOoQEQXO82l8LltkqAaVZ516cT
	B4GiapBag4TvSzmgdNlsBpkI6J6VCq0hC+a7j9QkBU/4PxEgifLdaiRWn4/Kn6XRdf47srKUP96
	HWgqklMC29xLTQnZbpZtetHNpYteR49azi89fLtAzXBa230812I8H8fEfNdIKW1CewPkGU8i24M
	+g
X-Received: by 2002:a05:6402:2105:b0:6ba:3738:aa76 with SMTP id 4fb4d7f45d1cf-6ba37ec713emr4645637a12.28.1795261458717;
        Sat, 21 Nov 2026 03:44:18 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm2294411a12.21.2026.11.21.03.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:44:17 -0800 (PST)
Message-ID: <acb17ca0-c814-4e41-91ba-10f28cdf9e00@pardini.net>
Date: Sat, 21 Nov 2026 12:44:16 +0100
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
Subject: Re: [PATCH 0/8] usb: typec: fusb302: cleanup device driver probe
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2026 17:42, Sebastian Reichel wrote:
> Move fusb302 to be fully converted to device managed resources
> instead of having a mix risking leaks and clean up the interrupt
> setup.
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588) on
v7.4-rc3; the FUSB302 drives a source-only Type-C port there.

Probe, attach/detach and flips in both orientations, PD to SRC_READY
and DP alt mode entry all work, with an RTL8156 2.5G USB NIC and an
Apple USB-C Digital AV Multiport adapter (A2119).

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo

