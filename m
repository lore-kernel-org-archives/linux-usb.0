Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DEE26B742
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782664307; cv=pass; b=be5rhY35m9DQpdJLSaeSgtoxT/lcGp50krWYKwOMiBh8C0d7U8nnQ/K2S9kGbwAPSYD3HSfBVEbO6Pf5AwD3mj6STmHPIWrSXF9F9v6j9xaL/qOj3tKWiORjcGEcLOKUDXmLXRzXhjoSeGx+ZMfeAI+Qofw08MHYfcQF71inbbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782664307; c=relaxed/simple;
	bh=5l1bZXAfKUSX0ItYfzxbNxOUmUVQ5YgkicP6K61SLbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+tlbpDM+eXYzA+tUiKXmjRvdJkBIHOAALKG9LuzBO2lxnfGKUFqLVFjmhCAIKH6Cpmsn2Ji8+RMlQvlcE6E9VL0fBZyFB2xKHnbbmDYQiQL4q0suaIyl38X7py8XBOWxpXdFsQcGXB8pIUDW5YqybgLjyGPpz1iDigtuDCOYgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd1f3474; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd1f3474"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69857dc1d5eso1011143a12.3
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 09:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782664305; cv=none;
        d=google.com; s=arc-20260327;
        b=kmXDPV7HD8hsh1fclP4VaSdccwqkf8I7LUwks0S56Bkp4Ak+4nbGB8qCzIjWrFAelz
         7Dn9tp2BGN4QZ85Dv93O75XO/G7tnn+DFMSKy065clI7NbR/Hj0z9bbXsFxKqixaLc69
         bb66c+0dbJFzqBM++wviMtAAUhnyZL147T+oYYIeY2RUjjcGjMoqwo1wh8UT2mWlHDn4
         +DxenZK0tQkhMNFdF0/vk7SvFWibJ4yyiZDLjaIY0mXGi48hcjqupZYtVUzvjX+wfSOS
         OtKUVdNZqkgxFOoW+Xm5UpRFl3l8I4A306jtKbaS93IPQk/zuC+wWE0E/BIVKqS0YJRu
         i+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NwIs/NzgKCDhYw7/WT2FuLFglQDbPL5SvJrcFuoFlVM=;
        fh=cQQC4ZcnSDaZ03G3vNlFyuY8RcJWNy18nF+ZnOE1ImQ=;
        b=Tf3CBkibZI78BjqBiFc5ToRZifS3QEFFQshVoCZsnZfbodovyfSYU3ZQ3I3aUzgoxA
         FDSDlSE6ZiMUipoPDcXD1kLNkvMTlUFkkIeAwQulsIF7k81XV9gGgvwQLFEhWmLPV61b
         jdIi/spck+DOQts9dE0oBm1UdQJjXElPJPLA8cS0LuMIV1ZdcdLjkMSAM/j4BDhDgOE1
         5z+MUKxT3PdRFTmGAB1a4Xq0H33JNJVlbLEA/T5vF4aLN7cwrAEdWpGsGz415gTMy1ns
         FGnMsgFEsRAa6kRk6YqJarbM+V4fDs1YtDrWqvRag09ppkfzZGqRS5F5UDBr2RAaA9w0
         +nkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782664305; x=1783269105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwIs/NzgKCDhYw7/WT2FuLFglQDbPL5SvJrcFuoFlVM=;
        b=Bd1f34740muALFdIz0yfIB/KxWR1AnpECIewflPt3T1dsz2t1bLid8NECOx0395x/D
         anFROMa8CLdpUb6n8t84M9iM4mfDZEQwTCICAg/BXfbtUhu0rLIzO7MDY+wpdqAunjRc
         g3zFzoCXBOfV/F5gj8tGIOkYSG8XD0+2e0ttxEi7GeHVea9V8Gi6ugtS+hX0NgOpWhd9
         ueVIdMq+ElqnLmoqbMxL+P3qqvuRon5zvO8PviEwOAg8hn7GUy5AoVolHlOkLCfDN4xM
         eIoBqmkNiHC/1c1Syy0Mx8Y8+WcK9l5vnUqwBsQBtxSSPfgWA2wPAvJ6Hbe/Q2meYg1g
         RFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782664305; x=1783269105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwIs/NzgKCDhYw7/WT2FuLFglQDbPL5SvJrcFuoFlVM=;
        b=kG1M0+70eoiAUnPPx1kKtYnB/er2oK3rOatjQTZDbIxpW4NiDQggkAKafRLV3vOjtI
         UErzr7S6EoFnUqI/duo+naV3uD/KbPJyrI24nHjqPwTfqnTlqP/8Yyuvjb9t9u9VtgC4
         dqvHZoQe6yIYYi+9wCXABYaECvLgKA+X0FrE7VcPgH4gSEnTyCpGNpBzEs55xojCjg2B
         1B1Sd1nqKaDzHKSBsTuD1h1/FjXP0KozFPpuQD5E5jqKkgVYrvpk6jIFA8v8Jnqn1JVH
         qFtwO3lWa3LNI8Zm/55Sy9ETE2PmjH2FKzLsTfdU4YDQ3ZnqputMh02yZS3drJ/QKq/X
         sdqQ==
