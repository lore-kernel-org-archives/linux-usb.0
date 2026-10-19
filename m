Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568294AAC62
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403759; cv=pass; b=RTfXD5AlSyPPP4PkQgDALzOncT1IfjppMYxuhQjn7N3a1JY16+amGXM5jnZ4JLKIMA6n9bWEJpZDDVFl3FAMUj+gq4MPp6hrtaOoNF/VCyljpPzf8v0mbPxjLBCrednn03ilqLf2V1fVkHREtUwdS1xpxJdaAYlw1BqAVLlSkBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403759; c=relaxed/simple;
	bh=gqi3U7n/QtDsR5wlhBbyg7CifMun5YBwGtD8IH4Foxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piRnv7O/7F9mOhRrTh0BHuz1sjhZ7/J91BB+5gSegoF/Esl7I1KeG2SGfph7e4tDlzNVrpEttlch5JveFiFgO7mVCDjIYgQd7Hy4YmwqjjsY+P1PBtPgInOiFHDjXWYvywL+/Oul1mF8RCjwjFvWeSw1QyWpy6WcQi6XnoFFAiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EDWJ/FlJ; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EDWJ/FlJ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so1308264e87.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792403756; cv=none;
        d=google.com; s=arc-20260327;
        b=oDiAjayfklTRRqAOMxwHXi1s7RcX+E4HCNkWTs/mERXWm7fbFtcXNxkIs8TemmKWix
         COG/qcg1b142tWuM1+nhFE2tZ4p5Fy06C2eEXunseKEZ2x1vFBSLbAVJpqSySfA4hYqr
         wIzuZFrVgdksqRc/0ewQLMB4V5ng2riuBWCgGsGbYPb7GjtCg5usohN6Pl1dZ6NeqUN1
         VmafuBHpFwobbBqn2RBPuMOC9jduogrViZHOf7NcPotLo/azWHeCVpUAazNGiFINk92Y
         xVSS3cn0+ig/XyzFIGXN/PQeh1R1+c7pG5s/jqbvmd/T3158JQ733LJqzmNXJCa31bbR
         BsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MuJPDRdTy81KjotvArVXlt4OrVu92Si9O0HYOV8J+9o=;
        fh=pb9xropvH1rsCjEg8gJQVFFHtbmdyLUMzum+iC0alN4=;
        b=emQJgUFKvkJo9c1uVQZ8KEYQasofIoKSdrur3C4LBdq2GkKD2VysGGxx95ljRFLV2e
         1PwolxWw7j/hoixXIFEoMms8hu/Yz3wc67hJBwMIJOW5n8hLGf3U5c1IVFJGCBAO6huw
         O2UkAzqb6DkYUlGItV9JVxR/hjbgJbznB74kII41POBk9TWonwMoogQiqDuoUQcmCiPp
         PSrrHv4teLbbjnysVshadc5eTmq/we8M8wkegZvP44vmpOV8QT9+83yvuxQ81RIHIVwY
         oc3XAjv7iINWvHmQ0p6Umbh2ZoUxeluogsoXwWikqOT0IQnsETOqFhY3nb6bpcUpO9oM
         +rGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792403756; x=1793008556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MuJPDRdTy81KjotvArVXlt4OrVu92Si9O0HYOV8J+9o=;
        b=EDWJ/FlJfmX2v91zxOsOCF5x37Q+IOa7JfFvjNDfGzKEGuln9OB68EyqJy2UUbI4gc
         Wb4gnUxCZ980F3gu4kb3Ij+tVs1Av7GEDtUn+uRl9cVtzENZOQ9CukFcZjetedHS51Md
         X9LDDE6x6VeZH8ElMQhQWYH+w2ws3vhusxHlcx//gNLmMouR9CEGiJuzVYY7Ly/isvZy
         Zk/gLvTmM7q/r61NxW5tb1pEwc4nZ/Ue5PFARi7C1cwJF0IbtAq8xzh+ulda1xUmeQB7
         P2TKv0Eu26dlJ5jleLFovEBr8qmdTHzfthmhRPTQFN9YrXMo+kKzvnsSK1LjHm58thb6
         hp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403756; x=1793008556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuJPDRdTy81KjotvArVXlt4OrVu92Si9O0HYOV8J+9o=;
        b=cMqVY0jnKsjCCSR9wAjSmu/lItLGscfGP/RErUa781WJSl2gP2nUeJBwAxK3M9W8nY
         6uMoTzokJlekYR42Tg6VzjOegQy1WHDRcyGyPhAqYirs97WejvMdi9OqcH/+I/c0dGlX
         OpaZh6y8q8357NYdlMvL9obWBv/h4msQamMmMHKPpqmkGpTDELB/tJnpg2Wr3CbAggUg
         4AezGCmD29xumeo7k6b92Jp3yZI4XYjkB62lco8Jhfb2MkBANalupB+C8H8rul9yY9Rl
         gtnoAPoM8no7gYQDasUbgvUb2iRb5vGLUdjzzAWHr1SQSMBNH0wwvg26/+FFC6ae746X
         USeg==
X-Forwarded-Encrypted: i=1; AKwUvBxX0CV7D9f/4mKo14dBnzekmdSnAsez8y+dc3+cckRNTR3V2rhwxT559SiOaevHcs1FtTMfBUmBYM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7jJJyyLcgoeRlX8arC+QDWAAdFw/1OXo3UWUTFzpaz287aY3b
	pJ3mABnUL5hK1UxjFXalnsOYh7RDjHfhVoS8D4BzowW4M1W30TLXplDCWlt1d7pzQHxKJSmZaIC
	f8zTogvrG4W04sIML6hipimy+hssgmBiYTqLGmizi+Q==
