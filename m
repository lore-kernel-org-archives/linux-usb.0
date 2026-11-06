Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794000340;
	b=ktPTTfawDdFfDVuTltFc/WAwUbiDTQXpcTUaGImwzniwF1JhJi5WNMxTiio3TO/2OoMJ
	 qDfxs11y1PXiRtVceGTv9lBFUD3X0rYIX48KFQxRLKoetw/fHqHRMkN1yFbf1J92NQOib
	 qNC2wbKkZ26QzIR9sBTllfDezAfWxurJ7heZady4tpiMvfadc81b/YbY2xc1cDB1lZTAR
	 YKRkDimDI8PEQ9t931g/KISbL7UxhgRfDkI8fOMfEjBj+ywfEJaW2YTmkzGrGIlqYR7zo
	 QVvoTH+L8po+QBhXEK2zkOiVEuAEOkZqoatWHWXGOB+Vk+nVeee0aMrjZt0NnHB0byg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=/NXpFZWuVq/VZw8J47VvHeo0LGsOzZdzIJEJ/ABD2A4=;
	b=H9KWAb5Lj70cTthP5ICQWB17h61OtPZwD2zntQJ1VbfyYfpQENBQSBt4lleKds+cPFHt
	 eQl4CA2Zj3GnVllK+qLflo2Ov3Xp+RnjITn4nQchxLbvqr825eTI57OFTNn+xUnQHqX3M
	 vqQZDi5S5hQsnBd7IUNks15mpwzEL6bEAyxYb2mUGYzCzKzvI9MMjcVjfl/X3KSnRsBFe
	 Ow29zRpb1fY9v+3tuszeWz87hQ2Mm2X7ewYjm54fqpsZMjA3Tmc+7vFL5tr59O9FI76Ko
	 iF6PZfj2ffIZKpObGLbWRy8jGTub0BNvIszxTtw2MJHATjji+Ve17LPCHkM09Huh6Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfyAjdsP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C66606A32F
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 21:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C66606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfyAjdsP
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67bf3c6654fso1179866d50.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 13:25:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794000339; cv=none;
        d=google.com; s=arc-20260327;
        b=cMys93Vvbtm9dRsIUv4AchCav5j5BbW6sfJwLwmn2l0CiKIcAhvAI7T1QEjRnGtqrn
         9jbPXGl2XQc0N8Dwkd6xS15BvhTHWUnhkdUf8vSOv7jeqhZRMTqrHy/3BtUNlas/7PYa
         DJA3OM3f6bStaWD17nl8EKMYK6/PJrCxvSgKoWNyDZzkWYm/mGTac+b0WvspV4+LNsNa
         5wymgdkz5lpOzz2FxbduWcYsvUT2+8M7NYsEuLfPjhFslDSbsoG9nIUXh2P22O7X7cEM
         Do03eX2RvKkChDPERGJ92oc6LCY2ZKvSnBlzuWBBPRr8TpjHPLq2KfBbPjLrYL8a79Na
         UQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/NXpFZWuVq/VZw8J47VvHeo0LGsOzZdzIJEJ/ABD2A4=;
        fh=ml6YVqtr/eMddLQQfYPoEJgG+syI5PAPYRS6y2O8yZE=;
        b=HfDZ0einv83EBvyl2+VkljbF7FxSAAX68W56ewmFtbLqJzxGRLSPLkSw6DGJiGvZig
         ZCs+Xd7GNGFwzFpm5Z1hUtRYUSt4e6dhgChmUFQQCL1pJNxqGpUwxwgTZrjWnFTUZgJs
         b7QnenMz6EaWm5cvPMSbg+TCJwvylFR0ZgSJ2aMgDA++qvBfh5KnTGPW/PUvw9ZyA/Qx
         6JZd7Ee4MN5SLkky1B2iuIb8WpNpJR+SBg7KfRN2x0AV9nF2xbDi1H8elh7oRcKOIObP
         UOuW1a8miQrJM0cDoZFZargwI840XOJJ8xBK8VpIqGItiAC3MAdTCTCe3mBFCIXkjRgs
         MVDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794000339; x=1794605139; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NXpFZWuVq/VZw8J47VvHeo0LGsOzZdzIJEJ/ABD2A4=;
        b=qfyAjdsPUTN1YE3M23y+YdtHiKrGH/REHSpNXa+vvi/eZfGOLHhyi/MVZoLvpbCV7f
         80O5mBqr0NftEF5/N59lNCEng3KqH0Nf4efxm+jZTCOd8JSXrbwng5X2aUR5xmTlGm+J
         tdsWYy7qvuOVMtQZehOZv5VksrmdQLv4wT0LZtefOSd8yOGdkYdHZywRly0pEqpAIQxp
         Wi+GenxopK9Jy2bwTC2fUTf9QaSif8wERWQJNfTEtVZBx9fIpgK13P6XU+vlr0NOUo2a
         M3qn5IakiynPkmG5eOBt4Ve3MHeBw0UEwu2Ul/gIGLkpkfl1V4Lfg/O0CE0EwAQ6WTGh
         ZidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000339; x=1794605139;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/NXpFZWuVq/VZw8J47VvHeo0LGsOzZdzIJEJ/ABD2A4=;
        b=qW3z/E0BV7Ko/D16MF/nwtrZJaOwUjbvJ93VxALvCvoZacBHXUoqej5vLRaZ7iBh11
         MxuMhswHTN1HYfWoN/2c047Y+/Fe52f0H2nOhvJiD/dX4FyzNqXKF/0KB7bnhJBqlKd7
         7IqgCmVTnYGTnJSVtf4Rmo1WpjplO6k5C3jDTPvn89KDSKr0JLjlZlHUGYMSprqbShVC
         VHzdSnlLMm0cCT2X/KKWE+knBHrdXAP9pltEqDCPvXXIu3COxznswXeKwuRueuskR/S0
         upMq8u1xZqAkHipiNzvaXW0fPSYRJ4h11fGaR+0mWUaBsCohgeQQVlLioCkXXZX0CekQ
         xA8A==
