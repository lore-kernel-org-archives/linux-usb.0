Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E98368D6F
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750804; cv=pass; b=l6yUBAuNcxgUah4vwdgJN0cGwj+mxefHDFuW7QFioE4TXB1FddNroewsnVv/5qHpeQ3xuOEk6YHFxwng3rUHpoynZdBwUspZPsazgQYPxAbJSpRr6A9AI0WcDrrpwf9mdH9A4JWc5QgX51ghH2k3YkC4rVnvNbP8aKdziuuSoLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750804; c=relaxed/simple;
	bh=PPyU/hz/a4Na+5pAT4hhG8x3kDuFcn+kPX+Se5g2BoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cl5AMJcokxVCHOoT6xQo5Ecr3lz9ADlw+twZrhk1uPxP58wSxo3PEnpMHGqZ4pgDjSbL1tfh4uuDkjX/04MSauZBsz1WPvwC+cHmHdlSW/M8W0WyvmPdgUCdb3lBEx17oO95UyFYCkHUnuH0Fil8V+lo1W09heBZqUMPfkwd5cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5VB0O21; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5VB0O21"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-44cb057311bso684171fac.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 06:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787750797; cv=none;
        d=google.com; s=arc-20260327;
        b=lmrGjhogn5y2IawzU7oTVSnzPgQvRaVvdQO1EhyZsk8lf2/4Pw1dUmofnsFF6QRt5F
         3Rul78bQ5Jdii+PKiop9yd8l7/xp6/7uZ9t2tEJXHDvBYU4jLvv2qQm9eGE7vuNyqiQO
         S7bEILF+Gl5OIRhWHLHiZS6sSLEa1ukYJsHs7cRG8lMcqh26SwwKGp52G32WVVPMMfpA
         dWP7jNauLIZlphAiFKgYcj2aOwKKMOanIEmwZfYrUDonLrGjXq2tFk6iGGuAMflr8FLG
         Hj3T7UdveY0gXND/IYGB7bFGNOdO68e3EEC85n5IIqB1c5TWeo71vEnVy9GiSgiKgtpn
         uzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXJfDFxsjd6n3nxiKwY8tVm+DTv8K0aaUVAVp01ZKj4=;
        fh=tusMu4Fxl7DFrn8Hkv/RLm/+I41I+j+tadU3vt41LJo=;
        b=DMBDazj085KmI9J7sciGKhORpM6PyjfxMelcJkbSOmlbGweXeyTG/WcgXUtfj5wmBa
         4TIyzDnhg7bFiJJBi0kIC4Inq6jj/apLPGmmJouRuYHKpx3nVo7dZe6pGsprLfmwj9yj
         GuLJx9cUuZT0gOmXqzq2ujwodl08JJOnw0lO1H6SF2qhddxSDpbt80sU72jyHII9mUGb
         xgISWUJK0xOruGlown7H99hfetnEpSsPin62GvNyAlAiinhEiWwp0+Ys+ZWYdtjYns3s
         HLQMdmM2t/bmm9btQ7B1Uz+YPCGcldvrcct7CZVzsvnZsI7JnxZVKMla/uVd2qwVYeIM
         zYqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787750797; x=1788355597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXJfDFxsjd6n3nxiKwY8tVm+DTv8K0aaUVAVp01ZKj4=;
        b=f5VB0O21Nql8ySw+1SsT4k6WYugJHStg9aTUot/hSdc/dB15NxmjbX0+REenpjOe6I
         mA0woCQcfZQ1HJvH7WBkzd/0BPue3FPkK/6DvenVT9JjorUKsqfkP60UPXLOvZcQDqIs
         98cKeaa1MjjoIwimixGvaIrv6tpf4Sdxan6vXXSju8llSamOBz3gqSqHDD4m3hBTpq+X
         awMUMrtfFHqb8AKV9OlDBkZ1Txk7kzbvCayh+5w24FhY57DTLz7ec1h0docw6MDRlx3U
         PyA/CSieDTwB6wAQbYMXuzIFFcFahtvy+ZtNDMk1K8yt4MYhntskq3JGQ+fkEIoCDQQB
         Q7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750797; x=1788355597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXJfDFxsjd6n3nxiKwY8tVm+DTv8K0aaUVAVp01ZKj4=;
        b=qFG9sVKQKZYJt5m5JpeBCMagg84RQNUUG1U2N7TAicDA3CwZdGO+Bp8cNLyCYx+k5v
         TSYUFr0q/foCpiF/beVz6wLjxlVuH/MstPmbUVYMVUo6+CAdlPiNYU1tZyW6F7wN6lNA
         guh9KlVqDWK+gP48b/YkWp5cHV9EzUKfoXack38DwjyfFj6ANikXIBXDNcnbJMFvd8mm
         Wo2lpp+qhwFV9iuR8EzCZkECGLfzr9xGcOEYFSOR1RnmTcCSrvOQKspRAFh6lAv65Nrb
         2uMNecBwQgrzoZCkOrO6iqlZq3dbKKTZI6bu3vGePZ38cV+xLE3qfLMVA1pbeHENV8CO
         y8mA==
