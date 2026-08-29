Received: from a9-39.smtp-out.amazonses.com (a9-39.smtp-out.amazonses.com [54.240.9.39])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13B324B20
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.9.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787988867; cv=none; b=HP5ooN/UjoOnGVgRDhpJn+2GNYNPRLeuXhhaiwSximoL5jgjhxGn1K8P0N6RRIf27Abr0Jw0H/rhCaBLqwWY8caz759AO6lLFTTeeMDNqIH2kFfBMFlAwRiW1pOCCmjjHgDrx79XIIwaRAcIY0ipzgTkaaMjyheXrYbSK+4Fqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787988867; c=relaxed/simple;
	bh=mzTN4xIJBchzxG0j1Jzg/jAp4Nqm3xCVRFvudqMbT2c=;
	h=In-Reply-To:From:To:Subject:Message-ID:Date:MIME-Version:
	 Content-Type; b=HUGZIffaq2tGiXWyOW5iYejqpBHY72DGh0vbqYW9spEvMH6CqNnd0JTF0JrYZIuBsqgfPBtGvgmCkZduZ0bvAGy5ittFmgL2+PPyuC4DXydpsUR9nXWaK5cy7g/gT0DrjYwm8SG1AOGEVXUBHuHztrD+ATwG8iDvZp1z3EJ1dKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=send.bugs.sh; dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=Y4nIojEd; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=qNSxlUCa; arc=none smtp.client-ip=54.240.9.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="Y4nIojEd";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="qNSxlUCa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=bugs.sh; t=1787988864;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=mzTN4xIJBchzxG0j1Jzg/jAp4Nqm3xCVRFvudqMbT2c=;
	b=Y4nIojEdNxfjpAEwrCXsh7oCcueLsNIuLebkSyAioaamlMrEou5gfbGu0OYIBNX3
	YK0k27Lj80jYmkZdRs5VYHFqmdXR/qd5nbbtuVJZhePjvuCLYJOkRmY4Am/UhCXihgE
	gTJRBbPOG3zwkk6s1ZmqKdzn1YE/UsfJOQHGOAO0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1787988864;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=mzTN4xIJBchzxG0j1Jzg/jAp4Nqm3xCVRFvudqMbT2c=;
	b=qNSxlUCa9aCn3MjULBR5/LSqOhi+3xjm/kNlRZ3CxTyMWimL/wA8OqMiQABb/T11
	34X4nXnpy6CEIR69PmeF+fPVyGnG7EW2ov/HI+/9wiQBB9b8eBeKZyJEZqiW4UxjuNq
	61rMzeEqsjRzWr+oz5pD6mALg84NwWAO+CWTDkSc=
X-Forwarded-Encrypted: i=1;
 AKwUvBzUm3J7a//caWVk1jlzJlHi0oa2S7bh4csGkOHEjp5l9WXaklHc9YnnQ8yO6PbIZ0RzJNuyQ9gfU8A=@vger.kernel.org
X-Gm-Message-State:
 AFuF++mY90Idf5WNSoqZz1zPByity/HW8t1pBxN4XbVrlXvW8qHZINJL
 Ot9M2ElqBUW1hJ1hv9enwoYSpD7JCo0htXHYw6OdRW8QT7w8Hdy79BKLk28OFadBzi8QfesitMx
 kujG86njulAHTCukzR45mo7SPBA92EJE=
X-Received: by 2002:a05:6402:a5cb:20b0:6a6:165c:ce49 with SMTP id
 4fb4d7f45d1cf-6a6165cd345mr4483132a12.7.1787988862939; Sat, 29 Aug 2026
 00:34:22 -0700 (PDT)
In-Reply-To: <2026082943-stomp-celtic-8a2b@gregkh>
X-Gmail-Original-Message-ID:
 <CAMb7gs9DKdi3=wA4OV1qZ8fiXEkeT+DEQiV=Ghz-Jc9kn7TOZQ@mail.gmail.com>
X-Gm-Features:
 AcwNN1Wmc32fUHznH-1eUm-Bsg83JphzkG4U2j03mCX4RvD5BZS7ZkDfEwUNU_s
From: CO <co@bugs.sh>
To: linux-usb@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <010001a04c70ee2b-c45aa397-c6df-429a-a4ca-bc08bedd6c7f-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 07:34:24 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.yL0noGNZdXCKlJHw27bHz8/I7/GZTaYDRe4l4bGvzjPa1Q4S+kzxKgpyYIxfCxOFAjHX6QJhZdsZN1SP8V3NfEiLJ34m58z2/mmJDZ5RtdRTZ06dzneIWyoUkJ1DSaTbU2HlPz+Zb2/NZ41D3j4FLWNy2FyGjUOa4qpft7gzKcs=:1.us-east-1.QSNtDRXSTq9sAuvRl56h5mypgasnQ5yDLNpVzTnziu0=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.9.39

