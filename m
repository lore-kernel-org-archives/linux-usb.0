Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6DC81AA8
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787984408; cv=none; b=KlgAtQp80bg/M9hz3SfvRKAVwcYVSUkgeIOTnAV6bASkwEWbXUkgu3vvf0BG8CXyDGZO3ALRBXYV5f5Imnmhg1lZP+v5z5bIONUTh4Hbr2ypbDrU7hxCNmWaKMqRjkFtIpWkiltml2ET6ITeB7m++HSwHxLqZyzQhp6LcxIz7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787984408; c=relaxed/simple;
	bh=PaHQtDLWbkGWuKZkpYYijHcFpS0e43o1sy0lODr3DAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pySfXpdhRQowQIOdI+pBL2O9jz51wd82ZUqjP9Hb35O0pam1wrOBD1vC3S1FWCZcK+HGtwKQQS6ZCFaOK3ZvJv2nQziDhJ2C1SvOLhMeB1yMwOQRiMyrBuh07G43YQ2HK+GgMitW2DwSH6g15xPW6PgHckq4/g2k7cDwP/xu4N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E567E1F000E9;
	Sat, 29 Aug 2026 06:20:05 +0000 (UTC)
Date: Sat, 29 Aug 2026 08:18:23 +0200
From: Greg KH <greg@kroah.com>
To: CO <co@bugs.sh>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <2026082926-unmindful-snipping-b8e7@gregkh>
References: <2026082816-jolly-unskilled-5d6e@gregkh>
 <010001a04c21826c-258f767e-4a70-4e60-9b5d-1a96906c8807-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <010001a04c21826c-258f767e-4a70-4e60-9b5d-1a96906c8807-000000@email.amazonses.com>

On Sat, Aug 29, 2026 at 06:07:39AM +0000, CO wrote:
> On Thu, Aug 27, 2026 at 10:36 PM Greg KH <greg@kroah.com> wrote:
> >
> > On Fri, Aug 28, 2026 at 02:00:17AM +0000, CO wrote:
> > > On Thu, Aug 27, 2026 at 10:31 AM Xiang Mei <xmei5@asu.edu> wrote:
> > > >
> > > > Th
> > > >
> > > > On Thu, Aug 27, 2026 at 5:50 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > > > > > We found a bug reachable in:
> > > > > >
> > > > > >     path    drivers/usb/host
> > > > > >     crash   out-of-bounds in xhci_queue_bulk_tx()
> > > > > >     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> > > > > >
> > > > > > Config, environment, the sanitizer report and a C reproducer follow.
> > > > > >
> > > > > > == Notes ===============================================================
> > > > > >     If you patch the bug based on our artifacts, a tag would be
> > > > > >     appreciated:
> > > > > >
> > > > > > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> > > > > >
> > > > > >     Everything in this mail is validated by the reproducer below.
> > > > > >
> > > > > >     We also hold an LLM-generated root-cause analysis and a candidate
> > > > > >     patch. The patch passes an A/B test: the same reproducer panics the
> > > > > >     unpatched kernel and runs clean on the patched one. Neither has had
> > > > > >     human review, so both still require validation before you send or
> > > > > >     apply them. Available on:
> > > > > >
> > > > > >         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
> > > > > >         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md
> > > > >
> > > > > Please validate and ensure that this is correct before sending this to
> > > > > us.  No need for us to dig through random web links, right?
> > > Hi Greg,
> > >
> > > Thanks for the feedback, and sorry for the noise. Sending these before
> > > we had settled the format and talked to maintainers was our mistake.
> > >
> > > Let me make sure we understood your suggestions.
> > >
> > > # What we understood
> > >
> > > You want patches that a human has verified, and you do not want to
> > > have to follow links to find out what a report says. We should not
> > > have sent what we sent.
> >
> > That is correct, would you want anything different if we were to send
> > stuff to you?
> >
> 
> Nothing in particular, thanks. A Reported-by: tag and having the
> report closed would be appreciated!

If you submit a patch, you are the author and no reported-by is then
needed.

And we don't have anything to "close", so that's not really going to be
possible :)

thanks,

greg k-h