X-Forwarded-Encrypted: i=1; AHgh+Rrw99+76TIB8nl9sM4yigOz5F8Y7KbHCS4t5S/uaPkBbUm4Yb0MdCewHvPruaLsO6G//ir8kSP+eR0=@vger.kernel.org
X-Gm-Message-State: AFuF++n3By3OwsTxE1E6LUxPrXa+nbyegYWmOww2F2UuDMJzhejN8IQ/
	3yALPMSkgl5TBpScDJe46jM7qtjEcPu8M7J/XYoy5fz3HHkKX0UflSy97OaDw4Af707tB+zisEX
	YjZ1C9hBBpPplB7FnoajD6iN91vtjHx9HOLFcvBqS
X-Gm-Gg: AR+sD12rEXr3C3tfGRVCTggYx1Q8VyUGTaqxxOQ7bBWKCvzR/01YTFe4RfX8N9CNJ1Z
	5JlH98vWArSnRJOe9Lp+D7gYGV/d+9HO3GzPTMNyd4iRFcpe9axjUS5vJd97hAOJ+jQ9U/DatOo
	w3NJN10JgxQtiXs2JHLeLh0K5w4uhLtLE5M6eeJeBWoWKLjVw0dP/W4ttXFCqn3ovdWgb1cIvTm
	5h9WMJbl8Zc443N/43jRpaC/PgCnKmGfu32i2Rv6tGYhgL9ABDAOpKEjjhwrrQ0BWkTYtQjcrgF
	xslQ6d9QiqZ/6Ms5Z0NsfW1fjnOvd/fUvgn4+nmde79C+/NiRJh16SPyziE5k915/DOCzQrmTo7
	+dvPAFXwBwYdKSBbGtX59sBYOYm9mGiH14eZAvV9g5zIsLmUxp5ixgMboadW63E6v8Y6DxO3o3y
	Qn9smQ5OL74WlZXg==
X-Received: by 2002:a05:6820:1a08:b0:6b1:3427:698b with SMTP id
 006d021491bc7-6b1a0496fa5mr6594994eaf.18.1787750795474; Wed, 26 Aug 2026
 06:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88012e.dbb3a75c.13dd47.0007.GAE@google.com> <6a8d0f6c.dbb3a75c.7844.001d.GAE@google.com>
 <2026082540-tarantula-gigantic-b786@gregkh> <CANp29Y5YH=O35brw55HFo_hVmFDz5Y4Yw7buBc-rOjETU2DNjg@mail.gmail.com>
 <2026082507-ecosystem-giant-0b79@gregkh>
In-Reply-To: <2026082507-ecosystem-giant-0b79@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 26 Aug 2026 15:26:23 +0200
X-Gm-Features: AcwNN1Ukp9gqLT_Z82SDZ7L72P37HiiIWWLnUCjIe39LlRn1vZJuzZxoH2pucek
Message-ID: <CANp29Y5hnOWaqGw8BbPu1TCr00TbvNRciYvs_VCd6Jtk=8kSPg@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in wcove_typec_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com>, 
	heikki.krogerus@linux.intel.com, jeffinphilip14@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mika.westerberg@linux.intel.com, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:07=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Aug 25, 2026 at 11:04:54AM +0200, Aleksandr Nogikh wrote:
> > Hi Greg,
> >
> > On Tue, Aug 25, 2026 at 7:12=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
< .. >
> > >
> > > Please do not think that this is a valid path for syzbot to be
> > > fuzzing...
> > >
> >
> > Can you please elaborate on this?
> > Do you mean driver binding sysfs interface in general or something
> > more specific?
>
> That is the specific thing, don't have syzbot do random bind/unbind
> calls, having it attempt to bind any random driver to any random
> hardware device.  That's not how bind/unbind is supposed to work at all,
> it's for developers who "know what they are doing" and you get to keep
> the broken system if you mess it up.
>
> Same for unbind.
>
> This is a root-only api for that reason.

Thanks for clarifying!

Some context from the syzkaller side:
Restricting the fuzzer is always tricky, especially when the
problematic operation is just opening a file and writing to it.

We normally constrain openat to:
1) An allowlist of safe absolute paths (so it won't open /dev/mem,
etc.), blocking any other path starting with '/'.
2) Relative paths under CWD (so we can still fuzz normal file operations).

Here the problem is that one can mount sysfs under CWD, which leaves
syzkaller full access to everything inside it.

Tightening the access to /bind, /unbind, /driver_override sounds
reasonable, but trying to catch all workarounds purely in userspace
(e.g., creating symlinks to these paths before opening them) will
easily turn into a whack-a-mole.

Would you be open to adding some kernel config option or a boot
parameter to disable manual sysfs driver bind/unbind and
driver_override? We had a similar problem with writing to a block
device while a filesystem was being mounted, which was perfectly
solved by CONFIG_BLK_DEV_WRITE_MOUNTED.

Best regards,
Aleksandr

>
> thanks,
>
> greg k-h
