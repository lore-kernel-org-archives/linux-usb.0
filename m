Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285DF34844C;
	Thu, 12 Mar 2026 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773313765; cv=none; b=YrSvQD7GPzdJ1ImSkN98EOtFxWQ43MpjFoewyBeo3RcWhsNe/AoReKzD+2lYIldakpkg5BO0WcXkiyPZoTvz2QYdyYU8EQVhKFg2LWovH7AXNhyc/Stys47IwOWsD8GFu0pRE4nTlSnUnH7tdOGfv1t2M1xlivZmFKCp/l9sKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773313765; c=relaxed/simple;
	bh=NEAaAhJ353a8YEKkugkb0fhtFFm7cYhXkBokwy3VQig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsRQYCzNKB7uLOTpjcF50IS5tHR9Dh1kIZ1SLpXaoHlHSqfCHDvuK2wnzqBFs7lZFL2iyy5RZxz4tjskajIRatVgFwri+fyqHS25c8JHbxkiCQo43/r2F+Bhh+SYzPyNKwb9qe67NpVfapL5nCZh26PQL9QpOUn8CNOelLhwcR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F1GISmMP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F1GISmMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174E8C2BC87;
	Thu, 12 Mar 2026 11:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773313764;
	bh=NEAaAhJ353a8YEKkugkb0fhtFFm7cYhXkBokwy3VQig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1GISmMPnj4sLrZ+XusUoudBEBhFbKNNXwX7atLEwTO1CjQ4QyOQsROsEFF5t5Ey2
	 SNepMBYJvhGFhi0rRwUqcuNu1sB8SMuxBauGUQh5K/Ja4sz0phluPhDUaO8hA23CbG
	 2jZDGGkRzzCPpWre14O7ys4S2Vp9REy495mRBEMg=
Date: Thu, 12 Mar 2026 12:09:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: zwq2226404116@163.com
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"wanquan.zhong" <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH] usb: serial: add RW135R-GL (33f8:1003) support
Message-ID: <2026031257-vitality-reprogram-292b@gregkh>
References: <20260312102108.13584-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312102108.13584-1-zwq2226404116@163.com>

On Thu, Mar 12, 2026 at 06:21:08PM +0800, zwq2226404116@163.com wrote:
> From: "wanquan.zhong" <wanquan.zhong@fibocom.com>
> 
> Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
> used in laptop debug cards with MBIM interface for Linux/Chrome OS.
> The device supports mbim, diag, adb and AT commands.
> 
> Device info from lsusb:
> Bus 03 Device 12: ID 33f8:1003 Rolling Wireless S.a.r.l.
> 
> Signed-off-by: wanquan.zhong <wanquan.zhong@fibocom.com>

Please use your name, not your email alias, for the name portion of the
From and Signed-off-by fields.

thanks,

greg k-h
