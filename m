Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0114570D8
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 22:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423882; cv=pass; b=MLJj5G6yWuY38cQPSwMRJxqFD48LSe6kgTxX3UPzX9us7yoAZv7Yd4/MmwF7YfaABPVBD1kWXX5vrLS07U1vHy778LdXQm0FBU1k4uIPDKbo9uNXGto4Ws0e1xkYZvDAEiJju2sNXDnvPwjmkf2FVy78di/ppv0shPGUldP2saY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423882; c=relaxed/simple;
	bh=NcB4ATQRCdpaieY6u4UOP1AJs6mx8wh+glgXQen3/xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJBlVQInX0G+FlAFpd936kM9sHuZweYjR5Ix32Hq4gZC8zdUbx9aEAUpGlRZ+8xuEqpaaVTKkmvTGoDtO8Kmgazv6kuBusMnzAsKyLWE6oyL2LYxRDiIC6aqdbbtjQT3z1X0l+KNHgE4MkG8VBNGyKabyEU1GGv4TewY7RCw/6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Pl6xeP98; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Pl6xeP98"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dd664da0f5so14080755ad.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 15:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789423880; cv=none;
        d=google.com; s=arc-20260327;
        b=aVqwLKv++Hfj8B9z8LqMarU3s9MlFX5mR+o3zPw2yc/gvDwzgveBkWl9Pp2a+w6Mfi
         xsYF6bMjJvKYVhBnaFlbH1r4eKQmHedKWYOuXDcJYjWVx/2VG9cCV5bNXKJRY4FtkfeV
         6T4Jf3RkzMay7Nm5sAhZGqHd3tTxkCj1h0csGWDnw4ZQBTxr4FdgtwOmRVGZRvD0MMha
         DgpfgJgks5LyBeFTrtN0SpHTspHsuUZFRZXLq1e204O8fykNIUOmjwFZTRI91EfKjlPL
         gnlEXIFDilG+1Xq99CZlKU2LjurE2ikAQjVbPQopifL5CW7y9YiHz5Nf+9KAslRkUEdQ
         +IVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w/oKC+Df0i0nlWK1p0/VROW0b/LkWm38BOYdDDAQoHo=;
        fh=GRNc47e2QHM70lT0f2uU7O0b9rCKsSKVp3ZATOCLHfs=;
        b=i2sTF4WiR4Wrzvm4GwluIzEpYYqcWp5CuWZkHTWHXJqXvgYvDITiECl/fKdcMdznaa
         YCkB/K/zIe16lasXy8Rpu/Ex+tjEKz8lDJNZKxzemeexD61fWFQ4XAZHDN+gqFkfcbSl
         50hfug/zTeGOQJ1zP78NY1YrfRN5PcKqQO7ArCjcP43WPRBRcZNLBZTb0jSaR+QOLSy2
         9f0FMpYWIxzrSE/2p8oZz5dtilj6+XUF0pm7TYOReEcmMfFInALyTV3mmcF+8iJsyJmz
         YsrdRaXrMYnTNaX/L40jHKPcQ6ru4MglWNdqWOLCGAMC+wjRICTNEZo1BYrv40pjVHyO
         YG/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789423880; x=1790028680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/oKC+Df0i0nlWK1p0/VROW0b/LkWm38BOYdDDAQoHo=;
        b=Pl6xeP98qWQ7cc3jycgStF1pnTxIpyRkwtkrBofB9HUyfNsvRN8IGR2jvAD3My7Qxp
         fnalI6HsHR9eYiLySKfYfacaz71HqT0RuuJVO4j4s15bvAxuX6Fq41b6VxwtVprO1zjd
         VHecroC4gUdisjFdHiE+sT/AbmTU8/8DrufdCE4+PyRiwc1JyeI2e07w3r0aay1HACYU
         QbJewlKCppdhj9Efzh71YF4JPbuUXymeUUQkB5COMEfHiO4Nwr4lhwO36pLSqEdQh33s
         XgJF0iKQnc294S1+2BDQbCqmT6RI3seIovADLEQQxwWjtXc66ys/lnOxDYRcVp30zikc
         JGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789423880; x=1790028680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/oKC+Df0i0nlWK1p0/VROW0b/LkWm38BOYdDDAQoHo=;
        b=pI+qiH2fY/LRkq38GJd56S2WceEc8XkerQwFyQOGgayDMJGzhmLg5vgfYGVfjyg7cE
         0bbSTALuYYblxcOXrImgdPd/cRbP6oIBL6a/Yytu6gV3YsRGzt9t+4u8IUl68y4dSRYK
         DWfzjmt/9XWYNsCO1mz9vPByxiOyLwzSTcHgWnccQfMt5LWSw9k8m/BPogcy396Os7Yu
         b4rPqLodvcfcvaHFMSsEeQNaZ4wocc77NtNNLVvp0n/cv1TL5bnpwRG9fT98TyqlLlwa
         OrSfHPsTYgz3TtPP7ShlYcuA9ldRVb9itbiPU2iHITR4aebatoqzJsicauwB1q7kJXxw
         k1Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxF471TXqnzDzcWgI46PRHVL5qE3jhJjr0PqTORuQFs9+xsw7ZHWPgB5jIw+SKKvBIe1F4Pl5EHQjU=@vger.kernel.org
