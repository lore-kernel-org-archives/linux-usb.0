Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A16B32D452;
	Mon, 26 Jan 2026 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769424126; cv=none; b=HHXGGxxux9g3g0QSjO9ocGbe+SKrYj/VWBEiLAvUZwHSvKxDFLZB1gOSlMS1pek4LMucLeGhnKT4yOsIA3pYLxIi6t8zUF9YDXMql+UNTAEqjHtmbjQIXAYJZJFyua3VIyusFDDct5FKMgT2xoD3C29rYvH6fwcOo4ETSiFNCUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769424126; c=relaxed/simple;
	bh=D1PU4TmQuihQ4wkP0X3G2+6BzE1sVOAruc+eyyTYsgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJOV54aEXHXz6cqnioFLOCzQzmWKJw+WfZR01MM7KYD5naZS/W87BnNtx74pR21nbsz9uNKZbwVkXqfHKQoEqLXyVo8s9+xgHJ+YP2aDGMuWTgM/xXkXvePLNvQ4sEZXUc5cLsusD752/vNEBVCgIAj0zWJJs0mwCo/fPqkzSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HSeY3rmd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HSeY3rmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2D9C116C6;
	Mon, 26 Jan 2026 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769424126;
	bh=D1PU4TmQuihQ4wkP0X3G2+6BzE1sVOAruc+eyyTYsgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSeY3rmdy6muXz4fdAoFLbGVefXJ3zfkakqsfc/psdRyQjyq1tuAtqEsUESHouemu
	 Jp48XRoWzQOzfQ7H4wbGRRxBpsIHsnOwJYh44EvsDO0w5oFq3Rvwtzkuwv6rV4RPou
	 E0Nq5DQlvRTzVjhNUjvfy0gewrqb28+M1bAoUiUI=
Date: Mon, 26 Jan 2026 11:42:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jan Remmet <J.Remmet@phytec.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Enable VBUS based on role state
Message-ID: <2026012639-gag-sufferer-a344@gregkh>
References: <20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de>
 <2026012343-rockfish-candle-d3d9@gregkh>
 <4d1e6908-daa2-4322-8c00-055b4c1022bc@phytec.de>
 <2026012641-material-guiding-444d@gregkh>
 <29eedf1f-7dcd-497d-a569-488d7cfb69c9@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29eedf1f-7dcd-497d-a569-488d7cfb69c9@phytec.de>

On Mon, Jan 26, 2026 at 10:32:40AM +0000, Jan Remmet wrote:
> Am 26.01.26 um 10:05 schrieb Greg Kroah-Hartman:
> > On Mon, Jan 26, 2026 at 08:04:58AM +0000, Jan Remmet wrote:
> >> Am 23.01.26 um 17:19 schrieb Greg Kroah-Hartman:
> >>> Does not apply against my tree, what did you make it against?  Can you
> >>> redo this against linux-next and resend?
> >>
> >> This is strange. I created it against 944aacb68baf (something after
> >> v6.19-rc5). I can cleanly rebase it to next-20260123 without changes.
> >> Do I miss something?
> > 
> > Probably other changes to this file since then?  linux-next will include
> > the USB development tree that has the work of everyone else in it that
> > will go into the next release.
> 
> I saw on usb-next my v1 is already applied. After removing it, it 
> applies well. Sorry for the late change on this patch.

I can't remove a patch from the tree, if there is something different
here, please send a new "fix up" patch for that.

thanks,

greg k-h
