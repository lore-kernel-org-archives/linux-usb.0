Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F241736F;
	Fri, 10 Jul 2026 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688338; cv=none; b=mN9Qoy4VE3jWcJX42t8YQw07iN9lkLk3pJf++0+w/LhiuZLknXi/OMMETCZWJcGqIX3zU09DXqlsjpcA+ndQrWZay8Z4CMf6WT8qvYgHeN1WKHY/rSGNLucML8HHQYNi2qD86e+QE2PcF0CLY4kWdDJA/2+7alZzrzBEfw9rTeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688338; c=relaxed/simple;
	bh=IiKn4pPJ+Fbvj0UniSlYZkXOwwLR2W6xxEpNJSxGO3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9Q/Q3YZ23yRCn44ppVJFG7cQgYEynm+9uebjx59kQFZMVu60LHnmxwRos/E6+C0qgP1AVQR9wl3PILFRqxMexvQWt4NQhEGsOvjKwq1gxTi45urLU2x4g0D1NSed4TKOWx2rBfJ3rNpjvd+g4YB3Ao67OpMVDSAJMKqfoCDCno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XnBvUG7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XnBvUG7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6101F000E9;
	Fri, 10 Jul 2026 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783688336;
	bh=EF5cscYIG18SiHvY55M5ZWlsxf/N9MK4AVYir4Nldfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XnBvUG7rqmB2VI74lYywKp0qvSxe6V7/pzM0TWcSfOpVNEftJeR6exeCtMUIqLbtM
	 fETAsee7P/xicFSm9nqAoqQMjJtjC8rG7QdOte75ux9JiyjdQquBhHiPCRe/2I0x7e
	 oAytvNU7Eh6odRuoW4yd9VEUI5SQEZWcJ68nD9R4=
Date: Fri, 10 Jul 2026 14:58:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Sam Day <me@samcday.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
Message-ID: <2026071039-ensure-vastly-73c8@gregkh>
References: <20260617085930.711146-1-ben.dooks@codethink.co.uk>
 <2026061715-rift-strategy-cdec@gregkh>
 <c1108bc0-190f-4ebd-adb2-51a4a07fc144@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1108bc0-190f-4ebd-adb2-51a4a07fc144@codethink.co.uk>

On Wed, Jun 17, 2026 at 10:56:00AM +0100, Ben Dooks wrote:
> On 17/06/2026 10:34, Greg Kroah-Hartman wrote:
> > On Wed, Jun 17, 2026 at 09:59:30AM +0100, Ben Dooks wrote:
> > > The wMaxPacketSize is __le16 type, fix the sparse warnings by changing
> > > the type.
> > > 
> > > Fixes:
> > > 
> > > drivers/usb/gadget/function/f_fs.c:3346:32: warning: incorrect type in assignment (different base types)
> > > drivers/usb/gadget/function/f_fs.c:3346:32:    expected unsigned short [usertype] wMaxPacketSize
> > > drivers/usb/gadget/function/f_fs.c:3346:32:    got restricted __le16 [usertype] wMaxPacketSize
> > > drivers/usb/gadget/function/f_fs.c:3371:36: warning: incorrect type in assignment (different base types)
> > > drivers/usb/gadget/function/f_fs.c:3371:36:    expected restricted __le16 [usertype] wMaxPacketSize
> > > drivers/usb/gadget/function/f_fs.c:3371:36:    got unsigned short [usertype] wMaxPacketSize
> > > 
> > > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > > ---
> > >   drivers/usb/gadget/function/f_fs.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index 75912ce6ab55..35d885178b52 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -3332,7 +3332,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
> > >   		struct usb_request *req;
> > >   		struct usb_ep *ep;
> > >   		u8 bEndpointAddress;
> > > -		u16 wMaxPacketSize;
> > > +		__le16 wMaxPacketSize;
> > 
> > What commit id does this fix?
> 
> bdcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across
> usb_ep_autoconfig() call")

Great, can you add that as a Fixes: tag when you resend this?

thanks,

greg k-h
