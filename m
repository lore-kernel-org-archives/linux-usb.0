Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD011FE47B
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985741; cv=pass; b=odtQZEUJ+0r+DV9+8rrqTW5nhD57Hj41MlwvP23iruonxu4yU3Kjnwe9M2IvmxU5E5W1Rgo3fTRHlilJc2ZMulVQsQj0GfM10xnrKo9liJ9eehEjF8DKld4IO9oBcTrayyaf3rk5YTHtH2fNuHnOhkWu0S8ftB6m5slvC1umRoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985741; c=relaxed/simple;
	bh=XvERT/sMQAq65Ti7jWsmJoiZ8E7sfOJHYHt+Zd9mX1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJO8cQ2KCieUpURKtyChNj7jvcd6ySGUJyxxmkGyvS0FwAm2qhuqG6WxW0zbpZVUWD4Srwa5Jf9YWmDPg3x2Pe18LhsZTrAHS6RkCTzD8EUamXbbAPIhsCHqvjk3AoWZfoFlestjPkjZbNo/aExh5UXf20vt9/e+Jqo79gZbw3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bmp14iM3; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bmp14iM3"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so2316617a12.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 23:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787985738; cv=none;
        d=google.com; s=arc-20260327;
        b=IgOzMa6swTCHvZdp2I4r3G1fiFMEwXeRZaLP4XuUS52wKXV00RoaV3sIovVBbWWgru
         V83rtPU5Gxr4rrIwM4bL253C1iHKl7dOEOTlpPBplFBevHKizDQgdnUlfRhXSjvnWTQL
         5VO3awOm+Q+PKMIITEscT4q4e6CClYMHMVwsqnDI+iNxcqTelnwmeOoj03LCbUrDyEI0
         eup/T6YdDGttNMd3CDhh+gourz02fbsGD63cV9r+UnJpEtCCe/lne6F8Z+UGQ0jjGFz9
         0oEckkGzW7RUV0joVWY0FMwY1qT3GSF3bFR8FXEfx82jYJww2GbYp0ltMqW2D3MYT0VI
         W4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l3iHqR3r5mmPK+5YHZnwvxX9AT8l8/MUmBa5362cY9Y=;
        fh=+Zfs3Sy3EWtRFR8jYUZnUruJSoPkxR/cHzurds5aThs=;
        b=jmUsZ9Nq3afYKERoxLkE4qGgngNRrBfT+gwq1YJl893deItmxnHHzqcQ8SjgSPvTjR
         5uMfL4nGBKfzEXktwxOQC4nD2xX0Wrr9MiSVteXTUyBybnHfiCLvEgWdIs0jfBSj71N8
         xgk9lbLHXX1UqQFuEz9EsGZN2Ey9yRf4QI+N3vUizzMY04r/NJ5tz2SQFwC8ahRA25Fe
         ii674+V4AG5RO0lSrvMZK7gCXoYN8o5J9JFylhu5idcU8frgjaeRjk912I67BEHMfbDR
         0V2iWyWgpPmVZ4GaT/NkUwuCjRubRiCMiDlxRVODMWU8P3bV1HhshVCjbb7mvgCeC4HZ
         PNQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985738; x=1788590538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l3iHqR3r5mmPK+5YHZnwvxX9AT8l8/MUmBa5362cY9Y=;
        b=Bmp14iM3uBKggbdP5WMJuZXxxL143l1839mJVzYkCulSA9nW/dAOElSX0RSyagtvKb
         aXkgmpFNDaa5EQJvqbqowZPDuIu0f5rPxIZ962ohoT8aRnUrUAOuWeSXPcrst4MEhFV+
         IwnoN3ObAGnTGZvBxOlQ9KmO4BlFkAZVB+WKxkA0a/+VG1pPYzsyCdNZHZN8ePl3bHDG
         R+yjkSkUT46p2JbRyFZxEtSjcsQD+/+aOXLcvXk7R3kwadenK0l7KSXDiNRFDHBWq5Ih
         jrPaijnd2Dx2JdD5nR0KeAXYA6tBYVkwVgNQCkKbCpSopfQe0fRgkL9e/fYFcVcpav3f
         O8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985738; x=1788590538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3iHqR3r5mmPK+5YHZnwvxX9AT8l8/MUmBa5362cY9Y=;
        b=DT1Q+LVzfaRlA4UV0ESHCvwxgWcDO5gycfzkdTZJlw1BpuoAgCxtnW+RNAHqcNxL4i
         suxQolex5pvH5S3JwdKj+6Y0T5ck1NNxI6r3nAoz+HRDKSKa7PFRyNQHASwAvxreVXSF
         2g7R3p/xAijz6Kfh5lDEapxhEWETnqcHU46LYVEj57N2BjtW6a0JvUPkIKL/XdHVpH3e
         f2vi80P9U+N1iOZCTRXLuZkhV9H8SHuyRMihrWEdbN1KU50L2jbVf1E4duNiwqYEx3u5
         VpO07SMtgN1y7cJbKYRgVK8BnwwudKVwbzpPlavOD94uHQvnoqa3pn9ODNusQ/sPibq1
         tPeQ==
X-Forwarded-Encrypted: i=1; AKwUvBydGzH1Pj+NdVEX9Lg9g1Ij9jbOQN5GN/ttYDsNNsCEpkSuEMURp3WDLfQaIUZeiH9RCafVsRr8sbA=@vger.kernel.org
X-Gm-Message-State: AFuF++mKV6aqMXd3BFRk+7n2cOZTe6NNeCMcXZy3+PIH11Ao3/+05KSh
	EW35UyCVnET5GYLg5RDcWX2V3dCgvsOA3tXimM2BVeXe8U8qXVBpss5UWwrIntKf/4uen1kq6t8
	+RuwAxhK4Ua0AtUwRaZWLZ53rhlqK7ah1qrg4
