Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795182779;
	b=BSvNcdsV8EdXKXefugmzOts65TIm2DqYlz/7kAdpweGtWoUn+ZwBliuIwiQUM9JeGWet
	 oqBuqH0NgNWot+0eSctYK0HRjsKyi10P+FgLQpfaTRrPJ4eC7OKRy5KPs4quRJ5P2uCUZ
	 BptoGdylIIPrryvSBX+VumZ2Yxn48jSFC6jjx6QDi1AFKVKR6GZzUxmd++5pL594kGsJC
	 ZVBNMIkAcbCtHA0KyWRmN3gPD57o9a2pbPEYRW/l01Pk89QW/US4cfuxZrp6aViISKWwa
	 h3Nnm3e2RExuc+wOCP66s1ylJgipJ9RZjMB8DhGa5QHdDkh3E2LM6oM1eBfPP+XXHFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CfeJt3/PREnoBpv4S0EeQNn7rVtzqEdjGPbzOJ6zZn4=;
	b=u1MZvgXr2f+JUrnUqJ85w94BnDkzJtM0ORRrpHnX/1NPeC/kHA/NShazXLtB8+xVz8ZL
	 cOY4WjZdoUhOY8pUvU6X+72hXW83FltlhfZW8KfLT01N7781GLIgVQZEF1ynX1VeLlrLd
	 hkyfF+IgDXWnLJ0bha/UI8dC9pTAA0GSnsEuoQHZo1bF5caHkcGFw8wlwIHnxCf5xcwCQ
	 v4qgB+yFkwk50vKvvgP1d8TIDlmji9b/0rWORe7ppVVXX0+vD3Nm78o8BLWkDPjdlEqJy
	 tJdxxYwpgfbJLxcPgybPtUFRxAhuY6Qxex4GPzu5hlWO7U2ujI7zrHCkYWtGFopiA5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=nC40FRtx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBBF606A334
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 13:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BBBF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=nC40FRtx
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5123794038so163035766b.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 05:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795182776; cv=none;
        d=google.com; s=arc-20260327;
        b=NOEGQLBVTXFg29wxwW2rJ2k9mUK06efdB0fNu3aewkVq5RE29KelODn+clHaCvXZqT
         qNMsqJM7xbdR0an6sxY4l8pvIiFGS0azuSPob1zwU8OoAYvmeah+cVNk9OQ6eTCAN6Or
         3u8/lHvYMKqdLemhi89VQ67dN+1ipyE7zEv0Qi/sLyCgAD+uVWnBj84MMDuI/eg0dmuG
         jJ482PhkSMWUS1P/oH1YZLcpAa+SJc7Ip56+g5/w78PEPuPmMk77/rB6d/gfZuqANEDM
         QvxDzogGdj6TMOieFhly+jkDcVrsgPrsF4eiILU1IOCkuMDM8jt7sl/RfBs5Uh13cci1
         nORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CfeJt3/PREnoBpv4S0EeQNn7rVtzqEdjGPbzOJ6zZn4=;
        fh=3k52aR38dJtxAzLNVc4ZRn6P02K+fsaQYKZgOgggEAQ=;
        b=O+pbSNiyT50At9cFXDUZ05nM3wpJPFedtvkGxTwi9+4sjSShI/MByGd7rqoooczS0V
         7Cpa2dDIYVkG5Ai3DivPgc6A5ZR/8r+By1UKlzHuagVMbRRpe3DRnKSt1x8y64OH0luN
         o0W0ZomcefmsHyzV3xj36I6wJB7Dk56JDGKdaXSU/od8r2lvEKw/vjXmLOiRLpNhDyIJ
         +swBIYC+9Hfkr9mGxEofA0V8XVOPz1x6h83w/n/pCvM3DsO03y0N4mnrDs7gv0EuKWiW
         EOQHp5IARF6g5mVxxIDJHRciHOmdNS3BdWdWP1kPEGIUfC7j4gBMvGmrBitycXiAilmU
         3dSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795182776; x=1795787576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfeJt3/PREnoBpv4S0EeQNn7rVtzqEdjGPbzOJ6zZn4=;
        b=nC40FRtxYgk0BbJCLn8b5EroXSKSJ88MrRs7GFxMehO5WBFc96o9b5xiz1XPNhoANF
         pedO+USxC/ZagEErtEaHcSHj463uI3tJ8cCxXL9SLlXmgz/ldvT6doBc/vt8UMnzbO9D
         WyOQ6t8Mq+IJUgLmPefOAQPdsZ0d1WuXyzEZqLQW9BXFGtj9zZoArzNo4ikuT3i8oEn8
         pcZpHGrqwTd+J+Jh9ByGpXsco2YQCc6vE5M6jQKsiuE9oMnU+L5DoD39XGstKyhS2uFG
         KHemC8OpP+hkCkOmj7K8Mpj3yJtXnVF9sN5njOkBC0b+jRK21iManY5gJK4BiFCXq04h
         ssug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182776; x=1795787576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfeJt3/PREnoBpv4S0EeQNn7rVtzqEdjGPbzOJ6zZn4=;
        b=LosuYVMNC7z/rAaiExIB9vkCxqDN8V9orvZ6bLxOZnlvcg4dq86Ua0PNSmdKtC6ncX
         65PX15SM6xUXsMsDyyFwVQzraqDspJax09kYx8xv4DSgB2ry4Xq0iufwzJjRgEU+dtLh
         CmLOtUraBPBBkzLfEGOYst5RwSMlDeebbRzQnPv+qu5gwMszIo4blTMK/bfrQjRE5tH6
         FeonwcuxEjJMNhCVTk3BKsBBhFFpoIMPdFwwMkoDZTUa1uIVHWTaoWlKWig22z4kc27i
         4VQ/Sqp7EBK7KRzPR4bPA6OKcW14XZ78iJz/NLHeMA3czY99ySF1shlfs4DwSh0Eo5cX
         ULEA==
