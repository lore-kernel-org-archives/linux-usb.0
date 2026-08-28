Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89A3AE713
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895377; cv=none; b=nx+QWsG3kjWokCeF8Xw35ASsbrR1kEhr3W+eVBvP/sIcGct5KUziu4qKS73CUNPoXhGHcUGSdHqX26BIbi/OOzp6qy/QPKWT80TxXuB3xBw/bgSOA+6sCvgjGgBKUvMkp3xc9aiJEesES34GAu2OFL9sGW1zf6XUs3bCdw3L2V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895377; c=relaxed/simple;
	bh=t9sIabV1uiTZnL8NOjqeEDzsea6FejLC2Qdu1B8lanM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X87k/QTV0uIdJyiPvuWpaZ0ZG5orG6oMBtSLVLIKN3iTUTr7dK5KzZRTFtMg6URP/W9ULzUfbtnhlVT6m7Fs7nI/+lRd4HDzRcN8imgjRKb9MBun2Jzl/dRn8waCsMcJ77W1tUVXs3hObMDHCA88bkQd0B5QVyjBEGInlFDxSRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07FF1F000E9;
	Fri, 28 Aug 2026 05:36:13 +0000 (UTC)
Date: Fri, 28 Aug 2026 07:36:11 +0200
From: Greg KH <greg@kroah.com>
To: CO <co@bugs.sh>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <2026082816-jolly-unskilled-5d6e@gregkh>
References: <CAPpSM+RJKziJf7enrZ5FMy-uxJp1Fy1M_acVXy+v3WskU7jJXw@mail.gmail.com>
 <010001a04618ab57-c1bc8a0a-2b93-430f-989d-69a19d05d56a-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <010001a04618ab57-c1bc8a0a-2b93-430f-989d-69a19d05d56a-000000@email.amazonses.com>

On Fri, Aug 28, 2026 at 02:00:17AM +0000, CO wrote:
> On Thu, Aug 27, 2026 at 10:31 AM Xiang Mei <xmei5@asu.edu> wrote:
> >
> > Th
> >
> > On Thu, Aug 27, 2026 at 5:50 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > > > We found a bug reachable in:
> > > >
> > > >     path    drivers/usb/host
> > > >     crash   out-of-bounds in xhci_queue_bulk_tx()
> > > >     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> > > >
> > > > Config, environment, the sanitizer report and a C reproducer follow.
> > > >
> > > > == Notes ===============================================================
> > > >     If you patch the bug based on our artifacts, a tag would be
> > > >     appreciated:
> > > >
> > > > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> > > >
> > > >     Everything in this mail is validated by the reproducer below.
> > > >
> > > >     We also hold an LLM-generated root-cause analysis and a candidate
> > > >     patch. The patch passes an A/B test: the same reproducer panics the
> > > >     unpatched kernel and runs clean on the patched one. Neither has had
> > > >     human review, so both still require validation before you send or
> > > >     apply them. Available on:
> > > >
> > > >         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
> > > >         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md
> > >
> > > Please validate and ensure that this is correct before sending this to
> > > us.  No need for us to dig through random web links, right?
> Hi Greg,
> 
> Thanks for the feedback, and sorry for the noise. Sending these before
> we had settled the format and talked to maintainers was our mistake.
> 
> Let me make sure we understood your suggestions.
> 
> # What we understood
> 
> You want patches that a human has verified, and you do not want to
> have to follow links to find out what a report says. We should not
> have sent what we sent.

That is correct, would you want anything different if we were to send
stuff to you?

> # Until then
> 
> We have stopped. No further reports go out until the format is one
> that does not waste your time. 19 reports went out in a single batch
> without a person releasing them, which was our process failure.
> That is fixed, and we would rather settle the format with you before
> we start again.

Just use our normal development process of sending patches, there's no
need to change anything here as it's working quite well (fastest rate of
change of any project with the most contributors...)

thanks,

greg k-h
