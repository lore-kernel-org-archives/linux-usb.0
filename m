Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E59420471
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042169; cv=pass; b=EbspxDWVZe1JrjTySD4a56jGK4H1MZ91fXmW/AjpcveIUbIzTEjFzEvtNVpEUj5LKFbsJcOYhDMlKK+Ma5VOmxMkhxe/E9vEqYUqDBAwKCsuNaZe7NzIXQUd2tyVLnnVeBP/Wa6TXBi2rFEnQ9xLHwKVje8LZwoTy5ipi1KwI+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042169; c=relaxed/simple;
	bh=qW4ERuNvK9fgZg40AQUcFPxZYw3NJz6R1VN9uER0cuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zf7t5UYFZ7V4ZTZCveKHgwGzCaCv2usJLjv/SW2lmu/sglEPJAYdjAjh1Ws5MBIK7c5UrAYjv2i1kavMzYekDydre/ocevNc1GTHWWGvSDw/+d+gz6FVuX2NXZEQOcIBDt46juYI9Q9AwflNWtDmrPl+bctCRhlKDpn5tFu9Eao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PJDn54yH; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJDn54yH"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so4229362a34.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 01:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787042165; cv=none;
        d=google.com; s=arc-20260327;
        b=lzhwHaZQe9fRQKx/0EW52BMEMIzbfhrZBjYLnOnE7wdO8ajoYDAgbuWxbGyC3hOwIh
         d4x5UykODwgJ/3lg6GVrzR1Di5O6zV0ADbNPRMH4vmHqXFCGK5lw+0pNmboMLLE2E2Gy
         xYG7R74KAGLpe0WgHrEx78561G4VKZ4fcW6VLcpyPMFMN2W7diDK+nJoe84c5CzVEJPW
         1lg4a3/IXO6rTiw6bfXONA+2M5LsbiSI9H65uxew+McEIxHD6BLfHW75zKirmKwOZqcY
         a5JjY/HU/91QJVCeDgLi+5XJ+6TmSnh9BhEGIMZuEgUucMzOw/oO7SvRQx1sz8M+/f6B
         nfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JpVDHozNTGP/7IjLlVpN0Zw4A7Wgx/MzhAMSS+fSqo8=;
        fh=Z1I1pYT1r+0hOQQmUQiuIRo+o6RQvvhTQBQ2clWviQk=;
        b=SHb7qjfSN98bkJlWXnaUDMghymoYT2ykOe3/6ThgDMElwcSLVG6NXpn7Qr/xJWCYHE
         rzpObImH45CGV+dMZ25dMROXcRf9W9xQXtxYLWwN90MqBOIQDYjFxRYkOTzxP/LmFlB9
         mYF3A8T+gJ6sGKxBwUfeqT9A5edspgnJHHatgTdIl63YErbPsrH+RugTC/x3d+kqMu2J
         7lDoCaZLHlXFlb0j49PE4ROjSYofooEHhonJ58h+FyYnkdIxVLyng7RB1Gt3urk5lf7m
         7+iIKOJ4D3SIfo58CZszFSMOUxfrZ6Q7EWU4ItTIRi5pNwDqapE86VNqDvw4G7mSqgeC
         9NSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787042165; x=1787646965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JpVDHozNTGP/7IjLlVpN0Zw4A7Wgx/MzhAMSS+fSqo8=;
        b=PJDn54yHXHjGhMvyFDqW4ig3IMmMVXy0//4gNrrXntG1y3aabavMUKcR9Ux2F2uQ2F
         iwKQaBt93L9lPW7rFwxRSWisbtOEdt+e0UVN9gsat/WI/6pIx3eG/gikmzVVXTRSyRay
         RuO6pxhAeDsoCI8fzT5eafSz/h2+SMkK6eXA2zpiZZvjcKyS2WLTul1T3RZP+FMukQSF
         GOZu57lsRGLv+Z9B7YcW9eyK1Iour+lwz/RpktWit1S81N5X5PUAb+VYvNIBjp+Qqw7F
         aHjMrVO46TiS36u0zCjw830CWIFJh3q3BRyO+qM7H0+4NqXTX9KyBtBlhNWXiqOU5sME
         NI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042165; x=1787646965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpVDHozNTGP/7IjLlVpN0Zw4A7Wgx/MzhAMSS+fSqo8=;
        b=LBiaSAj9t62Wm8JZ4zPiS6gLpOIzDBrunOHIsgD7gZcZyDS3b8aUq0CgIz5VVI2fJ2
         kAQukmA4upAJJJxOcVmyrOT1dq1AUj+kmmDGb/5erwymqx2Wdg+wuUKuTwjZvBYoruVl
         8aC59POu5FCBwxEDWr2cgQBATJvIDGGuv69gm4+BNjh58crUOKBS8LUF+Uf8NspROgBS
         yQQeC5sFWdIH3SVIsG2dSfeqtriq2svawnI7JSq1uXXkqbU1zifGNDv5utr6DEDIiR5B
         Nc2TC15/ZuVQ/EWI+yJWZF/JxOWlzc+GFUxzbhWen3NKJ99yzruszohNP3ao4kjLTIJq
         o+mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYl4wS+vb2iMu6ecsNoAs2CUfq82tNv2j1N8ZaDv6rKamVBQ6iZ/pTl0x2SJRyJnLD0hizhR+8uDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjQe77xGSBxr1qANbg5yTLc632UN1G1lNMrf7595u75z6DqtOv
	rswsBasOhOlpxPye7XOVB22ZS+E588V9st07ZYUVMNUoQ46Bd30PTQ+Y1xilrhbSXvlxBdLavUU
	nha8VkiJThtIDpd2xM6cxkPJeO4StjimUaR2hleMI