X-Gm-Message-State: APuU4Z+Dus1L5aopKNWOWdLm6QXWfAfTMw6lMMHBV0AuFtNdyChP9yWU
	D0d89gIMdgz6jkRvLH5DE2M12+i0/E+QRsBnnIc9wQiP9jdeW6y6iSFPWvVGnhE7IG/9BeCZWSL
	Qk8l06pWIv6IhLe79T/J22+WTuOw9tQ46MoQa2hL3rA==
X-Gm-Gg: AYBFou0mG9aXqGF5PdD2XlSZOlRklxxq1RofYCERpFLgpQvWrv/Bb+8ob4Ythgkr2q7
	ga0OLOdvf6cB9jNBddoNRSm88uQcXpCd68zjaBYK6gyFjUOe3Ibt7zc1Ze9O9SpGsqDsB8japeV
	rKISY6zx3rrchi9aQ/3/Ea28u4qLfg6Qmzz3MPOZuUKaKJvpMANjR1TraLclOh9ID8QgOUZAUbT
	N5V+vjYG4JENy9gwv2/R/10PKeLGFNgARq3Zfzk41w8/bBT0GVbYJ1JSgI/R2eCr9j5L/0i6cyd
	8Y7ysKirhI4WuBPO06AA3rRkeOYkZ/1aS5TFQ62Z2w7Qa2htFOY/VA4vMHR/ZEY8wmGv8xmLcGN
	0aqiA1K0QRCJmCK/kqlsqYVEF7Qm1+jfiz0SOWJ1S3BN2qo2eeVmXkQVS9W5TMqZFsCaWMGaeWg
	qlP/6TXfZvE5lxAOW2rHIPNkGTWxbU7sLD9fUz9ItbxRrmQHhhAs34TAeSXcv/CjxDq/PfAt4Tw
	AjekWMrFnIBL9s62LcIs2E=
X-Received: by 2002:a05:690e:4882:20b0:679:a9eb:76e8 with SMTP id
 956f58d0204a3-67c1441ab9bmr1260302d50.74.1794000339040; Fri, 06 Nov 2026
 13:25:39 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPv=dGA4maJEzJ1mt6udD71WFD8SbxGFfun5Hg8PpvGEb038HA@mail.gmail.com>
 <ausGNtWlRzZN29ux@black.igk.intel.com> <CAPv=dGA6ygdQ8StHwht6nPJZyb2FTH0n03txOOWhb4SSHkG9zw@mail.gmail.com>
 <CAPv=dGBgnxKoyOrcbKBwym5sm3M9+oO+L5R1do7pP9X6cBDXUg@mail.gmail.com> <au4TbIvSBLxIWxnQ@black.igk.intel.com>
In-Reply-To: <au4TbIvSBLxIWxnQ@black.igk.intel.com>
From: Peter Walker <peter.walker78@gmail.com>
Date: Fri, 6 Nov 2026 21:25:26 +0000
X-Gm-Features: AclHuK8PsY-vtX6TqJt86vh1aGSNIVOCEZSnkaRO4D6BUPDiqfDFvUliCa9a5nY
Message-ID: <CAPv=dGC9FCbqW1hBnRz8Axy8FmdD4vohFZ+Q03fmsz3pDRod4Q@mail.gmail.com>
Subject: Re: ucsi_acpi: "bogus connector number in CCI: 2" flood on Acer
 Aspire A14-61M
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 06, 2026 at 06:50:36PM +0100, Heikki Krogerus wrote:
> On Wed, Nov 04, 2026 at 11:28:12AM +0100, Peter Walker wrote:
> > I don't have the laptop with me at the moment, I can run the command you
> > provided this weekend if that helps?
>
> It would help.
>
> Please try to avoid top-posting on the mailing list.

Sorry about that. The laptop has two USB-C ports.

I tested your patch on 7.2.11-ogc4.1.fc44 (Bazzite): ucsi_acpi.c
from stable v7.2.11 with the Nitro ANV15-41 line removed, built out
of tree against the running kernel and loaded in place of the stock
module. It makes no difference here.

- "UCSI version is zero, assuming 1.2" is never logged.

- At probe, "UCSI_GET_PDOS failed (-70)" is logged twice, as on
every boot.

- The first "bogus connector number in CCI: 2" came 4.7 s after the
first of those, and acer_wmi logged a charger unplug 0.3 s later.
The stock module had been printing them until I unloaded it, about
100 s before.

- From then on they kept coming at 17 every 10 s, the same rate as
the stock module just before, while the charger went back in, out
and in again, and across an s2idle cycle. Four were logged during
the suspend and resume, and the next came 2.4 s after
"PM: suspend exit".

- port0 never followed the charger: no partner, power_operation_mode
"default" and ucsi-source-psy-USBC000:001 online=0, whether the
charger was plugged in or not.

One correction to my first report: a charger unplug may not be the only
trigger. Going back through the journal, on 8 of the 20 boots on
7.2.x kernels the messages started 3.9-4.6 s after the probe's first
"UCSI_GET_PDOS failed (-70)", before any charger event was logged.

Thanks,
Peter
