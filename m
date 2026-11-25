Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795648672;
	b=K8P3wsh6zSt341We3Oc5VQ364aXtvxNGl6zZTPii1BZ//W8ljdz+GsrRRJNpc2l3MEX3
	 GsRiN5RxqMq+ykMMYsLG3h62lEzoTkocqaYMqFui6XZAUVbkE2dY6FhkVB0HG8LUR5cga
	 /ZFNo3iqi5M3UvUh2UjHzNplbP9X/X/05+C9Mg7UDQRsgBxhpH6fR5P8mk5TRFB8p8U7P
	 d55HjwhNnF0GXPFPOBoJSZE2df3IUUyoiuBUqpT8no4Oi25VNT6lr3zKz4lJYD10bDPWz
	 Gs/BRWTXaJIFOTq/fN1ZFHsKgksZ7t1lwy+Ih5WeIkU1/b2KmiDudJVY1Ob+McSTQRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=SPmmmW8/OqRNbcYGmJPG6LaUxAYxeNGXCP0krZQQU4s=;
	b=UfLfVsjPcwfQbRe1yz5q7Vesbp/LXjHMZY0GhCpEowGuUoctbnuti2LukkMU3F2yUnY0
	 LmM92kHuc9hrXg5ftSbu5w9Wa1VtFS71+lrqwcg4X/H+jTqxK74nmMZg20Ljf6q1woeY/
	 7/MN2MDs2MU99/gqF4XqHNB6i0wFLvqAyuRXOriwuxlir7t7l1O6I2yjnK5QIxzmCXskE
	 k4C3bY6ECDPIi60FWPHVivXn4a/oRqyfvjd6VjQwR3k+LLpVgrfTrK4Un21PzerM1eNSV
	 trh0I3IWksQyBai0rw3Ud51IOtzCLNdP+sdZ/DCswl8PEJ72JRDOdDX9NKj++o9IonQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Xb4Uee;
	arc=fail smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60936606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60936606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Xb4Uee
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04ad2c46dso40141625ad.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795648672; cv=none;
        d=google.com; s=arc-20260327;
        b=q4rpHqH2gpZ4uKYqDRgJyXHP7khECqObeBpZHKYxohNL2EC+IEbL5BIqGzbAPOGcDf
         +L6E9qPRNSk1hL2yXD3QDccC7fVBN33yAHvWnhpYremiqvoN4aRua+I5LKHVn1PyOxvS
         HwqAKcXI2OIH0rdODStAwf48z8+8ccPBDUzqX1LXWeclJGJBy0UQipfbad+jGHWVKVFc
         RZnT+TsuDDUHuLHXV9jN9VKbGNrlzvE+O8MBsB3SSUzHozx9DTgTNTt9+nFUPGZ5gUKE
         ytevtkvvXYR1L4sVh4fjuQUNw27MvV5w+fvqABlT5lOV9rlfFAoIF8hMdi5VIUewTwCF
         e2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SPmmmW8/OqRNbcYGmJPG6LaUxAYxeNGXCP0krZQQU4s=;
        fh=KErv1kmETao+Nr2zLrv/RvW0uLg4bErhnfnioXb2WV0=;
        b=NrQC9mTFLky/0OgA2gCuKD96GRmmGrIf9214yrWpzo1EPG9HfqLlenUDCGksWnrYuy
         uIJ5CLX9/wafmc1QlHMccFhjD4PxJmVMsGlbBRd7m2s/ag1qG6/ejHRipLPBlxTWQwtL
         AnZxOnwqipcLjB1AWeL+FdkLfxocY91vOyKX8aQskNWB4lDohVuk8aV5W06ziBmsL9Od
         TltbFTB6T7v64HpZB8E5Ur/MdnA8mjgDt8yS2jfYqXKPc8xB1/m9vI+9gj8T/OEpxd/q
         JE5ZU134PcQptiT8seBhQ0pj33p3Oept8awGmCf3rAWbgL/3G0iiAs7PGkDrNwHNY5WW
         7hHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648672; x=1796253472; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPmmmW8/OqRNbcYGmJPG6LaUxAYxeNGXCP0krZQQU4s=;
        b=o9Xb4UeesFSAPywllWVj4lJbIxGhOYxJyoWqKVeBJmFbwZ2eQbgzZFJzC4El3kLGk9
         sH0DgGmaCwlRerX6F+NlMUJgweJLA4biFT4K+I5PQUFnoSl4MXrO7khPK23FIbb5AXqu
         shpukdYzgLpwRanYtTOYgDXXHa1Scc9k061PxXsQw0EnRRu29oM6Y9TiwWsykFA06ddk
         lJCV05BkDFugpiYG+0T3945HCPFnofPhxpG7RWtnBV0dZQz7xZPyiAA2oeaHLMjB2D6Z
         gzOA/Zv9vnMhxGdPolbakvLJDSt8v9lcgpgzkhLuIH8qsaNusN7MdUjE7aF8nBmDQdJE
         Gv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648672; x=1796253472;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SPmmmW8/OqRNbcYGmJPG6LaUxAYxeNGXCP0krZQQU4s=;
        b=SpQPK5NvNr4WpKCdmQVJtcK4mG6KQs9YzwuRJJ4E5+mi873K3U2ns7Ap2Gd39XLRET
         Q1DUOyWdQKIw0jTkeepCYdNDzes1o5vsLeLvgbJGQlSV3KrbvLMcHcOU0fixvKdwte+D
         EpbOawWEfIxjxhfkcpP3ZTtgxcilLxYiFpVmkc4y7bOVRfk4n1mQtC9flJdBFBrILh0y
         pD5NtmIVvACuFaEI8Hvg3tZWKI2Asd3rmQ9wkbudjnra8orxXhCp32Z9gwMnf0oRJOrB
         bX65emrOQDiO3/85T11uc1CXq124RkOHfUAIWZAxTgdqBQ2kLqC6NRsvL1/h63RJ3Pdf
         O7bg==
