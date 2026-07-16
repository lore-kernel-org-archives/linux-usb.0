Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03143383306
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 04:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177955; cv=pass; b=PMVTZQpNwWE90SIDOz5257Mi+LEZg57QWOflYd3lDIkmt1Bfzvd85/vz5rNmUUlbsyH4DzrdhnelfPLqdE7V33piGsdxeDnC5Qq1X/5bHlvCX49DsyvKTEeVXWhugu7TECCQhIL+9ZNmT508Enrl/OZBGO7VfLQUWFZhnQthgHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177955; c=relaxed/simple;
	bh=wYBaQ8XwVTIMSwIIpuk8mhwuYTe+2pxVToi3w/umSE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COFQjECyarEpDjpZVwHmYcEYPzr9vNMXwlFOlPfP2ItDXMav1ZhMvaT6qWwPit5qcwJsYwDU84xf7A0AtAF9vrbSb6qhsd+VNa28OJsbYkBdKCDv2BUd47HB1kc7En1Tn3WFARqq48WstTCrslVtfoAT3VduXqSghOuMeyvuLPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lORVSP9i; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lORVSP9i"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6626b5ace23so327957d50.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 21:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784177952; cv=none;
        d=google.com; s=arc-20260327;
        b=TCEB1nWVWFZn3jtoTFt6Rw+4Wt33D6u0BhhxyfW0DK6IubuFh/g9wZy7YJ8Pj15sNL
         w4g03vo3P8o8dlRpoSaLIt/j78HyzE5o3PkxPPGO6CkkRpA1CQdXrulil9JRd1aOY9Z8
         Fvc2MzF3HhNUe/WnxKxIT6dLLznccaE8LnoBR5lmyOzE3RZQ84PQVfEGXcpObUGOfL+4
         cXxgXLHRti774SlyY7RkY9WYgKDOru2KQ6y/qJqUV9clIUG4YJHTd/yAFQc6lQoadSaj
         7b98l3rRsg65lIUi62VN/tXP+Wlvvdl7i1PLuXUcvRlLoGLgXegJ+TUVj3n7eSYWYqSg
         hNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        fh=WFfHOt93sB1susESKiXQtPgQVsmtRv0HldskPVg1fXY=;
        b=LuT8qHSPOTOaaexNCSzm2c57BBeER1lWPGXZ5gAsnkcCvtWh64fsmS8Uh3HGNl5Qyk
         UrmSQBtuCAYcF3XqaNgJVCZNt98Rbju1laBjE3sMYwy2bPH9v5rvWCahPtvj1FY0rlaW
         TSTbZHtBmfhPCYYpQIsvopF3lapyA6weG4b4EtQhSYW3lVqhK0oGwXLeU5r5r5cIe92i
         GVhMTas8GzSQDAMYC+Q17L9yBDatKZ0uGsbi9lW6Bu9RfRnNfgkjFvr6LDfNnzS0epNF
         yLohbgxqBbm2xGpyoB/LxcggehXEPy8Axy8UEEUZpPna9jfUbM+PstQF5FEFWSS/8rxA
         ToLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784177952; x=1784782752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        b=lORVSP9ifVJ5Czr3v+5Isv3jhIIjZBkC9sryjLysjdwkMBfxclWDa71JGfz8pk6Qnj
         /40j8/WK/P7lXw/XIIdMVyklagrk3ZN7bs2reZkWjyVV3khmc0R7jzM/2S4AIymnmSci
         f7WcILaqA3AQ9U6ita7v/9x/Lu54P3lIoVsus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177952; x=1784782752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        b=OEESy+eVqWuOxV9a8s4v/1uQUZMBuvVJtySBMhI5uxjuxhrCtS9sShMF64FSskJCgs
         77+xwzz5Kc2SjSRR9RMwyJgFNGX50voyP0SxKx2xEWegslyM5AzfSsEg64S6MgsgEwe2
         WqWs1C3PPH7bOHTZtcot/Mm3QgzjH9zs8xfOgZcn4ZePBCYMpTiNKXgeNqgY/uGxaqiI
         DZzsRV4dXtWmkmrABnTKLLElGZNgC3nX8w/2Z778lmBtVZb0oyoW8rzOu7YbXX2csCin
         xBk+BqpHupCmPrsNndS28iYUMJvWzQk9jqFD91kXU2H0vCuGLkU87gZqzopH5RuPpEY1
         NrEA==