X-Gm-Message-State: AOJu0YwuNgTEFYO+pOVDRGCgU0da/Ar9AA/j+JL2W/v7q7fo2PjMxfrT
	jcdJxlCXKL+FC2T1917gZr3X6KAG1pYwCoa+OwMxxYrSlrBFvd0aJdqmt+MtPq4Cbys4FsfXPy7
	NcQ1RuncWm/12amX+L1oyjQpOJM/CPjU=
X-Gm-Gg: AfdE7clkI0hvhtHoQ/C1vu5ovODFstjJrXDZ1VCVYgTnnFtWQKbHzO6LvxBxLpPK647
	2MiaYpb4srYSCZ4kGu1ECZXq7J3H+v7E4LTdgwi+1z7vlWH0k3zGE7pz8UDUNB2SB5Z/XgMucro
	FG+p0vLQkOZlVMf5DmHfudrBa7cfTKQp/3DsYDZSYhSSwNfH7FKmXPHjCcxTM8MspUdQy4Tz53A
	IPOq41ZX3OM7eVaEiGwsBJrXLKfO9dRrU4NjOsWaqQrpK14vIyNu8vkx5Xo3PiPxKM53tP2
X-Received: by 2002:a17:907:3c8b:b0:c12:f84:85d4 with SMTP id
 a640c23a62f3a-c120f8487bamr640300966b.24.1782664304274; Sun, 28 Jun 2026
 09:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
 <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
 <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com> <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
In-Reply-To: <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 28 Jun 2026 22:01:32 +0530
X-Gm-Features: AVVi8CciSyj9HcmsKDyCiGg7VrCDEm8PTgxDVOrwRIGUvZ81AFhzla4U4iZ5FyQ
Message-ID: <CAFgddh+dEgtJf=3rL_48x5aQx7q3FH20CAw-50J32JOJCYdtMQ@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 28 Jun 2026 at 19:25, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sun, Jun 28, 2026 at 11:53:09AM +0530, Nikhil Solanke wrote:
> > I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
> > out how to make it properly work with my patch because of the
> > following reasons:
> >
> > 1. I don't want to move it to the top because, from my pov, there must
> > have been some reason for placing that quirk where it is now. so i
> > don't want to mess with it.
> >
> > 2. Regarding my idea of adding a condition =E2=80=94 so that it doesn't=
 change
> > the behavior when the quirk isn't set =E2=80=94 if the full configurati=
on set
> > exceeds 255 bytes, we would have to issue a 2nd request. In this case
> > the existing behavior would be more justified.
> >
> > So, I'm a bit confused about how to implement this properly. Adding
> > yet another condition to fix the second case doesn't feel right to me.
> > It would look unnecessarily complicated. I would appreciate a bit of
> > help and advice.
>
> If the 255-byte quirk flag isn't set, do the delay before the second
> transfer just as it is now.
>
> If the 255-byte quirk flag is set, do the delay before the first
> transfer.  If a second transfer is needed, you can do a second delay
> before it or not -- I suspect it doesn't matter.  If you want to be
> safe, add the second delay.
>
> Alan Stern

Ok thanks! Just to make sure, because the change I will introduce
won't affect any existing behavior, these changes (relating to
DELAY_INIT quirk) won't belong in a new patch, right?

Thanks,
Nikhil Solanke
