Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA93D84039
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783158129; cv=pass; b=jVXNTsl+nO17cnvVbz0SsR7WKY3v+GvdOm/J7G273X9dD8ZZs+3gPvc4KKfEpdLDP3LIJqrBiiFN4aeaDQflUOsYZQ/7nd5qsHJrV0JSrZbOTXCFy2CgmkqbFiX8snXYHw3bTISB6paMP6fyMi2qZWwhrjE1/3yPq/gVc7js2AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783158129; c=relaxed/simple;
	bh=UtHBNbPTCphQFj0SX3N0foFrXQDKzxU4CzUEENyHOvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKvYeTbCrxKkd5iSgmGAM7vrNHntR6IIIZ9XIN1/IsaP6B3p3eX6AoRjxLl7uwEJ+aTrvRttml8mdc5lP/DakoAY0fzi6Q3aoxps7pG3gbDDJL1px2XcdThk+PzuHphAEefvj6QHOkkpLJgl+KTt2C7YBS+vnHRraNH+Y45int4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1tQ2YWs; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1tQ2YWs"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-474560436c3so1345238f8f.0
        for <linux-usb@vger.kernel.org>; Sat, 04 Jul 2026 02:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783158126; cv=none;
        d=google.com; s=arc-20260327;
        b=j4ImS81RR4mvnvacFe/Fvu5GcTTZ/5QbHnakfphNuKV4GGtWpZ5+5j99IDfxb9PjvT
         RsVygNakggSc+tx/nhFSjCDcYSK8ZT1p460gV73/4w8osc5mhuzcd50TJz46eFZlrIUN
         DUCzwEVi/0we/55J0TaHohKCD1mDwFzBhlmlSgWSDtsbUXZE0P1+iygO4WoI6rsqpj3i
         UIaU4aWsX70lCwAJKmIdJd9fGS5qTMMuUEPd4dPjRm7/z+sK5Y9pF/U9Lfmyeffefo+z
         SA1QmQA1vausPWJUjEv8EzzusyPff2M4dV8kd8fHjGwUWk7w7HiWwf68ucnZEF6MjdSQ
         Zusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dgl9SnPS5R/2hzJihBF22S7J+OhnwsimNuEJHRQD6tg=;
        fh=nYrndWauy13tYg57Pd7+bvouqpKtuJIaduW7TC3Dlis=;
        b=mXUJO48sN7kBJRHH5cr4CIk3YSmti34s74S8CqGLUHrShHnjohQY8DRgh0Sd4Zd55y
         y9HdddPs+V+5HTsbgS+SIdbrp6P1meriY0ah0kpwDAvjyyWVzok5X610kWR9aPo6fp8b
         UqS+nwipZbtHSbYNVsXUefBoAYzWn/ZKAlSgiOVo3aQYW5TBrWOY9MFJ0Jyjew1or1RR
         tnJiQmUihczukTbzAEyYGTRG4ydT1uqZrIbMCUtOeMrz18FNLue94pvi4ZBvXCt1LP0y
         krFhZFTSxNOP0ASebUhBvD3LVf1ByPXZOhjr6vtyI0NRgGsumhS65FuWA2mlbR8XJ/AP
         ebMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783158126; x=1783762926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgl9SnPS5R/2hzJihBF22S7J+OhnwsimNuEJHRQD6tg=;
        b=S1tQ2YWscWTQtHj77Urh7qe6Ql+0GSmEnp/ZyJG5cKuY/tePlGaItuwytX//3xqaQb
         zVxiAm9Wqh+EvvBBPGopuw2k2xPYb0AM22+l8I4Dlwrd+SAmIq/Uqbusu1MlYd7DhWb1
         WbO6x538C9HUdUUdjYxDHhn4dZt2s0qUcfV0zLDDlrKSetC3IaB9APE96k48Rk7xqnu2
         RZTlw9u6+LxP/b4LsNqLvj0cr/zLBgey7qUzoj8PKEXPoqjzF26/EzqSIzEc4L/O6la2
         KhMPYuYm3TdwXLZAlmg7ZYseC1mM6lP8KkbLS/Bw+2UQ4ItR75fBHT1RUi9smMRrnNsg
         itzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783158126; x=1783762926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dgl9SnPS5R/2hzJihBF22S7J+OhnwsimNuEJHRQD6tg=;
        b=eMjdjLQ+nUgNpTS0KkNy7gppHI1NFwA0Zh1aXd6yhB8WK9RPmbXLiklM3MT+WzLBnk
         qbmL4vvK7BPqyb0Fzl0VQVawhRLwsPd/MF8GsjGrhS5MfkW5nhwMoDphGYLnffzpZPxn
         LxCtJbgueaXpj7XRDBJOEDuJBkYNYZV2MyjT/zGLOuR6vcN3T9e2q84g32qzccXhDAfX
         k21gveSi6rugVzGIXqnQqJJ0KUDMXb7VQB4aGxMrYhC87q+TA104fu/V8vGPqVv04WRi
         S2YldpUirCz7+9DnX0wRatwCP5lSRzDH+uB5yUy/Mqb37pnEMTMaSJb8p4MBdDpDaTiV
         ux1Q==
