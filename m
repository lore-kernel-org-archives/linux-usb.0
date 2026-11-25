Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795569771;
	b=CCcBkWzLxLS0PHcobz76XC6oOgpuHcrRcPNQinouoEOl2NL14zNs0jEW4ACGQbm/mmnK
	 NeZ1FzyRsAuljesCFzrMzV17RxnshnGFn1e19tsZMV/fwAZqSkuADfWswFAg34b7lfnij
	 EHE50H7gVogmYttG9fhktjj+lobZG4ccijwYMJbCyAT2y9sgpCl13vSd0KvkV28HeuQDu
	 IR24Bk4gwLX8l9vG0CgWslXz4+9/5AdQdBHtVZ+RedJ/Fsmd7FE/wlvxWUFA5cyZHdZVW
	 qtXh1AA0V4JZY5HK07B7fmBCz3SR+8Py900QsnjqXT1kmu/ym/8W3qLz1mTSbWoiWaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wNiHe9qvjeLSIhDwarY1WjZQZ+c5iOrBNm9DgIHA17g=;
	b=J77Y6QO2JsezXMFD2hYJcBNXji4kWW5cr6uH+RHZsiH3do8S0Yc480HW+ZbwQFU3U5Vf
	 evqV11MVI4yuZq2K0o7vFiy+2mg+VlzfCIKfl80Kuobk9wCYQ6T0uH7j6rSeaqwS6jd3h
	 bRNCqH8BRFBiXTQi8hlXYOttsOxEVvmPK6Mloa38UzelxvPFUqgy5GKrSDuOa0plKYVsS
	 Y8REhmN0Eb3i4U91t+WpOB+f4D0rODtRKzT7XZk1a1Lko4Qh/3JJXn0SMl7btC9b7bGkC
	 HI8nVk6+Mv5jR4uewo4IoyI5JdB3ZJ/ekPXroznFu/ybAWK31tXNCUidSGD3a0ksbDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0G3N+u91;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84C606A326
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 01:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED84C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0G3N+u91
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso2054255a12.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:22:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795569769; cv=none;
        d=google.com; s=arc-20260327;
        b=KmkvMEV2gxe/0vIgWQIQppq2EI0n7V8Ahtxuumhw0ItksC/vcOWdXgtvsyRf0oan66
         b1h3VGeX7anvVR9cNERGKms5T7Ul68F668Lf0HqVO6tmYWks/ZVqUoxDToy8vE63pdj5
         kFpNhFYEIr2xTTtF4LC549gcj6dsWhQmve5tTGxR2OzuB9dwrYVu3GS1xmfabIxc0M+D
         tR7nj5VJF1afcY5pcOjNOsuY9P7fM639YkKo/cG0bVUzch+SMRaoh2I0hREsyFbxCQZJ
         cGZQNsu3QkSrpI2NMfnz6VWSEn27WDAeJSXUY7QeCC/0FGie4UwdyJAWHtrbYsgEsem9
         vPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wNiHe9qvjeLSIhDwarY1WjZQZ+c5iOrBNm9DgIHA17g=;
        fh=ummwAOwxnNgeY1X/cgIwNayyuJroHY7VEfXnG1IGqOg=;
        b=aN1G/4o8FeeoNRV5BQLi7iFnLi+MY9mldPtp6jUrnbx83as+acelxlXWOKNELz2mAa
         oL7GKpBh4ux/HyMZRHSzU7khQYCjHZ8AZ210cmkieT6T6vaz+WXzO8T/6NKtbCCTXcf6
         1dn6eSFxutEnzMJ9fTK/i8oKGw6SETNC2u+JKAX48mhJ7Td1dRPMaDee76HEw3BRTU7q
         rZX1xUAQG88n9nyUpdzgRceg2TPKEO/UqHI3YFLCp9WiqcR3tFH4BZfF1pvphNtd60ZK
         N5evZUi93XXOrs7SLvWrSEFFB6AJ6ZD3NKv/L/Tn5TK1wgffAmCZb/yRCVMrw/DApAYC
         4NHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795569769; x=1796174569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wNiHe9qvjeLSIhDwarY1WjZQZ+c5iOrBNm9DgIHA17g=;
        b=0G3N+u91D8EA8Sz4lrEzn15RIlrWVPJ2E237FQOueNDAY4bjYgW089rsVNFFaAKTOW
         bqY2sbhc6g64GFB3eD71YqRgz28MV7F8XeR5C/P6T76lpjIC02T38F34+iZ3yLbNhJer
         sVPbWrhgTHlP4ECfcZCrfEhtZPR8NDoq+l9Z9TJVqaHN/JnZtGWC7tgEQhPKSXSiO8PF
         KGx54fL7Ddmi766AnCqQnS+K+xDpTdwBlkrBfelM6Sd4IIkMqqN3xo6zFM1dbTkcJqQ3
         VdyzHhbldRwobIAGmuewnJZyLpltQu9+F/njcOSPpyzCL59hxdJArNTJgcyT1jZCc594
         Dfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795569769; x=1796174569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNiHe9qvjeLSIhDwarY1WjZQZ+c5iOrBNm9DgIHA17g=;
        b=25mcSS5bjePbEtqj2Sq/gob6z8oEc7rnFiraepG+WJD8pzuFnkfJZKmV3LApE74dJs
         3OKPyGeILgCT7+vVIU8qkjoyJAYZG8Quj812x2Am8gxb0Ql0lcFCk1NBuJKMbkbvctch
         oL40BaPD0F1jKfLdCUX8dfhod1ihiK27npAb6VQMeBhmxiI91y8J3l5XBsXUONe+XtHJ
         T1oqWAOGetkIk9KT9mcWgHP9b59UyyMlrQIrgByO18ahvfzFJIOkrZiz06meQYnzyZ8Y
         vBs2I5Pzk09+cpilLz6g/wBnnUEYYXrj2YO6IJXJoPg1hGDuVUpKaJ23V7jwe0CwBI9B
         aFLw==
