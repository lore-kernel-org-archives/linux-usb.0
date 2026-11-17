Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917839;
	b=u5pOVSEpvTml4sKoHpuamVnhWML4Xyb3MCypGRCp1KPLrvDgFa7sDuTbmSVZ06xByYnE
	 6M21pC5nzUJsC+xT0iqtL/m3+GLzlJTLZpCcC+g681ep3a/TGJTM0R1g77Lg0okhGINXL
	 8F6BT2Ku37ZJKUQFGvVYfeOuWAJEqshre01aJQNPKYp8lpY8XN5P24J5rQnE7LY9Ew3kf
	 CP7EFO4rc2ZIrinJaaYVCiEHb9j0gI2ImZ95Ch5gYTEijg5cN9sds1a4L1sb5eWk74xC7
	 JBHG0mhVREY3FxCtWfb+HvQpFkgAYezsb/0j9XdR0xKzME7m50FtXFe5kpgyIoHLSng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nU0HNOJX5cxVhUM4H1v4s7zyRGp0x3z7E7rePfZOJiQ=;
	b=uusOcM+PabaS+NzZFhA+OQWTOH2CbRGIhp6lGLc2RHyRKFjsc8NzRa2QKSfunVYWtWW7
	 i0yUKOnqHn3FXc+Q9gvvek5Arg8OwIJU9DNdxtw4XIZiFdkEjOCZc1CMy9NDVmfDYrbSS
	 aiX0ahWQ/uNJ3ls6MG8IsKEpdQ7U98UtXVzJLCH3GWprIv8EJJl5vQvwVRQYv7aUPByDU
	 bizF2QDMiVslI9ZmRV8fSMk3NCEWzJcFjlcxL+c33blJTpTDUHV4dLCoThhE/OQkRevxc
	 DXsOhJo9tPhqxNhIFkyIwqho7+DErwCZ4gaRZiDniDjkyVwJiMT1YJb/HU5xqZo2eLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBfwRgOR;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53116606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53116606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBfwRgOR
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c45551fa84eso853220266b.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 04:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794917838; x=1795522638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nU0HNOJX5cxVhUM4H1v4s7zyRGp0x3z7E7rePfZOJiQ=;
        b=qBfwRgOR128pvEdXHm0a3UQwhgEm+6Ls2eiPpMOBn60nQsGZynyeqWF/DgvOR+xjuB
         HnReB608vVEKzJH+4gkl752mMfF2X/M0RK8Eh6jmh891p695yqoc0KgGTT7S8215k1+v
         2rhfQS8iaK+K9ldYbnszHLxIdWsftASol/modurz+1tbxEIiYTjAUg2UVeko2MR971/q
         +8iH1hcWvmYjUvovx4Mnabt+E2GfCZvKRl+0f/01tWZKOB2Civ9cg3lpYKRAU2cJH+e4
         fj1CP4mAoQtX996AcmBcRvdO0zb7MheUMBNRfpkuhBkfIumsf7RulWjXCpk8238GHz56
         kVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917838; x=1795522638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nU0HNOJX5cxVhUM4H1v4s7zyRGp0x3z7E7rePfZOJiQ=;
        b=sRNqe5HQrSDKTI06tC4neDEmr3xMWuI3/Jsyo6/blyW9o63s3xW3zF6H/s7zDK4f1k
         zLmOdJJHByPTjr8jevZKW7ST5b7fLurKmhacWR3Rz6NoqAMR+jcO1CQcSTtbzyQkj+36
         9+c93U0V6pnbrQX59f8LxNIWhPEx4t12sGCTvBh7jQDZXJ48MWXZWji/GOfJ0/vDIUxw
         ODd3P2fko9mOeEY6vfvZYIqjbbz7+kuYjT+KVqF6FWYA9Z1+dEqilMbttmL0tHET0Fk4
         ZcWf5Wc5NMPz1xuyYq8Uj/Kv1Io/N0M236IzwXEdwP4jxvI+uzPoFcBZ8SBcb/2bKzFN
         ncfQ==
