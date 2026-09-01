Received: from a14-41.smtp-out.amazonses.com (a14-41.smtp-out.amazonses.com [54.240.14.41])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3C9175A8B
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.14.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265395; cv=none; b=BFWD0lFYxMvLKiyN9CWIsXrAd6jGMfALczxqffoTA1KICcDgxik0+5pVu8MVscdCjV8ipenZ3fe6SPigt7ZP21m31Vow2OQKcC7lHGRTe7F61xotV+HEYo6S2Sp3zCj/bDTMYQSfTNiTlis3qBKoZt/Z6wfrmUdN/TmR7StDnog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265395; c=relaxed/simple;
	bh=f78fiXdngR4jIKoDO1Ivp3m0KW7Z1Nj6QsDQk/6Bzo8=;
	h=In-Reply-To:From:To:Subject:Message-ID:Date:MIME-Version:
	 Content-Type; b=CrK+hQ84FtbtRlBTVLKAUUzlYejY55UDZXicBKv4HaOXT4LZmk53BSII7ZuUMJAsdMjievtI5QgIW9qxgs+vy0PY4GoAdDwWn8IhOypZsm9o+KCaIg6/SPjKmURUo/VO1aup0ldbmj9vUnvkcQRGpsuW2nOg12JNOA6ILUoZlzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=send.bugs.sh; dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=myEma2ho; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Rtc4DlGO; arc=none smtp.client-ip=54.240.14.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="myEma2ho";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Rtc4DlGO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=bugs.sh; t=1788265392;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=f78fiXdngR4jIKoDO1Ivp3m0KW7Z1Nj6QsDQk/6Bzo8=;
	b=myEma2hokvzF3AMcteSvEeWszYGfBp49sGNj+7fLmVO9sF/Q/3/YWu3Eh9+qQkq/
	MrQxWIzE84FRSWAnuqbpM5/VZdvM/5h8XlH+dud7ZtQd/jlzYvPqHOUXwsO3VvoxTqj
	6bZu+ljpREyz4KabRAEB/IMeBUJpA8HBsoQPIWp8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1788265392;
	h=In-Reply-To:From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=f78fiXdngR4jIKoDO1Ivp3m0KW7Z1Nj6QsDQk/6Bzo8=;
	b=Rtc4DlGOTo+IPDZYZaTUC0wdayoFrc9wiPRMl6+JyVYRwnyYLDVnBFK5I10PGqZA
	VuW2QkAatNj+IYMM7jCTy6EH1sHXtdOlAmhoYY4UrsEKZqLBwnp+eNpP0LOLezOeHxs
	Z3oDhzlIEUGGVhnA+wEQpnr9F/L0W1AF/ihVWqUY=
X-Forwarded-Encrypted: i=1;
 AHgh+RqLZyDJMa/Xj6hDKlIY7XmiUHcF6QJ6wzbJgHJGZnxG4CsgYyXSow2uOhlrZ1PgFi58XHt3up8sNqE=@vger.kernel.org
X-Gm-Message-State:
 AFuF++nTCHGHrHnnapOx/FHtorOyj/T8hiXQRWHiRIqslRCo31GNdk8/
 lVt9daMe6LnBUB3numAbYHB9seznTUj8A94VG+A28UaBsRiFgXtW6YmdtaMYPCozKT7BCHkSStZ
 RowpdxpwccWIrneM4AxiO6CjEGIJ9OJar9YOuEn+A
X-Received: by 2002:a05:6a00:420c:b0:857:7337:5db8 with SMTP id
 d2e1a72fcca58-85773375fbemr38182422b3a.22.1788265390631; Tue, 01 Sep 2026
 05:23:10 -0700 (PDT)
In-Reply-To: <2026082900-mortified-freehand-7c59@gregkh>
X-Gmail-Original-Message-ID:
 <CAPpSM+QDO4Ww_YyfEWPPMrUvaQ88aJCxS4H2g9FmJBA5uEuEyw@mail.gmail.com>