X-Gm-Gg: AR+sD11CaByTydKrERcaMs/bbNZ7yiTtl+Jw5XIMVXAk6GYX/3zh1ZcU2N/BKf/Pe92
	nuSOPUX77c/cTn7D7Aj7QcXNDlICvpxUxHuiXqhjWH/TMxHZPGFA2Xxs4Swrp0j8qcrPWqxJxtu
	JCcZV9yv74G2DCff0CDWFXwNAcUbYzatZa1IuxBWGNiXvK6zwR1l5CuWE+nlWBMXGIERPcjDVXZ
	plkStPkRbW4QP1sq0UHjpAu6Qn/uXX/ofgD++SxEIENn7GGRfTXBaYj5AhDp8cFKPswQWv8lBFJ
	w9SoYkbOkY9ZaUYjE6pb9mBtJko6aPBHpvISg9v7NUz3nt/7PlBE5nunue19NFkj4KqPuftg3iA
	zM4lVcvUrSfm+1j9nYXmgiVAue28N5t290fRDL32R9UQBOXI4rz6gvcmjW4dUGKUGh8a+J5EbME
	z0ZHmScVB4m5H8Nk1VJuIzZmrd
X-Received: by 2002:a05:6830:6606:b0:7e9:ead3:4449 with SMTP id
 46e09a7af769-7f3de4ea586mr32399234a34.6.1787042164534; Tue, 18 Aug 2026
 01:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ee41fbfd-f368-4a06-95d6-ae9b4267fd82@mail.kernel.org> <2be6a758-c34d-4040-9c71-eb929b379fcf@rowland.harvard.edu>
In-Reply-To: <2be6a758-c34d-4040-9c71-eb929b379fcf@rowland.harvard.edu>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 18 Aug 2026 10:35:53 +0200
X-Gm-Features: AcwNN1Xm0pPhGVSrbku0E-V59s4HDVMB-_AqrxIhRvuS38U41gk43KckkL5Y7Bc
Message-ID: <CANp29Y6EGSUYZP7om7CSnibob7K9Ys8Xn06yQJhEuGKWqCc0=g@mail.gmail.com>
Subject: Re: [PATCH] usb: gadgetfs: fix use-after-free in ep_open()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Deepanshu Kartikey <kartikey406@gmail.com>, USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Sat, Aug 1, 2026 at 4:13=E2=80=AFAM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> Deepanshu and Aleksandr:
>
> Have the two of you seen each other's patches?
>
> https://lore.kernel.org/linux-usb/ee41fbfd-f368-4a06-95d6-ae9b4267fd82@ma=
il.kernel.org/
> https://lore.kernel.org/linux-usb/20260731230603.4637-1-kartikey406@gmail=
.com/
>
> For what it's worth, Aleksandr's approach seems simpler to me.  Can the
> two of you work together to find an optimal solution?
>
> Alan Stern

To be honest, I don't have a strong opinion here and I'm happy to
follow whatever approach that seems reasonable to the USB dev
community :)

If any changes are necessary to the patch, I can resend it next week
(when I get back to the office).

--=20
Aleksandr
