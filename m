Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206574;
	b=mHyVOaz4fkvPigm/KyI5CovMNxvV+wO7uBlxoPWoFcuQXikDhZpAknX9qxwIDknLut+J
	 6RwxEBJ4wydgkWnCgxDzYtCBLs8wyZeIcWMvWUQZ+Dw72ZbqW5L7FoY60y8mLlrG3nZfv
	 wDs/mC8e8znfQYStak5VzhnCTTeeG6wNuOA6VcFUxNR8JrhbxaM1J8RTi68Zat3d2Trdp
	 o9rF+btCwSRGjo0RaVGo3CGTUg0vLBneEP1UYBC6kcJ4fmG8EbBcM8NzIAscaITacJJu2
	 bVFmkveQhNdNGz3d6RyH9k7HMToqdBy1fsLfG51Kuomm28Hfg4FwuWa6HYtmY0Eueiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3J3kQRZpSmS61yNYsN5gk3qtEKjCDl2Guu2Ky/qBDuI=;
	b=YrmvH6VgRkveiYMVvQzZu9hapEbahLkBZfp6Qkqj2uKTzQv8ekzVCqJ26uVbtYkjh4Lg
	 +2ntA+8U1IYJJkI15O8vljoxt7N/15/4EUAHBda3cdujMh1ujdOh+svSRVpcmz9JWpfhI
	 y6AS4HmQjNbOgjEXvolLL8P03hS2DOxHkdgM9AeLk6aCfqdzQ9OAuKXyqrl7gty/neFg2
	 TWp5q0b8fBlEdxH1gGq/utxph35HTAeVfbqr7wyBoFpASsAnl0Ta3b6KRHiYOfUWLVEGv
	 GzMu07RrbwEvelP+/YcPM+Z0Ec/ty11ZMZrFV8Dhw97h2RQwk0PGSGvdGT3IiHwf7Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Ku9FM6ms;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D1606A6D0
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 20:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C58D1606A6D0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Ku9FM6ms
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71ad1db7e31so1675026eaf.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795206573; x=1795811373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3J3kQRZpSmS61yNYsN5gk3qtEKjCDl2Guu2Ky/qBDuI=;
        b=Ku9FM6msq1CZNrKE2uPrz1hTIOgDaUGZSB+/8SPVHzL2w6N0rUIqpm16rChCvv0Tma
         U/Qrn4e1EFtJcJ4LXSlcuYlV3vRwCfGKkfFk+uaJ7ymkMblRq0Tv62XhcuWOTveySw6n
         WoFW3wZXRBZFmjeoUmvft68iobw6ray95cV7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206573; x=1795811373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J3kQRZpSmS61yNYsN5gk3qtEKjCDl2Guu2Ky/qBDuI=;
        b=UAXwLygAaNA5QDDYi90+ZbC/TLqjc+OoAyyeQ8H+m/TIEPd+tIslPV0RMwDg6FW0gv
         KhO/QoKfMe3IMzZTxe2Mk0P41kTzxa7AIvawoppW411DmNDWfudlunUQvNLk9FQy8Vx0
         dTP3bWjDoykEt/H04B0EnRGksd90JLw9ZPePPLJit3Pi1+oDX+fqP171LOV6aZuGXrxI
         slEPHVvpeSxI5op7yN+Wv1i/vZOkNlx02vPi8pYVBBDAOj4HUkP0pCHn0jDE8a8n2Yj/
         lTc+HbwY/5UsxAmxnK2453IFilJ2/GzlTcHKyXQd3nJfcEWqq58I3jGnllfwQsNHja3f
         FceA==
X-Gm-Message-State: APuU4Z/wqIZtuoq7SkcUlfhzcMVRmoxYQ2vD1m4LDS2K7878wJvxIlt5
	Fk8loFcqmBe4Rvh0deM38ch4kXOeOoIaXVKuiSa/0zd/dAOmLFBbD5pNEQZPQGcHGow=
