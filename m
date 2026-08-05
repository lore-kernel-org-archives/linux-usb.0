Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F38A1A76BB
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909276; cv=none; b=CYnOfQJ5idpr5eMnh3HW7JIJyXSBspsv6lywBO1Cm2wfBzpNtr4MyvCQAaJdGGTYRnJZFSpGHvzkO1gqhaXEkuj0rbQXaEfLeCUvie0Btpvr5pKpRni4fvTFY7MvXlBByJGCNrI1JiRQSLzC/Ftu0xZtvJRw1XIARZYONHiibiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909276; c=relaxed/simple;
	bh=rCiztpggKkMOEj/pw/1aXDH+Z6xaCEhGuXMS64bB1XM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTSGWpUbtGBqNqvSDwLvgp2dJQBYbE0sGW+tiXBw+SHqnWQIDKjtp1HBBH/RYHMd4u/pPRl5MyXn35hXc5UtB+4srH2XOAj4x570kcjRjD4i8Ci2tQD/p+drcSa5yhVs3bhHIGB+xYjDsJFe2ZvfTPgo8bHzDjRMzQs/zXM2y+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvGIw/VD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvGIw/VD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49548e01d02so2858825e9.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 22:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785909274; x=1786514074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0y/0HAZbI8m7FAMg+ryFNwaZ1RSlH1nUepM7YFsT2Nw=;
        b=NvGIw/VDblGhYfefUDDCv8CV7OLelNnW+mlkToB4n/V2wnsDb64ZWy1XhzMu9vdje9
         neIusjKbVEjsPZvwNLDs0TVuaIys9oR64w7TYoq8tzRQi/8+Sx+uean535zcwm8mLN1M
         XY/RA9Qfuh5KKuSo+8EEKZyo+6uTkTXAVCMLQtKt4QMbEVwljNOF/3/On7/yT9QwsdkC
         SNYpNgDk/Xwgji8uuT+ELMhAUGTBy8UDqeXM8e18ecd83f4KbOrLXkIeXCRqLSphahfh
         1QHLt03uwRzjb5uHQDlYBOupZASFP/Bt/ZoxHrE7QT4+vuwZZl7ZRUxj1qTJsvrsuCAq
         oqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909274; x=1786514074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0y/0HAZbI8m7FAMg+ryFNwaZ1RSlH1nUepM7YFsT2Nw=;
        b=b7Qzy+FucVUQoLET5Eu01T8Hl2aLXkrWpweoJT4YYcPh6cmYlPMMqgUUBaAQabP2Wn
         iGuIyqVZ932wkZHTzjLDpEQ8GqnLWCTQ05H6SfOGb4A/pUfiYT2VonhKafPL8AfdIWsi
         nKk7M7x8vMsjQFZuzRP0biCVDeYtslODnlD+DAtvCwpMPSSrLk/JW3OhAla06TjdpvIm
         lQ3pLvd0QlcSLxOhlCULooi7HPBReQfBA9jS9TMtgdTltvwrb6awtktEkOaeetQrDu5f
         AVSWiFCqTL++iAQr9grimz9hBF4d34VxauzA+zj0OhHTZQnzrZd/+cjjiZeCCe3ASF7i
         veJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Q48Q47UH7vdiJUap9MmLKIufkLE7frz3J/26ijP9qhMJXed6d3OiZoJH0v9rIy1zfZNByIlr8uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm4Go2O7VpChFe62i4C5f6Dksxp2IG8ZSYJc0sf9Cp+LOx8FhI
	SYnFSUyUono/M43FY7u3JYI7lv+7X8TpMTejWQehAcARIDbeGotXkOCx
X-Gm-Gg: AR+sD13gi9vLuxBaVU01yoZR7zqAox5fm9zuhyBFIK/6lFwSa9mURz88UN3B/GAgOc8
	jfa33a8SakyxNRGgyeswjxhABfAwboz3kZ4WLI/qoC7jTKhsV7Ka3XQ2d4+ZqAHEBP4yl6uRWFH
	0eBD5iHXc7Y4pKGK8XGwmqUrkJv0cFR+5akeMLhPcnGTz6yBrYMvOytnA+DphsZhmCgSlgMd8wd
	qfUdSmVxRNX8ql9UF6gp1imKcBKpnJcH93+oTp/werZwUb+db1Nz6RgawAGZK95pw0DgXIKyz+m
	HDi9O90wXKSa+ziskQodfojP2bQauKqGtsODJse8E0B0wQVG2SHH7koZ43YraURhvUnbWbbDBR7
	ZzIOL+bKwpTYMi46ky2SgYu/zT4nOvs/IX6n/XTY7cXjxhVIZn3pcUdYwRuu6Z9U/Vp7WTC1fDG
	qIL9GmFyoyUytLUihlc/vsL15TpwTxvsepGYDj44icK8Tsv5n29xpERb8oWrfapOp3/mQgIzJ2
X-Received: by 2002:a05:600c:12c8:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-4994e7baae6mr26896455e9.10.1785909273638;
        Tue, 04 Aug 2026 22:54:33 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0fc94esm161020365e9.12.2026.08.04.22.54.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 22:54:33 -0700 (PDT)
Date: Wed, 5 Aug 2026 07:54:29 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Charles Daoust <charles.daoust@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] usb: core: add USB_QUIRK_CONFIG_DESC_READ_255 for Razer
 BlackShark V3 Pro
Message-ID: <20260805075429.08416607.michal.pecio@gmail.com>
In-Reply-To: <20260720150207.1963786-1-charles.daoust@gmail.com>
References: <20260720150207.1963786-1-charles.daoust@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jul 2026 11:01:26 -0400, Charles Daoust wrote:
> From: Charles D'Aoust <charles.daoust@gmail.com>
> 
> The Razer BlackShark V3 Pro wireless headset dongle (1532:0577)
> fingerprints its host during the first enumeration after power-on: if
> the first GET_DESCRIPTOR(CONFIGURATION) request asks for 255 bytes, as
> Windows does, the dongle enables its vendor HID command channel; if it
> sees the 9-byte header-only read that Linux issues, it disables that
> channel for the rest of the power session.  Audio still works in that
> state, but battery reporting and all vendor commands are silently
> ignored, and nothing short of removing power recovers the device:
> resets, re-enumerations and byte-exact replays of complete Windows
> control sessions were all verified not to help.
> 
> Both read lengths are spec-compliant (the device truncates the reply
> to wLength); the firmware was evidently only validated against the
> larger request.

Hmm, so is it fingerprinting of the host or sloppy QA? ;)
Out of curiosity, was this patch AI-generated?

>  The kernel already accommodates this class of
> firmware assumption during enumeration: hub_port_init() reads the
> device descriptor with a 64-byte request because that is what Windows
> does and what many devices expect.
> 
> Add USB_QUIRK_CONFIG_DESC_READ_255, which makes usb_get_configuration()
> request 255 bytes for the initial configuration descriptor read rather
> than USB_DT_CONFIG_SIZE, apply it to 1532:0577, and expose it as
> runtime quirk letter 'r'.  Devices without the quirk are unaffected.
> 
> The trigger was isolated by single-variable bisection on otherwise
> unmodified kernels: with only the widened initial read, the dongle's
> vendor channel comes up enabled on a cold plug with no interface
> drivers bound (bare enumeration only); without it, it never does.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Charles D'Aoust <charles.daoust@gmail.com>

But anyway, FYI an equivalent quirk is now sitting in Greg KH's queue
of fixes for (presumably) the 7.2 release.

I suspect that Greg would accept one more patch to enable the quirk
by default on your device ID.

Regards,
Michal
