Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253437;
	b=HRRm/uFSt+qLxTgoxjy/Ptv420i8CRrX1iIYPW79S1OiPOr9numcTj9uDUPBNBLqiZS0
	 pb71NaAJAClWEf28J1ks7F7SIqLGTdsFZPIe7yVLBwIM/8EJrzqKROvEHFz5nnJQWNpzw
	 wbizjDr9WFQlwkyzM8H73DgtnsvpsMLHN00tMu7HaJV4vYXbML9184yxfVG5uV6sjyWkn
	 YOtSKmg/pCRS/lQFMm4IaFVhu+5qxSfSS3yJIkw03Xx2YgvqT7KGn4wNnVbdLSgmydJZv
	 DXqeBNt1SKQjzqrwjTxYS7dQLscs2XWzl99pdkTIk29UE1FXfSt5CSfeuAvsoqpKn0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=165M+y67FGU92liuL0BI/yTTwNfE/BM37g04ys5KH88=;
	b=nZz/Psx53bU3Ag+tJB4djSihruSjBuB5D/9ubpi048VIs2mmnK1lNAcRBnch1IGPVw/9
	 oojPYPxk8ztk6MktU5dpD7U6TtHYhIX/yM6vkrvi+2vL6Iycz64zisWauxii3ypivhfM1
	 uiqVgiW/BrJkWiDThaliNl4gkyEAjVaX2aiugHrHXRNKO3PG7mfdbmkQkGynfdenySNuc
	 docN3zWJttXUYsfh1NrOFvoHDn3lel5tKA+ykXGWns67cms4UH1KmWtDKqg+SbxQkgrKt
	 YX87Ok9K3CQ9rIKYVSDxO40ANiZ/UDrrmFSpSlCnWZsd96cLPMNdktJ1jCPXnQAlWHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5fRBvPR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A807606A683
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 09:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A807606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5fRBvPR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so10526305e9.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 01:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795253435; x=1795858235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=165M+y67FGU92liuL0BI/yTTwNfE/BM37g04ys5KH88=;
        b=Z5fRBvPRvoNAHlTMNd+dxXxJjbgWlLta51HewPTOxJIZoF7VvFc/tMzPwtxfHCVH5/
         9GzZCdaeIRUU+PkFsrbhuKKIAD5koBjBfYYPoEeInqPTXH1Pus2vHs3w8Ytb+b3GHxVL
         sabss1un3a+vcTTkeKuDqWZ0pbfHqwpKjdPSzdyDMx4W+T7cmrr7uJOEkyOy3LywiBKj
         P5B/U7GQ1g5TH8fXNSghU5/0uli3h1haKa9w0A8RCtyn0YyXm04Lb0sJEkoWNbmIdBR4
         h95u/6WoF0XYcyQT34Ub+gi1RTB6gTYmf122qkoIMe+Vgy171J3PftY+DjzGgdW6m2gN
         8VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795253435; x=1795858235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=165M+y67FGU92liuL0BI/yTTwNfE/BM37g04ys5KH88=;
        b=RdcQAUmL/3obKBkx/Xs5C9y8s8X+ILMCEuNgMlQ0QaFbypqDMY85QhJz33pNqhlt0j
         IBN9MoKBOCPZwqYeZvuA/JbZBQCwZeshMdLcXSViUSX/9IYYsqA2uaNmjV1iKE+Gj9sa
         WssgK3JX48bKaqu+4mM3Oc3cA0a4uaFlDO1yzaGdizpfwxuZwx9cPWUGEZCye1FqQvVH
         CdeNr/XiP++8cvGcOnGoeHwji1cugXM5UPvAVvZZqaFuRFIKRsLoJg8SvO8hd8aXkHRX
         ZS7+TfpI0e6j8tpgROZrBzYD2lUJcxE+q/cjdrgE8nWpVzPzhzV8pQET/QRXBoHyaQr3
         j6ow==
X-Forwarded-Encrypted: i=1; AL+hErE+1SH4WFWZjxBBSQpS4qYNLAwiKGaSIzO9nUWZGwpmAwz3shvc/7g7zs/qhm7qI2QOONcWDEJ/zEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yUtLUC5RHIH8Ma3QU/ucgYackZ+C6kyDUGIbnwN5LbG+p5xEx
	Oih2IYiFM5Z+ev5kAcHyM5aTUpwEgXZtyxc6CzfO4Vbec445GNEx5mLn
