Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B76FC5
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455033; cv=pass; b=HAUUMVXDBsOhK5KLLqxdjteZgGAA2gYvT/qaTNHks0ARbM2KHrry5oWz1aPhwAB4R1ox8DvhhVL+Nlh5Gci58Yr/Py6PIm10/u5j4a2ijgzl/2Q/sqTeXIkHu+FrYbZaxE9j/yp7BCHPhme2cOdiobwgHWPA49SezMXUCKvvaEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455033; c=relaxed/simple;
	bh=/cm5odrc5jOZr97bScSICssJT38q9Jvn7//m2wToIzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyvB4OWR4wp61ZOUzZai5dOhOwj47zYfBdN6fqIsAimjs0SuA9IAfWyd9CY6HZGYrTCf1pJcOt5K23PBxiztxhptoqMcOByjFKxkBkSRc64UjCgB8gs3j/XQUSupaI2hDFhzsAgJeTeR4yCXsrrYRVoiGtlFvhX/W7w6YTjApmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=kz9LaD4X; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="kz9LaD4X"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so32881035ad.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 23:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789455031; cv=none;
        d=google.com; s=arc-20260327;
        b=FYRJRZ9CMeNTvmFLvT53eC7t3aT2oCXLSEJWd49KQIG4GeQ0nrnDe/BPySNrK8VE6Y
         FwpI26QHwA9tHwkxjQelkdmD+ixVvukY5PDVXye4unTybgzMzA6mzNBVB6C3/xlR37Y2
         sUQtg4m2E5A0ghJixYQaP2TQ/1bNGnjCfa1SDj1/wHEBzR3wStT3uJAeLFnVo9sgKX8v
         N3gqjifwMSq/e0QauUH9aa3HCdRzuMJCuA5e8moibQGZ3+HvJZYgp04uugBrv8PlcUgb
         +2RyQIudEeCdQs3/lE5lUgfSTgckffcwHL5QQXwReOb5nk4hY0QinxccVHVFwATDce2m
         yv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHfegJmBzBXg6Ird9knvNptWFyS6nMG1u7hMjzLFoQ8=;
        fh=ZmFDM5GGNxsXJHRWw2a1AIcKFs6dCGnR/qymRuAVIgk=;
        b=EuJeEGjFnP02HFw63LF0+SOg38FG2Wo0aiQImcfq621ft0ptyzm2PqyVdam+gfUKs1
         Lbvq1nFnYcUC4SHRV3i04lpgiXOiP+E4/lTrzsFMldWn+AIayUWgTgDlxDIETtXIKzIE
         yNkR7iq+qaLh9QoLsyeMgjXjvNFgJ7XymGyHCmZ/TJ2w1729/dNpXYjguepqLmU+XpCC
         EcZkVVqT4GfKm6hyH2fQPtVk0oXsGVCp7u3NiwHeJBoYoWnpJGk6dTqgNIpR10QdTSQY
         1SG1mrORXLTpm76QasRrHcCTfSrTxW7XoIbtOve92GazTWYsySutYmS77/V3mK0cZHTR
         gEFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789455031; x=1790059831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHfegJmBzBXg6Ird9knvNptWFyS6nMG1u7hMjzLFoQ8=;
        b=kz9LaD4XIcS9ab/SpG2XBrdC+Ij675IAXwYnlBSgFxEq2eZmLrRsPAyvm3AkzMBwKY
         Eud6iDDXMnW4XZZa1BmuH4lLi8Xwh/yFsEBvBQpEOoQk4/1oGFcHo7ahvgP9vYaSYrau
         pHTkUBADqHOM1U46EsszbmtKEGokBxtbbPHQ33j0bwhBW75wwzPJDEXPgzokiDLd/vJo
         vkQUvruxFzF1EdxECR1b5W7wElzHcOf3ekDQ/AF1zfttfhXbSnl02Dya85p+nmfcrN6Q
         ibMOqafNP+dsqyFzzbAL76akjn4kdaQTi2EMkn5xOnE+DgSHzNTB19XBMQkALESdpPN4
         AyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455031; x=1790059831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHfegJmBzBXg6Ird9knvNptWFyS6nMG1u7hMjzLFoQ8=;
        b=NxunlP3NAgnosgRU1B9CwkmH4G0Dr3zIEeRGh9GERrNK+DAcdRzYfLtxSWZUv1wQi0
         LMqyqzveHwc9aN9bLFSFUGl/h3ipuDSYnGkCZoGuRwbqtzu3bp4t5yCkl/gqzv9Xf4f9
         40bnT5p3JvrH7FroCf5uAupbBr0ZZGyzCRnSbmKL/JanexgGtm14kAe1fSuikFyZyXDo
         BIaUzZgM34+So4nhTu1XSU9W9PMymdxEwXvmXLB+s4w6BbVcgbJKupEkx2LjTz8/VzkB
         +bNGQCZSQxKZGsD4ZhjfnrYVs6rzL3hKupO2rK+HvsHtyZch5LeNaUzm870VpqXrXW29
         caNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz14kXn9eK6z/PbX+45btdMUyLy3Ot7sBTXEbkeBUhVU1aWMfjG8cil3Vd5BWF96z3IzjFoMmpcl2A=@vger.kernel.org