X-Gm-Message-State: AFuF++mxAn2UWB74+ZbTVnRM/NsYoSWYlAuVYrUVziffGNONbwNQtFTz
	Zmt9VBsZjhhCo04Q9G+3kV6Z5744IW5YgxvcGa83xiojVlyPyvVa5tkqt9CrsxE0niXABXDYVEG
	yd09g+ytR9bmeDSgISBnIAeR7tOT7GiiGTZBWPVojwesPQloFVezFCbdw
X-Gm-Gg: AYBFou2BIwzmhOOeK84O16x1MOkrW2F36POeGWUBYua9c2J6aJmAx8P7Xovf9LbeOOZ
	8roPx1eIafRDaGkNA8uBmMiIpOCcil9C86py4r7SAU4tZNb9tcoWiJi7CbNdDjhyzEGWDsmKvq1
	ewq6KJfT2z3EBKUZ7htskBo4WglqQ70Rtvr/Icip28PcKky5fqp1myj5xmy2w81j4YTAHKYVslU
	lfiLzrpHgwK1r4d9xdOnZkihWB5UDBN/NacOudq3HI5vQfVWZGJTDmmYad4FNGHllD8wDyQA56I
	RfIxYIXaecGMUOu408eQ5klNa0Hdf3yE7m+7w/dZGNMXKg0gI3v5dQDOVU7uvDRNes/0AMgzUZI
	K7upVuVRvFa4JKzLdeYqHDw==
X-Received: by 2002:a17:903:fa5:b0:2ca:f21a:a6c5 with SMTP id
 d9443c01a7336-2dd6c5bdd5amr99665495ad.1.1789423879717; Mon, 14 Sep 2026
 15:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh> <2026091217-almighty-slouching-de2c@gregkh>
 <CAPpSM+TjBEDy0zpkeNfz2ZeCZxYBHSKrw3spDBYS-kBw=EXL8g@mail.gmail.com> <2026091348-sheep-showman-5a20@gregkh>
In-Reply-To: <2026091348-sheep-showman-5a20@gregkh>
From: Xiang Mei <xmei5@asu.edu>
Date: Mon, 14 Sep 2026 15:11:08 -0700
X-Gm-Features: AcwNN1UIdONuXr8P1Zw9ERNZdlwWynOnzA0ZnFkLhlAV-42N5iBsZA8R1jXtbdM
Message-ID: <CAPpSM+RR1ztW_iCnSkYCm62VWsLYygXr2hWEeoikKk9Q8HKR3Q@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: NULL pointer dereference in stub_recv_cmd_submit()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: co <co+66c3f58096d0bde8@bugs.sh>, linux-usb@vger.kernel.org, 
	Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Suwan Kim <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:19=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Sep 12, 2026 at 11:41:00AM -0700, Xiang Mei wrote:
