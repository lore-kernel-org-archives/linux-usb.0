Received: from a14-43.smtp-out.amazonses.com (a14-43.smtp-out.amazonses.com [54.240.14.43])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14251A38F9
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 06:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.14.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983662; cv=none; b=XgtVOVNYxzm5WhC00n5LjOjS1lfMBu2AH4qSsvzDNN9l+mz0+n1qIBBQrk5izj/depKkiwNlWbgRjBaR6rJiLKBh8ikzC8UsVWe23Rd4Cx79OBxv36JhKGwiH5FQI64RxNektRq4IGOgvjLDME0USMn8+rCAtsGycxSHjmK3V7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983662; c=relaxed/simple;
	bh=Zay+EIHcVxoDxaA/5fl9LIKu9mFkYrykQLMUM5i6uAA=;
	h=In-Reply-To:From:To:Subject:Message-ID:Date:MIME-Version:
	 Content-Type; b=nK7ut2uZ+4xyVYAO3BM0Tag3OMoBiL8gARN2FTE5w7S0N+y3WsINLtFuwVPu9awes0JcuGrs11ovvOmcrIvMj6/zi2VPl7QO7zlyFWiBasBSWPUF+1Nxv6zXDlfMfb8OOxSrwcTZjP5dD+Cp7onXhTp3XSTtSxYwre3LhUzfVzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=send.bugs.sh; dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=deYyEv8z; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=G+oYsdJu; arc=none smtp.client-ip=54.240.14.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="deYyEv8z";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="G+oYsdJu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=bugs.sh; t=1787983659;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=Zay+EIHcVxoDxaA/5fl9LIKu9mFkYrykQLMUM5i6uAA=;
	b=deYyEv8z9X938GjPFtqgrbZ/4Kg8oXE66s0D2lAU2LUMk4IEeJSI0tTtkZfjAqX0
	Xm75r36aIZed98kGm6pxexx9v/s96xVlTSErx0lIT/Ifg+4sNQ38xl1KsZq175PJY55
	FaatwEWX+monT1/D6I4ao6Mm2ywjp3oGzwJ0Sm5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1787983659;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=Zay+EIHcVxoDxaA/5fl9LIKu9mFkYrykQLMUM5i6uAA=;
	b=G+oYsdJuLolNEr7z9r9A0gVo5o+l0O/wWZqCs0XzPbw5G1uY8ooTGLT/fDbKQHE5
	n+17v7M6s/m0C/YxFjTC4KLQizEuoW/gCHjYHOi+46xYK70j7nbvQC2hHBBE1rKzKb2
	gR0yauiqC2kUE4H1Ps/kZha8BvTfoHYxObnWwE0M=
X-Forwarded-Encrypted: i=1;
 AKwUvBwj/PEMBA+6uR45uHf7ZZ4dZ6+BUGhD+kImSXCOWmYQTQ1mbbBvD+CcRtYj6GxDLxwH+6nZTuBrSDk=@vger.kernel.org
X-Gm-Message-State:
 AFuF++mQMj6ChdUflp2U4iARY6JieL9OsMWh8wuFFjgl366lY8kLmLbG
 DEduYu9Ux4HdGHov5c5Snwbg5cyUtESC1KatUdfnw1k0I4/QsQhvjWEcXbx67JXNq49GzFe4s12
 ABvYL/42l42fwazs3y/eaiRtUnK7ZRzg=
X-Received: by 2002:a05:6402:4282:b0:6a0:a644:355e with SMTP id
 4fb4d7f45d1cf-6a60d2f4204mr9312338a12.2.1787983658160; Fri, 28 Aug 2026
 23:07:38 -0700 (PDT)
In-Reply-To: <2026082816-jolly-unskilled-5d6e@gregkh>
X-Gmail-Original-Message-ID:
 <CAMb7gs-aEd+4m+MQsw5UwcbEzSxH_MRNBpb8-ZGfwsL2quEd+w@mail.gmail.com>
