Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795273449;
	b=1T46V3uo2oGsLU+CuFAyR0d7zxo+DuHm1lntWvL0xSolHtxgvAEWEel3npCteI3H0Bty
	 Dqrt+lJu48XSIGxL0rqClRWjerJMN9VncxpEgFNmPn+GvHFpiIgIjHHu3E+R7dHQ13+2b
	 UFshf1gpcpPqqtNY/rt4O5BDRTrlpzSl5WDbv6yHAAOluBjZ9vme/nkPfM0cZneP9UwZB
	 M6MS9nDsNceyIN8MZITmgVs41LVUek/T98pSFCqgB7lzMBUN23w1VifPiexp2mZ427s9f
	 Ab0xK+UqH5kXO0WcYaUTX+T7eOeeCynimzmGIEKQaV/mu8j1SOQdjZzJrzLf89W3YdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+vnjKAc1aPhQ1a04AtQXFZ9jvQM1qTw4IWbtRfYI5GY=;
	b=L6V27XeiWuXfu7H/fPM7TmKqLstCWZQrsbVSmr5Q5UVacaZhmuQyQbPnwKHzXZ4hK4Gg
	 26WoS2ljFPril8MSVYzpElp1m9vvwSIw0Sbv4rhLkcLqIhWUoTVlza6y+gYWjwOFHZZDi
	 Eii8LwM4dzHZZjBzw9ODtCquQy4woColmn8VzMcmp2rm0DEE1G3fbtd5P3BVrSjaUURH5
	 ODQe5V42DlQSD6DZKChEOZ8jfLbDmfYtfviGLytEf6UZzhgyZQvQlfIE0KMobLrT0Ojju
	 0PQlru9hWLizjr55hQtC9Q9xTHDfTxz8uMKt9qzn7SClKXLavi1mNNIEuW1/6S7XalA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FDbsvgTx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E8D606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 15:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E8D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FDbsvgTx
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f02f04a426so15746235ad.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 07:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795273449; cv=none;
        d=google.com; s=arc-20260327;
        b=LHpy/ObWUT7EQOHIXcGhaHEoCdWnVci+PszdXlJDGCO7gZ/SvRWOrqK3boPvkOqfbj
         4duZvzyYqQqCfG1K5dE4oYJXUZGPfGc3JwEXnakMNVbUVyyOFPrbeeJXjWzWGyrN8Gwy
         d+KOBGUbvtjHq4UNGskBmhr86pw39ZrfTpRHqTVU4AfS9HnBkpGUDSjvp39nDuPiVmb8
         i8vdCuarRaT1xSpJeDHjqBU/etT65I1QRuMtMfoPbEAmLA0aThdVXrFW0BazBRrErDwZ
         JeXvI9sYxmQzfL3LTi88KdngaBxmVeZsp67qtTkt4V+tMT50j+W+kGp0CovCNAOOkWE6
         kfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vnjKAc1aPhQ1a04AtQXFZ9jvQM1qTw4IWbtRfYI5GY=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=jcr2Q8C+37PgPzRbwzMKcff9YQiMYCXLHB60FFmrkhvDKGqLrbeYoqFTK2+fzlTF5U
         xABy9NLBF+27gGtci1nIrebN8pX2jRXGb3vJfyOtbY18N+5VJTbu0Oftmohf9G9qTM2F
         4Qy2OsFtRNOXmCmSFXD4Y1ERIIORl29K/i2ElsbovLPVhm8fBy6dcQ6G/OpjZ4scI6DL
         HggQKbeowW/nKdMDTI1tBjpPC2vJ1jI6mSPD8vhBOC1m7ucZuqAJs6svZ/htDYgQnU3J
         +QU4Lxi6WeLQHlxEpWfkl8Oq3TUTTZPv1PlpXpZxW9FRyx57tOnkepcKEBW1o6+U7xCt
         CQQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795273449; x=1795878249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+vnjKAc1aPhQ1a04AtQXFZ9jvQM1qTw4IWbtRfYI5GY=;
        b=FDbsvgTxls4RGitIfCC3uh/wJmZ/YZSRrJK6zpSbPRdKyLkLfeG3UPUN37na5sxdUZ
         olOeB21+NY9mB9TvAwbXmod0L5w+Gk2Zair7da0l684oAdvvc+tbvzkOMRz959pV05Iu
         vnEeOe2ie4JMs0lzViAQXR7CUF1/jTypn8/vihfdDI5TEqPOpUgZgZzoEZYqSRBSUjr3
         10sj+46evnYlz2GvDrob9HOzwurX62agOA2WIcL6HBmLvGQ1b/MfEhTftZQTolSME0R0
         KvJJwM3btjNpqi+uE6TnTLYzqPQbJl48V672OdtcRv9z9LV+vJGqKWjVW3/5nbos5T7t
         bcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795273449; x=1795878249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vnjKAc1aPhQ1a04AtQXFZ9jvQM1qTw4IWbtRfYI5GY=;
        b=vqgGn1M2/QXfbFD39w4intYi+FL9GacJyNVjgqMWA9Pm5VEuHomETLZjl4T4NVGWiD
         Eot7ZSP1JBJ2qNFJO5Nlm9u1jVS0jnbjqCnBql7sEbDouGCKAomDEyzPLkLNFPfj/QGb
         OhWM4BmKF9jcTeon+6q97Khmu0Q16yIowfS9Wk7EFw1UB60VknpwOQH8NNB480d597Pb
         uK0WJ65hrI52cTnL7Y0a3G4+p/PtYaeKdbH/6VH2Wd+ecDKZpcdKQH+VDs3GNBr1HJK8
         OExGNDw6lrKxjLbs0n1sf9US9Z5q1E31PJ/x6y7WjIq/UmXAp5LWkaSEvTZWpnlmc8Lr
         TENQ==