> > On Fri, Sep 11, 2026 at 10:47=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sat, Sep 12, 2026 at 02:06:13AM +0000, co wrote:
> > > > This is a bug report, not a patch submission. See
> > > > https://bugs.sh/reporting.html
> > > >
> > > > We found a bug reachable in:
> > > >
> > > >     path    drivers/usb/usbip
> > > >     crash   NULL pointer dereference in stub_recv_cmd_submit()
> > > >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> > > >
> > > > Config, environment, the sanitizer report and a C reproducer follow=
.
> > > >
> > > > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >     If you fix this bug, this tag credits the report and lets us
> > > >     close it on our side:
> > > >
> > > > Reported-by: co+66c3f58096d0bde8@bugs.sh
> > > >
> > > >     Everything in this mail is validated by the reproducer below.
> > > >
> > > >     We also hold an unreviewed LLM-generated analysis and candidate
> > > >     patch. The same reproducer panics the unpatched kernel and runs
> > > >     clean with that patch applied. Use it as a starting point, or i=
gnore
> > > >     it and write your own:
> > > >
> > > >         patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.diff
> > >
> > > Please just submit patches like normal, in a format that can be appli=
ed,
> > > and do not make us go to random links to attempt to get any informati=
on.
> > > That's not how kernel development works at all.
> > >
> >
> > Hi Greg,
> >
> > Sorry about this. We may have misunderstood your earlier reply in this =
thread:
> >
> > "But sure, posting bug reports is fine, but again, patches are better :=
)"
> >
> > https://lore.kernel.org/all/2026090139-shortlist-junkie-9bee@gregkh/#t
> >
> > We interpreted this as meaning that sending bug reports without
> > patches was acceptable. We understand your concern with the current
> > format, and we will stop sending reports in this format to you and
> > linux-usb@vger.kernel.org.
> >
> > To make sure we understand correctly and follow the appropriate
> > practice going forward, should we:
> >
> > 1. Send pure bug reports without any LLM-generated analysis or
> > candidate patch, similar to the bug reports syzbot sends to kernel
> > mailing lists;
> > 2. For USB, do not send bug reports and only submit patches in the
> > normal kernel format; or
> > 3. More generally, do not send bug reports to Linux kernel mailing
> > lists and only submit patches in the normal kernel format?
> >
> > Sorry again for the misunderstanding, and thanks for taking the time
> > to clarify this despite your busy schedule.
>
> Think about what _you_ would want to see if you were on the receiving
> end of hundreds of patches a week.  Would you want to see a vague email
> with links required to dig stuff out to potentially have to make up a
> fix yourself for an unknown and poorly worded description, or would you
> want a real patch, in mergable format, that describes the problem and
> how it is being resolved?
>
> I think the latter :)
>



> Right now, most developers just ignore syzbot reports, as we are
> drowning in real fixes from developers instead.  There's no need for us
> to go research new fixes when we are having a hard time keeping on top
> of the stuff people are sending us that are in mergable state already!
>

You are right. We understand how overloaded maintainers and reviewers
are right now.

It's true that bug reports without a mergeable patch still take
maintainers' attention, even when no response is expected.

We'd still like to make one last request: would it be okay to continue
sending a small number of reports to other lists, with no external
links (just PoC and crash sanitizer log)? We'd take responsibility for
each report and follow up with a patch, even if no one responds. We
just hope that contributors who know the subsystem better might be
interested in helping us check the issues.

We'll stop sending these reports to linux-usb@vger.kernel.org.
Super appreciate you taking the time to explain this and discuss it with us=
.

Thanks,
Xiang

> thanks,
>
> greg k-h