X-Gm-Message-State: AFuF++nghePLtwigqZpAJGGwFvD98RbVwqQzMufeNttGK1wEPE+V+KqV
	YXdJ9qMJTgGqBYWdlfURPfn2E8gdnyMQmKk7A/Q9zSZdUrCzRlBcjTKMabQh1ufzQiLuluqL//f
	5r999g/XpEdbo5wW4tsnHNqrvh8iUp7yBTywdE8M9
X-Gm-Gg: AYBFou2oSSTtV747zP0IVYbaVjrIOVlFersEH5N5SQhgZ3agQPc49PqMFFT9uz98jXq
	/58YQ5GC3oclJQVOFGMbMhthzug8V6XJYiZrOz4gWZrFlI+IBzqWszTJYYAIBWNyrpmlQLGfspx
	wtb/jNE8LA4hsRGT5TncQyGPr6ztJUJhdSVhKwwMS1CDYPWvg4J9QCi+irwtRSPZ6yZ1QIylapr
	tb/4WyiB7/kD21+7aBKsVLNIvPa3Z7MmOc2BG5l8bLwc8WzdTNriNp5f20H2JDOqSR+NJMgaBDv
	ewaEO03u3DzdVQeW3XlkNAjAzdc/05kj0/KUM+5sdCG6Mc510K+W0hFWFy4v9Tpx7S2xG7NUHFq
	NptL+z8ZlZghkkGJWGhJHai2paenbFV6crdodcZN8QqKABw==
X-Received: by 2002:a17:90b:3e85:b0:39d:f97c:bb2f with SMTP id
 98e67ed59e1d1-39df97cbeefmr7436489a91.3.1789455030721; Mon, 14 Sep 2026
 23:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh> <2026091217-almighty-slouching-de2c@gregkh>
 <CAPpSM+TjBEDy0zpkeNfz2ZeCZxYBHSKrw3spDBYS-kBw=EXL8g@mail.gmail.com>
 <2026091348-sheep-showman-5a20@gregkh> <CAPpSM+RR1ztW_iCnSkYCm62VWsLYygXr2hWEeoikKk9Q8HKR3Q@mail.gmail.com>
 <2026091546-spoiler-borax-ed6c@gregkh>
In-Reply-To: <2026091546-spoiler-borax-ed6c@gregkh>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 14 Sep 2026 23:50:20 -0700
X-Gm-Features: AcwNN1VjfPyn5bzDCRPAnyDxIKYlDLoc_Gvi-ECILrBxKgOyGUMipD-10NOD7OE
Message-ID: <CAPpSM+RXw7v_9Qnxpvkm7CZA2AzyuA79eSWUGyMG3nanLeyJrA@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: NULL pointer dereference in stub_recv_cmd_submit()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: co <co+66c3f58096d0bde8@bugs.sh>, linux-usb@vger.kernel.org, 
	Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Suwan Kim <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Sep 14, 2026 at 03:11:08PM -0700, Xiang Mei wrote:
> > On Sun, Sep 13, 2026 at 2:19=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sat, Sep 12, 2026 at 11:41:00AM -0700, Xiang Mei wrote:
> > > > On Fri, Sep 11, 2026 at 10:47=E2=80=AFPM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Sat, Sep 12, 2026 at 02:06:13AM +0000, co wrote:
> > > > > > This is a bug report, not a patch submission. See
> > > > > > https://bugs.sh/reporting.html
> > > > > >
> > > > > > We found a bug reachable in:
> > > > > >
> > > > > >     path    drivers/usb/usbip
> > > > > >     crash   NULL pointer dereference in stub_recv_cmd_submit()
> > > > > >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://=
git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> > > > > >
> > > > > > Config, environment, the sanitizer report and a C reproducer fo=
llow.
> > > > > >
> > > > > > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > >     If you fix this bug, this tag credits the report and lets u=
s
> > > > > >     close it on our side:
> > > > > >
> > > > > > Reported-by: co+66c3f58096d0bde8@bugs.sh
> > > > > >
> > > > > >     Everything in this mail is validated by the reproducer belo=
w.
> > > > > >
> > > > > >     We also hold an unreviewed LLM-generated analysis and candi=
date
> > > > > >     patch. The same reproducer panics the unpatched kernel and =
runs
> > > > > >     clean with that patch applied. Use it as a starting point, =
or ignore
> > > > > >     it and write your own:
> > > > > >
> > > > > >         patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.di=
ff
> > > > >
> > > > > Please just submit patches like normal, in a format that can be a=
pplied,
> > > > > and do not make us go to random links to attempt to get any infor=
mation.
> > > > > That's not how kernel development works at all.
> > > > >
> > > >
> > > > Hi Greg,
> > > >
> > > > Sorry about this. We may have misunderstood your earlier reply in t=
his thread:
> > > >
> > > > "But sure, posting bug reports is fine, but again, patches are bett=
er :)"
> > > >
> > > > https://lore.kernel.org/all/2026090139-shortlist-junkie-9bee@gregkh=
/#t
> > > >
> > > > We interpreted this as meaning that sending bug reports without
> > > > patches was acceptable. We understand your concern with the current
> > > > format, and we will stop sending reports in this format to you and
> > > > linux-usb@vger.kernel.org.
> > > >
> > > > To make sure we understand correctly and follow the appropriate
> > > > practice going forward, should we:
> > > >
> > > > 1. Send pure bug reports without any LLM-generated analysis or
> > > > candidate patch, similar to the bug reports syzbot sends to kernel
> > > > mailing lists;
> > > > 2. For USB, do not send bug reports and only submit patches in the
> > > > normal kernel format; or
> > > > 3. More generally, do not send bug reports to Linux kernel mailing
> > > > lists and only submit patches in the normal kernel format?
> > > >
> > > > Sorry again for the misunderstanding, and thanks for taking the tim=
e
> > > > to clarify this despite your busy schedule.
> > >
> > > Think about what _you_ would want to see if you were on the receiving
> > > end of hundreds of patches a week.  Would you want to see a vague ema=
il
> > > with links required to dig stuff out to potentially have to make up a
> > > fix yourself for an unknown and poorly worded description, or would y=
ou
> > > want a real patch, in mergable format, that describes the problem and
> > > how it is being resolved?
> > >
> > > I think the latter :)
> > >
> >
> >
> >
> > > Right now, most developers just ignore syzbot reports, as we are
> > > drowning in real fixes from developers instead.  There's no need for =
us
> > > to go research new fixes when we are having a hard time keeping on to=
p
> > > of the stuff people are sending us that are in mergable state already=
!
> > >
> >
> > You are right. We understand how overloaded maintainers and reviewers
> > are right now.
> >
> > It's true that bug reports without a mergeable patch still take
> > maintainers' attention, even when no response is expected.
> >
> > We'd still like to make one last request: would it be okay to continue
> > sending a small number of reports to other lists, with no external
> > links (just PoC and crash sanitizer log)? We'd take responsibility for
> > each report and follow up with a patch, even if no one responds. We
> > just hope that contributors who know the subsystem better might be
> > interested in helping us check the issues.
>
> Why not just send patches to resolve the issues?  That's the best thing
> to work from, especially as you have ways to test if your patch is
> correct or not.
>

We appreciate your suggestions. We'll stop sending reports and instead
focus on working on patches.

Our original consideration was that reporting the bugs could help us
scale the patching effort. But you are right that maintainers
currently don't have the bandwidth to review these reports. We'll do
the right thing and move more slowly but make concrete contributions
by sending human-checked patches instead of reports.

Thanks again for your suggestions and for taking the time to discuss
this with us. It has been valuable talking with you.
Xiang

> thanks,
>
> greg k-h
>
