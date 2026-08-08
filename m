Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C12A1F09A5
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786228254; cv=pass; b=dGTGOPYbFHSRQuMrW4tc8dx2R5PF8Pf9BPV3vfq2hTBwtD/5v1F67XGrDRSASu6eDrvxgXChAdLr91pE7JD2yxh8sKLAFXAzXUlwJK8QMw1/fWnUCJNiFdUNHclGr6cjQnM3I9IG6sS3cCCtR7CG7lwenGzmuzQeuDILw7B/ops=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786228254; c=relaxed/simple;
	bh=u/aR+YgPWxL3SaP0F+G6mRY9b3B2c1OpPs6Kao85gCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtgBsqkPtES97+UYma8pZbBI/t0SVa0jSTJIcPO+JSq5NK8zww8WYUGt6OZdzEF5L+TSY48lbLCj9Tjj4t57HIA01WdzQFLAd2PoTp/kJKZ9Hx7i3or2LuktMZymD/hifItU+a3fWFz6IjJl+vOoCcvWuEymFgXvyA8hLyHGp9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHH3TmgS; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHH3TmgS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caced6038eso6171335ad.0
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 15:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786228253; cv=none;
        d=google.com; s=arc-20260327;
        b=MxKSkZOTQpfa5HPqYh4z9Uvs8SUUykyrpr3vFeDIrZShD7nh3I8SpTVh8JRG1iUYAw
         ORFiGCUcv4tMRjIsVQ7OrP4H7dhTTRXwCSVPIjGkT8bRwBO1vR2P8WyrQeQICLAIegJT
         p5jFJOMlMwTHA/nY2sDA/z0GTEzygZfUNswSDPi17QyNbnAHqQJkbe3nTFRM+Fp0Yc6D
         dytn1LHb3la8Xz+b1iw4rY5ZlWk/K8DLWzCDd6HF4swjRVOdIYGY+lq0Mx8TmidDV2cc
         Ih6cSPv6o4FXtG17r44AGZ0B9HX7HyxnDheIX1rUg2KOcD1aa1FED9RjJbe4BYejzCpK
         H6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aBDL96EwzGigIPn5AWnNwvGjhTglYCk7YLygBX7ROMU=;
        fh=3CIenth+06lQhsy8L+tY1dlmMJXy5qcKJzO9RVL50f4=;
        b=Ox6BFXNePY+Yrqz2cVIt92qNy358W6J/OXc2RVK2wFTZ0WI8kzmGxskGabG4dSNuN1
         gfu3TZPydKQpMxCNLdm7qqbWyBy/16qTo6j49b/uKeNDQlDVhxI+aJTrbjbROOUioQ3m
         3HS9zW4jiHGaGj/0heN/YNbz1nkrezV/is52oL4DtchnlM6x8gaOKQlBnbCXEDfzyV04
         cONlhKZo7UewaC/ruLziktAUqVfNGr+j9mIILJxaA/8+Y5iRyaDq1oDbQ41XipvKVWBw
         v8yIN7RK/W3taktJEZDbCqg9JRK1J2zi9811YqZJMtzVibic4NOVkR7WfqWrEqN7ZBxa
         5VsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786228253; x=1786833053; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBDL96EwzGigIPn5AWnNwvGjhTglYCk7YLygBX7ROMU=;
        b=QHH3TmgSaU3iyDjVmXSNyGyp6V40a8IpmbpPaw7GGJxtopHYIY/kBiko7/1FwGG8W0
         e85Er/SNMufvbN+iQL6rolUXqAkpW4pZI4YxQtfkd44duQr6vi1qtZXSE4SA8d+x3Icc
         TjAW5I87oc1hcd0GEfaftGces+l+aRNzjQe3+Jf5EiqAhxmQbyWyHCrnKze3YvMq1Vfb
         N8cW17j/KxKn5FnUku4lT2RDgcVw+3/Ffxl9A1X4FB4maSscsAk9iVAHm5doVcYWoryA
         jvey13lYh6Bb1eAzem16psodAN/RLdp0+mlZijFmMFUxDJGoQz0jhglMDXsr7ITTnPUD
         5SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786228253; x=1786833053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aBDL96EwzGigIPn5AWnNwvGjhTglYCk7YLygBX7ROMU=;
        b=Ih+5pygEMLxIwRvSir9oPtFYPAdeVGmRQ9zn7sy5kkGo03QaSqieZn9pcrk/uUu9EK
         1oSttDWvmTTA5hOSpvRw99URN+V8fWnA/LQ2zohgTdTxZsjiRpRYsCpsNDm5N0fhl3AR
         sCQsoK3z5a1GBxmHYsUz1cHNZ8Ln2CEQarcstp0ZVbddvfarcCyAWQ6EytUIG0rlEejR
         5KAyKuhy+8PR+acdkevKk+CfoMff0T+Cm3YaqDxvYyZO64krw+fVaBBSBXyQXTtRKOg3
         sUh/fAZtLID98G2Q9XYaPUcSIgViJeTdHYKNk7bnR9+QSkyTFWyatqn82Y/fXR5mF+1w
         w/fw==
