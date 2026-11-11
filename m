Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394130;
	b=cQJVIk5F1wSHsUJrxqIytJJtUJLTfoNA6vXblW+xJ251QPn80BvftW8Xg9tc5EUa7H+G
	 NgrQNkTmtpXSbA0bPFQ193z24Y0u+bOTc6bbPDUGz9qsf1cJITjefwMf+Fa7wdllb5gG2
	 pEkOkxnNHZnyCLtaTrSZX5XgcDtQxzqzu85AHSnYv9bUNdshALuKW3dEqTot0tqUabwJy
	 nx7wrLOyJQdw0DdusVZpBDkxlUqpxKTYmq4v+/i1guK4zxYVMCgZG7YLGk/8gDbTRHfZj
	 eouw6hC+0sWQeMtLl3T/dB11bXGPvn7AiqpxRFddYzLT471XZtgyjLlcSbC+hCC9wdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SJE8c/dZm+CWhQbZBqBGTdaX2jwL8ZWmvduRU6X8Ew0=;
	b=4ij5Ureq7KnxocaY1PIPo8PiaD6+/A4lsFyszcIIbGjgBpSNOUANpDdv/e2+/FZnEALX
	 +Nc77xFkWDkBQmONlEpj5ZBRsFmc/l02bvCcABlq14TPE5OZd2AeWwVuEvY7nadgvLirn
	 SL26I7A5uqry/ErwHrSc5y0AJMbL+CFyCipDH6cLU5P9QwWcvls33Yt+2htJzJV2jIsIz
	 nb2ISqvEN4rSte1G/1nuODwzOViMWzLfU3yFqhXQSxntWaCMWc/yKBOSUFRrHH5wkqoqy
	 UGpNwemc6dTnLf72jbGBgSBVT/Js955RIqF6lADuh8BNV+k45aC/uGh4TlGzAFESz+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GBKkvpuR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB000606A32E
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 10:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB000606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GBKkvpuR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so17954575e9.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794394128; x=1794998928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJE8c/dZm+CWhQbZBqBGTdaX2jwL8ZWmvduRU6X8Ew0=;
        b=GBKkvpuR5r+JH+yFSCx2MRbxX6k1mn+PDhE0+d7qG4hyFMh2NoIazPozMTmQIzj+JD
         9V8o/DugtUDYfrwFdXFHHxGzNFBYTu7e76oRigVpHZa80NBx+zbfSyUnBxDqxg3KoAOA
         I2K6lq0c9BVy7Cbjw4IwNKTP+XHg7DTaHTxQbG5Nh6/cbrNOti3bTUOFGssN6RfM71le
         ijhIsPf9Un9wqeCXlb5W6zgWPLYabiBOKuih/2tp/XV9plgnBLPIiy+2ydMVk2wWH3eO
         jqtcIRFucEU87Lf0iApwLllYGg7Jt9b4puTC3EpxpXWCSs10ncEoku0H26XlqImr5k37
         xJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394128; x=1794998928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJE8c/dZm+CWhQbZBqBGTdaX2jwL8ZWmvduRU6X8Ew0=;
        b=13CH0nw+ZvDyK15nr8pedrRZpyNa8BWuCqR8Pa5tWrAfYHQfV0z1ZoO6SF7cN6wN9W
         3O3qyfZ3+C/kxmXFigtu1hUI/qBC/x0kUKS2/AUGLJYJs74fLIz4csEdDRq4W8bQ7wxO
         XQ85eRraXdhbWS405djqF7TQpZoxx7ysXA/YQc8b+N8mz0N1F2JBtrCay8i8kosyfxFt
         ZzRmvSqIGNr1Ic7bswTGwjtD6P9qDRavJvH/btOQqnivGEnyEAehBDdpzUQPspSqF4Eh
         Afu+30ZbcnhYCdBSbaxTL9JQat564Nk2w1AaGGSnj13M4zKIq9yoIjnBuuwbPMHBNrPI
         Bi7A==
X-Forwarded-Encrypted: i=1; AL+hErGdJD5QxxFRizffrus0H9JKDuAEMGGMjXo8xbaJLr7zHz4b9xj1DEbgf7OyLOmvGu5Pq/2HvJIQM5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qv+WoG9wmaGAiPw/GxImduwkTeJMgY/KHkiIWjLldXvShQtzr
	ujIy/EcDNiHyyyq2A1CFBtOvzf0gPz81YYFZJhxK+Z6ojE9ytrl9DlTpKFSjvtZicWU=