X-Gm-Gg: AYBFou2v82qJ+L1jJlLePu1iz6U6FGmOL9JugKfO79lhJJNt1D9TfWmJW9v5A8BmaO9
	FP2t61RJzhsCDZgRv7oLKkl8G6xsU5FIjiLoGIyBZcA/vrDtBHd0G3iEsgdj4FdamChZIlNNwDM
	hkZhkXHiW38e31vpuZaBB0yGYaltStQ0y28Of6XcK3jdUMrsc1/2OnV1rrt/lqBNe37PXhIyXF+
	6EK/aXFNrEfYoLwF8wp4POJAtrHSXFD2cVcn72KbPs73p1qkG12t3z2yy4dbVvrxa9jMEYbXW00
	HZ2uTM+/BYUiFNjbNgjhOsN5OWh9p5K7xdiqKikSB96JTxYE/QgIvrryLvgzf5WXTUlrAeOeRYa
	ZB7/AZk8Bty7aIxGmKGRXo/GBrRk3cCNh4VHELP49Nc+OzaIWmCkGlSGsmU+3n8kSFExqkUu8VZ
	oBf15Pt5jDjTBGYB0TMPB0u/IlYznck7ntjS3KfKuJUvnhsncQ2JZQ8mO3Au78h49h0mRohBk0P
	ByLOgL02gCZvfRtvc7VGeYYcktChNyRkJBOKHktI7sIyFq+oi6AeiftTAH5L4rH1q5Wa4Q64y6s
	0NhRf4qzlbQFwS5sKko/K1quQy4aZ9KO90f5kEU=
X-Received: by 2002:a05:6820:1383:b0:6da:e0c:c3b8 with SMTP id 006d021491bc7-71b3277f93fmr4211378eaf.48.1795206572616;
        Fri, 20 Nov 2026 12:29:32 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d57csm3712963fac.1.2026.11.20.12.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:29:32 -0800 (PST)
Message-ID: <0f144e5d-db49-4251-a18d-3819fb30ebed@linuxfoundation.org>
Date: Fri, 20 Nov 2026 13:29:28 -0700
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
Subject: Re: [PATCH] usbip: Don't print port status error for full-speed
 devices
To: jjatczak@antmicro.com, Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Zee Yudenko
 <zyudenko@internships.antmicro.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20261119-usbip-fix-v1-1-e6c04690115d@antmicro.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261119-usbip-fix-v1-1-e6c04690115d@antmicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 07:18, Jakub Jatczak via B4 Relay wrote:
> From: Zee Yudenko <zyudenko@internships.antmicro.com>
> 
> When getting port status for USBIP, we only check for high- and low-speed
> settings, but not for the full-speed, which causes an 'vhci_device speed
> not set' error to be printed whenever a full-speed device is attached. A
> full-speed device is the default status, so we don't need to set any port
> status bits.

Does the full speed  device
The change you are making doesn't match the change log.
> 
> Signed-off-by: Zee Yudenko <zyudenko@internships.antmicro.com>
> Signed-off-by: Jakub Jatczak <jjatczak@antmicro.com>
> ---
> Patch authored by Zee Yudenko; I'm submitting it on their behalf.
> Please direct feedback to me.
> ---
>   drivers/usb/usbip/vhci_hcd.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 39e8faf4c18c..936b98629921 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -480,6 +480,9 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>   					vhci_hcd->port_status[rhport] |=
>   					      USB_PORT_STAT_HIGH_SPEED;
>   					break;
> +				case USB_SPEED_FULL:
> +					/* this is the default, no flag needed */
> +					break;
>   				case USB_SPEED_LOW:
>   					vhci_hcd->port_status[rhport] |=
>   						USB_PORT_STAT_LOW_SPEED;

Why not remove the dev_err() under the default case?

default:
           dev_err(hcd_dev(hcd), "vhci_device speed not set\n");
                                         break;

thanks,
-- Shuah