X-Gm-Message-State: APuU4Z+lIXOQtyWoaSV7ul/LB5je+GOmJbWeiUq3eZ9ALGFKXnQhTKGG
	BadRhKDbgBsnbKnvib6DvXyVQ3S2G21tuVCm+wRVxpljLBCXsJnS0mqIKFZsw3OyTiu/lWbgE1+
	vOwX3+THjcFpPO7FA3x3DoPWCQa3DQ7t5UpsqvEq3DQ==
X-Gm-Gg: AZFdTZehOKvU7Yjitc+fa5Yx1yZ72Q6HUNotsWRiDoJs1rXozkHlTg9bcyYwXdCp8tv
	bSB5MCVGnMr086PfUTGOUsmNh6BaFX9/7gDfi0BP2GTIf+gKxJzB8TL5/23ISmdrCWYWpfJEk0Y
	6J8K01b7az62CTjRWXmX8jlQrBUWScrvPuiljmzo5rDGL0SlMWjcw8hQMPqqeMwdE3Mx/221Wvk
	swPM4uiJg49LjVXQwV3fEZRUvODYRP/EUwhc+rsvsTsRAnp5uBt662nIJ2SBvgR2AkacRA4mTTc
	ONIzxU9W6si/phTQ5vlp+tCQ8BsH478awjFWbcTxQ+1UjFWzEWXSQGJjuL4p8jFGdhLhbLr+9hV
	MGAcjDV7OsKGmoeyqq8z7C/7Jt7c1wUeIYqOVe1HyzsmjHP/jKeyUQji90ryNWv2RrIIHgJO7pj
	yyXyYNHc88eXW9GM1yusDi1u0z
X-Received: by 2002:a17:902:ea08:b0:2f0:4667:7e36 with SMTP id
 d9443c01a7336-2f046677fc9mr55057675ad.23.1795273448562; Sat, 21 Nov 2026
 07:04:08 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121070804.26185-1-alfonsocvu@gmail.com> <sashiko-outbox-226770@kernel.org>
In-Reply-To: <sashiko-outbox-226770@kernel.org>
From: Alfonso Villalobos <alfonsocvu@gmail.com>
Date: Sat, 21 Nov 2026 09:03:57 -0600
X-Gm-Features: Aa3M54pUHrVxsUYU67iq6w3t8wW-swoPKsF6Xfxgln_fbTIjBun2oztD7Ewrh_4
Message-ID: <CAJ=mrFpob6_aCaWWGw3yyo8CfHY0Hgde2Mjm3dJcQQH0QYj6=A@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Re-add host router DP IN adapters after DPRX failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mika, and all hope you are well.

I'd like to check the direction with you before doing v2. After the
Sashiko review and looking closer at how host router DP IN adapters
are handled, I'm not sure v1 fixes this in the right place.

The DPRX failure happens when the RX 9070 XT feeding 0:10 is in BACO.
With runtime PM disabled for the GPU it always works. After the
failure the host router never sends a hotplug for 0:10, so it stays
unused until something triggers the re-check from v1, here me
replugging the dock at 00:27:26:

  [00:26:36] 0:10 <-> 1:11 (DP): activating
  [00:26:36] 0:11 <-> 1:12 (DP): activating
  [00:26:48] 0:10 <-> 1:11 (DP): not active, tearing down
  [00:26:48] 0:10: DP IN resource unavailable: DPRX negotiation failed
  [00:27:26] 0:10: DP IN resource available
  [00:27:26] 0:11 <-> 1:11 (DP): activating
  [00:27:26] 0:10 <-> 1:12 (DP): activating

The DP OUTs also end up swapped, so the ordering part of v1 doesn't
work as intended either.

The comment in tb_dp_tunnel_active() and the redrive code both seem
to expect a hotplug for host DP IN adapters. Is the ASM4242 supposed
to send one once the GPU starts driving the DP IN? If this is
ASM4242 specific I can limit the fix to it with a quirk.

v1 also only recovers on a new event. The alternative I had in mind
is retrying the DP IN a few times with a delay after DPRX fails, so
it recovers without a replug. Which is better?

I already have fixes for the Sashiko comments (the missing
tb_exit_redrive() and the ordering in tb_dp_resource_available()) and
one to skip DP IN adapters that are already in a tunnel, but I'd like
your opinion before spending more time on it.

Thanks,
Alfonso