X-Forwarded-Encrypted: i=1; AL+hErG/ehJA6HU+G79SkOqkVkklRY5gTMxID4v9mzQKV0Gb5avtVoFhpX8fkxaWU6CbGPmSedwycyWcD+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N/HyiysIJJC6I4RWH+fF6VCnsSq8Ouy5UtEw/K4E8VVBZfoHU
	9U8VhhVtCASB+g80ozsD5z2IXuy7CAMBMg0JSh5HHexT5DxpshhnXZwUazTIsSWLYQD3sWRO+YF
	6bvk+Rr6A4BCv45bXwMrq14N6m4FyHkQ=
X-Gm-Gg: AZFdTZfWaTzfLUBOOvbAlMptr+jKgohAKIq0/F+JljIn+Aeoj0RVOX055ehYUOIUZ8p
	0tiGuZ56xgMDtJgj0TnhBi7Gmz5Qb06oLN63/zGmk0nNCReHZQ0V4S/HmseTwlwIvii9zP6KQX0
	NLyjflfKQ6S32M50lJfK0xVlN4BLkT1HbX1FybF4y/WAZK+q+F1DYi/Zgr1aO/scOe2WMGn+p8W
	IqkeyXIjUwaNwHQXu91TKmZ1kpfFtk232N6vYLQCesI7jNiL8R4RW5xMvV0xyA1ps/tfcU1jWx/
	nxSmDMPWONFikigx+kjEh6cFGptMcTjZomO3RP/2WggIPNvC2dc3+Ia+1s0ObnmlqWSLxpY6Rhg
	328PDMAwqFSRt3mONKUTD4N8Nf/8Wdg5itg/+y1uQYZcG9oaVQtNfcvR8CAKtIrasYHUAM79svS
	WQ08FZv9jU7HRN+zkbympSPrbP
X-Received: by 2002:a17:90b:2792:b0:3ac:4e18:238c with SMTP id
 98e67ed59e1d1-3b41cb0c476mr13175916a91.49.1795569769043; Tue, 24 Nov 2026
 17:22:49 -0800 (PST)
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
 <CAJ=mrFowQNahOjD-NQzcuJCjPE=efvDK85kMpseRUrqYBwX3Sw@mail.gmail.com> <20261123054042.GL229695@black.igk.intel.com>
In-Reply-To: <20261123054042.GL229695@black.igk.intel.com>
From: Alfonso Villalobos <alfonsocvu@gmail.com>
Date: Tue, 24 Nov 2026 19:22:37 -0600
X-Gm-Features: Aa3M54pT0_8tgO6P1r4mw5msEUdOT3vfDvbG2P3XisMd4UFaW0VbA8wVLw_bRT4
Message-ID: <CAJ=mrFqe1ujyq5oX==HQ8MsBRNb_64dPZz7aHg5LYBYtKVOGvg@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Re-add host router DP IN adapters after DPRX failure
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: sashiko-reviews@lists.linux.dev, westeri@kernel.org, 
	linux-usb@vger.kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the details.

> Does the RX 9070 driver poll for a new connections periodically like the
> i915/xe or it supports PME?

It doesn't poll. When I looked into adding it, the GPU had no way to
check the connectors without taking the core out of suspend. After a
wake it stays on for about 5s, so polling every 10s would eat most of
the savings BACO is supposed to give. I haven't actually measured it.

