Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E5352F86;
	Wed, 12 Aug 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519538; cv=none; b=EE+iVc/PVfryyHcb+TQHncdtcmYTsnkSGGqqFN60k6ltONHALS++Z65x173ieBKLQEEWAqGrpX844QIhYNZa8O2jEkXkF8FfrVJXxgSNsLXMuuk3sefqAK9tkQRD6U4kyLEN/bxJ5QxLhAgUMkLl35OG0++sv4uf/ZJsqApGpkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519538; c=relaxed/simple;
	bh=vtc+9fVJdjU6qJE4nfAFO8m8fK5xQB1iXR1cVY1G8hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wm01cp9Ei++ZmQsSODtr90mKp96mArOSBmq/qAC46L+SuBjUMtXfiJeWza34oUumnRFWczQ5kOlqbI9JbS+P6/CLXbE4FO/9rtVGVv4la2RXtvvX5sPLziqQt/uKF7sta93PwCakBMHdX8gWRcw5c1hlknS5+HS0gMpnM2zeODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Yt+TtxKF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GbvLifOk; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Yt+TtxKF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GbvLifOk"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 5B61A1D00126;
	Wed, 12 Aug 2026 03:25:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 12 Aug 2026 03:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1786519535; x=1786605935; bh=niL4OSIHDl
	Q8pw3FC/Vt3XSQSxfjAmdZ+bNGZxfF+ZA=; b=Yt+TtxKFmqf4etLgg3WIcOovD8
	t7lRkE2EU1gArdc+rTrqvtYueG8fl5+SeWPTOSgPxY+z3hKFEDxUp3wO+2IPpggz
	LV8z3sR3vYp9Wly7rEiYw9wyvewbIxbXyKZLrSdPXLD58wJkCSJ5jti9HgY8fNkZ
	lqUTaYp1rJ7h6/W/40tPF6AsRcmznpInMNuejno0ecoGxaigxz3HZIoJcPndMfD2
	rOhaLDXEpN/oJY2SPCuurT8Ioi/4g1mt+fenjIO+xVUr2xQ0MJerhHQnSBYq6LjM
	EMHJsvtyWOfcgeGmIdpqTmuXPu+IQMAZQh/Rb3ucAQPUf/TQOyzNdlTyPikQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786519535; x=1786605935; bh=niL4OSIHDlQ8pw3FC/Vt3XSQSxfjAmdZ+bN
	GZxfF+ZA=; b=GbvLifOkMF1EhrQeroS7p51RB6ruffqCIQhLe4frLuFxfIrp94X
	Sf7Fkfka2J8mgcR4nfP1npMOFnxnIFw2baoqxR2lCr1ZjDzR/DGb6eUNFUnF0lpk
	/u3vc98eZgjxn4rXnzSbBKKcekTwaTTMnCV0dPQ2qQt5JC6vywIBTaPMZ+YMWyWt
	PNDyhWDjhFvz6IKJd4GipkrjRQwQssAfkDx8Z78qIezYcQkKfEAg6FsIYQX4Na+m
	u6rYxebRkmasvpRU+PIZ/mhL9T6Nr9mU1KGNYZf2iMGc/nghy7pZj4eQ7MoCcCT6
	+mE/mNDHdtiL/wEoFFwNoWXC36f6F+qWJlg==
X-ME-Sender: <xms:7h98ag4vyQxACmkjD9FBWE0lhOmgZkP0CusXgxzvAGOVuLTE7kKsvQ>
    <xme:7h98aiAuk_lMqK_DnCb4Vs3NJlqhufgAbaJr01dGaOhqutx_7o4hm36ITwQXV78J-
    rrHmlMHCNAyo_UnDTFLRxrDXjCwQz5rxNUeCs-DcjJygZ1Czw0>
