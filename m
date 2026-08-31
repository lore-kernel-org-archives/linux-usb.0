Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B565A3A3E73
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195635; cv=pass; b=B39ZYiGUx0+Z9IngQZaBVd1Q86MzG0XzQw76OfyMyBXH6U3PXLgk5ov5MX8gSB4jCu0BJYJkBy5dpe10wsqbSAAQrdEaxUSTzl9s7+Z9/lbQtqfkyQWDt+jN20Mo+CG4TNUz7bqeuvXLbToMCqJyHAM9olyZb5+0J2AnQ4vzeaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195635; c=relaxed/simple;
	bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0oo3hhQ3vp4iXCnQo9HJEV1Wj3t2MpeqlNWowya+L468eEZxpsaEC18CqeFMcCyxm1UTZhiKePQ7RF/6ZtW5Xa8oU5/uSk5CwV1UBLPDeg90iG9f4C9X32ilIf8UvFNeCesCDI1ymTG5V+dZUSyoph3hsjUxaWEgLfb2aL6VH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e2dab83eso110107366b.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 10:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195632; cv=none;
        d=google.com; s=arc-20260327;
        b=RAKvKWAzCxJ0crC+NxzSbp1UZWm0I5WcfAd5gxjv46PccyoL6vxLd2+kOzRbYv9DVZ
         kLwBbSONQgd6Xq27qCdFYURyz2twrNvURSbcQcpdAMMop87DpEI1hE6PEmjB1NZuVmN+
         GsSNXGRgcCLDcI1rX4aETMMd08utPK29zTONqQdY2wJuoqMeVWbBeiiwsT/pZYhxYWYr
         Z6ucouZAi5oGUrYTOTkxnKaCh5Ft5qPk9otGmNbDs6GUQn54TY9ikwdAaLe1PNhdzv/2
         UzSiNjmjNJq10J0S667DAx8XQwe0n7aYuCgRr8qcwASLHP4TOzHmwxtbW7OYkQVQrP1j
         Mkzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
        fh=7eLjKG6FOrlOWeXTkzZq2gvQh4+bJomyCEK8DjHN5wk=;
        b=T/3QCPaP5bW55JalBbX8TBXl+iFQQzXhpat4gUVKG9GrvySO9yUc4L9CYBK8vwIWb0
         fZWEmqeMoXb9Mqsa5YXXh0hb4wrUio0iGmC0Aq/PeFF7lN0b3m1awrS/WS8J18gqz+vJ
         iZmnIkNiiu2e5tOQuBmqVPPrCuWX9QtglwxPzuYYgmOVMoI8rFfU6UwZ55I3mg5I19Gk
         QN/FJpLwgWPYxTl5VbwOqU8uHaWAsZ4wmpU9w+XZ7gaiATW5X51FuNq+aYzUHU4uqxNR
         CrhXCaFKQkQBZpQxHIMHNglvT5h9aVZBKz1ZpAhns0cW7rWoBXPP/f1Y1JHS+rX331xs
         Tvvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195632; x=1788800432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLKSGZop/RGG8SYzGMFyQDakC+1a5r9cdIsEn3XpgII=;
        b=pE+lvr6wEatoqNpVkFp7AxggQN/t/KzahrKYas5J9KZBrczgJMKd6tsjROPs8ME4St
         T1S4DPx4RPw+tWQZeEv2km+7HWJChFHd4Gqp21ACdNykrDP0HuEYK8Zt5To6bkrsgD0a
         fnvtRnKC+I1OD5yKV78ncnF+oDuVePCPb5iihaWJ+d67C77r77Q0hqzwtQi0PyMS45Xv
         JtdA3PpVVAGjX4p7LjaRgNxJgQa5FdPT1w6QEgnQT9F7zVbiWPbfl3Aef4t/yCnwpdsg
         kifs2A7TnGOIPb9iyZJaU/RL9bcBHcPC0Z+prf/esJ17ogGNu0MOJ0cmaUJf7/aYTyUQ
         s+hw==
X-Forwarded-Encrypted: i=1; AHgh+RpS+H2Lijsp6FED/tCPTKuU+EwZJKYKfxxcVijriqHHmmE0rGZBa83quaZyhLe5cRt04XQkFARTi1w=@vger.kernel.org
X-Gm-Message-State: AFuF++kffwH8KZbv98wFVQB9MeuX4geO9dmXdmzRe0fZMbgk6DNd4CG3
	jiGVYpIxwhWb8OLra+4dxi+IPcqLh6xCHvP+6C6mrHqCeXK5kaW+atYb0gTEEWGa07xs+0zHyRf
	XVubjAIh+ukc6AdCrdh5zGN3icbwkee1Nb5roCTD7
X-Gm-Gg: AR+sD13/8x2cFPdnIxgvorIabb/cf00+Z6OaQdLFItt+Fq5xUd/eMom4xEBhWzyNXMW
	5fEo6NUBJptBK9yqeS15oiskAX3Uwe+ju5jJAStNcFLeOXvAXkgmV0sYr2CcqT2/E5B2pq65gCb
	1z4nqcnnYXi1LB+L5PXWa6mZg+YsmSpPqCNidgmVIoV7NGUjo/BKSv3z+aDtWo7U4picSXoxhR2
	1G/ycatU7ndoOCNohWRuv4Uo2bLY3d6MXhpIFa0RK3McLrsDo7u/6XzBuK6ppsyIPqlgjxPk48T
	stD5llJw+J0rftOeY4S2YwhA7/jzkFQxQvtL9avkXsjt+L/DbUTafDc1zvzXHbI3FwAX75Sxuwe
	FCZM7pXnqq6Kv8k15OPimnAi7ET9PRfjFf2uUQZvw+fVs
X-Received: by 2002:a17:907:3e04:b0:c1c:2173:d412 with SMTP id
 a640c23a62f3a-c2556fe9307mr1660123166b.1.1788195631588; Mon, 31 Aug 2026
 10:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
 <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
 <20260830165934.34e5b82f.michal.pecio@gmail.com> <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
 <20260831053825.11f1007d.michal.pecio@gmail.com>
In-Reply-To: <20260831053825.11f1007d.michal.pecio@gmail.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Mon, 31 Aug 2026 19:00:19 +0200
X-Gm-Features: AcwNN1XNg3dD7oaXf6xtHhi299wPsa-ycc5jfTUXGnyaxivHR6JJ0HBY77JeeB4
Message-ID: <CABUBpLdLUbC6nj_tKKq4FFmoVNGJ7MnAhE5=O_S4_fnP69jHJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:38=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Mon, 31 Aug 2026 02:58:55 +0200, Matt Eaton wrote:
> > I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix
> > the issue:
> >
> > commit e3d757dc9257
> > commit 042aad8d0db6
> > commit 7e0ef4332ed9
> >
> > There does not appear to be a need to apply this patchset now. Thanks!
>
> Great. Did you try disconnecting from external hubs? This code can't
> detect that, but maybe it's not a problem case. It wasn't on Renesas.
>
> Out of curiosity, was it limited to USB 3 devices or also USB 1/2?
> Disconnecting one device or a hub with devices behind it?
>
Tested both cases: directly and with a USB 2 hub (no external power).
Disconnecting the phone from the USB 2 hub, it didn't appear to issue
a stop endpoint command, so I don't think the condition was triggered.

Cheers,
Matt
