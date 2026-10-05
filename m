Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A230E0EE
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 04:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791175020; cv=pass; b=UkdqtZsnCjDlKby0edY1j6VIshp2jn8n+IJ21EjNk96Go6JEt/oNl3QJamHGLYdDDibspaK3JheiwCFxaj7+0IYbjCSUeNBm/c0WxcvUFzrWzEjl29Z0t2xAh+bLvSP04QZV0SNJGl2x8j0oCi2F30TGKiWnKHbaavCB3IakVhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791175020; c=relaxed/simple;
	bh=4JaW8TsfEgIYQ0t1F0pY0awGa16inumluGQbcchpNhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcmXV0bw6PVwgW+t6jiVHDzkZBRhIQabq1QWB3YI1M+82EUhuqVAxMEnAEouGoO15uc/dVzdKz8SkpLgQ86TN8oNzoQIcoPAzhtYfPDPCuO+F9VQE7AU6bXsefxjsdx5kImbT3TAnlIrGXVHfOLoOpEt83OHz1PpzBJcsiSGhZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGJeDFSL; arc=pass smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGJeDFSL"
Received: by mail-oo2-f7.google.com with SMTP id 46e09a7af769-8210db80578so874110a34.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 21:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791175016; cv=none;
        d=google.com; s=arc-20260327;
        b=k1ipagkSQPxV7VUt7lRcsZ+I9l8UhjnsT5L9cZIyhHtHHFPU9ll25frvvwWc0joDH4
         AVqD2PzGxA9IzWrReususdv9twfFpPxLLqvJ7WxdWcDaJHFRY3cIpjSvNOcE3pTzGDdW
         2EW89A/bNqmwtVkFcudojAuMGYQfyFBMh93QqBOlvfmg0KQb9RX1CGJS5MGe6AocXFmV
         zvRF7vpUMl27iTytwyhjPbIMIOj2SmdUF+p7HyDIB3AyaQrzpoppz6ODMHFBLedHBsnN
         Tzb/tHcsAAIOn6qH5V3xINFbXftFrmjH3ogPNNTPeoKLa7ozdncSkzcW+3xcOkO3mGJg
         2b0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jMemwemCDjVQ/IRLCAlo5A+Uc/DpvQUIN6OnaV6i+nM=;
        fh=AUq1K2jiQGQ8IihHKCaABOLHE3zNVc20+6hbooKUi/0=;
        b=IamEUzzt+wZqEI4xgcBHXKNLqj613MN9AvDT7u/nj9YJIrCcj1KTqkpsnjxIhPrb+O
         KJIgdX/kPEVAG/ymt+y2IChD+MOw2pGx9vi2/Kpq2A9u6V8sAUNiosg/OyVCyZcSBsRO
         Y25eKYmzilktXH4WIzxu+cuXQB3RNbqCyP9UCPAV5EwiB8EfobSgK4wdGl3fPGmuw+Fm
         s3jIpLCvy260S1Ubc8sfdia4FvMAWlDvVQbDKPzAnd9/D+0PhDBx+YChwW80FcLXzz2w
         WlGehHYBruJ1/pDTbT4IjyVxmR7LbREUfl3riR9lAE+gl+oLtXiGOITPyXVMQFedPM3I
         EHPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791175016; x=1791779816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jMemwemCDjVQ/IRLCAlo5A+Uc/DpvQUIN6OnaV6i+nM=;
        b=LGJeDFSLZkI/vPN7f6LghCYPc/jKOpleFeaWKdzZDzdOihg8ozwKHvBFCGqzHZ4+Fk
         iudgg00839NrKv6mRHs4sGjUaTRZIP2J/zBqWcf/zxmzk9q/Eg7P5vp40rMFtDVBOHQm
         H5qEGHr45g/LpgcFQFJ7yGkQXfEU0UTu4twTSgFRcfcUFtFpX2U0tnPt3VTDyNENoxoz
         c8KtIhABRG1vheMUe09gbhFaM3ldigSRskHlFPoeLrPtyPxG6VwINfRNbTS9nKnIBWcC
         ig+rgWHidmPpf3Z/xlxVoU+PpD9BuoRY35M9ePkqTcL2TJfWz8AZRJUvr0t4hbElrfE+
         fWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791175016; x=1791779816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMemwemCDjVQ/IRLCAlo5A+Uc/DpvQUIN6OnaV6i+nM=;
        b=UcKBSFWoR6eCSA57XYzHZiUxnTiNfXMx0vI1HfQu0CPsqwNA6Cdoh5afytX4ncttF6
         K+2Z+gDrD5SVR3hk37bDHzdXLytcOFiMnj8/i7KoUVghO4eK53dz648YgpViMLM/cL1X
         IXpcfbY3+I/RRrKft1x8nS4O7eU8nLQJKQ0XAiG2/pyJ5ciwSs696UdsOAXf8vSnBOyt
         Y435224TRUemp777kVx2IdyGpEpATSOQe17pfZ7wSRfohQIeF4QtOn/3qHzOVBbaXb8k
         Ux3Dp5JBEpwAB5DEZ0gw6CgCm7C2QFkmfAKcTArz2scgaF5tLK9D3Tk+gEQLA+s+9k2M
         F1uA==