X-Gm-Features:
 AcwNN1X0plTm1kn80BUF12_1tQtrG6ay3H50Q7LDoNeXWQwvMKaWQhfemT9hJw4
From: CO <co@bugs.sh>
To: linux-usb@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <010001a05cec684a-64e27a6c-d9bf-4b18-8fd7-19fd00c3f42e-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 1 Sep 2026 12:23:12 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.yL0noGNZdXCKlJHw27bHz8/I7/GZTaYDRe4l4bGvzjPa1Q4S+kzxKgpyYIxfCxOFAjHX6QJhZdsZN1SP8V3NfEiLJ34m58z2/mmJDZ5RtdRTZ06dzneIWyoUkJ1DSaTbU2HlPz+Zb2/NZ41D3j4FLWNy2FyGjUOa4qpft7gzKcs=:1.us-east-1.QSNtDRXSTq9sAuvRl56h5mypgasnQ5yDLNpVzTnziu0=:AmazonSES
X-SES-Outgoing: 2026.09.01-54.240.14.41

Sorry for the late reply, and thanks for the clear answer.

On Sat, Aug 29, 2026 at 12:55=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Sat, Aug 29, 2026 at 07:34:24AM +0000, CO wrote:
> > On Sat, Aug 29, 2026 at 12:01=E2=80=AFAM Greg KH <greg@kroah.com> =
wrote:
> > >
> > > On Fri, Aug 28, 2026 at 11:42:07PM -0700, Cedalion =
wrote:
> > > > On Fri, Aug 28, 2026 at 11:20=E2=80=AFPM Greg KH <greg@kroah=
.com> wrote:
> > > > >
> > > > > On Sat, Aug 29, 2026 at 06:07:39AM +0000, =
CO wrote:
> > > > > > On Thu, Aug 27, 2026 at 10:36=E2=80=AFPM Greg KH =
<greg@kroah.com> wrote:
> > > > > > >
> > > > > > > On Fri, Aug 28, 2026 at=
 02:00:17AM +0000, CO wrote:
> > > > > > > > On Thu, Aug 27, 2026 at =
10:31=E2=80=AFAM Xiang Mei <xmei5@asu.edu> wrote:
> > > > > > > > >
> > > > > > > > > Th
> > > > > > > > >
> > > > > > > > > On Thu, Aug 27, =
2026 at 5:50=E2=80=AFAM Greg Kroah-Hartman
> > > > > > > > > =
<gregkh@linuxfoundation.org> wrote:
> > > > > > > > > >
> > > > > > > > > > On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > > > > > > > > > > We found a bug reachable in:
> > > > > > > > > > >
> > > > > > > > > > >     path    drivers/usb/host
> > > > > > > > > > >   =
  crash   out-of-bounds in xhci_queue_bulk_tx()
> > > > > > > > > > >     =
commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.=
org/pub/scm/linux/kernel/git/soc/soc")
> > > > > > > > > > >
> > > > > > > > > > > Config, environment, the sanitizer report and a C =
reproducer follow.
> > > > > > > > > > >
> > > > > > > > > > > =3D=3D Notes=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > > >     If you=
 patch the bug based on our artifacts, a tag would be
> > > > > > > > > > >     appreciated:
> > > > > > > > > > >
> > > > > > > > > > > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> > > > > > > > > > >
> > > > > > > > > > >     Everything in this mail is =
validated by the reproducer below.
> > > > > > > > > > >
> > > > > > > > > > >     We also hold an LLM-generated root-cause analysis=
 and a candidate
> > > > > > > > > > >     patch. The patch passes an A/B =
test: the same reproducer panics the
> > > > > > > > > > >     unpatched =
kernel and runs clean on the patched one. Neither has had
> > > > > > > > > > >     human review, so both still require validation =
before you send or
> > > > > > > > > > >     apply them. Available on:
> > > > > > > > > > >
> > > > > > > > > > >         patch.diff  =
https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
> > > > > > > > > > >        =
 report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md