On Sat, Nov 21, 2026 at 1:25=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] thunderbolt: missing tb_exit_redrive() in
>   tb_add_dp_resources() leaks RPM ref
> - [Medium] thunderbolt: list_add_tail() in tb_dp_resource_available()
>   breaks DP IN order
> --
>
> commit 4eedd8886dc180b45204d935f18725051dd0e6a0
> Author: Alfonso Villalobos Ulate <alfonsocvu@gmail.com>
>
> thunderbolt: Re-add host router DP IN adapters after DPRX failure
>
> This commit re-checks host router DP IN adapters when a new DP OUT adapte=
r
> becomes available or a device router is scanned, keeping host DP IN
> adapters ordered by adapter number on tcm->dp_resources.
>
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 418ad0a61a5de..1f3dea836067e 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -109,6 +109,29 @@ static void tb_queue_hotplug(struct tb *tb, u64 ro=
ute, u8 port, bool unplug)
> >
> >  /* enumeration & hot plug handling */
> >
> > +/*
> > + * Insert a host router DP IN adapter so that host DP IN adapters stay
> > + * in adapter number order. A DP IN that is re-added after it was
> > + * dropped (for example because DPRX negotiation failed) then gets
> > + * paired with the same DP OUT as before, instead of swapping DP OUT
> > + * adapters (and therefore monitors) with the other host DP IN.
> > + */
> > +static void tb_add_host_dp_in(struct tb_cm *tcm, struct tb_port *port)
> > +{
> > +     struct tb_port *p;
> > +
> > +     list_for_each_entry(p, &tcm->dp_resources, list) {
> > +             if (tb_port_is_dpin(p) && !tb_route(p->sw) &&
> > +                 p->port > port->port) {
> > +                     /* Insert before the first higher numbered one */
> > +                     list_add_tail(&port->list, &p->list);
> > +                     return;
> > +             }
> > +     }
> > +
> > +     list_add_tail(&port->list, &tcm->dp_resources);
> > +}
> > +
> >  static void tb_add_dp_resources(struct tb_switch *sw)
> >  {
> >       struct tb_cm *tcm =3D tb_priv(sw->tb);
> > @@ -118,6 +141,9 @@ static void tb_add_dp_resources(struct tb_switch *s=
w)
> >               if (!tb_port_is_dpin(port))
> >                       continue;
> >
> > +             if (!list_empty(&port->list))
> > +                     continue;
> > +
> >               if (!tb_switch_query_dp_resource(sw, port))
> >                       continue;
> >
> > @@ -130,7 +156,7 @@ static void tb_add_dp_resources(struct tb_switch *s=
w)
> >               if (tb_route(sw))
> >                       list_add(&port->list, &tcm->dp_resources);
> >               else
> > -                     list_add_tail(&port->list, &tcm->dp_resources);
> > +                     tb_add_host_dp_in(tcm, port);
> >
> >               tb_port_dbg(port, "DP IN resource available\n");
> >       }
>
> [Severity: Medium]
> Does re-adding a host router DP IN port through tb_add_dp_resources() lea=
k
> the runtime PM reference on sw->dev when the port was in redrive mode?
>
> On host routers with QUIRK_KEEP_POWER_IN_DP_REDRIVE, tb_enter_redrive()
> sets port->redrive and calls pm_runtime_get(&sw->dev).  When
> tb_add_dp_resources(tb->root_switch) now runs at runtime from
> tb_scan_port() or tb_dp_resource_available(), it adds the host DP IN port
> to tcm->dp_resources without calling tb_exit_redrive(port).  Any later
> tb_dp_resource_available() call for that DP IN port then returns early
> because the port is already on tcm->dp_resources (or already enabled by
> tb_tunnel_dp()), leaving port->redrive set and preventing the host router
> from suspending.
>
> [ ... ]
>
> > @@ -2234,6 +2272,14 @@ static void tb_dp_resource_available(struct tb *=
tb, struct tb_port *port)
> >       list_add_tail(&port->list, &tcm->dp_resources);
> >       tb_exit_redrive(port);
> >
> > +     /*
> > +      * Host router DP IN adapters removed because DPRX negotiation
> > +      * failed never get a hotplug event of their own. Give them
> > +      * another chance now that a DP OUT became available.
> > +      */
> > +     if (tb_port_is_dpout(port))
> > +             tb_add_dp_resources(tb->root_switch);
> > +
> >       /* Look for suitable DP IN <-> DP OUT pairs now */
> >       tb_tunnel_dp(tb);
> >  }
>
> [Severity: Medium]
> Should tb_dp_resource_available() also use tb_add_host_dp_in() when addin=
g
> a host router DP IN port?
>
> When a lower-numbered host DP IN port becomes available via hotplug in
> tb_dp_resource_available() (such as when exiting redrive mode or after
> resume) while a higher-numbered host DP IN port is already on
> tcm->dp_resources, list_add_tail() places the lower-numbered port after
> the higher-numbered one, breaking the adapter ordering that
> tb_add_host_dp_in() maintains.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121070804.26=
185-1-alfonsocvu@gmail.com?part=3D1