X-Forwarded-Encrypted: i=1; AL+hErHE8iCNhtvnxciC+v64OSWaTDCbBG3PsJ+DWvzL99NnJtA/g4VrmQ3Gvozo5xb8aExy6vdSLj/jLKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C2B6Jn96xSVVqbvCLgcbP3urMs59YyyuwVq8M36GOwMj6ZD7X
	1s0cqUcx8RSvgLn+7i4GBI/TABeW2YAJPaAJZrP+NNyvF9jrUoOxiChY
X-Gm-Gg: AYBFou0eOTcVuvix/xQOh4YZYlEqLEEs29TimRrQWH0bjuo3av5rNphCqyErBsZLcpd
	Zh8a0cL9GHCyU965ryU4LmDtJ4rze1M3DE4IpZ9d/76D/67KbrUfs2+DLgIrCUwCxqUJSPoV6Qe
	i48eAo18rMlCItwEhBbnlooUJtTvmOrVoS84LfORGb5ICnY0FZC8kxg+0tqqU3B3CZvKqhpG41x
	AsXqehi+Fp0SqmB06ROCQxl1YUM7P1aouijtPZic/2SQN57SHI6/3fj1FtBGOkRvZQ0yHCA76wB
	mrTS0DlcUUO5Z4EV96wNzuPTYOY7pmJkQ4rfpHNLt2T/eqEaURGx/7D/HQmUMk0KQc7bPsyDY0b
	ojJcqVvm2+LX467FPNR3v6gZMDAr2wHVNWnIikiIS5q8hk8PvOo9ExnUHdl1V3jus8Qa6P9NoCe
	rjwFIXoKcaXGWryJy6z5sefDyKbw+SJW8fVUbPEI0IBf1BJBwXS47ouOa7uAnHMVOQjmHcg35Fc
	1rlxE90zXMHSlCpCJLeOeQMUNytsexx0D6xhMngM1hkGzf7E3PEvrobjc9RSDU/79v1L7jnNYTK
	gMQsqNmDHvDh8svv/pcpIvpGxuWLkEY18vXznNUV1TQxyX2o+RTfJ3PQmj03Q+1N5lRpYswdi9I
	ADCdgHp8+ojRylOiwZKAIVg==
X-Received: by 2002:a17:907:1b0a:b0:c50:5e0a:fbad with SMTP id a640c23a62f3a-c5096430d02mr1128651066b.39.1794917837477;
        Tue, 17 Nov 2026 04:17:17 -0800 (PST)
Received: from nixos-macbook (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50c041600asm353859866b.10.2026.11.17.04.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:17:17 -0800 (PST)
Date: Tue, 17 Nov 2026 13:17:13 +0100
From: Jacob Procee <sn125164@gmail.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <20261117131713.2db5294d@nixos-macbook>
In-Reply-To: <3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
References: <20261112113005.16418-1-sn125164@gmail.com>
	<avw1kOqmrUii-msr@black.igk.intel.com>
	<3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-unknown-linux-gnu)
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

On Tue, 17 Nov 2026 13:03:03 +0100
Sven Peter <sven@kernel.org> wrote:

> I suspect we're just missing the proper suspend/resume work in the PHY
> itself to put it into a low power state. Or maybe we need to keep an
> additional power domain enabled so that the PHY doesn't lose all state
> and keeps working in a lower power mode.

Agreed, please drop this (and v2).

That second option is what happens with wakeup enabled: the dwc3 node
and the ATC PHY share the atc*_usb pmgr domain, and it's only switched
off in s2idle because xhci and the root hubs default to power/wakeup =
disabled. With wakeup enabled on xhci-hcd.*.auto and usb* (Asahi 7.3.3,
j314s), the domain stays on and a device left plugged in stays
connected through s2idle without re-enumerating (no "xHC error in
resume ... Reinit"). Asahi's pmgr marks these domains
GENPD_FLAG_ACTIVE_WAKEUP; mainline's doesn't yet.

Wake from a USB keyboard still doesn't work: nothing calls
enable_irq_wake() for the dwc3/xhci IRQ, and irq-apple-aic has neither
irq_set_wake nor IRQCHIP_SKIP_SET_WAKE.