X-Gm-Gg: AYBFou0tE3wpTQaBCvGdASeyJSMG7J3iLOYfLKyx1lglO/ZkQldVeAgQ817AIzmwaXD
	oghhkhUPuWWmmx0Ndh4ymChCLqx6GQeqDk4Ri+CXXkxSDgxhA6a1+t78Od+Y7Qcnx+DPyoxTINn
	OyyzjJ+QL5cPQA0bORDE+xHAMjFLcEb1RwSMJjtkhi2+CSemGKnhXuY+YrYbo8Rcq43DJvcQIIL
	+fPTmptlzYqMyV0angKV7LePm8wgKYLZOaC92f2l89hPxE5c1PrkPkXXupQojvTOexoIfgWCwz8
	VJLc7wLDlNGrllisIxZcJ9pmR2aWtZAb9Sm232KiSt5x/2PqyIrELNYS1YR6J0Uxwys/3dzuuFS
	tPubRh8cdJxsIT/tcOKJI6KfocrCkBqw2TqHNln5JbXAdbHVC+Iq4a501UYwWkbuAN80FNZXQm7
	9Vqt9+Ol0CMjABe3BkI0fpzt1C796gkAp5lR22Dcus9amLL3JZgD8F7cl9Nr06x3x2qNLidIEie
	gSnfbJBfG2bKqlwSAxyT4d8TnjYzGXD7TlhzpFWJp/rXtdExjIgvM26v0+YMsilO6TAi1nWEABX
	TbwMLZL6uORKebqtW81gp/m3XCtoN+0vVZiAjaqtvI6NFMSs2YmdEH0TPMrVSr3pkg==
X-Received: by 2002:a05:600c:1f93:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ba0938124fmr41926975e9.16.1794394127955;
        Wed, 11 Nov 2026 02:48:47 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951fe22sm54693255e9.3.2026.11.11.02.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 02:48:47 -0800 (PST)
Message-ID: <2e392c2b-3fde-42fd-82e0-8130d2de48d2@suse.com>
Date: Wed, 11 Nov 2026 11:48:45 +0100
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
Subject: Re: [PATCH v2 0/3] Remove obsolete __MODULE_STRING()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rudolf Marek <r.marek@assembler.cz>, Andi Shyti <andi.shyti@kernel.org>,
 Chris Snook <chris.snook@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Duncan Sands <duncan.sands@free.fr>,
 Chas Williams <3chas3@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
 <2e88806e-57dd-47e0-a9ef-a8507d22aa3e@suse.com>
 <a190f981-d668-4208-8148-f4e50adb31a6@suse.com>
 <6c00fc009f4e61e87895eb2dd3d77c5dfb28183d@intel.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <6c00fc009f4e61e87895eb2dd3d77c5dfb28183d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 7:07 PM, Jani Nikula wrote:
> On Mon, 09 Nov 2026, Petr Pavlu <petr.pavlu@suse.com> wrote:
>> On 10/14/26 11:36 AM, Petr Pavlu wrote:
>>> On 10/2/26 10:31 AM, Petr Pavlu wrote:
>>>> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
>>>> MODULE_PARM support for older modules" [1] in 2002-12. That change also
>>>> moved it to the graveyard section at the end of linux/module.h
>>>>
>>>> Replace the remaining uses of __MODULE_STRING() with __stringify() and
>>>> remove the macro.
>>>>
>>>> Apologies for the wide distribution. Acked-bys are appreciated.
>>>>
>>>> [1] https://git.kernel.org/tglx/history/c/136839a1b4
>>>
>>> I've queued the second patch ("drivers: Replace __MODULE_STRING() with
>>> __stringify()") on modules-next for v7.4-rc1. Thanks for the Acked-byes
>>> and reviews.
>>>
>>> The first patch ("hwmon: Replace __MODULE_STRING() with __stringify()")
>>> should go through the hwmon tree. Once these changes are in mainline,
>>> I plan to pick up the final patch ("module: Remove obsolete
>>> __MODULE_STRING()").
>>
>> v7.4-rc1 no longer contains any __MODULE_STRING() calls, so I've queued
>> the final removal in patch 3 on modules-next for 7.5-rc1.
> 
> Perhaps send it for v7.4-rc3 to prevent *new* __MODULE_STRING() users
> from cropping up between now and v7.5-rc1?
If I need to send an earlier pull request for the module loader, I'll
include this patch as well.

-- Petr
