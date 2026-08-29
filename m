Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10FA1C28E
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787990147; cv=none; b=VmQmO0WDVkdECwaO4HX22S7sXWjmGB3RnkcF4OjRdunCjqgCZlHIyy76S7l1NvPvuQgfFQliQfgTLg73HnV799owPMLxIWgZT6wvRFbhCTXqzjn/LqstI6ZMoROlhjJjvk58w0UftfchkxgiFy++BHg7RIac6YZ7m50aVX6bI8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787990147; c=relaxed/simple;
	bh=kw8+iHS9eyoizS02ds/TXYtMmWbMHafB19PBU4tFGQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLOUQn2yyYy909kBRRWR+HC25amykvJAU/TbZmhyJzoQSyknrDWXT9vME2yBgN+07C+BDbjxObyGTtZtEXX8rzJ3teJLWsrmtxcGxzlG+FfrzZR/VLXJqk8CRD6o7wrMKa0g444Z7gny1TRR8nElxjyMjuPvVjbwTIyyD4+DXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05CD1F000E9;
	Sat, 29 Aug 2026 07:55:44 +0000 (UTC)
Date: Sat, 29 Aug 2026 09:54:02 +0200
From: Greg KH <greg@kroah.com>
To: CO <co@bugs.sh>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <2026082900-mortified-freehand-7c59@gregkh>
References: <2026082943-stomp-celtic-8a2b@gregkh>
 <010001a04c70ee2b-c45aa397-c6df-429a-a4ca-bc08bedd6c7f-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <010001a04c70ee2b-c45aa397-c6df-429a-a4ca-bc08bedd6c7f-000000@email.amazonses.com>

On Sat, Aug 29, 2026 at 07:34:24AM +0000, CO wrote:
> On Sat, Aug 29, 2026 at 12:01 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Fri, Aug 28, 2026 at 11:42:07PM -0700, Cedalion wrote:
> > > On Fri, Aug 28, 2026 at 11:20 PM Greg KH <greg@kroah.com> wrote:
> > > >
> > > > On Sat, Aug 29, 2026 at 06:07:39AM +0000, CO wrote:
> > > > > On Thu, Aug 27, 2026 at 10:36 PM Greg KH <greg@kroah.com> wrote:
> > > > > >
> > > > > > On Fri, Aug 28, 2026 at 02:00:17AM +0000, CO wrote:
> > > > > > > On Thu, Aug 27, 2026 at 10:31 AM Xiang Mei <xmei5@asu.edu> wrote:
> > > > > > > >
> > > > > > > > Th
> > > > > > > >
> > > > > > > > On Thu, Aug 27, 2026 at 5:50 AM Greg Kroah-Hartman
> > > > > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > > > > > > > > > We found a bug reachable in:
> > > > > > > > > >
> > > > > > > > > >     path    drivers/usb/host
> > > > > > > > > >     crash   out-of-bounds in xhci_queue_bulk_tx()
> > > > > > > > > >     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> > > > > > > > > >
> > > > > > > > > > Config, environment, the sanitizer report and a C reproducer follow.
> > > > > > > > > >
> > > > > > > > > > == Notes ===============================================================
> > > > > > > > > >     If you patch the bug based on our artifacts, a tag would be
> > > > > > > > > >     appreciated:
> > > > > > > > > >
> > > > > > > > > > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> > > > > > > > > >
> > > > > > > > > >     Everything in this mail is validated by the reproducer below.
> > > > > > > > > >
> > > > > > > > > >     We also hold an LLM-generated root-cause analysis and a candidate
> > > > > > > > > >     patch. The patch passes an A/B test: the same reproducer panics the
> > > > > > > > > >     unpatched kernel and runs clean on the patched one. Neither has had
> > > > > > > > > >     human review, so both still require validation before you send or
> > > > > > > > > >     apply them. Available on:
> > > > > > > > > >
> > > > > > > > > >         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
> > > > > > > > > >         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md
> > > > > > > > >
> > > > > > > > > Please validate and ensure that this is correct before sending this to
> > > > > > > > > us.  No need for us to dig through random web links, right?
> > > > > > > Hi Greg,
> > > > > > >
> > > > > > > Thanks for the feedback, and sorry for the noise. Sending these before
> > > > > > > we had settled the format and talked to maintainers was our mistake.
> > > > > > >
> > > > > > > Let me make sure we understood your suggestions.
> > > > > > >
> > > > > > > # What we understood
> > > > > > >
> > > > > > > You want patches that a human has verified, and you do not want to
> > > > > > > have to follow links to find out what a report says. We should not
> > > > > > > have sent what we sent.
> > > > > >
> > > > > > That is correct, would you want anything different if we were to send
> > > > > > stuff to you?
> > > > > >
> > > > >
> > > > > Nothing in particular, thanks. A Reported-by: tag and having the
> > > > > report closed would be appreciated!
> > > >
> > > > If you submit a patch, you are the author and no reported-by is then
> > > > needed.
> > > >
> > >
> > > Thanks, that makes sense when we send patches. We want to focus on bug
> > > reporting for now like syzbot and we'll also put our time in patching
> > > when the pipeline can run stablly.
> >
> > We almost always ignore "bug reports" that don't come with patches,
> 
> Understood. A bug with a human-validated patch is worth far more than
> a report alone.
> 
> > especially as your tool (i.e. your LLM) can automatically generate a
> > patch based on your reproducer, so why not submit it?
> >
> 
> The bottleneck isn't generating a patch, it's validating one. Bug
> reporting scales because a reproducer is self-validating: either the
> kernel crashes or it doesn't. A patch isn't. We can confirm a patch
> stops the crash via A/B testing, but confirming it addresses the
> actual root cause rather than papering over a symptom is beyond what
> LLMs can do automatically today. In our experience current LLMs don't
> come close to an experienced maintainer, and sending patches we didn't
> validate would just move our validation cost onto reviewers.

Agreed, so don't do that, but rather:

> If untriaged patches are still useful, we're happy to
> include them. We would send a proper patch with a commit message
> rather than a bare diff, clearly marked as LLM-generated and
> A/B-tested only, so it's obvious what has and hasn't been verified and
> others can take it further if they want.

No, please do:

> If instead you'd prefer we only send patches we've reviewed by hand,
> we'll keep doing that, just at a much lower rate, since it's two of
> us.

Yes, review them by hand, verify they are correct, and then send them to
us based on your review.  For you to expect us to do your work for you
is a bit odd, don't you think?

We want fixes that people think are correct, based on their review and
testing.  Based on the work I've been doing this year, LLM-generated
stuff is 50% the time totally wrong.  Don't make me have to reject your
LLM-generated patches 50% the time, as we will just get frustrated and
ignore 100% of your submitted patches :)

thanks,

greg k-h
