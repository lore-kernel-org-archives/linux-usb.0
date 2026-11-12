Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523615;
	b=XuKcQ1CZYJpgbMlCAngZOwewqTjd+lxRs+PPbNt2E4WhRNuGv+jd6axq2hoydLdXVIn/
	 Rf8ol+7QVHEjqvOk//GDLnvO9sV1A65ibKP3STxLOFQXR+F+4c2jmZ/4sCFOMDek7cAYX
	 xh2Iu398iF6XnQ+xoHHeqiWZoYlv7/xfFmgQSUJlN8REnSsG5cN0J+HTp+5YRME1N1C3O
	 WK4mPnV+4MJXmsthRbOpx9vQPkoC4A06+3JwIoDVZP4IGH63FWfqSYefHOROAQcmV2hkD
	 Pbac0LPvr9XKatb+mt/wZ29vZ6eF2rIrlKGLBBCOfR3lQcNOGr3bfqycaFKMFUzJ8dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pVSpryHAFlCLz3rbBucSelxzHLz0CacAipJZykSWsqs=;
	b=t0+JQn6QjB+KUBBuhhvHRwsRYLvzIC7ON0mOr3bRvtR84hJQXBPgGjHpSPezjyGalUCG
	 Mc7jzX+8k24JRLav6egRzcbfD9BkKlVbOzKlMiqvg8LhktbycgqxvsxNJzjD4rTB9G28j
	 zGHEFVTE4XOTgQZlysksLY7HkfXnKn7PARshzkfJMxOZ96cc3E57AOvWpSyNyx96saxCB
	 9K6LgwgZtCkpX7owxCB4jOns0z5FeF/WmWCvuAET15MCSlVZLUCj2KfMWTUxqpJK4baun
	 FmlCZEWAlSQb8dThpWLROGZJbl2bxd/Oe7PNMAwNTvF9K4ZWePomdEnhbxvp/taovBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gd3ELEKr;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39866606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39866606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gd3ELEKr
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-7143451981fso364289eaf.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794523613; x=1795128413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVSpryHAFlCLz3rbBucSelxzHLz0CacAipJZykSWsqs=;
        b=gd3ELEKrqfLsLRUZQygvDf5TRKPGFeTSyf88xZ0LlqulMvCMtN/hYW1gOeLatc4Zx0
         GGBSWN4tBQBrSKRnkIP1tW+APOwZ8rGyIzXcG86SeKHlMOWh9KrD0AHuTLC9JBRpV1bQ
         ILEUrQU+apv19q+8iC3/sWvxdXcYGXp4vZwe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523613; x=1795128413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVSpryHAFlCLz3rbBucSelxzHLz0CacAipJZykSWsqs=;
        b=adDnuCO1pNpjybfM37dL0Yj8vzvjJxuCprosA/dukYhojZRtZhYp8eQgcD2NPQ5WH7
         sBE23/Nr4WuuJjCOEHMuHzwuWflose//Zm1/Nc5mkINe4N0f1aNoZErjsM3xaclRVnnJ
         OntSrEancwUaqIwFFtjrkQUGtle5Ru/vc+O1HUJfs3rrQ5zk0c1z/jK9OH2cbfue5roC
         hsa5t+LnWKTGi0LyhwdVxajekOWjeQTzn7ckAIYT9ajtlps/4RQYhg0UjA9sZjWdu0Fn
         cM5RryI54V3MYN1/2y6lfWoupchYJ7rkkvonA+eByhtESPZLFFVtENan5WVu4anyBWh2
         5oBg==
X-Gm-Message-State: APuU4Z9Wu9MDAeBQ+5Sbgoci6jzpg7qeni/tuxB4cbLXKBaZXjAGnvqt
	1tgYXVz5xiUCHXymwOZC1YAVwEWSKHrOyd3UArmRxjVUsx6a+M1wactQSkoouEAI7Vc=
X-Gm-Gg: AYBFou2A84UbIDMtinK3VJNPPxQGMt40ioLcXkn7K9ONospbAy9a6xr9Aj4QRnYJI9L
	PVDc0hSi/d29eFMlECZ1I4jSjrwUzqjhK9u7bYe6H/ZPNrZKO4m/AkEpnz1/hEYyRqhBisWWbsl
	gEoIV+kjruD67wh6CobYLb7auYzbZDkUEYdIS5ijnEKUMyrf9TzGbYlr5LaYYGQ8orPORJXN1oe
	8L7BZKjrEjdLYEEh+qb+9kave0opPoeleuykf1uxYOsbBv3UOJIATUIcu/FR8c43emzESld7nLC
	taKCRiyAq+njo8lEci7g8fpcYBTn0W2bc1sewJOdw3XA9aF3+5twKc+KMDbTTTbuHsROxPyqpjb
	doo9g1ZPgfXnffVd+0UdCcxI2CgThaNtba105BcXtQBynU1rG5s8WqhELDLJy25i3vYMUDi6NZd
	/wMP8wpc6F68bcAIR20GXougJCgWTZFRnkU2NJrPO3DFw63Sap8M97CwH9s4nax+EwN7Zxultmz
	5jZq//7MPrscss6FPATJ5gT4NImX++UB4ir5Fmg0cw6Ouaod5070m+i0FzWfkXURCYTWbmBxfQi
	CrR+UjzCk1/LzDVhz6Dqhtni3k6GbfpEjmvpKg==
X-Received: by 2002:a05:6820:8599:20b0:717:10a2:89b1 with SMTP id 006d021491bc7-71ab5218123mr278831eaf.84.1794523613129;
        Thu, 12 Nov 2026 14:46:53 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm831187a34.10.2026.11.12.14.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:46:52 -0800 (PST)
Message-ID: <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
Date: Thu, 12 Nov 2026 15:46:50 -0700
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
Subject: Re: [PATCH 0/2] usbip: stability changes
To: Michael Grzeschik <grzeschik@puzzle.ch>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 04:34, Michael Grzeschik wrote:
> While using usbip on kirkwood embedded machine, I came accross
> some stability issues. This series is addressing the reference counting
> on and usage of the event handler itself.

Tell me more about the stability issues? What doesn't work
without these patches? Do you have reproducers for these
problems?

thanks,
-- Shuah
