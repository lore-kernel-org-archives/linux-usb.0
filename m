Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170554;
	b=19s0E7z6yRl58p+FEjxIk5fvv5+/Oga50f2+1tyWa19yh67HsKsvq/MyRBKsnZN5+xSR
	 2xMCrbBvMack37H35EQWgQHYmcdNGk9AYD/pfwajPIosuDEyS1BA1OHT2qOvEN+Ktg7Za
	 6xioB2WoYSiDWOkjstF2maCRK+rboOHnMW0On/Tjy8nn+nQtxnTazVqO08PSyxBM8iu8e
	 veu26a/kB3F4ESQjuL+s72qbfJQZ0dXfuYASDXQCAdpBrXMWRRvAoCrDIOU1zIqH5B7QH
	 GWQ2bGytfCM2j9jAx4Csntvs2DpiWzyIioWRT6iZctz9cJAnfqMVInq94+v1qpC1Uig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170554;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZHtd759AKHliNzdBVzL4n4C+GbA5ruEDT5e660xhcCc=;
	b=Vd814Ydzk4jg5alux3ZnsTyGYnb2cOdgFeIK2+1g+qWulOKC1EYLi5l/uWWUjo3viOlM
	 PE5pJin9UoTNyKVZEDFc6Tk/lczNeKD9zWQp6NSUMcXZ96uoTgpVp6vO/zZMyKf2iXBoV
	 mKNlApvxMp02qCnKCP0YF7vOz3bXwjTWnl/ra1c/8jMD7kKfOFGMSfID18oiWwxjh65ve
	 wWP6jz3nFDCTR0yn2NtsXgU95jdpOnlNl3HK4ixx+hTDW5nNYU9Zq+SZ5sXTkimNNGdfe
	 5fI2Otz1efU3Ta/ExoGIhfkFWythcyTOnLWM5e4d25sWktJ4uio4zLLEqvf9CzzpaaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uuOJWguY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39058606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uuOJWguY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF711F000D2;
	Fri, 20 Nov 2026 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795170553;
	bh=ZHtd759AKHliNzdBVzL4n4C+GbA5ruEDT5e660xhcCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uuOJWguYbUE5YtSjH2VGA6S8c7Pbg9keG+UCE3sx7OLcrxZ+JryhxteNktSin2HuG
	 h9VOpn+logALmaXsgpuVsOuqNL25esGNEkwL4jfdmeAbPB9bBRp74FSlfTP/rE3iMJ
	 DDgNef/+bJenHQk+bdWzU3BNm/uFTnpyQO+3XGU4=
Date: Fri, 20 Nov 2026 11:29:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: viro@zeniv.linux.org.uk, nkapron@google.com, me@samcday.com,
	michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/2] usb: gadget: f_fs: cancellation fix
Message-ID: <2026112003-glance-blouse-b5ef@gregkh>
References: <20261119151942.44304-1-ingo.rohloff@lauterbach.com>
 <2026112027-purveyor-chastise-5026@gregkh>
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
In-Reply-To: <2026112027-purveyor-chastise-5026@gregkh>

On Fri, Nov 20, 2026 at 11:16:44AM +0100, Greg KH wrote:
> On Thu, Nov 19, 2026 at 04:19:40PM +0100, Ingo Rohloff wrote:
> > This 2 part patch series fixes a previous commit and does
> > some refactoring.
> > 
> > Note: The first patch in this series only applies cleanly, if
> > "[PATCH] usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance."
> > is applied first.
> 
> I don't see that in my queue, pleasae submit all of these as a single
> series.

Ah nevermind, found it...

