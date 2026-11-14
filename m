Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662681;
	b=OaQ4wRqKF97zfVK7NI87jyPx6iRiGgJ63/oL3qWf7c7SjPQCvKMdSEbB0zg1N9XiQbqa
	 OMKAzz3HjfAH0GlZP/vg60l7qUxWdM5dHe8K0gscXyFSea2MRpk6jAYOxuQVztKvtcs6V
	 EPW9f/HhUw51rLO79a9TQFUVgqGj8rB//9g9OB+u2apEoa7d/OTirP1OHEf0PSC9dMwns
	 Ah3Mz7fKBVG5yhGWeHd0i7wdiRrN/gGFHL9njnT7vkCkzoZa6okMAL6pib0QvqWlEw9JZ
	 UKjjfgBOqxFaJrDvOV8HvXUNcbXtWKMHnLJc9jZxHLwz3xi1zFG/TRcDt9dCXmahqYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WLe7v6XZja1RIFGbZJNa5YyEJADDimNLeCELW2k4fmw=;
	b=xiM/wcqwIn05y+vmfF2WVk+DfHaWnzV0JgBOcQLP4GxCCgzW0tCqF7MNjAUvOGJpnfjD
	 06KV1YHIz34hJRtRVTeEWfvkspXGmokFpCkOgIR+h0HUvaohvbLvWCpA4JDlIBc43NNlw
	 YOqrM1+iGKC2j2o9UA5BvogmHCfAJlrPjgji2Lrj85sR1/xohCcJ/h9L2Frs7/oTGXPwg
	 gvN7vSKo5SSM29dN0LXeBq8ONqzj5u5DOGQJ74pK+Tep0YDX0KyogIXBv3e+yjVM+Vpp8
	 fT5JLxYiOnbVqQRFQVBGAAhaA30PI9V652SxyrC4kfhuYzVMO6SwJEo5PNsH1Knnsrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jphein.com;
	spf=pass smtp.mailfrom=jphein.com;
	dkim=pass header.d=jphein.com header.i=@jphein.com header.a=rsa-sha256 header.s=google header.b=v4RiwmpG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24B606A33B
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 13:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F24B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.a=rsa-sha256 header.s=google header.b=v4RiwmpG
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so1965166d50.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662680; cv=none;
        d=google.com; s=arc-20260327;
        b=ZojIoNGi52wbhuQa99c01nNlQdIshxo5HW7pkPEtByfOhcYRU9cA3stDlQo8anVdTy
         NEFiWCHRol61u6dlHTbPEz+hVdhZKTp/4JQwNmzPmDZGa6q/5UBZpkHDbUTcPSgmbjKP
         hybHHV/zgysfYUJNgdQV+gjJmMatJYylBZp+d4btmP9988I/uROJgVNeqJiJJR7xg5JW
         rgjbnaxJ5Wzi96sQ2AkjjL28couv6sHRbl5MJ3ngn7TIWQvV8mYco+gq2mYFgTVwYmDv
         kLfVdhJ3lj0ftlfT5N0GU/LEXwtFsFgfncfaOIRp6dPZTXA5NQ6U1k9ZKdro0OW+Lcqm
         lwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WLe7v6XZja1RIFGbZJNa5YyEJADDimNLeCELW2k4fmw=;
        fh=b479b1Glb7i3UuiFe1hsAEBgZHKU4eCfgf+6p5rKyu0=;
        b=QfkBFPa/kUQZ7v/coyE+C7uuPIIifaye7PJ0IwutfsgTz+pBIp/iQZEYrFNJCYlAvT
         eLJO7qx63ZLGnkL4KUAWwyVQu40b3AZ1pTwFa6FqzFa6tPDg/CWt8ClSU8Vd7dWwhsIP
         WrjkczSOdjlufKQRtc+O1Mz7sOHCUht8Y8bi0LaMbtrblpnpbVYqtsTah7esBB8yinvF
         LBsH1ym9ApKmzuaB5Kxb7Vg3NfibSmGz5WQdRHdOGfGoXUjP5oi4xjLeAQSPuKIN6zos
         7bDYwaSUWSJLncmFDcx41pDMe3oeyxy/lNinSpNyfqeNrY0HYuLYGd9ES4xETKrPpXJ5
         7eRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1794662680; x=1795267480; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLe7v6XZja1RIFGbZJNa5YyEJADDimNLeCELW2k4fmw=;
        b=v4RiwmpGAgGaxDeI+koomOaV2NvKwnf+jQZeO0AM7sHZTKmOrhpP5koLY0KRR3zOX2
         ZxuKvT5+yukW5vAQxAdJpOJf7PTHSWYrdjNn/gRABKy5z9QLXae2TESMOxMM/b4P7pTa
         pHCu4Vx80w3ddVg3Ez6CdCgYuRBsQ1ABXMv6C+GtiwuXGcArbiDki68gkW3ZocMSJVpT
         DJ1lRTs7DJgM133zkRqLwfiH2EmEi6S29wdUlRM91NAbH5KFo0x6xJIqg8K+kqsvUsJ1
         QT3TfHeQagyheOSvN+YU0NKFHqPSW+YRLiXLnd49c2niOE7lixmxI9pUNLbv7zljKFaT
         geqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662680; x=1795267480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WLe7v6XZja1RIFGbZJNa5YyEJADDimNLeCELW2k4fmw=;
        b=xGcUS9V7IhwDYhFS52ZmqChqvdDl7nKwPHbj1kw+j/CP5chVIINIpLHvsF2eQGu8DE
         Cyg63mqdWqylzR1YS4FXPPjyHjvkCJX9w4CxMUVbQxf8IVxwFS3wZeWKGtg8jvMhpEsN
         JiqFvG3WyxISifTMcdAZC5UwRBUdODMmjajzRhxn123HCEXyu1hvZ3GwERL68cQ48THc
         omcHLgRJdJjp9gAbc8WnVGGthGg4us3rCScdyslkW2v3WrlISe35uCADGMdCXo050BjL
         gD+XvlMc/vx4FRk9BWFVTOuWbfOkkdjgIiYeD/Xrks0+NrrfKqvBDh/tED8yYz/nwsX3
         HGcw==