X-Forwarded-Encrypted: i=1; AHgh+RovfPWQLpxVZkPcMz2Lzw3U8MosDEsnvo/RjhNFWe485g+qjTunw5tyZLkg2fMjMk1GV8yGq4L+AYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/c6xM3YKS4rzppC+zP2Vux53d6jRcWDAYVMjPT0vjJGO57pN
	yOrsMxcZB2gZ+mgaCeuGy/0V0XKD1lTmqI3RDHRMr8s/ltmwlxnSDMunS/yqdhrsYSkGe/jr7Ik
	Xgt+Ez7mJu+o0gs1VFVQWzrz6GkrGO7Y=
X-Gm-Gg: AfdE7cnKJIa/3hddxT7xWpQlvfWqwGXoc0PXZYOnKi0BVSzBFXOPgsCN+yarXDAqlXQ
	u+hpQiwhQz8iwrvGha8qkM5/F7pqiC1Qq975oU/H4UbaTCS6ZS3uEFmFd9JoGmnEISfO+PdvSEA
	/7kkXPRfx9d8cBOTxmtVyE14kgijVr44pQxfGGNt3h2D27DSoY8bgZ/Wi+7VxmfXf5u1c+Ng4ov
	tn7GnjoJB2DXPSsUc1t2UTArOPtagkeI/XKcMRVX+eIJRtP6PwQy18dvGUHrx1jhug12rvI
X-Received: by 2002:adf:f5c5:0:b0:475:f0d1:eb5a with SMTP id
 ffacd0b85a97d-47aace8f2b8mr2340042f8f.53.1783158125998; Sat, 04 Jul 2026
 02:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604105059.18750-1-andyshrk@163.com> <aiLHBIYmexWvmlha@kuha>
In-Reply-To: <aiLHBIYmexWvmlha@kuha>
From: Andy Yan <andyshrk@gmail.com>
Date: Sat, 4 Jul 2026 17:41:53 +0800
X-Gm-Features: AVVi8Cdw8CdNzAsOvZRCnluiLNAz8yOFdlvEQSUljumZpqX21iKSDZAeyXm8gN0
Message-ID: <CANbgqAT+B34JNMCnVBg4kk1X_0PX+nFmSgLY6qytRfJ7jnfsaQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Fix VDM type for Enter Mode commands
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Yan <andyshrk@163.com>, gregkh@linuxfoundation.org, badhri@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello=EF=BC=8C

Heikki Krogerus <heikki.krogerus@linux.intel.com> =E4=BA=8E2026=E5=B9=B46=
=E6=9C=885=E6=97=A5=E5=91=A8=E4=BA=94 20:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jun 04, 2026 at 06:50:24PM +0800, Andy Yan wrote:
> > VDO() second parameter is VDM type (bit 15): 1 for SVDM, 0 for UVDM.
> > Using 'vdo ? 2 : 1' corrupts SVID low bit when vdo is non-NULL
> > (2 << 15 =3D BIT(16)). Enter Mode is always SVDM, hardcode to 1.
> >
> > Fixes: 8face9aa57c8 ("usb: typec: Add parameter for the VDO to typec_al=
tmode_enter()")
> > Signed-off-by: Andy Yan <andyshrk@163.com>
>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


  Gentle ping....
  Which maintainer can take this patch ?


>
> > ---
> >
> >  drivers/usb/typec/tcpm/tcpm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 55fee96d3342a..3674e1cdde57b 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3061,7 +3061,7 @@ static int tcpm_altmode_enter(struct typec_altmod=
e *altmode, u32 *vdo)
> >       if (svdm_version < 0)
> >               return svdm_version;
> >
> > -     header =3D VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTE=
R_MODE);
> > +     header =3D VDO(altmode->svid, 1, svdm_version, CMD_ENTER_MODE);
> >       header |=3D VDO_OPOS(altmode->mode);
> >
> >       return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TC=
PC_TX_SOP);
> > @@ -3109,7 +3109,7 @@ static int tcpm_cable_altmode_enter(struct typec_=
altmode *altmode, enum typec_pl
> >       if (svdm_version < 0)
> >               return svdm_version;
> >
> > -     header =3D VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTE=
R_MODE);
> > +     header =3D VDO(altmode->svid, 1, svdm_version, CMD_ENTER_MODE);
> >       header |=3D VDO_OPOS(altmode->mode);
> >
> >       return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TC=
PC_TX_SOP_PRIME);
> > --
> > 2.43.0
>
> --
> heikki
>
