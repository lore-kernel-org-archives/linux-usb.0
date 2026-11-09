Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239513;
	b=VP/DDpqioFXzwRl2hicPgg9itaSIHxm7Cfiry8K/6GR88+aCnbNxRL21zlMRgrsZmjSg
	 bX9PMs90aRF/7o1piA4VI0hIBfB9diLfHUcJVscnz3swk8eFjrz4gDSG8ve01UF5jfbx8
	 EUSj32RS6aEmUrwpQqNdQircHv5jHscj3nCAbCZRGX/8nlWTwH7q/+IeGF9TLk/td47tB
	 qApgTqV2NGRLn9hET7JNloYV3NFGgu14qnW0I9TuJgFLF++Zbog/NtsGePpR56CqMzLGB
	 VoAkeVZUXHQ3c97jI3O8xcOjLYzsl4KbQha2NJX0hQC2MY+++jHgGEmg5hIGVYOp/Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Cc:References:
	 Content-Language:To:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
	b=XQnkq4CiOw+tSXUpYPAOZfTVbCbf9BJSXebbi/9nd/P4zxMm6keAZtNgtLiNXssllAYV
	 JxXUst9IMT4q+f4XZFHn4JOjDKgMcUjBccnOPxuZPO9zOaCzmmBfpatURlEp2QjBO1MW2
	 lvEvyD+Dcoi2KmkxWUaZsbiHzhbT4VlWroZG9Awdh3EAG9lX79uw3JVTxBkY98PGml+49
	 AJ3Dl8Plvvb2XD0tfQVQ32oW0IYl47EteUF6unsYxSa/A4XB/5wSUrhLq/ZhtW3Kqrhi2
	 zxxfzDPSivyTz3zsjE3qQ65SwvW8NcSP/ImwWU70ZPonRLCS2Wj2Uf7trsLY380qN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I6Gf+TJ+;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF265606A333
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 15:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF265606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I6Gf+TJ+
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so674584f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 07:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794239511; x=1794844311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:to
         :content-language:references:cc:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
        b=I6Gf+TJ+xx28C6M6wGa7IriJIxP64CATq5xKa5KY4/dVEF70L68u8oNbC3qDhkhEI7
         7ia14iP5TbkPq0pUWtgTMNnR57unFzAtVelBZ6VlJdQ4CrgVYgxw4RobiXpnUn7hkB+D
         nzTyACD0+MFjBaqWPAWXlFUgKFrj/LJmZ6fQQvFA0wYX9Z+YdDx7xP/wSzXM8J7jhI3Y
         cnv1opUi8bNDC5CGiUC5RyhE5sufSwg94ps4g0+w/MIT3GHEM+nHtCTD6yBD+zcjVMzC
         KM6SnUFC/LBhWAJoh5/3RAr1pEMN+dTTDdPPEWzL92kIaF0QNP3pX9QYFDhi6xIlcLq5
         xWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239511; x=1794844311;
        h=content-transfer-encoding:content-type:in-reply-to:from:to
         :content-language:references:cc:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
        b=hwn34GRnkN/iI72a4mKWM+IaZCYIRQCSpsqV2j5MqfYrHJLYjqrAlCj33+kb7aSdSZ
         X1q3H4cyGUHw8EtDR4LN9oiEmjljbJ0XFKzU0QI1NVc34qxSFlk2QIPZx01gLJjdduIf
         TPNW2i9fEVuWa6pMKxKDMiIpu/fMIqGYnID0fWCCfBVzynZHs7O8gSORW3DXTAbp0P/a
         X7b/nL9exCwm1sIF4LzwL5y48N8yCc5cbvwxNHEfTpnrTkOvMQP1uTxzx2GrCxvZ+HA7
         fDT/3VMg7b6aAdn5KLkwH5K9j2nUaCgYBdK6NRTyrdTiKk8qWa9pRgzd8Ma+twqfHJep
         5q9A==
