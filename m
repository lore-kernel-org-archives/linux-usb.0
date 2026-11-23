Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409311;
	b=exc7acRv2/bqWL8+lvbKCbljMivSzTUaehsZtKeIbVB4epBwUiigi0Ndftjri4B/dl3C
	 C2wgpgg/fTzMOhJTvyhcwGNzQ8J1h20mbVIGdAYoDfykkRJkZApskgRl5qjBWagURMZLx
	 MA4JAqzDCISH0scYBTs+NLq1V2uSRS15k+00wT5x8NxwO+BVJBZsq8cR0znX67oJVZDrh
	 I7ejDPlQPWb14TXXObB2ANUWTfFxTNRTdf8SS059ay5faz/k+ScacxtiXbqqJnImEDkFD
	 +Xnm0qGzBT+rT9F7ST4OSP858wqhDFVHXn3eonb28DTqQIRfZ2ZDaCo0zfBSBCjbSTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409311;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VGlsapO2V5POm3US54gqe1+vK/bGv7Uye1pPVBLBino=;
	b=BgkPJ/NH8/yxSDWpDbMAUcKkFX1NDQweHKnVGzkvoWdSnsq8XSp8hK5tjMZ2VGJoiXdH
	 gHWA/vBrsDdYOCh6H2btQuzZlYdwUvTU5b4poC6oAmlGS+DF2KC1WMoNv2Ej5HduvdUV3
	 lyKOlssbW+ni374BSf9bRYyNeczrv+4vPqMKX8p0sIRcVKFOF8NB8qcydUdg0mvZpT4qb
	 KL6A7/TRaFmQ+uTE7IXhJhPZm4KMKAUGFFwFBpOfn5KjA1SMXoriPDsRgWu8A91FBYYx4
	 uMxJOEx6iZn0aM96F5AjF46JbqBBvNMgp8lwkNWVYQaFwnVrqlQG5+RAY06qxPpOxfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Xs9m9E0+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00804606A320;
	Mon, 23 Nov 2026 04:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Xs9m9E0+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3241F000C6;
	Mon, 23 Nov 2026 04:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795409310;
	bh=VGlsapO2V5POm3US54gqe1+vK/bGv7Uye1pPVBLBino=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xs9m9E0+U6OF+0QRmU9uPnMfRzHuEmr4wAUPC1AIxzT0kGTxF3MVML/ZIzBafB7EQ
	 NyVPERnWgS6XZLpYddyCTHdVuZz1ybRQue9OggtEl3RoFwqH7x6P6cv5zRLlNnBJX6
	 dzEYKDuag2dkDzE3QINtpuFKnYZmzucTKQyu9bck=
Date: Mon, 23 Nov 2026 05:48:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhijian Han <hanzhijian1991@gmail.com>
Cc: andreyknvl@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Subject: Re: [PATCH 2/2] usb: gadget: raw_gadget: fix memory leak on connect
 event failure
Message-ID: <2026112307-throwing-tint-b5c3@gregkh>
References: <1729447050-0-patch-2-2-raw-gadget@kvack.org>
 <20261123011750.1032874-1-hanzhijian1991@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123011750.1032874-1-hanzhijian1991@gmail.com>

On Mon, Nov 23, 2026 at 09:17:50AM +0800, Zhijian Han wrote:
> On Fri, Nov 20, 2026 at 09:17:32PM +0800, Greg Kroah-Hartman wrote:
> > On Sat, Aug 22, 2026 at 10:48:50AM +0800, hanzhijian wrote:
> > > gadget_bind() allocates an ep0 request and stores it in dev->req. If
> > > raw_queue_event() fails to queue the connect event, the function
> > > returns without releasing the request, leaking it.
> > >
> > > Release the request before returning in that case.
> > >
> > > Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
> > > Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
> >
> > Full name please.
> 
> Apologies. Please use:
> 
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Please send a new version with this corrected