X-Gm-Gg: AYBFou2QTpF7EprnnbeCEDARkAOZjx7Gf2Ebl647aQb5Wp7wBSyed8vTtaXO+/1ZAsA
	1/8jJgFjKCHcZVq6WErYud9acmkl7MZzuT6ZtvQZ8cjjeOoYM5t4D9rfC1DLC77wdUArGckIj0v
	20J9aU3C5vNvJFOhaPiF9AL4fKnyF/u/iDZ9Id//r46at0CIP8zguMBy1FrBeAGnhG15dBwZ8/3
	VJI2sgLCzwMXPiX3tIoXQKVvQvmUWMrZ4v5QFyn2BPyX2VQUVyAh/DBYTBJTRttTBnGnHj6pyyB
	wlViphKYfK3z9GbSK0L6MvI3jne20Y9r39s/Ov208VG9/LvfOPa23FrG+aUP6XkjbUcFUMn5jpI
	Pg4hJi8bQZiOa
X-Received: by 2002:a05:6512:b84:b0:5bc:bb39:1b53 with SMTP id
 2adb3069b0e04-5be50a73b7dmr2347028e87.31.1792403756369; Mon, 19 Oct 2026
 02:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012095452.135828-3-marco.crivellari@suse.com>
 <179188543192.434549.4257004266357227847@kernel.org> <20261018143442.GM503057@horms.kernel.org>
In-Reply-To: <20261018143442.GM503057@horms.kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 19 Oct 2026 11:55:45 +0200
X-Gm-Features: AclHuK_6oFqzh3TbYN_-CW7N1nWbLX95zNftyFclNTBVaLpWf8RWHFN24zLVM5Q
Message-ID: <CAAofZF4YxqKihS3TtYXyT6y-f5pH9XjYiXKo2VzjXWWZ3OWjRw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/6] net: ti: icssg-stats: Move long delayed
 work on system_dfl_long_wq
To: Simon Horman <horms@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, tj@kernel.org, jiangshanlai@gmail.com, 
	frederic@kernel.org, bigeasy@linutronix.de, mhocko@suse.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, enelsonmoore@gmail.com, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 4:34=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Tue, Oct 13, 2026 at 09:57:11AM +0000, netdev-bot+sashiko@kernel.org w=
rote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] The conversion is incomplete, so one delayed_work is queued =
on
> >   two different workqueues.
> >
> > --
> >
> > net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
> >
> > This commit changes the self-requeue in icssg_stats_work_handler() from
> > the per-cpu system_long_wq to the unbound system_dfl_long_wq. The goal =
is
> > to let the periodic stats work benefit from scheduler task placement.
> >
> > > diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/ne=
t/ethernet/ti/icssg/icssg_stats.c
> > > index 7159baa0155cf..7d6d6692d8192 100644
> > > --- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
> > > +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
> > > @@ -69,7 +69,7 @@ void icssg_stats_work_handler(struct work_struct *w=
ork)
> > >                                             stats_work.work);
> > >     emac_update_hardware_stats(emac);
> > >
> > > -   queue_delayed_work(system_long_wq, &emac->stats_work,
> > > +   queue_delayed_work(system_dfl_long_wq, &emac->stats_work,
> > >                        msecs_to_jiffies((STATS_TIME_LIMIT_1G_MS * 100=
0) / emac->speed));
> > >  }
> >
> > [Severity: Medium]
> > Is this conversion complete?
> >
> > Both ICSSG drivers use icssg_stats_work_handler() for the same
> > emac->stats_work. Both prueth_netdev_init() functions, in icssg_prueth.=
c
> > and icssg_prueth_sr1.c, do this:
> >
> >     INIT_DELAYED_WORK(&emac->stats_work, icssg_stats_work_handler);
> >
> > However, the first run is still queued on the per-cpu workqueue from
> > the ndo_open path:
> >
> > drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c:emac_ndo_open() {
> >     ...
> >       queue_work(system_long_wq, &emac->stats_work.work);
> >     ...
> > }
> >
> > The follow-up patch "net: ti: icssg-prueth: Move long delayed work on
> > system_dfl_long_wq" converts the matching call in icssg_prueth.c. No
> > patch in the series seems to change icssg_prueth_sr1.c.
> >
> > On SR1.0 hardware, the first stats run after each open would still go t=
o
> > a per-cpu worker. Every later run would go to system_dfl_long_wq.
> >
> > Could mixing the two workqueues also bypass the non-reentrancy check in
> > __queue_work()?
> >
> > kernel/workqueue.c:__queue_work() {
> >     ...
> >               if (worker && worker->current_pwq->wq =3D=3D wq) {
> >     ...
> > }
> >
> > The instance running on system_long_wq re-arms onto system_dfl_long_wq,
> > so this check fails. If the timer expires before the first worker
> > returns, a second instance could start at the same time on another
> > worker.
> >
> > Today this looks harmless. The handler does nothing after
> > queue_delayed_work(), and emac_update_hardware_stats() takes
> > prueth->stats_lock.
> >
> > Should emac_ndo_open() in icssg_prueth_sr1.c also switch to
> > system_dfl_long_wq, so stats_work is only ever queued on one workqueue?
>
> It seem to me that it would be worth getting this right upfront.

Thanks for your comment on this Simon.
It likely makes sense to change it there as well. I will check for the v5.

Thanks!

--=20

Marco Crivellari

SUSE Labs
