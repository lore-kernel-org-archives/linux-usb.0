Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEFD361978
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760209; cv=pass; b=kZkbi0ifucLwB95UEHVTao1+N70qkxo9iVTs4grJsXfPtpDoBrGrUtstFr0+ErDp01PY4BdEV/IEtq9SCsdhnyQLkUUJhxU9dVBl5JfDUDh/2kiyfyD8tSLWhSyPk/Izd70cmcOtSiTz9lCth3GEMDOgIHVFI3PmniHegUPYLPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760209; c=relaxed/simple;
	bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnfMoh2+vOtpegJgkQMZy6tglJ/8bU1am4YhpJo/4g72E9Kovg+BtlSVGAmnFsjvww+xrHXl5/uus1dCAXNCvvInHPV601fYCWeSFS/XZxKyTV0Gy+9E7mCVPSxfAIM6kQK94qdpp7d4thmXda7kC7j9YgC+4aXP4HItbYZ0I7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBO6Xvx7; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBO6Xvx7"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1f75277f3so9049781fa.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 09:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787760199; cv=none;
        d=google.com; s=arc-20260327;
        b=DRRXJuqy83FhFcJ7grIsr3GCHHXVgAjcuqmFRinX6rettIgke3IEOCoZ/4Y53qHdFw
         qfOYexk66BiDm1XaT4jG9xd9ltPkzFC+bIcXoYznsfBWuOD8pVb3aX1SADKkJp1JVXyc
         7PTvvqd5eG6TjsGXwL0eiNyhejVgOS+vV4gcO4DSjUxUFF/XVMC7UxdOSZjPIewNFMDg
         S6+1dZBPHlNwixoUVhqiH40Q5cYDKZQ+9EOYwqNJWxPAGMaeSBkKJv0tc414u+ZmMbiv
         HLpkpwTwEbZJqy0EE5pag8f8sFm/rYm5YvLFg1Zy9DvqtW5UY09TBOh+hm7oO54Pa+3Z
         4Rjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        fh=kwHZZ+SYJ1+l44VyyHQDq+ApKT0HBy0IhgMqbiq8S0U=;
        b=Vb/CM1W4+2WOzM5gePwybCyALFiov3ZPgOD/5Ydwu46rme1ZJMMp/hodUkNGPqrVh+
         E33j0XFLswdloJtj5JSf1Y+l2gVWkQyUvDsLhdzVnGKdygkS/ES8J1QIeFL3x8Q4D2jJ
         fgEeNLdkg8c0AggQlFvOpACSP7g/cNkioIwmctwe2R4bOwXc1mDN/3+cjFCa3TUcMXjT
         Ko06FUFgkrnogDEKerFtt9yfoFdRgWkfQgjFDM3euttrqON1+T/kOnWpYuPee0HC4cYa
         96L84EX6kz2beblOj0MPNOnawayAGUwDtfu499ZuJuHsK9iNHKRSv9RyvlslBlOAY2fO
         TvIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760199; x=1788364999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        b=jBO6Xvx7RsJ6daoO9ux7RccUIWoR274y4P/QKLXA7yiKYnKY6a5vMzT7T7Z4GlCdUB
         Y+2x+OxPA2nkkG37yq6L9IBtIPhMjnZ0AJk2eAQ+27gquitNYDmEX5wE2/YdFFC9jIkZ
         uP2Wf/xQNax2ey+J08fZQMBWw0xxIRUTn+GO5K2yTjsLl7jQVJYeY3DyFZWlEugxVWvs
         2RJBLr2IgHL9kJNLxgZDWBWl6HCfFKqztNwxN/hzQhXNaphXExhSaNt0m27e3h9bimPs
         YyA8UaaGF02pbD0Kn30QD7wfbeaN2xHoQe5LBJ7RvEPv2kNjUtR+55lVB6BAcgJtg9ZA
         oJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760199; x=1788364999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYFdFW6deGwNCuRXWE33qO5lp6MMBOGHlKlJNVvT82g=;
        b=sq36z8DI2lEAXrtrTLEnNJ8KGUOEm2A7KgtjbT27n8lF1DdyC0eQuOq2OQxBENC/JL
         kY1/aJfWQV5UE6TfdFXq6732lApEG1/VAucMlNcrK9IN20FUslazKSwCfIilAWH41BGp
         /89kXP5aaQZC1ESk+WAzMJqVIYWdaR00M9ivpgYgtUCjMDyQpTHsvDr0OabchcJ7/+0a
         utVOhx2U4TXyQsoqEO7FKcgIwcbXUYl3mTD+44k+HiN7YuxN2aZQ1WTweT328BWjPVLx
         OhfdeFnFHkIh0tCC5Y8p5x3s2zYlGzEEFop2D0vZNWr8Ux+Lsl4RohCotLIagvFU9U+/
         vciQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpk3ZjvegqCr+sL4rtqKQk30i263oSDNLDdieW4gr3md6hBhkYln+ONO0BwrcXo4sY/VXZfxjKMCnY=@vger.kernel.org