X-ME-Received: <xmr:7h98am540EtkJUe5rTpb0DC5dAPWKzsj5tQ8-rNbIWnzQKlyJXyu_uQ>
X-ME-Proxy-Cause: dmFkZTF7Zu7n7jUZXouOj6SlMjI0m+8M08b/HO+jhekg5bSP8zCs4rT/wU1NEPNfb1kLwA
    EEC2+Kmpfl0CkxzCAig2HGzJpJFMKLxcKgSTC3f2WLYWlmqY2F33wc8a8wr97HIeqlygL+
    YTeUs89v6EA9Nf7vFj24D9t/ZO+w+AOXsKKc8aOvf4HUDY3GnWwTe0JP7cG/46uViLEt6c
    IQx+WfYaDKTX8/duEIvwvH/f2Bu7MQv7HnbwjIUmWSMSZlCtsbPYVtcjOB6a6unPxH88Dh
    MuDrhHTPeu1QgZr9/Qu4L+E16mOHgYsIqNz6gx20kbuZ0yn+6eC9EuC+rQ8//PjZKVdcdb
    CeYkNRUkF5PXKZfkjOAL37QI4bSq0eJnc/otwHy94GZrT54Y16CT3sLDXNH1I3MTqZfTW2
    CYw9hUgvn11JWGz6En1wvE1yPZ9vL0uDDuMuKOAEU6ft65dXjr7brq2pH46y0m2a1ulC3v
    ZlONEOQCJs20bfPVSSuJVR2TRTQfM9iYRVa7H4XQ1XBvDRQ+dK6pE9rZ6fovJL+kqfCyYr
    4uGmD1LhlcObXRYE0MvV4MlP6W82zN/7VOPh3kL0hndZQYCSR+M+ns9xq2kKQ7eGzYUiuz
    q1Cr3Vk9kovYoHz/jwbRohlbMM2SHV4bu6FzeevD+yadGlvchNs3lpa7IAuA
X-ME-Proxy: <xmx:7h98aru6JKoDzPuX055wIE3pXFPDRlwLq4t29jbzk6ZuNjw3K1aqxw>
    <xmx:7h98ar6nMttqDWv205ZFTTE-WCL-_4LS5sa_1Oq7T1Bod6KzeRwdWg>
    <xmx:7h98av0kmdIr_u6DPMS0JgHDbJPfYzt2DmqeOH3yFjXPK98odhltYQ>
    <xmx:7h98auiAVvXRz0o7MvBimnor44kFBVhGlTX3-Opn4vZoCevjShayAg>
    <xmx:7x98agDWlKFpE_XmvOn_QQT0ZGAiSig2xhWpVtr8eUeTLCBac3-kwhfT>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 03:25:33 -0400 (EDT)
Date: Wed, 12 Aug 2026 16:23:59 +0900
From: Greg KH <greg@kroah.com>
To: Jason Colapietro <jasoncola1@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 1/2] usbip: make remote list honor parsable
 output
Message-ID: <2026081211-seventh-whoever-d455@gregkh>
References: <20260812063910.31293-1-jasoncola1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812063910.31293-1-jasoncola1@gmail.com>

On Wed, Aug 12, 2026 at 02:39:09AM -0400, Jason Colapietro wrote:
> The -p option only affects local devices and gadgets. Remote lists still
> print their human-readable headings and details, so scripts cannot parse
> them using the documented option.
> 
> Pass the parsable flag through the remote listing path. Emit the same busid
> and usbid record used for local devices while continuing to consume every
> interface record from the server.
> 
> Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5
> Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
> ---
>  tools/usb/usbip/src/usbip_list.c | 33 ++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
> index 3d810bcca..b9d60b87e 100644
> --- a/tools/usb/usbip/src/usbip_list.c
> +++ b/tools/usb/usbip/src/usbip_list.c
> @@ -41,7 +41,7 @@ void usbip_list_usage(void)
>  	printf("usage: %s", usbip_list_usage_string);
>  }
>  
> -static int get_exported_devices(char *host, int sockfd)
> +static int get_exported_devices(char *host, int sockfd, bool parsable)

Why is "parsable" not just a global variable for the program?  Passing
it around like this is odd.

thanks,

greg k-h
