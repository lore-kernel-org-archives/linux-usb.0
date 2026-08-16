Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA73CDBD3;
	Sun, 16 Aug 2026 06:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786863479; cv=none; b=Ff5OyJ346BLr6X7gmXe2mUSrDZZrRgGEzjObK30jM2aRpDSKeS98aMGsfYbIS+Oz1a62eaIJXLBywOFJ//IGyOUcdYmDGdG8ubDz8GCGIgbRQxJ12z5SEqs+fAxeywniFLV213M6dGR+GmMnthLNBix24neDIIM5Xh5biSlAAew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786863479; c=relaxed/simple;
	bh=vAkpQEVUOlr0U7T+iHC4TqHk9fzAAS730T+4ctZ9Q0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfqDu0bxnajApryCCFm7S+LGXIPuUyfuP6prw8NjIbfUvlPbOt+4NSLCbtfnyn/bnOFwOf8lvoS4jfB5/GzPhUFDR/FnIslsYao/KI4iHStiDlofAV/RM+N1WHQ+pScqf7hYNa6xgPtrCKagxWyQcXj5gwRntr3k5C2bNUNtshI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BOjqPb/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BOjqPb/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A784C1F000E9;
	Sun, 16 Aug 2026 06:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786863478;
	bh=s6IPrmmHNprfb0DG4HnVI4L8DgQTDpEossKjpD1SSKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BOjqPb/TSPF+bAsy4V/Yd0lTcZeYFsubCynelD+Hi6EgjbETrK7Ay+q/uQfFtGoEb
	 on15tQYS/KxInUiU/zKrud9uBlPfXU8P8mR3dEhFI503OQHxssIYxMmVnecZn1btLz
	 iig/2qKIA2WTcDyboWw4dny9IGnvPSNFHqDV8gJY=
Date: Sun, 16 Aug 2026 08:56:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	yuyang.du@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usbip: vhci_hcd: let the driver core manage the sysfs
 attributes
Message-ID: <2026081602-cork-molecule-fd5e@gregkh>
References: <20260816015051.13184-1-kartikey406@gmail.com>
 <2026081646-sixties-fade-1359@gregkh>
 <CADhLXY7UWkd_4wNVSjxQYOVP3GeBZcDA5iiOBoZbz9DXn993GA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADhLXY7UWkd_4wNVSjxQYOVP3GeBZcDA5iiOBoZbz9DXn993GA@mail.gmail.com>

On Sun, Aug 16, 2026 at 11:41:41AM +0530, Deepanshu Kartikey wrote:
> On Sun, Aug 16, 2026 at 10:26 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> 
> > >  extern struct vhci *vhcis;
> > >  extern struct attribute_group vhci_attr_group;
> >
> > Is this still needed here?  And can't it be static now?
> >
> > > @@ -1565,9 +1546,12 @@ static int __init vhci_hcd_init(void)
> > >
> > >       return 0;
> > >
> > > +
> >
> > Extra line?
> >
> > thanks,
> >
> > greg k-h
> 
> I have sent patch v3

Please slow down, there is no rush here, you shouldn't be sending
patches more than one every few days.

greg k-h