X-Gm-Message-State: AFuF++kDZZzSowx6EgJ88ZiNtHwkN0uSJm/2xMV1rRbvxwWA5Rv9db6m
	sADndgtE9sw/9pZa3roBgeem4zUACVgUF+b5eVfTJILcpUYGfG6IZempz/KTztXZ6FgP1hqr6Jv
	LhfBtkkGRnzdk6AnpEjkLhzO+i6kTy8U=
X-Gm-Gg: AR+sD1056sIa+5dGw8QvCeX0cpGBgsnly1mOy4mQIBu2cQa6NVaEZQ0p8AZqgqn4D8M
	E+f+XfA/rFgPPppKH3TDdF2iL1v4aXHUQkBpJHc6PFgTavPUamseqWUyVHTxJ6q1h4ImnonbYju
	SGiWVMEHbUxZRKMHX+gQ78lC8yfIKdTqST9Ix+sWKrt4K7A0D2M1wIsd+PvvEN0TFpStDJRo2Ah
	x6JfkRzs/+e4GV/2zxuzpOAt3Uc4OaPnDmyRSE0+bLlg4tsgzxipQn3Oae1Fi3On5A8dbjgMIFC
	wLNpA5eEnCxqy+tvOxPJDUH9AO/9+AC4tt94M2F2dUu+nfM55e9lhXPba79XTToTI1ECEWM2bLm
	q
X-Received: by 2002:a05:651c:a10d:20b0:3a1:476:74b3 with SMTP id
 38308e7fff4ca-3a1fd6605afmr15291371fa.9.1787760198919; Wed, 26 Aug 2026
 09:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info> <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com> <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <ao1ovvdPAy6n_F7I@eggarch> <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
 <ao7aLXk9q_v_jEyX@eggarch> <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
In-Reply-To: <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Wed, 26 Aug 2026 18:03:06 +0200
X-Gm-Features: AcwNN1VMj1i9qHLHYCgFf_wI4NJMgmrhr4t1IuAyWuVvRr1oKaUch4AAYMJyJrg
Message-ID: <CAPyJwA8CNeUnh2kzYktF8OR2T2QnVNN9EUnrUci7_419bF4QDw@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Mathieu, would it be possible to test different values for
> USB_SS_PORT_U0_WAKE_TIME in hub.c? Especially 120ms is interesting.

I reverted to the stock version of hub.c, and changed the
USB_SS_PORT_U0_WAKE_TIME to 120.
-> No crash for 1 hour, but I will test this deeper this evening.

Where I am a bit puzzled is that Mario Limoncello from AMD just confirmed
that this was a platform issue, only affecting StormPeak, for which AMD alr=
eady
has a fix.... Or maybe there are more than one issue here?

On Wed, Aug 26, 2026 at 3:40=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 8/26/26 15:35, Lovekesh Solanki wrote:
> > On Tue, Aug 25, 2026 at 11:43:22PM +0200, Mathieu Fluhr wrote:
> >> The patch you sent makes the issue go away. I am now running the exact=
 same
> >> scenario for 2 hours, without any crash.
> > That's good, thanks for confirming.
> >
> >> However, I am not sure if this can qualify for a proper fix, since I
> >> do not have any
> >> external hub connected to my motherboard: All my USB devices are direc=
tly
> >> plugged into root hubs (and at the moment, there is only a keyboard an=
d a
> >> mouse).
> > Yeah that's the point it only skips the 200ms hold for root hubs. The
> > external hubs still get their fair hold since a parent exists for them.
> > So external hubs are completely unaffected by this patch.
> >
> > On 'proper fix', I think it is, even if we keep this bug seperate for a
> > moment, it makes sense to not give root hubs hold they don't need.
> >
> > I'd love to hear more thoughts on the patch.
> >
>
> Roothub needs some time to settle as well, but 200ms might be excessive.
>
> xHC can triggers wake (PME) when a connected USB3 device starts signallin=
g wake,
> but port registers changes are not always visible to driver before link t=
raining
> between roothub and device is successful.
>
> My educated guess is that 120ms should always be enough for the roothub.
> This is also the lecagy msleep() still apparently left in xhci resume
> to detect port changes in xhci runtime resume if there are USB3 devices.
> That msleep was supposed to be removed now that we got the hub changes.
>
> This 120ms can probably be further tuned for roothub in some cases,
> especially if resume is due to userspace action instead of xHC wake signa=
l (PME).
>
> Mathieu, would it be possible to test different values for
> USB_SS_PORT_U0_WAKE_TIME in hub.c? Especially 120ms is interesting.
>
> See when system no longer crashes
>
> Thanks
> Mathias
>