X-Gm-Features:
 AcwNN1XBf1_za5zHglpTFRwFwfxOBcPvBtRkm2jS6DNqxP7_W1BJfrG7t9kEVAU
From: CO <co@bugs.sh>
To: linux-usb@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <010001a04c21826c-258f767e-4a70-4e60-9b5d-1a96906c8807-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 06:07:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.yL0noGNZdXCKlJHw27bHz8/I7/GZTaYDRe4l4bGvzjPa1Q4S+kzxKgpyYIxfCxOFAjHX6QJhZdsZN1SP8V3NfEiLJ34m58z2/mmJDZ5RtdRTZ06dzneIWyoUkJ1DSaTbU2HlPz+Zb2/NZ41D3j4FLWNy2FyGjUOa4qpft7gzKcs=:1.us-east-1.QSNtDRXSTq9sAuvRl56h5mypgasnQ5yDLNpVzTnziu0=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.14.43

On Thu, Aug 27, 2026 at 10:36=E2=80=AFPM Greg KH <greg@kroah.com> wrote:
>
> On Fri, Aug 28, 2026 at 02:00:17AM +0000, CO wrote:
> > On Thu, Aug 27, 2026 at 10:31=E2=80=AFAM Xiang Mei <xmei5@asu.edu> =
wrote:
> > >
> > > Th
> > >
> > > On Thu, Aug 27, 2026 at 5:50=E2=80=AFAM =
Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > > > > We found a bug reachable in:
> > > > >
> > > > >     path    =
drivers/usb/host
> > > > >     crash   out-of-bounds in =
xhci_queue_bulk_tx()
> > > > >     commit  bd5f485f3f02 ("Merge tag =
'soc-arm-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> > > > >
> > > > > Config, environment, the sanitizer report and a C =
reproducer follow.
> > > > >
> > > > > =3D=3D Notes =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >     If you patch the bug =
based on our artifacts, a tag would be
> > > > >     appreciated:
> > > > >
> > > > > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> > > > >
> > > > >     Everything in this mail is validated by the reproducer below.
> > > > >
> > > > >     We also hold an LLM-generated root-cause analysis =
and a candidate
> > > > >     patch. The patch passes an A/B test: the same=
 reproducer panics the
> > > > >     unpatched kernel and runs clean on the=
 patched one. Neither has had
> > > > >     human review, so both still =
require validation before you send or
> > > > >     apply them. Available =
on:
> > > > >
> > > > >         patch.diff  https://bugs.=
sh/b/fd80bc5967eb22c3/patch.diff
> > > > >         report.md   https://bugs=
.sh/b/fd80bc5967eb22c3/report.md
> > > >
> > > > Please validate and ensure=
 that this is correct before sending this to
> > > > us.  No need for us to=
 dig through random web links, right?
> > Hi Greg,
> >
> > Thanks for the feedback, and sorry for the noise. Sending these before
> > we had settled the format and talked to maintainers was our mistake.
> >
> > Let me make sure we understood your suggestions.
> >
> > # What we understood
> >
> > You want patches that a human has verified=
, and you do not want to
> > have to follow links to find out what a report=
 says. We should not
> > have sent what we sent.
>
> That is correct, would=
 you want anything different if we were to send
> stuff to you?
>

Nothing in particular, thanks. A Reported-by: tag and having the
report closed would be appreciated!

> > # Until then
> >
> > We have stopped. No further reports go out until the format is one
> > that does not waste your time. 19 reports went out in a single batch
> > without a person releasing them, which was our process failure.
> > That is fixed, and we would rather settle the format with you before
> > we start again.
>
> Just use our normal development process of sending =
patches, there's no
> need to change anything here as it's working quite =
well (fastest rate of
> change of any project with the most contributors...=
)
>
> thanks,
>
> greg k-h
>
Understood, thanks. We will be slow at first =
and keep things small-scale, and
improve our workflow by checking the =
requirements from the replies. Thanks
for your effort and for taking the =
time to help us get this right.


Xiang