On Sat, Aug 29, 2026 at 12:01=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Fri, Aug 28, 2026 at 11:42:07PM -0700, Cedalion wrote:
> > On Fri, Aug 28, 2026 at 11:20=E2=80=AFPM Greg KH <greg@kroah.com> =
wrote:
> > >
> > > On Sat, Aug 29, 2026 at 06:07:39AM +0000, CO wrote:
> > > > On Thu, Aug 27, 2026 at 10:36=E2=80=AFPM Greg KH <greg@kroah.com> =
wrote:
> > > > >
> > > > > On Fri, Aug 28, 2026 at 02:00:17AM +0000, CO =
wrote:
> > > > > > On Thu, Aug 27, 2026 at 10:31=E2=80=AFAM Xiang Mei =
<xmei5@asu.edu> wrote:
> > > > > > >
> > > > > > > Th
> > > > > > >
> > > > > > > On Thu, Aug 27, 2026 at 5:50=E2=80=AFAM Greg Kroah-Hartman
> > > > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > > > >
> > > > > > > > On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > > > > > > > > We found a bug reachable in:
> > > > > > > > >
> > > > > > > > >     path    drivers/usb/host
> > > > > > > > >     crash =
  out-of-bounds in xhci_queue_bulk_tx()
> > > > > > > > >     commit  =
bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.=
org/pub/scm/linux/kernel/git/soc/soc")
> > > > > > > > >
> > > > > > > > > Config, environment, the sanitizer report and a C =
reproducer follow.
> > > > > > > > >
> > > > > > > > > =3D=3D Notes =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > >     If you patch =
the bug based on our artifacts, a tag would be
> > > > > > > > >     =
appreciated:
> > > > > > > > >
> > > > > > > > > Reported-by: =
co+fd80bc5967eb22c3@bugs.sh
> > > > > > > > >
> > > > > > > > >     =
Everything in this mail is validated by the reproducer below.
> > > > > > > > >
> > > > > > > > >     We also hold an LLM-generated =
root-cause analysis and a candidate
> > > > > > > > >     patch. The patch =
passes an A/B test: the same reproducer panics the
> > > > > > > > >     =
unpatched kernel and runs clean on the patched one. Neither has had
> > > > > > > > >     human review, so both still require validation before=
 you send or
> > > > > > > > >     apply them. Available on:
> > > > > > > > >
> > > > > > > > >         patch.diff  https://bugs.=
sh/b/fd80bc5967eb22c3/patch.diff
> > > > > > > > >         report.md   =
https://bugs.sh/b/fd80bc5967eb22c3/report.md
> > > > > > > >
> > > > > > > > Please validate and ensure that this is correct before =
sending this to
> > > > > > > > us.  No need for us to dig through random =
web links, right?
> > > > > > Hi Greg,
> > > > > >
> > > > > > Thanks for =
the feedback, and sorry for the noise. Sending these before
> > > > > > we had settled the format and talked to maintainers was our =
mistake.
> > > > > >
> > > > > > Let me make sure we understood your =
suggestions.
> > > > > >
> > > > > > # What we understood
> > > > > >
> > > > > > You want patches that a human has verified, and you do not want=
 to
> > > > > > have to follow links to find out what a report says. We =
should not
> > > > > > have sent what we sent.
> > > > >
> > > > > That is correct, would you want anything different if we were to =
send
> > > > > stuff to you?
> > > > >
> > > >
> > > > Nothing in =
particular, thanks. A Reported-by: tag and having the
> > > > report closed would be appreciated!
> > >
> > > If you submit a =
patch, you are the author and no reported-by is then
> > > needed.
> > >
> >
> > Thanks, that makes sense when we send patches. We want to focus on =
bug
> > reporting for now like syzbot and we'll also put our time in =
patching
> > when the pipeline can run stablly.
>
> We almost always ignore=
 "bug reports" that don't come with patches,

Understood. A bug with a =
human-validated patch is worth far more than
a report alone.

> especially as your tool (i.e. your LLM) can automatically generate a
> patch based on your reproducer, so why not submit it?
>

The bottleneck isn't generating a patch, it's validating one. Bug
reporting scales because a reproducer is self-validating: either the
kernel crashes or it doesn't. A patch isn't. We can confirm a patch
stops the crash via A/B testing, but confirming it addresses the
actual root cause rather than papering over a symptom is beyond what
LLMs can do automatically today. In our experience current LLMs don't
come close to an experienced maintainer, and sending patches we didn't
validate would just move our validation cost onto reviewers.

If untriaged patches are still useful, we're happy to
include them. We would send a proper patch with a commit message
rather than a bare diff, clearly marked as LLM-generated and
A/B-tested only, so it's obvious what has and hasn't been verified and
others can take it further if they want.

If instead you'd prefer we only =
send patches we've reviewed by hand,
we'll keep doing that, just at a much =
lower rate, since it's two of
us.

Thanks,
Xiang
> thanks,
>
> greg k-h