X-Forwarded-Encrypted: i=1; AL+hErFZcZAn78nYRtW/NuOuHsfIXByM2+9greruYUaiPn9SBA//MWS+f50iPBrO16LM+pu4alkr+BuA+fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z89z5Tqfyro9Cc839bR6Sj/hbCJlR+DIRYW12VtDzrRBHDFcJ7i
	tkGcPYGwtJXD58MTEaHGH8MJckGSGxsmaWqVAlPk80GJsxp9HKRXvplPa71LdcEwdBxOS6SmzuT
	1jxc84DgZTMymnaUFK6n2YmAiQWVK8+P+fb0AAMzJuux+lWVE3QrCsQ9HhQ==
X-Gm-Gg: AYBFou1wRXP2pDdLpu7xk4FyMFAsLY1511onAKSYADkz+FIvN5sNCDsBMUqlP3chdqX
	9jVW6GP6uY2TLxzsz0xQndd67wfXpcsd8MCAA+52XIdWVdaiyvwf3qVeNesgaOUmRtaDV8F/dTW
	ss7/96LgyzKkFCu9JrPX3TBGe7KnLm9Mi8EyM/AfkfMuVriyBYkQ4MZbkmHIbbeKKiISWKikCPT
	rSuiRjYA3NBCJdGlQzUzzQEf/LCfcdMSFFVuAgUgHWWzXE0v/ngCJZWf78uOSv5q30saKO7chWi
	qyVIQIRS6+Da7jsEdHrKG6S1Zjlf/jgEWtc8wfUVerLodqHwWgqwOyf99Y4S/dn8oP6rFaCfLPT
	VbGMWQH9H4zFse4FfPjo8p2zjkrFH7k5/a/AIqbFCrfxbre/HclFSraQ8Q0WFj8W4uBb4Ig==
X-Received: by 2002:a17:906:a099:b0:c2e:350b:7220 with SMTP id
 a640c23a62f3a-c513a99a637mr271625966b.9.1795182776578; Fri, 20 Nov 2026
 05:52:56 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net> <awBFWmpR9hPkcerN@black.igk.intel.com>
In-Reply-To: <awBFWmpR9hPkcerN@black.igk.intel.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 17:52:45 +0400
X-Gm-Features: AclHuK_VIZlrGFHXDuTJlI-KT2ULB_-F_s02FUea_6KmXVP_7WAbNp_FalPVFPw
Message-ID: <CAKTNdwES7sRRDjvgFdGttesY9dppOkfBjNhwsJuwUWN1T9DFvA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Keep interrupt flags across a failed
 register read
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Yueyao Zhu <yueyao@google.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Fri, Nov 20, 2026 at 5:04=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Alexey,
>
> On Tue, Nov 17, 2026 at 12:25:31PM +0400, Alexey Charkov wrote:
> > Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chi=
p,
> > so bailing out on an I2C error in a later read loses the flags already
> > read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
> > lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attach=
ed
> > as a sink and left every Source_Capabilities unanswered.
> >
> > Keep the flags pending until they are handled, and retry the reads a fe=
w
> > times, as such errors pass. Otherwise a flag left pending waits for the
> > next interrupt.
>
> I did not quite understand this. What's the i2c error? Shouldn't the
> i2c adapter driver take care of the retries?

Any I2C transactions can fail - that's why the accessors return status
codes. And they do, e.g. if another device on a shared bus misbehaves
and hogs the bus down, or if there's any intermittent interference,
etc. The I2C controller won't rerun the failed transaction and will
propagate the error code to the caller instead. In my case it was
-ENXIO when another device on the bus interfered with reading the
interrupt status registers midway, causing the irq_work function to
exit early and drop the flags it has already read without acting on
them. The result was a permanently desynchronized TCPM state machine
vs. what the partner saw on the wire.

> > Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip dri=
ver")
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> No stable?

Cc: stable would make sense; my oversight. Thanks for spotting that.
Shall I resend with it added?

Best regards,
Alexey
