Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615559;
	b=1TOTOV/l0df0uOPfO3DoSVywE7Is4dJzqKIND9HJDKbhLq1nSIil9aSF8S+xJ+iqcVbp
	 DxromQjqxMSlwtrzyh6J7HDYwSVksVoStQ92QYAcXCgxWqd4ROYyU9Q7BwC9+Lztp9rAt
	 7xIm/ll9u5X5SWMNGYfAIruRMuGCdxy6Y6qU2t4f5LuorUJns3s2RHuTfE6tPqbczwjFP
	 gYzdaXZv/1mfZgROhjiLt6fsUem4mKEDMgzpKrnVGERq6RmgxK61/rYHwkdJvFiWK3H9y
	 uantsKUvzEWp+4xY56ELx6Q7EPakySzMoXnb28cbaTte1PXTnZrD1zU3jNr51VyEJpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=s5Ihq3EDQtqpbYTB2nxg63sO8PdDPYRVUiCL/mkX980=;
	b=TFqj76a1BNlNYAewaAJpI4d/Busq16ud6s4xdrvak07osGIf54TxueqA/Jz25p4pv22X
	 m9BiVzzbf+CGlVMnDMPH2dr+ufclXM85ITOVR+JgGil0j5wgYRym3OglmKs+vOr2RR1XG
	 nNC2lXEXUXIIqwlvHspfhvRzs7Bx/0DYcZIS99gjgkJW/Z0hthWn7R0aT/XXWNiKhKKo6
	 QKsr70N/yzwzEAMgfddXwuyboGmEmW3aYIOjnFW4GHcGDwi5nX/p5ALGtPgxpBcamWGQO
	 oVJqDsQ4g3IpofArxfc5GgfuxIHhTcjdUOx6Ssmp904wBFKB1WiyDbbEEkN4pfosH5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD99606A324
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 10:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD99606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so24381185e9.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 02:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793615556; x=1794220356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5Ihq3EDQtqpbYTB2nxg63sO8PdDPYRVUiCL/mkX980=;
        b=YRyvXk+Jya/S850FN1og1TUyPM7JSwGSQbmSEG1aDTc8/MkHGIw4P4FNGh7jDDk0bj
         v6OD3/wouGnRVnwmtCeiqX3fK7Tl8rdp4cSMxdHeQulceZ3SMwjLVlHjKrzwb9zQ8rVo
         vB7Ym8COF4zO4FFS5iil/gV5foFx4zGKQFDlxDzviGaZYWExGNfd/cDimEztakQNBdHE
         cgxrleQp+XO6BwfygnAyrWr0KNeOejQlGt/AC0rWok/eVA3a7GN2eWr9z/noWT/otzVv
         CJvgK3U1CmIcMWvi3+brx/W0YRdsWn3azd0jKxDdckJXt0RGu7s4/3AhCyk+8R/FRSoI
         eAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615556; x=1794220356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5Ihq3EDQtqpbYTB2nxg63sO8PdDPYRVUiCL/mkX980=;
        b=twu3kW2XbBnoImOrZoi9+11ni7WqQbJgWwM4bSXKIIh6zAY3Ko2ZI+d6tYxd6euSf/
         WRfGNep22gn6+xU5h+17W76nP6sWT1SNKwLpwjRsAgc8TcrndoC3Q0k5DhphZoh4IPOk
         l3Te4PUoSTFQxD8kW+yJVTGEY1aanAyNVXEL/1ruOMOuzEydIcwl0QSa9Mfm6vATxSza
         NPazAFmH2BgJITGCvz9k9ActO7UE7+XbWTsXDHzWiHaNXPxAY3p0iK3c80v4NalSBgrB
         ETsZFrvqQrw7Nqa7fFN1j8jaiKZRLJM6uKlmAZLi3RCBRXozOxhYWneKA6g+dVHy4r3e
         GKfg==
X-Gm-Message-State: AFq9FYJN1g9+g+53koHuLcc19AafbVY1PzbMKbwP25aArFLJzPmlLoWt
	CMZfZugoSSxonpGy5codFW0sv1tGMis8wl1rSjZOOQsyl309lskOP35EBpqsjLOyzc0=
