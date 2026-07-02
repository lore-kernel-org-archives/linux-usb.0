Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DFC3D646E;
	Thu,  2 Jul 2026 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993328; cv=none; b=SvU3QnzMsM0IzpVHI4kEQZ0hbDNIEAZl688Kar5oa4uSZj7uiQWeSXwz3FDGchUZSeAeOgb3+F5quYrVLfPn3LKIYtDJEU7vb1Je8aj/OJvEv2QaoJpHtFhhS29vG7ets9XquLgfZMAl0lb03eSzjP1VRa1njyvgnsp3l4d63+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993328; c=relaxed/simple;
	bh=Gx1pmHZxG9QtBoYoIpiP2VqeVgfUHiSeei7Zo7qDg5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDhQL22cnb4D6N4Sl5lQlyC/yof6DnTtz0H6zpL/mwGsSqRGtFczoHk2QjW7SKkgGy27OxrIl4T7IYAsn/C5hV10Q0JlfelN4LqHDLlv+8JICSYLR0BHqMnCQae531Zxez3gTdGrEBYuifi11DSaQLMvZQMwxi19x4vQNVP1W84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GVIUf8+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GVIUf8+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D033C1F000E9;
	Thu,  2 Jul 2026 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782993327;
	bh=zIiF8yPWcvGc1nmzMfILVCKt8KvT6o+AwdmCYedSfFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GVIUf8+gbJWedcssTHa75M24/pBMO3f2WXrncwYjat1MfBmxvEwnIRx271K7nCcqO
	 t8/zW59EtIqGdgDSAghN56BMEScoupl6uUMXlmKn5dvFEiYaMahSNEAT7o/7zlTbvn
	 w2yFmhCuBG1oabbTOLYRhhzh+8Zbv+MyFxZNk73c=
Date: Thu, 2 Jul 2026 13:55:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: dengjie03@kylinos.cn, johannes.bruederl@gmail.com, kees@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, michal.pecio@gmail.com,
	sakari.ailus@linux.intel.com
Subject: Re: [RESEND PATCH] USB: core: report interrupt endpoint correctly in
 companion descriptor diagnostic
Message-ID: <2026070255-majestic-saddled-9bd5@gregkh>
References: <2026070248-fleshy-activity-1a33@gregkh>
 <221217D28C1D901C+20260702092655.2567041-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <221217D28C1D901C+20260702092655.2567041-1-raoxu@uniontech.com>

On Thu, Jul 02, 2026 at 05:26:55PM +0800, raoxu wrote:
> Hi Greg,
> 
> > > interrupt endpoint because bulk endpoints are handled by the following
> > > else-if branch.
> > >
> > > Report the endpoint type as Interrupt instead of Bulk to avoid
> > > misleading descriptor diagnostics.
> > >
> > > Signed-off-by: Xu Rao <raoxu@uniontech.com>
> > > ---
> > >  drivers/usb/core/config.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Why is this RESEND?  Always say so below the --- line.
> 
> The original submission received an Acked-by, but it was not picked up.
> I resent the unchanged patch to bring it back to attention.

So you dropped the Ack now?  That's not ok, just respond to the original
thread.

But realize that the merge window just ended, and I'm staring down
thousands of pending patches.  If you wish to see patches applied
sooner, please help review other ones.

thanks,

rgeg k-h
