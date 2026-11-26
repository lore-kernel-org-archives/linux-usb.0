Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690288;
	b=pry1ACJ37ReEOVVrZXH4XYvVg46J3tvwpOn7EMV9wkJRa4NYZEGiQ6RTPorWgsxWmdey
	 /vu6uOPRWN5UkhSl352QmBVPbLG1FJucknn/nh4GqEoDcLmS25VlSVhyarRsVsq+VshJX
	 zdCuRF4U4h8YUoi4aKdSYC8mMoS4WIxAMh+5/2s1SloOjrLva6vR11uLwVCIs6YImMOdv
	 6f28QVQDrBn8aLKxZGhNGGl0sZyscwdoNckyMBqg7qaUHUCMvtvpUeaJKkD7NurCV0zUL
	 ZGchcd8jPBykNaGL+N0LOJwah8XABk5r0LLhJ4BA6xkSr3pS3NFVj/SrEKPywfNLdiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690288;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
	b=hxGzVnMiigb3tzEpKL/68eVVAekk1+Am8TTUYdh6UuhBLQxTV0p2+5Wm7UQ6US4+9wst
	 yBDOmykoppSm0hJ44lGbZrXIwkoIMxwoqFxKp/O0khdIfLWC97kn3ot+9GlfAYyN87x/o
	 EWPywT2WFRtq24isiAotJOY8mE6zay2zQH3W4Zl0asXIiI9e0cAlbOKOPvaiWkVIc6kDY
	 7hsC8rt3dM8lKdsMwxRAmM6n31CjD4FX5PhOhwo0xuOMX4xBxOFSc/HZ0r8QBvG/qizNd
	 kh8Lt2b5zVsbREZBfBKafq8xKJ0qWORVgX59nJC67DwpqmRrgoSY5Ty288reKSKlkkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVhCp4gY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LIJodMzh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B12606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVhCp4gY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LIJodMzh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795690287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
	b=IVhCp4gYsLWQlCf0GRKOYBJF5IY8FcyTE2sZBU4GP7pKfLrlpEf+6gyN6Dt47VWdFRrEYt
	nHz7eLkIRoWjycvbalTuk5g66+Cfg8M2doKmmT+dWxQgLANP6mNgWXsfjJsHLeoC5eoa3r
	z3KuFqozIENfXxqInC+ZJVoxcF2ZSWA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-AHFarXA5NXm5C0rX6Al1Ww-1; Thu, 26 Nov 2026 10:51:25 +0000
X-MC-Unique: AHFarXA5NXm5C0rX6Al1Ww-1
X-Mimecast-MFC-AGG-ID: AHFarXA5NXm5C0rX6Al1Ww_1795690284
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4bbc86e1eb0so769352f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 02:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795690284; x=1796295084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
        b=LIJodMzhs4AhX+/lBnW+CSbMtYdS0Lk6JiuaDFm2NFKLmd+DHq8fF2VPlljWOoyVpP
         XfyerrXlcUrlY3NywfQ4Su+Uc6cyrDrAcucQkw7BK6qmYiyKPOR5P4mUq4jESbl09bhu
         4IGqSEO11btOE/Kmq+bM+ukgs4s4Kd365rSlKJLcFnuHz142vCOA1U85OTg7wn7R/cVw
         JIfkEHq07Y+0KBHAtxox4wEgxs8g37RhoN4yKMJGoqRfhLZ6KaqHQlXp6kojv5RG/GuT
         LaNrdG7hrMChJG1YetYo4996CLbFmVW3/a7F0xVmnfXoZeGwrqQGRV2IehCz8vrIff6S
         CCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690284; x=1796295084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
        b=EGbDMNG5Dy1wzTde0g+LusWur4HkNI0Z+DNJkP1HwQjT9Ri30hjdubn16SHRGdkUi0
         mfc9f7DbHXpXLCfGQUyDQciGrgkcNGevS3NcW6zzI3HTzLaPpdxOvgI4c7Wphexh9wia
         1PPLNiUrnexzFlgO5AhKcZcydhqVjs4LWqR+QXroseB4kZazYR1qt9YvRO/bB3kAAh2b
         wPsKUHB1rp0fuAbYhm5nnZUIX/LMmwvpHvn8XURykfnVA93SRZ33Ajkl6hzfbE9/y1XM
         8L2PP+ZDCfT70Z7udftpgLOS1ERojcPKpfeqodSRdRQI6PQou7sGuKWEUiU2v0oK6L91
         jCMQ==
