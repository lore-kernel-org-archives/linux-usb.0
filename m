Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619A4418F0
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516751; cv=none; b=l/4aei45Yotc95Qexvcr/T17Yb1QYUyQm6vPnjPm2RyGrVPLUR0BJCHmZvrnI2tuVveQs7Lk8pfSt0sicRhncdusZlp0GdQpb07Tkvoa7EMczqYfU3r4qW53SqzBg7rtMDgMpIyBghi2b5gpM6tYBcmST7XwO0MTpQenPMWZf/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516751; c=relaxed/simple;
	bh=QkrSEynGau1ZbI201+0Em8TncEc13fHHUvNMrEc6cck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhbOU7jGtEXswkCkPJltv01QfYnfeT3gbM2w27qrpfoQnI2XNlDpkN8YSQJlTgipeYtdA+VEiPg9KGG3d2D71uV50kZjDNr+PFSTpOlK5kpuDTJDvRu+fkOQ1IGUgeJxWeI3TrluuY1WYVIGuPMhspzkySNI6XGF3M+hG7d2aSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c5ac25089bso406257e0c.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 03:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516748; x=1789121548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8ZpJN9RlZp1CfHTyya0RqETx9peOqUoR2+FiCTsKgE=;
        b=Tv0ZP/TcVYu/x0N2mfMO62fbStLdwaLxKvceWz2rbxYMF/YapSduB9E/64QJJLzKM7
         j4Hfja2ZHy5RAlhQV4as94DMYNYEyesl8YhjjUCARXYLg+lI3UCLqvFpRu1P3kzBK0jZ
         a/Q4xWVImd3LHQhRKvV+DaTwX+zCIE3anbhk/PVnbO3G0Xz1lSn7R3t7DCXXuZ4EH64f
         b21cTggqrVvY1Vndvx3m+Lz4wo9IlXnfOcfM3Y8+E23d6h9l6IHqCGKwyahy3yb6n7ZH
         EJvsOY8VqlUrFywfEVhHx5pU4oUPPs+mGJRQcqFRVN5exRxznLCTCqYy5R108gozYDf2
         VN6A==
X-Forwarded-Encrypted: i=1; AKwUvBzpXy9gQqvA8LpHKgEMWK378f25w749csa1TbZjGbWDXSt5pdZlBQeWAKIV94ueAAHjB9YtJIY70Ek=@vger.kernel.org
X-Gm-Message-State: AFuF++n0PWH+FLTru8tIjezvY8VTLjkLkEOSoG3XWaCuOy7+fTFAbBUW
	gP1f+nsMIim8mlpiqhID9pKVXsefsM3hFJNjK5ERG3T8KaNIwcC8oCgdduqJrcP2rcA=
X-Gm-Gg: AYBFou0oPBBtX1Rg5Q3pa8VGpPVc5t68iLpsJr7+ZxjTxBYiPXFPcvEfVJeTd8uEUJ6
	ocWRLePOqH+fajde6wNDR80CmFpwWcP45ZMw7A/vA5KrEoPW06clAO4vOuEVhhD191maQBfG+49
	ABdMuTM2T9ygsitUzOrlDlHnOmTlDy0yJUU+QcqSfGZeJRESpQPNkJLzK3rVl08cUByb5SVkQyI
	QaGvlAQWPP7oXam8k+9zT5+ooTH+3/kVWNtobrupD/5S93SsPwKp03Wx83C60ZjkV1ajIHS10hh
	Ahn1rGNnB1C5vCH6AmkpXjx/4j0XrFmraI6vCv9GY/NOWZB92ES4wcV/03FftBCJc/9tmy1YN9L
	3W8NE1ehAcHrwFEKdiOs/bUV5E/BKg6vJMzdNS4fWXkdTEfXRzqTvRmhze2Qrc69IFMpOzzZYPO
	oHviOaUqRcsRUEu/+zUsKyAakoDiu37jJjFj4ah/KwiFCCHtt4NMEZOsYEPsDJSXr1TFtNyYzjI
	xl76dsXvoQsDiI4A88laSsMUcZISw==
X-Received: by 2002:a05:6122:17a2:b0:5c5:d531:2f4e with SMTP id 71dfb90a1353d-5c7ed8053f1mr1921780e0c.5.1788516748513;
        Fri, 04 Sep 2026 03:12:28 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec366bb5sm1707909e0c.13.2026.09.04.03.12.26
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:12:26 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfaa014978so408494e0c.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 03:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4Xoyfsk6ZeUvOEG8KOClK71foTeSJ2SAGXFQA1BqJmGUgqT/jRo2sdHyl5UW5aaZ0JkjZz+oclzw=@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1286425137.10.1788516746128; Fri, 04 Sep 2026
 03:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
In-Reply-To: <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 12:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
X-Gm-Features: AcwNN1V1Us7DEfFHRItLM1ZA7SwiTD-ZOtpiiIkRmjTu4wyeWXgopaPPPq_n9t4
Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> > On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.com=
> wrote:
> >> The list of allowed pinconf properties already includes input-enable,
> >> but has omitted input-disable.
> >>
> >> Both refer to the same hardware property, setting and clearing input-e=
nable.
> >>
> >> Add input-disable to the list.
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > (...)
> >> +        input-disable: true
> > The Subject of this patch is  "Allow input-enable pinconf".
> >
> > But what you are doing is allowing input-disable.
> >
> > With the subject fixed:
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> Thanks!
> I'll fix the subject ... !
>
> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pincon=
f")

No need to resend, I will fix this while applying
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

I will also add "output-disable", which is missing, too.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
