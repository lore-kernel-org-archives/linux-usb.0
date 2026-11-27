Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795803748;
	b=YjK3GURgLTtwMcLQYImbqG8zvOjFHE4JnMyQQ0pMJYigk4j0BSpLu8NnpeDhgorzcr4X
	 sSgJ/4B51Zklrm8Yd2ISI7aLB502g2hlCK+S+w3x0JkMeWDGN/LFJn1EiP8yqKMVGUiVt
	 3C/QqBZJdEt98tr1PAPqXF/Ob6hfusSMgGzWX8T5hsZKle3U9zUlQZA6JKtexFoCKMm79
	 sJZO/AujAPw/rUjYKYGhaKJiSuCy5x9ozQaCQ+XmZ9T5iWM8sIZlUVKcS7S4p0f+6eA31
	 3tKbJCnqdLR1nv3WNiKnsN2oOQ6hCzLqQzDy1HrPOEmDPqp+uR4eE4baByRJyse/S2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6LCryyAmqvskOoWSagwlvu3S6g6rSUFNUH8Nq3Ag0ew=;
	b=CqPM2woma5R0vQE9phdLnG/9bQk47I3fgQmXYgB3Ps4XMDhCYjpCuC94j3O2xaVT6i6J
	 5RJYh3IPd9a4d5E5D0O3X5LGcTxheuV+ZJ+6wrfUofFnu42tdgDpVcL+NSVPA81VlYtwE
	 oqTReXq3vbjPTehnNyA5BQwhktTKnLCwR0I97VuRYdRsnkHcoo9KpKdNeCcNPqQKbzt2Y
	 pEYI1PYLLfRpAoVlVTeq3NPwQm10OxbCMc+0e6Is/1X/ikQuHfHnPiiZ1CB3uVNU2i0gy
	 a6zDBFWSKIbVVLANCmNsT4c74Q5XrlWgYPz4hfnHobTX6PmOPddkgOQVRplh1plaxlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTzSIHqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A07606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 18:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTzSIHqs
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7d88baba78dso2329004137.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795803747; cv=none;
        d=google.com; s=arc-20260327;
        b=kmkJYvkpe3Y3Re5WnbK+wiVgbwnEnkstndqBCqxwh3LN9xbxaI6i+48LZBlCF/x1jE
         nkbSKb4Jp5tefnjcwVKJwON4EoxUgHk/I3pIDHPXyDXDAOS5eHaMR3isrzYV/c8uqRv4
         0O0vIMZSnTxKno1m5uG7U4GsCCR8gQaGXSmN1G9j9OfmfzrDDczKmm31zaqxeEMRICqf
         M8t48znH32XpnmEKQoJ9RVnypTk9XcM/YzjJHfrFT0Vd5BX3jNA/8MBlS3t0wYVpJpkz
         jmK4e3bb1z2u1WZbnWg+GqNruOWEwiWmF3otr0DOYlc7mIHb3LggjrOxuE3iUjblVzqE
         TJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6LCryyAmqvskOoWSagwlvu3S6g6rSUFNUH8Nq3Ag0ew=;
        fh=BDyC5qaubaIExBmHLPbd/ft2uJ2W4aSGB/qFeualf6c=;
        b=AB4rj8ThcLnRZjEEoLH3ez6BWu8cIPBYRCGXeDiUH5ElBLLmNueC5CbSU5LiUHiGTS
         6Tn54voYCYCUh0ZlEnVBhwL14ihmNnvQG1wTGLJ/sBwwImOJ5eu3ZuV/zy2IRkjQqsIS
         QKk1xdJWU7Kt69d7zzF/ImhkENsT/HL1rzUX3vnZu5A7KGb8D2/1dRhPRclBIlwGj5Sj
         pcnjAmxy0fROh7hXM3r9Gl1kq3LUCUUydvBDqwmFuetnouRKHZIGU7ok/3Z91Yu/SJMs
         GSlWMxBpzYxIjo1XxoRuIcXXp3HCrJSKNcez7he5OUxLxKvL/kg9XlVUV1N8h703McUK
         M5MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795803747; x=1796408547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LCryyAmqvskOoWSagwlvu3S6g6rSUFNUH8Nq3Ag0ew=;
        b=wTzSIHqsZ/Isw3xG+fkfOoOQs9rMaPLjGkOc4pIb6yZOqd9OizXP63FVHw6wiFmE4/
         5Yk2UuK39Wdp6hZAA+zJFwQdyn+rZ1d1dYNfmY3siUDdYwUkStPWL3aNmL5EXrbzRmkV
         d5PMtxOg2prkFCMYYAG+T60FuvZsmVlsxRsv/WQLM8Z/bk6SeVtxbcWgo3Ytw1yn4Z5f
         sbRFNx7d8lp0XFUgnpJbDGUEbnL0qm7IauzrNpEysb4PdoEGGZjMtpb9toQRfWp3R7qQ
         80MvdVinOpIcw9cpjTV4u/AD7cVDauHHmSQARofH1l7MF68nP07GHnPIPvAQAqApA8+U
         XgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803747; x=1796408547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LCryyAmqvskOoWSagwlvu3S6g6rSUFNUH8Nq3Ag0ew=;
        b=MZui9DqNEKjMc82aUwJcatkkeRRwZ7P9+qdEUflS1hXJ96TnzRuZgtfsxDe+DekzEa
         5soAC3hlKZVrbO9zMPQlX5ponF3ZmqxSmoXfWm5P4iskne1dU5OQ3gWYH11YTjQFKzds
         WTdTSIZYjLCTgXnIGYwGdOHDC6I5Dm7uuf0+0gcqTP2bFLEVgA162t3Eh4rJ3YGfe2xP
         0/JwFrubu5/yktGki4ZCXSAgXpFAufzyD7Twaah1W7Ot25xJTcRoaaDcimujHrGf9UrA
         ngqFevdyvfSYNIpcMaHkEygnCLm/iA8naxHrnB1glpjX9HSHVrgX0R0s/9WSqBsZGPwT
         MfYw==