X-Forwarded-Encrypted: i=1; AHgh+RpBIm46CLoKjzkCMvSaIC5Uptjcr6ySB/JWxkOHavf82MO5PZK9eSiJuywxOoZ3UatJgl+TUk1ZmlE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+h0u2Mo/eHJoJ8x4MJCSKI51a18yitzBTAmMJxxLv4m+oKebN
	6LmkD/epguCpRL7qS6SvhdqRCf9WwxH6FcI03wpfMk5WUfjIEwwW/NI7F16mVO5kvFhJfVqNTH7
	WvxTGizntvDzRg4adYCz3MT78UvxZVi0vxF9/Kq8/
X-Gm-Gg: AfdE7clRLmvxiJo2cuK3G/9lAgQbtma0SQTDGfQi8/troIHt5vgmm0i3emxKfPtKMhk
	7ZNr79dN/mwHg/iETJI2gcct+t3g1nBwHEVF/nAbkilFQXltK0NyOLxskGEVI/oh/wNqb5kNTnQ
	nX7LYR2EIfFM5UXR9bM+wj8B5jVSD8a2tqyOCQtgSXwpuU122RkNXlWfmfgMdkdb/OEy0umV8nJ
	WFLr2DLQY2GcX3+irhDmjIt28o279iu2PMmYOC50ihpXVj8/dFREoGaLJfM6AdNoxG3dafmVye0
	kgZCK9XwSTEU5P/R
X-Received: by 2002:a53:b784:0:b0:664:b559:d524 with SMTP id
 956f58d0204a3-66829f39e58mr611543d50.4.1784177951944; Wed, 15 Jul 2026
 21:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
In-Reply-To: <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:59:01 +0800
X-Gm-Features: AUfX_myfMUyRbxWwYQRsbuThILT6idiwmNtqsd830qG3sUgPLjemD-RPoobAiuo
Message-ID: <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> >> The power sequencing consumer API already does power on state tracking
> >> internally. Expose the state to consumers through pwrseq_power_is_on()
> >> so that they don't have to reimplement it locally.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > ...
> >
> >> +/**
> >> + * pwrseq_power_is_on() - Queries the last requested state of the pow=
er sequencer.
> >> + * @desc: Descriptor referencing the power sequencer.
> >> + *
> >> + * This returns the last requested state of the power sequencer.
> >> + *
> >> + * Returns:
> >> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> >> + * negative error number on failure.
> >
> > I would rephrase it a bit.
> >
> >  * On success, 1 for on and 0 for off; negative error number on failure=
.
> >  * If desc is NULL (means optional) return 1.
> >
> > And this rises a question: why 1? Shouldn't it be some "unknown" state?
> > (But since Bart Acked this, this doesn't prevent the patch to go, you
> >  got my tag above.)
> >
>
> No, this is good feedback. Maybe we should prefer an enum like so:
>
> enum pwrseq_state {
>         PWRSEQ_POWER_UNKNOWN,
>         PWRSEQ_POWER_ON,
>         PWRSEQ_POWER_OFF
> };

Well I think the crux of it is whether the API considers the descriptor
optional. The power on/off functions suggest that is the case.

I modeled this on reset_control_status(). I believe the rationale is that
if the reset control or pwrseq is optional, then either there is some
other mechanism to deal with the reset (GPIO) or pwrseq (GPIO + regulator),
or it's always on and operational.

In such cases and the rare case where one has to query the state, the
queries are possibly chained together and I think it makes sense to
assume the "operational" state as the fallback.

If this returns an enum, then I think the previous approach of returning
an error value for an invalid descriptor is better. One doesn't need to
learn a new set of return values.

I'm fine either way. I would just move the checks over to the consumer
side. But I think the principles guiding the overall API design is
something you need to provide:

  - Is the descriptor optional? What should the action functions
    (power on / off , or query status) return when NULL is given?
  - Is the subsystem optional? Should the stub functions besides
    pwrseq_get() return 0 instead of -ENOSYS?

Right now the API feels like the descriptor is optional but the
subsystem is not. One has to add IS_ENABLED(CONFIG_POWER_SEQUENCING)
around the consumer API to make it an optional feature.


Thanks
ChenYu