X-Gm-Message-State: APuU4Z9l+5FQh+t1ex4QNTgDxirBv1D62YrJ3Z6ppX1q01i+Z9I3WKBz
	yUFv3nhrYSyXVrQ6RkRdUwGcFDZZKfy3oKju0Ksa8HiHbb5Stb3rY4CfGLmawPtQ7XLlKzSdJnx
	MBoJt+MCMxQgEcltlTwpilg8ClywATJo=
X-Gm-Gg: AZFdTZfAldrYzFglI+VVnXnO/kQIcpywyNGQtpNBTVtqh5ciEFQ1/2Dr8Ux9SxI61TO
	LhESE0q9o/a2EyOkzRC0GeVzAmirQKQtMk0vilLJmNb0F5LjZKrK8tJ999f8ehQX7lj0HkalaY0
	fczJmm7Qo02hk+uZ2x9O9T+kHSJ/Y7Aq/bHH33IEqFivXFb5EC4CLN6/TY388Ohyw/OjckjDtMf
	MPSFpL2SApOCQb82QbnJGCXTAX2EX3HJ3aZEST3NJdIJSlX1jpU7PNPf97RiFgyNSnGNlHKp8Mc
	yUPgwNcDdWveoaxV3bPd055F0M1Lz6IzelnJ/WNr2by/vTQGkGHEF3BLX2MdBYHI+tLVvp6oLv4
	Px6xAsbWvGN/22COlg02WNqSnk6E1J5/rwhdEsxpePB2SBm2A5Rt4fzmUYBw2jswtPRI=
X-Received: by 2002:a17:902:f602:b0:2df:90d4:7847 with SMTP id
 d9443c01a7336-2f03f1bf176mr194005115ad.35.1795648671611; Wed, 25 Nov 2026
 15:17:51 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
 <20261125203211.76029bf0.michal.pecio@gmail.com>
In-Reply-To: <20261125203211.76029bf0.michal.pecio@gmail.com>
From: Flavio Giacchetti <flv.giacchetti@gmail.com>
Date: Thu, 26 Nov 2026 00:17:40 +0100
X-Gm-Features: Aa3M54rgy4LL-69X-hqnD2jE-HjcRy5WNU4DRHc4WE3T57CpsEVg8w2rLPrsqdo
Message-ID: <CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

Yes. The earlier Fedora 7.3.3-300.fc45 logs show the X3 enumerating
at high speed and cdc_acm binding to interface 1 as ttyACM0 without
the rate-query errors. Audio worked. In a later 7.3.3 boot the same
unit enumerated at full speed (12 Mb/s), so that later run did not
establish a working high-speed baseline.

The failure also reproduced with Fedora 7.3.5-300.fc45 and its stock
USB and ALSA drivers, with a different known-good cable. At 480 Mb/s,
the X3 disconnected and re-enumerated, then failed to answer USB audio
sample-rate and mixer requests. On 7.3.4 the same high-speed failure
also occurred with my experimental cdc-acm module loaded and the ACM
interface unbound. Please disregard my IGNORE_DEVICE RFC as a fix.

On the failing 7.3.5 run, the USB hub worker was blocked in
usb_start_wait_urb -> usb_control_msg -> usb_get_string, called from
get_term_name during snd_usb_create_mixer. A 30-second usbmon trace
showed repeated endpoint-0 GET_DESCRIPTOR (string) and class
control requests. For several requests, the next completion came
about 5.12 s later with status -2 and zero bytes, consistent with
cancellation after the timeout. In a separate 7.3.4 run, the Intel
xHCI driver logged two "Event dma ... not part of TD" messages at
disconnect.

When the old probe finally unwound and a different rear port was
enumerated, the unit briefly appeared as Creative 041e:6007
("X-Fi UltraDSP"), with HID and CDC interfaces and no USB audio
interface. A targeted USB reset completed but left it at 6007. It
later returned to 041e:3264 and still failed the audio probe. I
have not identified what the 6007 state represents. Separately, a
local WirePlumber rule forced 32-bit PCM and hid the output when the
X3 enumerated at 12 Mb/s. Removing that rule restored 16-bit/48 kHz
playback in that mode, but did not fix the high-speed USB failure.

I then reset the X3 using Creative App on macOS. Back on Fedora
7.3.4-300.fc45 with the original cdc-acm module and without the
experimental USB quirk, the X3 briefly disconnected on the first
plug-in, then enumerated again at 480 Mb/s as 041e:3264. ALSA
registered it and I verified active stereo playback with S32_LE at
both 96 and 192 kHz. There were no further USB errors after the
successful re-enumeration in that test.

This is one successful test after resetting the device. I have not
isolated a bad kernel commit or reproduced the issue on upstream
mainline. I can provide a sanitized USB trace and kernel stack. If
it recurs after the reset, would a good/bad usbmon comparison
starting before plug-in help distinguish what happens at the first
disconnect?

Thanks,
Flavio