X-Forwarded-Encrypted: i=1; AHgh+RojhZWRuPbnap4SnjmIgpe7tdEANPlKL8svs/uTiG5feGXxQZR2WKl8K6iA/k/xoH7QKjbXo4Jgh1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnvjfKz2rN5dapn7XyUfWCRd3FZAwHhZTi6U1CFqGaY441TiXA
	jc0XQ28PHjv3riFPyPBqwsYb4d1lV0HT/3I+330S+/Y+IrTkQD5/vNKmrEyRRYjqygrO2twYDxf
	biRJAstNPBTX7Lu+B6sRk9lmTTwMX7eI=
X-Gm-Gg: AR+sD13Jga3HkQoc4q6xdy6ghKEu4WfXUZOLT6cvhEe2iC8461jvf/o7fjzg2/PhZu+
	WN8RyfWNRu+Ovbl/LVZ1QxzLgprrgr8/hIH+xrScEi8u+ijMD3+lqWEJIBrtOeGLqlQddwlK6b9
	jlSSFaeyaXwxxWBd5DGgyf3UtRKRznCsjzrUdn7KuWi58qIOnL+Abo0m7vVIZlcVrdecSBnSPnR
	MHWLMnPZtW9Wu7k6EoTvarKKFWph0gnyp9dZieJQiTBy843779N+R6r+rZpvAyblP305oq3Ck6J
	NZr2wiHXGvxz6f0qXhqCJZ+BDjAbHErkvnKwMi7MiLKsFEnJ0G5Zx0CzOfBSIZj5nIE5CraiP5a
	olvCp/kZSfjK++3kF7mlAtJpURHMYPR/ZpRhSxOsF9xKCk5MMsJYQo6HG1WQ=
X-Received: by 2002:a17:902:ccc9:b0:2cc:db7a:251 with SMTP id
 d9443c01a7336-2d2b2d8ec9emr100184405ad.2.1786228252650; Sat, 08 Aug 2026
 15:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
 <anIhyHL4Kl-DX2G_@eggarch> <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
 <CABWMpWTn3H7UKqYzr7JP9tkQCEJHsXX-F103nyyey_srn7mvHA@mail.gmail.com>
 <CABWMpWSkJgmoZACA4LYEbmsbEGJMYLyixwv2V3tZbneeKBxpWg@mail.gmail.com> <be3775ba-3e7f-4548-aa1b-4710711f8aed@rowland.harvard.edu>
In-Reply-To: <be3775ba-3e7f-4548-aa1b-4710711f8aed@rowland.harvard.edu>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Sat, 8 Aug 2026 18:30:40 -0400
X-Gm-Features: AUfX_mxXklcd22HO6HDonbWutYlV7pvODMMT9yPLiMD5KmmDZ5Por3aKpq8ARgE
Message-ID: <CABWMpWSSYWusBTvxC8ciHR4FAY4zo=sON5fBWr-B=uefyqAw2A@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, jikos@kernel.org, bentiss@kernel.org, 
	regressions@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Subject: Re: CyberPower LE1000DG (0764:0501) - Further testing results