X-Forwarded-Encrypted: i=1; AL+hErENUlNPDIFD3lr/tUDKNNA1NHopwe+mxWFuLZkgUtOb7GS+pZ7u7VeTxSRpXH1qYGgkRoqGrlBw0dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O7pibY/5hfUcycfxBfNWwA+cigOnhooAUSkHqsuXobPuzzgfJ
	HW2b9Yvlr2lU0lwCiWneRYVOWjocDfu0c9T/g7Txi2wqqU3P4ASOHa27O91kQrKCumMZrIjQ6oo
	CVTCG9//L/QrREyG66B6ZGfF/ElSaPSYHMGKcAu8dOBq6Vz6YK+RDJY3O
X-Gm-Gg: AYBFou2PzGiXdYpcVZ7huXmh4yxXUQbZhAc12NCSN+R6HtD323h/MSfkASQSNK7i2tQ
	Il2FR5BPHlAUO5WXpWncFNCBSeMMYtvLTwtguH/Yx/HgiY9tCvOg3XROJ2EAVlw/tkKR7fShDcs
	d/PYRvjLZEks66nLTndllZvkUvgiBb6EHgGdJCn2b6nzQ0mzAU/hIrmjViRrXXZeP82lBXhsyGr
	FfbaPM+eVI1NjKj5QwVCAxNkVb9IOf+4jzfRl2sXHviTD1wIw5sreSM3OcJdPhxNPNImu7U7rUJ
	66z0NtWlgMSlo7rYu9CV0Wak6eC725G1Woa7iZYqwSzS+fCDJCeL9K0ym1c3gx7HXX+aGhrRQw5
	kIDjkQEWvFJGapZAKRgS4v5LJvQHC6MWZsNBFCrOmrOq/6oDdPlQE0GKW7XLZicfD92Q3ZMqr/I
	0rSNJjXFh3DjAeI2bKOk0l0q7SaXDheRC2/M3tUpWmbQtKuVRHkN6upQf1Vu/9rHsom7JFySi0a
	SFqb1cJirT6cIIvLZ+O/0NhikNmmxlsla16z1fXp/ZJUGzy5zumosbIsA==
