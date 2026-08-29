Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C532FBE
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787986899; cv=none; b=EWjQ6cE8aVOzjcJhy2Ugf7uw2qsw+wURH7EmFELrcpwMSAL+ri4bjj8xuupdduzABHPGmfRVtiJReOc7xLUsC2aa+1X1/bjHaQybm4g8vbQn4RctEIo6AJZPqYm12RckycNihyqXaYqhFGVgv5rHLxtP5/ohsJJEvhg/McCMd1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787986899; c=relaxed/simple;
	bh=Rs6UvUei0x0eTLd4SdqtOPpyI1BGFSxoSYn6aP1Y3tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k71J0OLUj5R+ASgHo3Wx1aRqBGWlXS+YeokcNV3NB17LuURts83BSddt0u4DfYFUNYGhTsr8aFC8ZFt7Q0oinvtf8zQ90wZjAMqPeFDHlZEyIu/TJi9U602kYzRa03zpj9wY+UOMWsfnrj0gFCazxua9vlOEvmgMw47dZokFaxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9C41F000E9;
	Sat, 29 Aug 2026 07:01:37 +0000 (UTC)
Date: Sat, 29 Aug 2026 08:59:54 +0200
From: Greg KH <greg@kroah.com>
To: Cedalion <4rtiphishell@gmail.com>
Cc: CO <co@bugs.sh>, linux-usb@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <2026082943-stomp-celtic-8a2b@gregkh>
References: <2026082816-jolly-unskilled-5d6e@gregkh>
 <010001a04c21826c-258f767e-4a70-4e60-9b5d-1a96906c8807-000000@email.amazonses.com>
 <2026082926-unmindful-snipping-b8e7@gregkh>
 <CAMb7gs-vRZYfXK4Q9wrsSa_f46u74UgpfDWNw3HyKHjci_VWQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMb7gs-vRZYfXK4Q9wrsSa_f46u74UgpfDWNw3HyKHjci_VWQA@mail.gmail.com>

On Fri, Aug 28, 2026 at 11:42:07PM -0700, Cedalion wrote:
> On Fri, Aug 28, 2026 at 11:20 PM Greg KH <greg@kroah.com> wrote:
> >
> > On Sat, Aug 29, 2026 at 06:07:39AM +0000, CO wrote:
> > > On Thu, Aug 27, 2026 at 10:36 PM Greg KH <greg@kroah.com> wrote:
> > > >
> > > > On Fri, Aug 28, 2026 at 02:00:17AM +0000, CO wrote:
> > > > > On Thu, Aug 27, 2026 at 10:31 AM Xiang Mei <xmei5@asu.edu> wrote:
> > > > > >
> > > > > > Th
> > > > > >
> > > > > > On Thu, Aug 27, 2026 at 5:50 AM Greg Kroah-Hartman
> > > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > > >
> > > > > > > On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > > > > > > > We found a bug reachable in:
> > > > > > > >
> > > > > > > >     path    drivers/usb/host
> > > > > > > >     crash   out-of-bounds in xhci_queue_bulk_tx()
> > > > > > > >     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> > > > > > > >
> > > > > > > > Config, environment, the sanitizer report and a C reproducer follow.
> > > > > > > >
> > > > > > > > == Notes ===============================================================
> > > > > > > >     If you patch the bug based on our artifacts, a tag would be
> > > > > > > >     appreciated:
> > > > > > > >
> > > > > > > > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> > > > > > > >
> > > > > > > >     Everything in this mail is validated by the reproducer below.
> > > > > > > >
> > > > > > > >     We also hold an LLM-generated root-cause analysis and a candidate
> > > > > > > >     patch. The patch passes an A/B test: the same reproducer panics the
> > > > > > > >     unpatched kernel and runs clean on the patched one. Neither has had
> > > > > > > >     human review, so both still require validation before you send or
> > > > > > > >     apply them. Available on:
> > > > > > > >
> > > > > > > >         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
> > > > > > > >         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md
> > > > > > >
> > > > > > > Please validate and ensure that this is correct before sending this to
> > > > > > > us.  No need for us to dig through random web links, right?
> > > > > Hi Greg,
> > > > >
> > > > > Thanks for the feedback, and sorry for the noise. Sending these before
> > > > > we had settled the format and talked to maintainers was our mistake.
> > > > >
> > > > > Let me make sure we understood your suggestions.
> > > > >
> > > > > # What we understood
> > > > >
> > > > > You want patches that a human has verified, and you do not want to
> > > > > have to follow links to find out what a report says. We should not
> > > > > have sent what we sent.
> > > >
> > > > That is correct, would you want anything different if we were to send
> > > > stuff to you?
> > > >
> > >
> > > Nothing in particular, thanks. A Reported-by: tag and having the
> > > report closed would be appreciated!
> >
> > If you submit a patch, you are the author and no reported-by is then
> > needed.
> >
> 
> Thanks, that makes sense when we send patches. We want to focus on bug
> reporting for now like syzbot and we'll also put our time in patching
> when the pipeline can run stablly.

We almost always ignore "bug reports" that don't come with patches,
especially as your tool (i.e. your LLM) can automatically generate a
patch based on your reproducer, so why not submit it?

thanks,

greg k-h