X-Forwarded-Encrypted: i=1; AL+hErHAnpnq8BGlIVwg2gUm0KL41RmgXEo5ePx7BI7wUlpTzWvNVDs16juNmmTh6b4V1Dh3/Zj1uNrXfN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DDfN1Tctaj6+U3CfjjDWwBFrVEPAbKzyAJRj/6HWFqlqSnZ4K
	5d48LWC1DNIK/va1fjV2DiY9pmEqyeZGvlnTtofxrZcMqtx0buSvNLL0hRenxXsetDW2Dl+xRSc
	0bDnbRVNJsSJnphWSOIFXWTeQMTWxv1P6K1ba2nBGIQ==
X-Gm-Gg: AZFdTZcf05Hw2QChLBR49SNcvOfitztC5CqNs4V0J+q8zjMPi2OZMha7B6Rdc0hylMr
	MX+Bym4s7nTg68BrLkONcRIlCehWgNb83ikHNV6g2jJ7jjb4XWRferewI/osRfGUqTN97mUAmBj
	fUhMTUBKe9prW4574CMBiYpjQ/U73KJIHRjC6rTtz16zj29WGaBme0ftfEohsV+mQzSmk12ga3X
	9WXF0xhAg3ob5C4gXbwY98aDfrIxwBEgvlUKDJSLYjUsQTXWQoWbSXXQUAt9AiKfdyH5Z6ml+P1
	mUSHGlH/3MQQDTXwp3iblULr7NeB6iHbqe2WAxUc0vc4JbXrBvbhO2J55aKWyViPUFO7SZb5xP8
	rTtnaX5Vmvx3seaWVItHaT8oCd2f72vXl40FzNw==
X-Received: by 2002:a05:6102:950:b0:7d6:48c4:ed56 with SMTP id
 ada2fe7eead31-7d7393cc6d0mr14612336137.6.1795803746639; Fri, 27 Nov 2026
 10:22:26 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126232159.68334-1-artem122novak@gmail.com> <awkvNgFEHgBX9GhI@hovoldconsulting.com>
In-Reply-To: <awkvNgFEHgBX9GhI@hovoldconsulting.com>
From: Artem Novak <artem122novak@gmail.com>
Date: Fri, 27 Nov 2026 12:22:14 -0600
X-Gm-Features: Aa3M54qcaPJoraFS5xeCM2KAkZy4LXml-K6XaQT-iMStFyV84RU4AOEe8MmPCf4
Message-ID: <CAPufuhYX42uiiUtnsYLB1Yk=DdGBj-Qw34VD8P3M5DQx_VCbUQ@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: cypress_m8: remove trailing whitespace
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Johan,

> Don't run checkpatch.pl on code that's already in the tree.
>
> The exception is when learning how to send patches by working against
> drivers/staging.
>
> Johan

Understood.
Thanks.

Artem


On Fri, Nov 27, 2026 at 1:20=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Thu, Nov 26, 2026 at 05:21:59PM -0600, Artem Novak wrote:
> > Remove the trailing whitespace from the else statement in
> > cypress_dtr_rts().
>