X-Forwarded-Encrypted: i=1; AL+hErEDFQPFFSQ4WVjTNvlKZM2ULPkkBLrh82lhWBa4te0GCC40NPUWtIOBLZ7VfkL+Xnekro46CUT1Huk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/89kaCq2+Od4BmxZgDfvFA16SalL2XqaKwSifPD+NCJqwnpCFf
	XOzlzMI/dpULrxtEbQk4cimZCbrdCXyhH1MPDrXMh4+eUsWxhAuadjaXQOmslGiapb0=
X-Gm-Gg: AYBFou0XHoDO6lJ1ADV2XGBCQRO9HtVdv8BMWKf/s1xGxaKyGsi2HmZ36QrdxfbWG7S
	dnKip5B7iXYVIhATsQ4ET+Kf07pYNNv7lD3KtJLCEu+zQtN9zenRpagU4uSO8ijaU0+ZFuF7FFt
	ujingvlky9DWRKGW7yU8lX8e5vjYYyXI0dKepqq0k1ZoRzWytGqZAXPlcw2Yz9mQK151iGtNpq4
	H8gByNi8DREO+NddMtWf6DMiDsbKne0Z0sgIYS5Cc6ZKgE+zW/r6FvCcVDsCKP/BmHDYZ4axy2+
	5HTUlenBWI39/5/wQUrhUZRMNDTY9+ldgIFasn9phln4mpA5KtmI9VddfAOnY5Epyedp1t/XtRh
	kiGNjLMIRkDesdpIs6NbWeo0EpE0yz+zcJ/hXBKAT/v4Eoq3jI9u+3942jsAF4XJpABe0XhkF9T
	bn5PoxgYSDTzpp3QK5kYK39j8xTsdsK8Xfnr38cfwJpyDd8XsTzkWlW89w//UoyZ6MqKgDEmU9m
	/LHM3uJxHxhVRliIaxcPV2A9QWq+6BVdO80ILPDjkGE/5QAGPq1CyS22fwDfvzo5X8JOgYluXCU
	06LpIjNEjHr0Dbk03fvkL5HNJlII9EmZ2UajyvKT7upJRoSfLVM4kzJ+iZFX1vsy
X-Received: by 2002:a05:6000:25f5:b0:492:e1a6:90eb with SMTP id ffacd0b85a97d-49582e8e516mr8245452f8f.10.1794239511204;
        Mon, 09 Nov 2026 07:51:51 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186eb9sm10435718f8f.35.2026.11.09.07.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:51:50 -0800 (PST)
Message-ID: <a190f981-d668-4208-8148-f4e50adb31a6@suse.com>
Date: Mon, 9 Nov 2026 16:51:48 +0100
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
Content-Language: en-US
To: Petr Pavlu <petr.pavlu@suse.com>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <2e88806e-57dd-47e0-a9ef-a8507d22aa3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 11:36 AM, Petr Pavlu wrote:
> On 10/2/26 10:31 AM, Petr Pavlu wrote:
>> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
>> MODULE_PARM support for older modules" [1] in 2002-12. That change also
>> moved it to the graveyard section at the end of linux/module.h
>>
>> Replace the remaining uses of __MODULE_STRING() with __stringify() and
>> remove the macro.
>>
>> Apologies for the wide distribution. Acked-bys are appreciated.
>>
>> [1] https://git.kernel.org/tglx/history/c/136839a1b4
> 
> I've queued the second patch ("drivers: Replace __MODULE_STRING() with
> __stringify()") on modules-next for v7.4-rc1. Thanks for the Acked-byes
> and reviews.
> 
> The first patch ("hwmon: Replace __MODULE_STRING() with __stringify()")
> should go through the hwmon tree. Once these changes are in mainline,
> I plan to pick up the final patch ("module: Remove obsolete
> __MODULE_STRING()").

v7.4-rc1 no longer contains any __MODULE_STRING() calls, so I've queued
the final removal in patch 3 on modules-next for 7.5-rc1.

-- Petr