Thanks again for all of the help and for the patches you provided.

Unfortunately, I did not get a usbmon/Wireshark capture from the
LE1000DG before returning it. I wanted to send an update before going
any farther with the kernel git bisect, because some additional
testing changed my thinking about where the problem may be.

As discussed previously, I tested the LE1000DG across a number of
kernels, including:

- 6.0.x
- 6.18.40
- several 7.0 kernels
- 7.1.5
- 7.2 development builds

I also built and tested the patched kernels you provided, including
the USB/LPM and reset/resume changes.

None of those changes made the LE1000DG reliable enough for normal
use, so my next planned step had been to begin a Linux git bisect.

Before doing that, I installed a separate PCIe USB controller using an
ASMedia ASM1042 chipset so I could eliminate the Intel xHCI controller
as a variable.

The LE1000DG behaved poorly there as well.

It enumerated normally on the ASMedia controller:

    Bus 003 Device 003: ID 0764:0501 Cyber Power System, Inc. CP1500 AVR UPS

and the kernel identified it correctly as:

    Product: LE1000DG
    Manufacturer: CPS
    SerialNumber: QBKRP7001634

However, usbhid-ups was unable to reliably retrieve the HID report descriptor:

    Unable to get HID descriptor (Pipe error)
    Unable to get Report descriptor: Resource temporarily unavailable
    No matching HID UPS found

lsusb could still read the normal USB device and configuration
descriptors, but the HID report descriptor remained unavailable.

The more interesting test came afterward.

I temporarily connected an older CyberPower AVR1500/CP1500C UPS that I
already own to the same Proxmox host.

It uses the same VID:PID:

    0764:0501

but is an older USB 1.1 / low-speed device:

    Product: CP 1500C
    bcdUSB: 1.10
    Negotiated speed: Low Speed (1 Mbps)
    HID report descriptor length: 387 bytes

 this older CyberPower UPS worked normally with the same NUT 2.8.1
usbhid-ups driver.

It has been polling continuously with successful quick and full update
cycles. For example:

    RemainingCapacity = 100
    RunTimeToEmpty = 5407
    Input.Voltage = 121
    Output.Voltage = 121

The driver continues to receive HID input reports and complete full
updates without losing communication.

This seems significant because the working test uses:

- The same Proxmox host
- The same current kernel
- The same NUT 2.8.1 installation
- The same usbhid-ups driver
- The same CyberPower VID:PID 0764:0501
- The same Intel xHCI controller

and the older CP1500C works while the newer LE1000DG did not.

I also tested the LE1000DG on the separate ASMedia USB controller and
saw essentially the same communication problems there.

The LE1000DG reported:

    USB 2.00
    Full Speed (12 Mbps)
    HID 1.11
    504-byte report descriptor

while the older working CP1500C reports:

    USB 1.10
    Low Speed (1 Mbps)
    HID 1.10
    387-byte report descriptor

With the older CyberPower UPS remaining stable on the same host,
kernel, NUT installation, and Intel USB controller, I became much less
convinced that the primary issue was a Linux kernel regression or the
Intel xHCI controller.

At this point I suspect the problem may be related more specifically
to the USB/HID implementation in the newer LE1000DG, or an interaction
between that implementation and usbhid-ups/libusb.

Because I was still within the return window, I decided to return the
LE1000DG rather than continue troubleshooting a unit I could no longer
return later.

Given these results, I am also wondering whether there is still much
value in proceeding with the kernel git bisect. The fact that the
older CyberPower unit works reliably on the exact same system seems
like fairly strong evidence against a general kernel USB regression.

I do appreciate all of the time, patches, and troubleshooting help
everyone provided. This turned into a much deeper investigation than I
originally expected, but I learned quite a bit from it.

Thanks again for all of the help.

Jamie