X-Forwarded-Encrypted: i=1; AL+hErFIiJn9atyaMr+nkUaX91UAAnwAyZgKzhRziRGS/tcbnneR7pNiLOJwpZTf6YX4hSveewwbP7p658k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N2jPhXKAr5eSadG4s+on3XOYg8rhvidadGK7AxfM6Ul6hIOgD
	8LDD2XJ0+exj/C/Ve6FYcc1znlrXSZ2CSYVqpvln/fHWpHyKVxDDHM/GR31IZk4Og6TxI2U7x4d
	SWM7ae5dc34L7MNxpHF/lcxwkR5aWqrLCDvzQM8YNhqMPP/dwh6xj1vaNB+Mxqg==
X-Gm-Gg: AZFdTZcCT2emWCj2Ul5UB8jChnKffKlz4ZAvvF/J3w87qrU+3eVrzIqG6sgarDl+bxc
	O4iFYxsVqTwRdQfGgnguat5Ls1Z9yPzBOviLhCO5DmMgzw1MyfQiL9uizrSgRZ740OipygfL5UE
	EMDEOjn1KrBtmzEPtt1yl7xJXOsSI+9UzjWKLFX6q5va9maIX1g9sVB/WjNMpFqXiThEuZmuaKK
	dJcdnJ3N+CV7OwDGkRJlzuQDGWM984tMVwoxer4gUTejl7nncz2Rxqr5jKn+wT2rB4bSm+1IsUw
	BsBIKeEGl1Z4xvEQ73s46dOuL8nLG0fjjR7eQMVyDFfAIj3hgsdzsuJNvBWpgF7BPNkDZUDfgEa
	pO4qNOhElobULIE8RNqGbS8DmQQQVi4cWB2lUzGqYyPydKzoQwRi7hGrSO1sEJvmFdLphMZajy+
	2I8D7JlnYwBNzy/IRMYAKdDGwVummpGncxTXcTYQfPJYJ1
X-Received: by 2002:a05:6000:4013:b0:4a7:d4c9:ea03 with SMTP id ffacd0b85a97d-4abaac57bb5mr38352848f8f.6.1795690284059;
        Thu, 26 Nov 2026 02:51:24 -0800 (PST)
X-Received: by 2002:a05:6000:4013:b0:4a7:d4c9:ea03 with SMTP id ffacd0b85a97d-4abaac57bb5mr38352799f8f.6.1795690283567;
        Thu, 26 Nov 2026 02:51:23 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm42611310f8f.59.2026.11.26.02.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:51:23 -0800 (PST)
Message-ID: <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Date: Thu, 26 Nov 2026 11:51:21 +0100
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
Subject: Re: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a
 stopped queue
To: "William A. Kennington III" <william@wkennington.com>,
 Oliver Neukum <oliver@neukum.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?Q?Jan_Kl=C3=B6tzke?= <Jan.Kloetzke@preh.de>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118034122.315979-1-william@wkennington.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261118034122.315979-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 04:41, William A. Kennington III wrote:
> cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
> whether usbnet has stopped the netdev TX queue. Since commit
> ad70411a978d ("usbnet: fix kernel crash after disconnect"),
> usbnet_start_xmit() frees any NTB submitted while the queue is stopped
> and increments tx_dropped.
> 
> This triggers routinely under bulk load. With the default 16 KiB NTBs,
> usbnet only allows MAX_QUEUE_MEMORY / tx_max = 5 TX URBs in flight, so a
> bulk TCP stream stops the queue constantly.

The sashiko comments look relevant. Also it feels like this is papering
over the real issue: bulk transfers should not cause TX queue stop.

It's not clear to me if there are H/W constrains behind the
MAX_QUEUE_MEMORY value. Perhaps is time to revisit it?

/P
