Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB6C445ACE
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970583; cv=none; b=kzq3SIpKkzCVc0gYclRt4t5PryM18J0v4QT+PJXf1qlhasIWNNOGQKh87A6Ge1THP/PAKp8o/FQRSCGgbCi8SjNSTkb1Ca56APCOZ4ZUDi+JYUTM5fPE5+Aswd0twfo8PNq2tW3J4wyD8yKVhvd1D0hmpERzB2XYl1BJwA8CWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970583; c=relaxed/simple;
	bh=Z5ysX779+2BJivXevzHH1XvznaoW04mloJ1QhySlIwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfhXeWHCVGubfyJ6Gy5xsXKIEe5bGJCBvjHPD/n4S88/Fzah9hpjQYw4h46dhb+aVd44SV7N5AMVchPAqvAXKKe20dRB0rLnKUkEyGxskq8ySqAQjWaoA8mqMntPaJdxgABGYfdwo2Z1cpMnIgjXPDU0w/cqGDGzer+UvL0d0es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D4h9k2KY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D4h9k2KY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso3880497f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 02:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791970580; x=1792575380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nFXolfpittgi2Lah9fQ/bqQ/j+/1tOBiVSyiO7ElMg=;
        b=D4h9k2KYW0maCX6tsmsmAbBTbeDdlb5KVqZYxV9wP/e97DT6QK8TQKq4I42wueMV0a
         zE2RtdDtU8d5LBptU2aMNoFDSszAJdZP1rravwftWPtTz7oH0RmXjV1nqk91mu9TQkAX
         ufJfj8m19qntw2Uu955lFAoHWNN1BGx8VOiRbyd6rOWAuibyEHYTpQULp7Zq0IxGfTRD
         MctpWNhBsxU45VyxsNAquLRCunBRdU4E/MnypoU/eseCMjj1ajJ2dmDecnvL2R0x0VtR
         mVdVJM1Pm0mA+T+WIQk3HglCHAZE2vUw7QZhJE/CeYtTti7pqi6FPX2xqTjb//pYNPn5
         E4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970580; x=1792575380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nFXolfpittgi2Lah9fQ/bqQ/j+/1tOBiVSyiO7ElMg=;
        b=Nnr8hINUaTdly/CG125kL7adDL+GgqhDJgs0Y3UGWmMWb0ZDkN592su0FCA0ejHq4E
         W6D81pWdNVe7ewIZM8TMaw7yyk3Yr6LwYtYZg8sTPoSjx11CsCwrVGoGfxunpNGoDNez
         jqA7IGOjPplQ9IL5QTasIExjKsJnZ9gg2BzUOSDJG7mEVPru8nr+Ff4smgHBjJ6PviQX
         VLrDowFkPMPJEWfikE0XPfQ4Z7qun1MtxRvjbc6T4wS1IMBaNRl3/0qLb7QvtR4Jofkt
         AfKBxMIhsu7j09wjF8zi38RtOwvqtYf3Y9hpy1b1jlQKyatqlNL9rpLROR5dpG6lyZPg
         WPyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBGJ8WY+AJzg0FuH0236NeZjXTqDtZwToUIwzWunQfY5JAXG1aOMSN7Gh96wCVxqiValN8KBr3crY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqQO4PFMTNnh3Mnfl1CterlbQ0zSoqqLGa1pB+AK2O6vnoOBEy
	jOkTHCBL0+wCz4fb9GoCZM8ivv6HJvBCLXiMtcRvfbQDUebsEaGY/elPfxuLZDBADJk=
X-Gm-Gg: AYBFou3zW+RQLNsGIRZYRALLRhMG4nVrCDJpNpIMA95UVDLegx3zluRsxtlx6DoZndG
	rBEbGEtRtFukmdblUX0OkAfvKainA4H+E3UqW3UpMsO3ShTY47gY8k9p9GVzuFUUb2voMYIeDqu
	pcpn52Ya1wWAxsKm5DnORGZlbPo+7zra7Kh8bQjhX69vX+ieGRFnAPrLV8ThXgrQJ6cYgqfX6cr
	qStzEmerSd6kpQkDZis74ieK7HfHnD/2Uhi+Qm7fuiQgW3+7hacPn+xtMMcFoPzenbQaysFLLTA
	HBbDHMyFWVPcCLVtVxrdcpaRlGUxazXc+tJmmXzTzXfiaCEK5HKmL2J4Ti9wbxFWVxwI4dZcssg
	ubGsYYkqDPpd/jh08rEkwD/aYqpagbJ76Fhyt2C8e19ulzFaw+bJa3MPsJKq6afjb6t7wZQt3WF
	Umg7xuov8MW2/q239ccMQq1lmts94nxrKfQNgVdZLJ9oyyiRyYPP7s7kft23rdIWKHMP7ANWUX1
	uByqs04W4qgi9hjIkD19h27K2OA6xwrg37bhaHJJN5BpdRNnBKpH/BmBIxCgrvo4n0B5xLbibZe
	ZH/bFrNMSS8qJ+OudmzdWMSq7KBO7nKKPYkzIaj9
X-Received: by 2002:a05:600c:8a09:20b0:4a1:9c98:b9b8 with SMTP id 5b1f17b1804b1-4a19c98c153mr160846965e9.11.1791970579795;
        Wed, 14 Oct 2026 02:36:19 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa3fsm10907378f8f.10.2026.10.14.02.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:36:19 -0700 (PDT)
Message-ID: <2e88806e-57dd-47e0-a9ef-a8507d22aa3e@suse.com>
Date: Wed, 14 Oct 2026 11:36:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Remove obsolete __MODULE_STRING()
To: Petr Pavlu <petr.pavlu@suse.com>
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
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/26 10:31 AM, Petr Pavlu wrote:
> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
> MODULE_PARM support for older modules" [1] in 2002-12. That change also
> moved it to the graveyard section at the end of linux/module.h
> 
> Replace the remaining uses of __MODULE_STRING() with __stringify() and
> remove the macro.
> 
> Apologies for the wide distribution. Acked-bys are appreciated.
> 
> [1] https://git.kernel.org/tglx/history/c/136839a1b4

I've queued the second patch ("drivers: Replace __MODULE_STRING() with
__stringify()") on modules-next for v7.4-rc1. Thanks for the Acked-byes
and reviews.

The first patch ("hwmon: Replace __MODULE_STRING() with __stringify()")
should go through the hwmon tree. Once these changes are in mainline,
I plan to pick up the final patch ("module: Remove obsolete
__MODULE_STRING()").

-- Petr
