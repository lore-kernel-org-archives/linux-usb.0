Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793865994;
	b=xxJBjJMsquLqu2z4I+Yjv6s4uQIp/MT7fRuOXDiBtfp10fE7QMnDnxhOA/7WrkwOMoeC
	 8q7w+ALpfnkfFQanMdp/p1pXEHUgqFqzErwh1ZC6BWK+c4CLeDhGjIT6sLDL692JmvhaH
	 tjOSefC0ToskaFJWg/ZFjnSWu2m+JDMfDOS927jIunsSKlDdc9Au6jZBC8AUQQJxKq6hb
	 oygBykClKa3YFPsjKwCcVHzrA7hkDxWmx+vWdVXTmde0EnWIBoAgr+hVEpjp1Q8sYq9cj
	 5ymcxQevMKzzvQ8v8Kf4NpFOS9X7QWNdAqWaR8kS81IJ78pwA6z9LEQTLlkgkFy5aow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5/St+sw6x3aC+lH60Wo2obbqzz/BFNLno+EhAZDHgi4=;
	b=5ThSElHfRXljcSqckLkb0abVz0o4Z5QUPhbEdFaM12MZHL2Z0P2f1hgZAh/bYkaVnHbu
	 C3jZ75JA1/qYEPxCm3cXEVlfXLBcDoH9da6tjsp5WgGaTcWaxmSngtoAgXWXa8XbAspc7
	 J9KbLg1Nsd7k5G6lS5ixnHa5jyEGGXkMMT/uS5jW+L+lBMSeKO/B3BpH3PG7CRua2Z2wP
	 hDOfByfOsG5afrN1nLn45mEQyGcUfm1uh4/HsJrAJwBAoffF2+mz8lVlINnV1GRlxx+Gf
	 oGPzoavqUQ9gtx8JmHXzdffwYQVjjTeIPkHdH9QJJl+M63+lU/KB41dukRW81eKQZeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c46WMjMX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C19606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C19606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c46WMjMX
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c19c6721a3so945445137.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 00:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793865992; cv=none;
        d=google.com; s=arc-20260327;
        b=ccnHiXj3p3lQ2dk73HcVDVKzJZ2BvU4nU6K4RUeSuCy+WXWj72AjYmx6IfgI/cRYqG
         h0ThK8EB47tMNzVLhjjESU5Ik1yRPU8KnR8m9J8PeDWo15JkM/gEx1L/yYW4ta5pFTGw
         bJsnwT9KE9XWHAoYwnNgjIf0zDLi45N2u/ylnycporguS52f49xqxAhxC4CXNDm88ziR
         BzDacdq+PrtPOkMlluDRIqP5bCs9RtANO7n+c7RYUfGJT/e0ReFaafHK7z9/JZ8y0zjf
         1aErAUXGyWAsww1df19xCo11puSOaWV+7g+wQXwB5eqLjHMpg7z/lE6wRX5Pi9valZ9u
         zNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5/St+sw6x3aC+lH60Wo2obbqzz/BFNLno+EhAZDHgi4=;
        fh=JzB6N3jwv3JV+dYWXlCWhrx4iUKWdUQQ9K7YfMXCf1g=;
        b=cXm3WKyUdHP+Yla4c/jHtCCDNwtUYGxZkJd1+T5xW/4lVXkCXzqLKcdp3+LOJYQRb8
         5aYx+pT995GoXI70lMsAotkhVG4jTyToa2WmklVtzT/PkmpLVi+mpidWpNjkq2bDr4Rx
         2vkEVvT4jzcmKAcaxvLFowCP7vgha2qmEuPE7jACQoRUmZnizZ4GIwrzIluPQ8A0XLK9
         DepAqFSDqaNmikvp/10ddH+h6rRmP9lyOqqnhZ0zHVnJcI3+cm8v4qO6O/08lP/D5cmP
         OQ6QKaJukN0ANVWhwjKg3h0iCbUL1mDeret5mChS3hhNkLx4NCcTXFcapka/oGgkYrTE
         /Faw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793865992; x=1794470792; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/St+sw6x3aC+lH60Wo2obbqzz/BFNLno+EhAZDHgi4=;
        b=c46WMjMXb6rtL2HrXD3/1ZrnixlforqU0S6QIuYlsLt52mA0mLvMquNIwnN1n62Bfs
         wp/8oclxRo7K0Y1Z9RbFcyGe9u9M25IeZBHRpg6ph9jz4iy27huXZ1LaPE9kmPlDp1tI
         1kSjVXSgVypRkrhLhr2vlYafivVr4K9B2CtioJsYkgsCyFtmzgRNiFu7yPN36ZkewshX
         T31rBhizVcNX0CrHaVBizCuUUJQu4WFSz1bmBYiiR/1sVBj7FOC1JWKChidKWAJ6D1B8
         YaLL5nJZiip+VkvvvaeAkzEn5Pyi+lcFNW6NBWGKVLtBslhRTEVN5SinVNx4Vk/DyN2M
         CnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865992; x=1794470792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5/St+sw6x3aC+lH60Wo2obbqzz/BFNLno+EhAZDHgi4=;
        b=ErLhKu2l2jaSKEZnoezUO2yafNq63Vkkp20ur8J0SV2CJu5vTFacnZehMoiG2F+fxE
         hsV2D7BRQzj7OHV2T0D/zhYsCS0KP0DqnwPpOyhqLJ1cLkOSdLCRj2cKJEfbPC5YMHzH
         /FwuCuoeQQ89i6urzqcxShPk8vkjUrQ/NM43qZ1efQTHI4DpOPfHbOe/CFAF02sVPqcu
         IuWT/XMevCPyIdWa5i3jjOp8mHlJEcOaXdC9sUskPH3AVMzInS0zhhMADO4vE6n89vOi
         6sqPbl/lVkjgZIzpCInPcdYqNXTYg2Oq3+pRZa+zZQg6MPorVhEK1RCC6pWPUakqvuEz
         gErw==