X-Gm-Gg: AYBFou1u/HAxDhNJc4CTHf/MZrvxxo9ICEu4ZfO0CD7WLROp0sBXEOOzRerrOaxt4LW
	BHlJ7VimMyMWKSjDXrEvuiDGrxM88XEofmPU+7z4Mnx+v/1oSI9sh7wejdLzt5fE0MR2YnemAyP
	BX4OglrvJoKwY4146EWYOQoSzdJ5W9y5jvmfoF1c0Z11yBf+FrrcjDviGBF8OHLgL+SppDpmiLl
	cVTfr3KH4xMhen1mT0lm+k/3n+bxLIkxJQ8jvDFFPE2rVt7QmiQgaQvZxOUJQVf1KSnKbE5Jcsr
	fJcblqxDSRDttUJpwz/CaArOWCaVE9Rh81GQ5ZBqmA4sZswrlZ9y0kzl8eiRt+enJoq5xLSJb7H
	WHHM=
X-Received: by 2002:a05:6402:27cd:b0:6a1:f8ad:6c0c with SMTP id
 4fb4d7f45d1cf-6a60d3ab0b8mr7713487a12.16.1787985737816; Fri, 28 Aug 2026
 23:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026082816-jolly-unskilled-5d6e@gregkh> <010001a04c21826c-258f767e-4a70-4e60-9b5d-1a96906c8807-000000@email.amazonses.com>
 <2026082926-unmindful-snipping-b8e7@gregkh>
In-Reply-To: <2026082926-unmindful-snipping-b8e7@gregkh>
From: Cedalion <4rtiphishell@gmail.com>
Date: Fri, 28 Aug 2026 23:42:07 -0700
X-Gm-Features: AcwNN1XBHaB2yAz6xtSVKY6hr8y2KFkwT9LaI34gxu13nc1kPHFqk3VOw7iY7FE
Message-ID: <CAMb7gs-vRZYfXK4Q9wrsSa_f46u74UgpfDWNw3HyKHjci_VWQA@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
To: Greg KH <greg@kroah.com>
Cc: CO <co@bugs.sh>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:20=E2=80=AFPM Greg KH <greg@kroah.com> wrote:
>
> On Sat, Aug 29, 2026 at 06:07:39AM +0000, CO wrote:
> > On Thu, Aug 27, 2026 at 10:36=E2=80=AFPM Greg KH <greg@kroah.com> wrote=
:
> > >
> > > On Fri, Aug 28, 2026 at 02:00:17AM +0000, CO wrote:
> > > > On Thu, Aug 27, 2026 at 10:31=E2=80=AFAM Xiang Mei <xmei5@asu.edu> =
wrote:
> > > > >
> > > > > Th
> > > > >
> > > > > On Thu, Aug 27, 2026 at 5:50=E2=80=AFAM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > > > > > > We found a bug reachable in:
> > > > > > >
> > > > > > >     path    drivers/usb/host
> > > > > > >     crash   out-of-bounds in xhci_queue_bulk_tx()
> > > > > > >     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> > > > > > >
> > > > > > > Config, environment, the sanitizer report and a C reproducer =
follow.
> > > > > > >
> > > > > > > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > >     If you patch the bug based on our artifacts, a tag would =
be
> > > > > > >     appreciated:
> > > > > > >
> > > > > > > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> > > > > > >
> > > > > > >     Everything in this mail is validated by the reproducer be=
low.
> > > > > > >
> > > > > > >     We also hold an LLM-generated root-cause analysis and a c=
andidate
> > > > > > >     patch. The patch passes an A/B test: the same reproducer =
panics the
> > > > > > >     unpatched kernel and runs clean on the patched one. Neith=
er has had
> > > > > > >     human review, so both still require validation before you=
 send or
> > > > > > >     apply them. Available on:
> > > > > > >
> > > > > > >         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.=
diff
> > > > > > >         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report=
.md
> > > > > >
> > > > > > Please validate and ensure that this is correct before sending =
this to
> > > > > > us.  No need for us to dig through random web links, right?
> > > > Hi Greg,
> > > >
> > > > Thanks for the feedback, and sorry for the noise. Sending these bef=
ore
> > > > we had settled the format and talked to maintainers was our mistake=
.
> > > >
> > > > Let me make sure we understood your suggestions.
> > > >
> > > > # What we understood
> > > >
> > > > You want patches that a human has verified, and you do not want to
> > > > have to follow links to find out what a report says. We should not
> > > > have sent what we sent.
> > >
> > > That is correct, would you want anything different if we were to send
> > > stuff to you?
> > >
> >
> > Nothing in particular, thanks. A Reported-by: tag and having the
> > report closed would be appreciated!
>
> If you submit a patch, you are the author and no reported-by is then
> needed.
>

Thanks, that makes sense when we send patches. We want to focus on bug
reporting for now like syzbot and we'll also put our time in patching
when the pipeline can run stablly.

> And we don't have anything to "close", so that's not really going to be
> possible :)
>
Sorry for my typo, I meant the `Closes:` tag, but it is fine either
way if it is left out.
As long as our report helps to locate a bug in an efficient way, we are hap=
py.

Xiang
> thanks,
>
> greg k-h
>