X-Gm-Gg: AZFdTZdfMpHDDfYPSPhTpIQXgx43UkyVkClkqZmZ/a3uGiwDBU+uhv7qmZdr2MVGILG
	G8vW836JpeL2IcK4gZRDN85Zn9Crcv5jXcwZQLzXbJSG9y+8FuMPjlErKCj67uXchy63XAOqxx6
	ixIZVs9B9OUwDBjomfDHGQgRFmWw3yCCrEwx3FwVWPNjdnApyHjfhrxcEhXBvKXWKXJ6w7RF6Do
	5C8CD25a60AcgS9o2wdv8suVLIrE88LEeEwkDYC1CWK5b7TVRZVO/X1M7o+ggGQGKAVkXRfcU62
	wgNL+M7kLQfamkOpAGrK4GKyulXNrGIP8SlWqvkmS1gScBDch5fB/k9O9oJ/s1ApyFnphlucJmL
	e7gLUKPchSAYSs53XmwFtHO5VQPv+tzflNYM2XL+6rnvQZQQhE2iPn/uChAIDqcvMu362se170O
	PQG0Ho4BvZt5yIcUxn+s69C1dhoYLID4oTlqKTOaY9L4p6W5p2m9fyAi4/Mxa2M2clXqSzmsPbW
	s0t5ddO+8gDOYBJ2KCWuW+YkdzvSfH/EvdSPxKIJ6vnrhFR0zJLWMWA6Dm1bEim/PagUHLaHVCx
	W6uNpdjk+oPNcjR/GWa/37O6FXA=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr119899625e9.9.1795253435290;
        Sat, 21 Nov 2026 01:30:35 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm215995135e9.11.2026.11.21.01.30.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 21 Nov 2026 01:30:35 -0800 (PST)
Date: Sat, 21 Nov 2026 10:30:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: "Alex Kononov" <alex@albefly.com>
Cc: "'Mathias Nyman'" <mathias.nyman@intel.com>,
 <linux-usb@vger.kernel.org>, "'Takashi Iwai'" <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>
Subject: Re: xhci: unratelimited "buffer overrun event" warning floods log
 (~7000/s) with USB S/PDIF capture device
Message-ID: <20261121103029.7af20ec4.michal.pecio@gmail.com>
In-Reply-To: <001801dd7985$c068fc60$413af520$@albefly.com>
References: <001801dd7985$c068fc60$413af520$@albefly.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 21 Nov 2026 01:58:44 -0500, Alex Kononov wrote:
> Good day Mathias,
> 
> With a USB S/PDIF TX/RX adapter (Savitech, 262a:9123, UAC2, high
> speed), the xHCI driver logs an isochronous buffer overrun warning
> for nearly every microframe while the adapter's S/PDIF input has no
> signal:
> 
> xhci_hcd 0000:00:14.0: WARN: buffer overrun event for slot 2 ep 4 on
> endpoint
> 
> Rate measured: ~433,000 messages per minute (~7,200/s).
> systemd-journald sits at 100% of one core and reports "Missed N
> kernel messages".
> 
> Setup:
> - Intel N100 (PCH xHCI 0000:00:14.0), Debian 13
> - Kernel: 6.12.117+deb13-amd64 (same code in mainline 7.4-rc3)
> - Capture stream open continuously (CamillaDSP), 48 kHz S16_LE,
>   EP 0x82 IN isochronous, adaptive, 125 us interval
> - TV feeding the S/PDIF input goes idle -> no input signal -> flood.
>   With a valid input signal the count is 0.
> 
> The device is clearly misbehaving (it sends more data than requested
> when the S/PDIF receiver is unlocked; it also reports its clock source
> as valid while unlocked).

Either the device is buggy or snd_usb_audio driver submits wrong URBs,
but that's a sound subsystem issue.

> The driver handles the events correctly and audio recovers fine. The
> problem is only the logging: the warning in handle_tx_event() for
> COMP_ISOCH_BUFFER_OVERRUN is not rate-limited, so a single
> misbehaving isoc device can generate thousands of lines per second.
> 
> Locally I changed that xhci_warn() to dev_warn_ratelimited() and the
> rate dropped to ~100/min with no functional change. 
> Would a patch rate-limiting this message (or demoting it to xhci_dbg)
> be acceptable?

Not Mathias, but I think it should be xhci_dbg() like all the other
conditions which are device-triggerable rather than driver bugs.
People can still see this as -EOVERFLOW status in iso_frame_desc[].

> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ handle_tx_event()
>  	case COMP_ISOCH_BUFFER_OVERRUN:
> -		xhci_warn(xhci,
> -			  "WARN: buffer overrun event for slot %u ep %u on
> endpoint",

When submitting, please make sure to avoid line breaks like this.

Regards,
Michal