X-Gm-Message-State: APuU4Z8oDn3sQBTvgNkWBoAXD66WUOX9R2lzYxlZTFs3LMKz9eRF1Hki
	XXldkW9M8jcD8DK63lRkXiDK9nk3D3SQAeXiuzY1Cvy+xJEBVDetrJIXaMoqmd3r9RRG8kHkkV7
	6z47p3GlLwMpH7PiStDIimw0wmHLmHcPtz+XM
X-Gm-Gg: AYBFou1yKHi+wQtllMJ6g3Ny73P7WpzIABNGApY7xoeCNNnYTPO6rMXOY7SXZoUCngT
	7VdVvTBivAfkWvNkmNZsW9RLDjpa0RuFNLG0osUHJPnl1yAIpmqKASqEKua80ztpepO7vNXmm+T
	5rD+c07HjE5Nraz24feGjzXagL/fcTbNyi5W3zS+PQtKlbfYyXwkwC7Y74ji19uXTUSl1x8Jbp6
	TJd0nF47l5T3BoVvLhCT7MppURqC1JmxhiS5wQ+sP1SlKMoxve2D6/cLAuDEIR15iGRTsOsW9SG
	d74AzPDMw189zdBUgwbE3Lq028iVqniPEHbtpfLewgvzAQRTndvG+bQlKaKQQX9LIEOmCvmUhed
	hFkRzOk6hns+u+TcZeP6qslQcU2vK3TWr03LnhQHUdgm4u9B3iWw=
X-Received: by 2002:a05:6102:15a2:b0:7ce:62a0:6a14 with SMTP id
 ada2fe7eead31-7d07262d5d7mr8535231137.9.1793865992336; Thu, 05 Nov 2026
 00:06:32 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012092730.332531-1-dnlplm@gmail.com>
In-Reply-To: <20261012092730.332531-1-dnlplm@gmail.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Thu, 5 Nov 2026 09:06:20 +0100
X-Gm-Features: AclHuK8wpL1RIgmjEVkF4TSB4KBxLAPvlo3tTTMggrAnU62HsIbPt07XvsMf0lk
Message-ID: <CAGRyCJF8pQPsopxO5DNnTRpAW+6Pzqd67y5rh+kBOf0t++C3=Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] USB: cdc-acm: add control line state quirk for Telit
 QCX216 modems
To: Oliver Neukum <oneukum@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Il giorno lun 12 ott 2026 alle ore 11:47 Daniele Palmas
<dnlplm@gmail.com> ha scritto:
>
> Add control line state quirk for the diagnostic port of the compositions
> exposed by Telit QCX216-based modems, since the control line state
> requests prevent the modem from sending the diagnostic data.
>
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---

Is there something to be fixed in this patch? Do you want me to resend?

Thanks,
Daniele

>  drivers/usb/class/cdc-acm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 0d3f815b2f1e..c07b21872d19 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -2039,6 +2039,18 @@ static const struct usb_device_id acm_ids[] = {
>         { USB_DEVICE(0x1bc7, 0x0023), /* Telit 3G ACM + ECM composition */
>         .driver_info = SEND_ZERO_PACKET,
>         },
> +       { USB_DEVICE_INTERFACE_NUMBER(0x1bc7, 0x7020, 4), /* Telit LE910Q1 (RNDIS) diag port */
> +       .driver_info = QUIRK_CONTROL_LINE_STATE,
> +       },
> +       { USB_DEVICE_INTERFACE_NUMBER(0x1bc7, 0x7021, 4), /* Telit LE910Q1 (ECM) diag port */
> +       .driver_info = QUIRK_CONTROL_LINE_STATE,
> +       },
> +       { USB_DEVICE_INTERFACE_NUMBER(0x1bc7, 0x7028, 4), /* Telit LE310Q1 (RNDIS) diag port */
> +       .driver_info = QUIRK_CONTROL_LINE_STATE,
> +       },
> +       { USB_DEVICE_INTERFACE_NUMBER(0x1bc7, 0x7029, 4), /* Telit LE310Q1 (ECM) diag port */
> +       .driver_info = QUIRK_CONTROL_LINE_STATE,
> +       },
>
>         /* Exclude Goodix Fingerprint Reader */
>         { USB_DEVICE(0x27c6, 0x5395),
>
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> --
> 2.37.1
>