X-Gm-Gg: AYBFou3Bl5I4zwUohTuIvMH/Vm9Wx7gxmlfjoT1mWM8TjmOkqYNT+xLjXqA0tbFuNEz
	dVnCeSFzVBHqd9IISvw/2cpfN5yDm8qCx6yK+bcywPgaLP2A1uT7hWeR0Vwdp6PuGqsPLTssLUc
	XLMT4vMwpQb6DfcCai7yvxDz2F6eQnqEJMUu2ZnFY5PMa694+I9VXipFbF+v4mNkvkon2DLi1t/
	5Ndp9NCgqN3+FxpPLeOcQGtLfuUM/NaX87hPnIt44yrs7O8ZH430flW0OYvtePlok9bOkn783oI
	aYHBf7Y2sQ4J48uQqcRHVyeS4T/H/zLirvbg2fZYPHc9kFaKPgqOK5WvLuwdAvU5nfXm9sr4Fgd
	XwXpp4jJG/Q7cEpEDtNOwuz8wNF7O2kxlzVjSWmL2nVaLqAObQhvFYvLMQqjEj3J5j2tW1/7DCZ
	VvCjfLt0mDEwKchmQ4nv5+EbDJ+fW2HZM74+AXotB3WUwCdIJMz9wLjpH9di4FXHvw6m1a8XcAf
	f1/PjxKww2Vy+HmfDlWhbTQ306Ij7nOjKBwy3grbm1K25BYDh6MKPfp9CKoOEmZY3/2qZM+IjWb
	i+ZN6D8l1zQsarsCtUQG2wu6ttuMp4LUlcNP1t5GpRPefPwutr3FE9PfqsLnpBQWnXLlCA==
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id 5b1f17b1804b1-4ac1765d977mr205638275e9.21.1793615556161;
        Mon, 02 Nov 2026 02:32:36 -0800 (PST)
Received: from ?IPV6:2001:a61:13f9:c301:88b9:18b4:d518:6aa3? ([2001:a61:13f9:c301:88b9:18b4:d518:6aa3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm19722777f8f.1.2026.11.02.02.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:32:35 -0800 (PST)
Message-ID: <ab7f4bed-92a3-4d69-8ddb-818121309837@suse.com>
Date: Mon, 2 Nov 2026 11:32:35 +0100
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
Subject: Re: [PATCH v2] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
To: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
 stable@vger.kernel.org
References: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
 <20261014105700.19433-1-olivier.kaloudoff@gmail.com>
 <09633215-e52b-42be-90d9-12fee5b8728e@suse.com>
 <CAKLTOU-rb97bv5dNZ0AkzBNORLYeWbK9kJjQUxfveK4aCAUuJQ@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAKLTOU-rb97bv5dNZ0AkzBNORLYeWbK9kJjQUxfveK4aCAUuJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29.10.26 22:32, Olivier Kaloudoff wrote:
> Hi Oliver,
> 
> On 27.10.26 10:54, Oliver Neukum wrote:
>  > have you tried the new quirk reducing the number of streams
>  > being used?
> 
> Not directly, but the failure signature doesn't look queue-depth
> related:
> 
> - The enumeration stall fires with a single inflight command. I
>    reproduced it again this week on kernel 7.3-rc5: with the
>    device bound to uas, sd probing's first READ(16) times out at
>    +30 s with uas-tag 1 inflight, then abort -> host reset ->
>    attach. A stream cap cannot address a wedge that happens
>    before any queueing exists.

True, but just to be clear

1. is this a race that sometimes hits?
2. does the error recover actually work? 
> So the two failure modes are probably distinct: a probe-time
> firmware bug (unfixable by stream limits) and a load-time wedge
> (possibly helped by a depth cap). Even if US_FL_QDEPTH_075 fully
> masked the second, the device would still fail enumeration
> reliably only with UAS disabled entirely.
Yes. The thing is that if we get a rare recoverable error
on enumeration, disabling UAS would be overkill.
If not, it is what we ought to do.

And an experiment would show us whether UAS could be reenabled
if we ever find out what causes the issue on enumeration.
I suspect that there's some difference in how we and other
OSes read the partition table that triggers a firmware
issue.

	Regards
		Oliver