> > > > > > > > > >
> > > > > > > > > > Please validate and ensure that =
this is correct before sending this to
> > > > > > > > > > us.  No need for=
 us to dig through random web links, right?
> > > > > > > > Hi Greg,
> > > > > > > >
> > > > > > > > Thanks for the feedback, and sorry for the =
noise. Sending these before
> > > > > > > > we had settled the format and =
talked to maintainers was our mistake.
> > > > > > > >
> > > > > > > > Let me make sure we understood your suggestions.
> > > > > > > >
> > > > > > > > # What we understood
> > > > > > > >
> > > > > > > > You want patches that a human has verified, and you do not =
want to
> > > > > > > > have to follow links to find out what a report says=
. We should not
> > > > > > > > have sent what we sent.
> > > > > > >
> > > > > > > That is correct, would you want anything different if we were=
 to send
> > > > > > > stuff to you?
> > > > > > >
> > > > > >
> > > > > > Nothing in particular, thanks. A Reported-by: tag and having =
the
> > > > > > report closed would be appreciated!
> > > > >
> > > > > If you submit a patch, you are the author and no reported-by is =
then
> > > > > needed.
> > > > >
> > > >
> > > > Thanks, that makes sense =
when we send patches. We want to focus on bug
> > > > reporting for now =
like syzbot and we'll also put our time in patching
> > > > when the pipeline can run stablly.
> > >
> > > We almost always =
ignore "bug reports" that don't come with patches,
> >
> > Understood. A bug with a human-validated patch is worth far more than
> > a report alone.
> >
> > > especially as your tool (i.e. your LLM) can =
automatically generate a
> > > patch based on your reproducer, so why not =
submit it?
> > >
> >
> > The bottleneck isn't generating a patch, it's =
validating one. Bug
> > reporting scales because a reproducer is =
self-validating: either the
> > kernel crashes or it doesn't. A patch isn't=
. We can confirm a patch
> > stops the crash via A/B testing, but =
confirming it addresses the
> > actual root cause rather than papering over=
 a symptom is beyond what
> > LLMs can do automatically today. In our =
experience current LLMs don't
> > come close to an experienced maintainer, =
and sending patches we didn't
> > validate would just move our validation =
cost onto reviewers.
>
> Agreed, so don't do that, but rather:
>
> > If untriaged patches are still useful, we're happy to
> > include them. We would send a proper patch with a commit message
> > rather than a bare diff, clearly marked as LLM-generated and
> > A/B-tested only, so it's obvious what has and hasn't been verified and
> > others can take it further if they want.
>
> No, please do:
>
> > If instead you'd prefer we only send patches we've reviewed by hand,
> > we'll keep doing that, just at a much lower rate, since it's two of
> > us.
>
> Yes, review them by hand, verify they are correct, and then =
send them to
> us based on your review.  For you to expect us to do your =
work for you
> is a bit odd, don't you think?
>
> We want fixes that people=
 think are correct, based on their review and
> testing.  Based on the work=
 I've been doing this year, LLM-generated
> stuff is 50% the time totally =
wrong.  Don't make me have to reject your
> LLM-generated patches 50% the =
time, as we will just get frustrated and
> ignore 100% of your submitted =
patches :)
>

I 100% agree with you.  We won't send patches we haven't =
reviewed ourselves.

> thanks,
>
> greg k-h
>


I'd like to check =
something:

Is it acceptable to send bug reports (without a patch, such as =
this
bug report) to the list like syzbot?

As you mentioned, we understand =
many of them will be ignored since
reviewers would prioritize patches. But =
we'll work with community
contributors who would like to work to write a =
patch for them. (which
faster than just two of us)

Thanks again,
Xiang
