Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A2639D6FE
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774592783; cv=none; b=Wpdh4LbK7ykl1LWs1nc1ps2QmnjdZkpGno1SNCHGqUhGB77+O2ACIkSWWc9AkYnc4l4obdHCXp/fBwUlFEsgCA88SH8G2+foCFrj462JKZsIbTQgoBJcHnQHJXb9tLyRdNL+QNz1Q8Ggy+1EkFJBAHmGfpZd5yOOr6BHAbz9KYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774592783; c=relaxed/simple;
	bh=7Zd3GXcfUUJPbkkU9ZPRSCWwqtqqysCMHvPwbG61icU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1jAcRhlOBwdXF4/XBInySwLvrq4UayJPk2oJfKOK2XYx8b+aC4zt3ppYFXgZRnM9N0ZWwL59b7ZNyad/Xsu/IdE1vR20ZLKt7GHYR8rZx1FbwAgMmNx1O0Zd8jNoLe29x4xHj0KKBrOI1NviH1aadDD2NRKVKfG5M1tocEPJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kpy+4HbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kpy+4HbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FCCC2BC87;
	Fri, 27 Mar 2026 06:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774592783;
	bh=7Zd3GXcfUUJPbkkU9ZPRSCWwqtqqysCMHvPwbG61icU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kpy+4HbPqhibvIqYHAYR4dcBtUTn9BSfpquo5J1DujW5MKSUwZJ1zdxttWm32Wie+
	 +iiu6i/aJwBGkE5b1S2jRKjbw13GlA1PvmmM1+AQ1/O0xCUsYn2GK94kK4CX7jsNV+
	 L/YDptKC/6qnuTCP5iT4Zxxtup+4XwfbgktF+92k=
Date: Fri, 27 Mar 2026 07:25:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, addcontent08@gmail.com,
	skhan@linuxfoundation.org, kyungtae.kim@dartmouth.edu
Subject: Re: [PATCH v2 1/3] usb: usbip: fix integer overflow in
 usbip_recv_iso()
Message-ID: <2026032717-botany-empirical-69ce@gregkh>
References: <20260325104841.8282-1-addcontent08@gmail.com>
 <20260327043153.643-1-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327043153.643-1-nathan.c.rebello@gmail.com>

On Fri, Mar 27, 2026 at 12:31:53AM -0400, Nathan Rebello wrote:
> Hi Kelvin,
> 
> Your series hardens usbip_recv_iso() and usbip_pad_iso() against
> malicious number_of_packets values, but the bad value still lands in
> urb->number_of_packets via usbip_pack_ret_submit() before those
> checks run.
> 
> The patch below validates at the source — in usbip_pack_ret_submit()
> before the overwrite — and checks against the original
> urb->number_of_packets (the actual allocation bound) rather than
> USBIP_MAX_ISO_PACKETS. This is a tighter check because the URB may
> have been allocated for far fewer than 1024 packets.
> 
> This could complement your series as an additional layer, or stand
> alone. Would be glad to rework this however the maintainers see fit —
> whether folded into your series or submitted separately.

Please submit it separately, on top of that series, to make it easier to
review and apply.

thanks,

greg k-h