X-Received: by 2002:a05:690e:21c3:b0:67b:e603:55d with SMTP id
 956f58d0204a3-67d89776a8cmr2571802d50.105.1794662680101; Sat, 14 Nov 2026
 05:24:40 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260427083553.36ff4731.michal.pecio@gmail.com>
 <20260826134501.1726230-1-jp@jphein.com>
In-Reply-To: <20260826134501.1726230-1-jp@jphein.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Sat, 14 Nov 2026 05:24:29 -0800
X-Gm-Features: AclHuK86g1Y20tWGjPrsr-EGZ1lGzYtRDw7NYfMWWwCGCBO9N72I6wF1yiK0mF0
Message-ID: <CAD5VvzC3ySh=fgdPsuftQt_C3kf8Ww5TYGbWTmx5E4S3FmaSbg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michal, all,

A retraction of one claim in my 08-26 mail, a status, and a proposal for
the series, so the thread does not carry a wrong report.

--- 1. Retracting "NO_LPM quirk not applied on 7.x" -- it was my own
parameter ---

There is no usb-core regression. I had booted with usbcore.quirks=1532:0e05:k
since 6.17, when the entry was not in-tree. usb_detect_quirks() XORs the
dynamic list against the static table, and kernel-parameters.txt says so
("each letter will change the built-in quirk; setting it if it is clear and
clearing it if it is set"). On 7.0, where patch 1 is built in, the same
parameter clears it: 0x400 ^ 0x400 = 0, and the device shows quirks = 0x10
(the RESET bit my udev rule sets) with U1 enabled -- exactly what I
reported as a regression. A second Kiyo Pro on a second machine (7.0.0-38,
no parameter) reads quirks = 0x400 and has no usb3_hardware_lpm_* attributes
at all. Dropping the parameter fixes it. Sorry for the noise; there will be
no bisect and no separate linux-usb report.

Small correction to the same paragraph: I wrote "no 0x100". USB_QUIRK_NO_LPM
is BIT(10) = 0x400; 0x100 is DEVICE_QUALIFIER. The conclusion stood, the bit
was wrong.

Consequence for my data: from the 26.04 upgrade (Aug) until now, every 7.x
data point I sent had U1 active at the usb-core level, with the driver-level
usb_disable_lpm() stopgap covering from probe onward from 08-25.

--- 2. Status since 08-26 ---

- With LPM off at the driver level (08-25 on) and, since 10-31, refused at
  the hub-port level too (usb3_lpm_permit = 0 on every port), the host still
  died: five HC deaths on 2026-09-24 alone, same two-phase signature
  (SET_INTERFACE hang -> COMMIT hang -> evaluate-context timeout -> command
  ring abort fails -> HC died). So LPM changes the frequency, not the
  mechanism; the lock is in the device's reconfiguration path.
- What has kept calls working in practice is never stopping the stream: an
  always-on OBS instance holds the camera open and applications read a
  v4l2loopback virtual camera, so stream stop/reconfigure never reaches the
  firmware. One stall under that setup was absorbed by a hub VBUS cycle with
  no visible interruption.
- The two cameras now sit on two hosts (Intel Cannon Lake 00:14.0 on the
  desktop; a Titan Ridge Thunderbolt xHCI on a laptop) with the same stack
  on both, so a remaining desktop-only failure isolates the host.

--- 3. The series ---

Given the above I do not think CTRL_THROTTLE (v8 2/3) is the right layer and
I would rather withdraw it than leave it pending: the failure is
sequence-dependent, not rate-dependent, and a control-path throttle cannot
address a hung COMMIT. Unless you or Laurent see value in the device-table
entry on its own (DISABLE_AUTOSUSPEND | NO_RESET_RESUME), please consider
v8 2/3 withdrawn.

Still open from my side: the A/B on your xhci-test patch. Is there a 7.x
rebase, or should I run the 6.17 pair with the version skew? Either way I
can now run it on two controllers.

Captures, tooling and the self-check that would have caught the parameter:
https://github.com/jphein/kiyo-xhci-fix

JP
