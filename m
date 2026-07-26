Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF40355F41
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063267; cv=pass; b=IR/RUbO+mCDyB480vrUqH4b7+HeqvJ1EwYS42qJ0Ds4aUoLRXy41TmwUXuK1/iCPk7fGGwu+ij7ySQqUcrw6Kjf7Wiocs4XbId+A57+pAPQoaB0xFWwHAtNqT5ry7Uyl7Iywgca+ld6dhtiNqzh+JlAsh0NrLHO0vaHfdQKtArI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063267; c=relaxed/simple;
	bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZohexHvVONElDpiyQSAqHS45EjMvOC1LGeaDSCXgrjtDl07ZhJEkzeMl2M4OmdiCIImYV7fAkzjG91+94VAZpxadZDfHcsADCZsyBy2FNjlylU1aMpWCW9WFUod9iCf8j3Rl4YnvNcgg9w/WBOxxznCFBPJca5BPpqkKDtwXBBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dvpv2ol3; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dvpv2ol3"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1098823a12.1
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 03:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785063266; cv=none;
        d=google.com; s=arc-20260327;
        b=SDV3DW/s8/py0P2coQiuJWtN1VAlZQwPQMWfWD689AdpLhiRRAcHSH8GrUQ4RmOOHr
         VNwWQSjd6Z1+LRkrfnc4B4EibO5/ajNpBE7uvyhQI6z/Z/MS43rMRs3JPoV7hoXlF8zo
         qk7Gmy2S3eX4XvQL3QvQ9UUufzIvdZiBg/DWOLGFOS5GhUlLxDf6qylyXsEMeuzkDXNd
         7AyChDSrSV09CerAK3mW+o0wmVzag4kQuiWGYFD+09RKZpig+WbUdV+RDSS/vpW31zU2
         jGFf/RkdHAthdck95SIxsAmhw/LvDynFUaA8HjEGcYiCf1rfmyorNSJnJtWVXp0t7F9s
         /eSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        fh=0gUOkb99zZDS44YG5/7a7qtBVUpqoUEK2LyVXTz0xBU=;
        b=X0iw8guOMPmAgnwwoabDAqoZgznRIU1A9zqHC18bwz5N0NZT8AqAVys3iYGKfwXFUd
         yRvZFIzKK8JoynxejJjMAJsIWj51HYo7YROIXyLXbXfnb3UElRD+gZ/v8C4zi+bqnH//
         aFhzHPSt6H1H03NlGZEA6aXftdFUly2Kfj0rcdNONAWg4xt7ILnBX0ZKpr75dAS4qr2/
         9FB7Pc6hXQjzcFmeCB1Jwee6PXTgNJZ2EKc2MTrmeiV6VJmcXZi0EgYzlV8UeAQm6xOC
         OJTBZ0hviUhmDnX59mu2ZkSwqHzrcVBWvCGFq7qTJdSdLbozGjCDgZv9OSDGpz9JJDZ1
         UxEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063266; x=1785668066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        b=Dvpv2ol3gARkoIB9UcQeTblO9C1suXXD5K6j2neVIym/I5hSAZlqwQL5v2vjOD4O2M
         9NG6JlGieKWNZyTtPpSWqLT4v0xdA4egzED+rPp8omqS1McUmXTfJZEY3U0WTEbTVfmt
         MP53Lf3RrzMlMlm76Y3ya0RXlJSRQnwvi3oegwzmjx1uU6XXsu0mm7hVs+t/h4M/BVAx
         EuY9B17ZQlYQUrS0Sm3a6ErwpxkZIKSa/+6e4VI4lWbSdiXArkeiv11Pj+QZN8TAPhaS
         6Uf642mGc9VUzor3mcI2nOPnXxkVA8iGytd3v19AvBPm2fi+6HdqNq6FwRU4Z7Cx1yYJ
         6SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063266; x=1785668066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        b=jm6li5TZEuCvwcvjmJpWRS6yKxn7uRyc1g0mspY+VNG588HCc8B03bNhfd0XfcwcyM
         wqRiF99qZhL9O5FwA5DXHBooYIldyWRW7m9DqMf+DkLbTqRonrWRoSYZjoqCkLOksRFK
         vmIgEBnIL5/S62UrR/4s0KDxZTSVCXEIw0XbN/4fxQ3+hlMbCntwBkUQq+QWUI23XN89
         j/gTwjPJaPGrQmf9jJiSe89YHO5Aj6RXsPmOrai8btEUyo6AEQeaaWd/3acDwLolQM/3
         N4mLNKuZp8CeucqgEoIk3FQ/Gw7N9yHUTjFOHpJILZbmK7+rJpHR/VFrli7LB810qtrm
         l1EQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaVxBsL31L2VM1raST0mqlyHRGH6eVrXL3XJQAPF2WSyyvAkSL7JMwN7WF6LrDZDplU49XLnGQ1Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIF8m6v5XzP3Z8LAi7sebK3SYC6uOszH3dJ4FMumnjwKZ34N5K
	uU4QvWLLleARJAn7kJO8vdmemDc9S9L4cVLw25ckGBkmQOSif28DOnw0CHNQrsG6NKk9ByCmaNZ
	oRKE2ljor8+pxtMj91SReAOIFRtLhCfM=
X-Gm-Gg: AR+sD103VezOTda8BpkBH2gqSkgve2P7F+48CmEkNP23SX0Nz9fELIAI0KZ/o6SW2fo
	X8I8FWBRjrri0JBzjZT3YiZcKRj8sCFiovgsjToC1PaidXsP8pVLSg6Q6bLr/J9PHBb+Gv4xW+N
	BHnulDqLuC33dYMoSzqzNVeF2qyeZ+w+dIQuvAIoeGDwncGC3wSyyqGVKxL6/EWXoXWSmLXw9Yz
	I0hz1t2oQM7p8wphffEG1xmNc5W3kGg8wbdr4HjXgjZfYAY17aYHZO3XfBf54/D
X-Received: by 2002:a05:6a20:918e:b0:3c3:68a5:50c8 with SMTP id
 adf61e73a8af0-3c67e166966mr4554741637.71.1785063266062; Sun, 26 Jul 2026
 03:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
 <20260719-usb-ptr_err_patchset-v1-1-85f7f2e4fefb@gmail.com> <al4zFG3zCD5FJ7eB@SMW015318>
In-Reply-To: <al4zFG3zCD5FJ7eB@SMW015318>
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 26 Jul 2026 16:24:14 +0530
X-Gm-Features: AUfX_myX_j6xmvi1eW61hYxH97YPNgwMZ6bNH_j9w9hal-EVFSbaRcZHMpkAmFA
Message-ID: <CABfayGP4XpfqrfQ3qWz97yLTfjqwn8xXwW9WS2g1_vceS0srXg@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: chipidea: Use %pe to print error pointers
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Duncan Sands <duncan.sands@free.fr>, Chas Williams <3chas3@gmail.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Hans de Goede <hansg@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 8:09=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> Avoid use words "This patch", just
>
> Fix coccinelle reported warnings:
>

Sure, will follow the same in all my patches.

>
> keep one is enough
>

Got it, will do.
Thanks for the review. Will incorporate your review comments in the v2 patc=
h.

Best,
Subasri