The card does support PME, but in my testing a hotplug on the TB side
doesn't wake it up. From the amdgpu code, PME seems to be used for the
audio function and only while the card is active.

So I think the problem has two parts. On the GPU side, PME wake on DP
hotplug looks like a firmware limitation. I'll share my findings with
AMD and see what can be done there, but I'm not sure how much I can do
from here. On the TB side, the host router never sent a new hotplug
for 0:10 after the DPRX failure, so I still think the patch is useful.

Thanks,
Alfonso

On Sun, Nov 22, 2026 at 11:40=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Sat, Nov 21, 2026 at 09:07:04AM -0600, Alfonso Villalobos wrote:
> > Hi Mika, hope you're having a great day.
> >
> > I'd like to check the direction with you before doing v2. After the
> > Sashiko review and looking closer at how host router DP IN adapters
> > are handled, I'm not sure v1 fixes this in the right place.
> >
> > The DPRX failure happens when the RX 9070 XT feeding 0:10 is in BACO.
> > With runtime PM disabled for the GPU it always works. After the
> > failure the host router never sends a hotplug for 0:10, so it stays
> > unused until something triggers the re-check from v1, here me
> > replugging the dock at 00:27:26:
> >
> >   [00:26:36] 0:10 <-> 1:11 (DP): activating
> >   [00:26:36] 0:11 <-> 1:12 (DP): activating
> >   [00:26:48] 0:10 <-> 1:11 (DP): not active, tearing down
> >   [00:26:48] 0:10: DP IN resource unavailable: DPRX negotiation failed
> >   [00:27:26] 0:10: DP IN resource available
> >   [00:27:26] 0:11 <-> 1:11 (DP): activating
> >   [00:27:26] 0:10 <-> 1:12 (DP): activating
>
> Does the RX 9070 driver poll for a new connections periodically like the
> i915/xe or it supports PME? The current DPRX timeout is pretty much
> following the i915 that has 10s polling period so simple way of working
> this around is to set thunderbolt.dprx_timeout=3D to match that.
>
> > The DP OUTs also end up swapped, so the ordering part of v1 doesn't
> > work as intended either.
>
> At the moment tunnels are created pretty much in the order the hotplugs
> arrive.
>
> > The comment in tb_dp_tunnel_active() and the redrive code both seem
> > to expect a hotplug for host DP IN adapters. Is the ASM4242 supposed
> > to send one once the GPU starts driving the DP IN? If this is
> > ASM4242 specific I can limit the fix to it with a quirk.
>
> The hotplugs should happen when the host router is enumerated so for
> example in your case it should work so that if graphics did not do DRPX
> capability exchange in time, the DP tunnel is torn down and if conditions
> are right the domain is put to sleep. When you wake it up there should be
> new hotplugs to DP INs so the resource is added back to the list.
>
> > v1 also only recovers on a new event. The alternative I had in mind
> > is retrying the DP IN a few times with a delay after DPRX fails, so
> > it recovers without a replug. Which is better?
>
> Can you first check if drpx_timeout=3D helps in your case? If it does, fo=
r
> simplicity one option is that we just make the default match the "biggest=
"
> and some slack.
>
> > I already have fixes for the Sashiko comments (the missing
> > tb_exit_redrive() and the ordering in tb_dp_resource_available()) and
> > one to skip DP IN adapters that are already in a tunnel, but I'd like
> > your opinion before spending more time on it.
> >
> > Thanks,
> > Alfonso
> >
> > On Sat, Nov 21, 2026 at 1:25=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential
> > > issues to consider:
> > > - [Medium] thunderbolt: missing tb_exit_redrive() in
> > >   tb_add_dp_resources() leaks RPM ref
> > > - [Medium] thunderbolt: list_add_tail() in tb_dp_resource_available()
> > >   breaks DP IN order
> > > --
> > >
> > > commit 4eedd8886dc180b45204d935f18725051dd0e6a0
> > > Author: Alfonso Villalobos Ulate <alfonsocvu@gmail.com>
> > >
> > > thunderbolt: Re-add host router DP IN adapters after DPRX failure
> > >
> > > This commit re-checks host router DP IN adapters when a new DP OUT ad=
apter
> > > becomes available or a device router is scanned, keeping host DP IN
> > > adapters ordered by adapter number on tcm->dp_resources.
> > >
> > > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > > index 418ad0a61a5de..1f3dea836067e 100644
> > > > --- a/drivers/thunderbolt/tb.c
> > > > +++ b/drivers/thunderbolt/tb.c
> > > > @@ -109,6 +109,29 @@ static void tb_queue_hotplug(struct tb *tb, u6=
4 route, u8 port, bool unplug)
> > > >
> > > >  /* enumeration & hot plug handling */
> > > >
> > > > +/*
> > > > + * Insert a host router DP IN adapter so that host DP IN adapters =
stay
> > > > + * in adapter number order. A DP IN that is re-added after it was
> > > > + * dropped (for example because DPRX negotiation failed) then gets
> > > > + * paired with the same DP OUT as before, instead of swapping DP O=
UT
> > > > + * adapters (and therefore monitors) with the other host DP IN.
> > > > + */
> > > > +static void tb_add_host_dp_in(struct tb_cm *tcm, struct tb_port *p=
ort)
> > > > +{
> > > > +     struct tb_port *p;
> > > > +
> > > > +     list_for_each_entry(p, &tcm->dp_resources, list) {
> > > > +             if (tb_port_is_dpin(p) && !tb_route(p->sw) &&
> > > > +                 p->port > port->port) {
> > > > +                     /* Insert before the first higher numbered on=
e */
> > > > +                     list_add_tail(&port->list, &p->list);
> > > > +                     return;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     list_add_tail(&port->list, &tcm->dp_resources);
> > > > +}
> > > > +
> > > >  static void tb_add_dp_resources(struct tb_switch *sw)
> > > >  {
> > > >       struct tb_cm *tcm =3D tb_priv(sw->tb);
> > > > @@ -118,6 +141,9 @@ static void tb_add_dp_resources(struct tb_switc=
h *sw)
> > > >               if (!tb_port_is_dpin(port))
> > > >                       continue;
> > > >
> > > > +             if (!list_empty(&port->list))
> > > > +                     continue;
> > > > +
> > > >               if (!tb_switch_query_dp_resource(sw, port))
> > > >                       continue;
> > > >
> > > > @@ -130,7 +156,7 @@ static void tb_add_dp_resources(struct tb_switc=
h *sw)
> > > >               if (tb_route(sw))
> > > >                       list_add(&port->list, &tcm->dp_resources);
> > > >               else
> > > > -                     list_add_tail(&port->list, &tcm->dp_resources=
);
> > > > +                     tb_add_host_dp_in(tcm, port);
> > > >
> > > >               tb_port_dbg(port, "DP IN resource available\n");
> > > >       }
> > >
> > > [Severity: Medium]
> > > Does re-adding a host router DP IN port through tb_add_dp_resources()=
 leak
> > > the runtime PM reference on sw->dev when the port was in redrive mode=
?
> > >
> > > On host routers with QUIRK_KEEP_POWER_IN_DP_REDRIVE, tb_enter_redrive=
()
> > > sets port->redrive and calls pm_runtime_get(&sw->dev).  When
> > > tb_add_dp_resources(tb->root_switch) now runs at runtime from
> > > tb_scan_port() or tb_dp_resource_available(), it adds the host DP IN =
port
> > > to tcm->dp_resources without calling tb_exit_redrive(port).  Any late=
r
> > > tb_dp_resource_available() call for that DP IN port then returns earl=
y
> > > because the port is already on tcm->dp_resources (or already enabled =
by
> > > tb_tunnel_dp()), leaving port->redrive set and preventing the host ro=
uter
> > > from suspending.
> > >
> > > [ ... ]
> > >
> > > > @@ -2234,6 +2272,14 @@ static void tb_dp_resource_available(struct =
tb *tb, struct tb_port *port)
> > > >       list_add_tail(&port->list, &tcm->dp_resources);
> > > >       tb_exit_redrive(port);
> > > >
> > > > +     /*
> > > > +      * Host router DP IN adapters removed because DPRX negotiatio=
n
> > > > +      * failed never get a hotplug event of their own. Give them
> > > > +      * another chance now that a DP OUT became available.
> > > > +      */
> > > > +     if (tb_port_is_dpout(port))
> > > > +             tb_add_dp_resources(tb->root_switch);
> > > > +
> > > >       /* Look for suitable DP IN <-> DP OUT pairs now */
> > > >       tb_tunnel_dp(tb);
> > > >  }
> > >
> > > [Severity: Medium]
> > > Should tb_dp_resource_available() also use tb_add_host_dp_in() when a=
dding
> > > a host router DP IN port?
> > >
> > > When a lower-numbered host DP IN port becomes available via hotplug i=
n
> > > tb_dp_resource_available() (such as when exiting redrive mode or afte=
r
> > > resume) while a higher-numbered host DP IN port is already on
> > > tcm->dp_resources, list_add_tail() places the lower-numbered port aft=
er
> > > the higher-numbered one, breaking the adapter ordering that
> > > tb_add_host_dp_in() maintains.
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026112107080=
4.26185-1-alfonsocvu@gmail.com?part=3D1