X-Forwarded-Encrypted: i=1; AKwUvByJVXVrXQQR5EstJLXNy4UR5BIKCwj8Ygc7cxzNAu0zaQb6PD1n8mQIvqaUQdsROMExFfQKV7VCyZY=@vger.kernel.org
X-Gm-Message-State: AFuF++kdMtOIYROQsvUQwVXUojmqsD7ew1t/GIFxebqcK8JxaPR2D0wy
	Io/J4QxOpVYgkSKX4pVnPicmKOG0VVeIjENUgbq5RuLnM51zxHyfXtXNznnnCZ5WQ85C9C55DPS
	cWGid5Q1fSLKOq+z9Fe0xUDGw2BzdU2s=
X-Gm-Gg: AYBFou2EPJm44af9XxBAyppUcorWxetFEtN5Dg9hsfXOP5RIkgUwaZojCC5949DUoAi
	k0Fd9G0yvzCOv48xorbr41ipmydIihzx3u4/D5lQt+HAZraDKVK4maEit3huUtHYHiiHj3uIe7U
	gA91nSin9XipmlPjzkajwSX17SyaTTuIjCP4AsTimkSuZ7851+FZLRPRwCzwzluV2UXrDp9e+at
	p6Ii00ab2WjJ5PDiaAJUZban7yLiGwmoUrJmR+pq5T2HSykMyIhbbb0qNMqp5+5cEVqwlxl8FaR
	5emJwkNhcAcsyBy327Es8URoZ83g/tDvUE7GCZB8firh7M+6vcEyyATU0SYIE5PohBa+OgO0NAT
	lxb8toGFsTHRTqKpyt+ThpTynGQ==
X-Received: by 2002:a05:6808:169e:b0:4b9:a829:f00e with SMTP id
 5614622812f47-4f529a2c191mr8446849b6e.26.1791175016138; Sun, 04 Oct 2026
 21:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005041525.49111-1-xinsheng.zhu.ny@gmail.com> <179117397560.1402591.15477443356899321449@kernel.org>
In-Reply-To: <179117397560.1402591.15477443356899321449@kernel.org>
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
Date: Mon, 5 Oct 2026 00:36:45 -0400
X-Gm-Features: AclHuK8AQ_fJPqH9F2RpLy5B-liqnS01GJJ2XrnacHzFOOm1bTKvMDyxIGNhDR8
Message-ID: <CAFGKm+x2563P6iwWwrJq1VaLJJEbodx8-f5r6Fe41R2f1wdbvw@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oliver@neukum.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I noticed this while manually reviewing usbnet_read_cmd() callers for
short-read handling.
This is a theoretical issue based on code inspection.

On Mon, Oct 5, 2026 at 12:19=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
