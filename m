Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362DD2AD37;
	Sun, 24 May 2026 06:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779602991; cv=none; b=ZtCJnCyX41dc+IozsVFNqP5ZVEWVL8Xg7zcKK7UDhh3wCdx7inCFdxDNa7XqVsPCMuWQ52somh1TVwCdyXb3mCwECFu3UWMPdYj0z3lUGwQCLnBVzixbdTUf8dhbkFzA0iClfXqsmgF4Ct1OLnmZ4fmkuqodm+nv3h//fuO+mP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779602991; c=relaxed/simple;
	bh=CU5I0O6PQRB3YYkLAsJYC50Igs914ZWHAfeiz9InDzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMeqZTY2VEQPS9C9rj/e9a31DZq763on0eCn8PpfBkVjwrmukH9n2Xlu450kjSwD52RIAKotwOekWLfV+geF5IfmOa9pdn/IqwDoI+Dc0tAwj6XOmMoPKQU/UpYHd+Jb8IMKe4RCz5dZq0F2ZM+GpQQxqyWPFthy25NLH7Mx6YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rRmh4M1H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rRmh4M1H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A07D1F000E9;
	Sun, 24 May 2026 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779602989;
	bh=KYWJD2YdmN9SJac5G8qIRi32OQ/EkGnTIPXgpLZsq6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rRmh4M1HcCGMPvYYSV2E8zyFCv9FZH0Z0oMw3QTPxSrje9UuIMFltlJn7Yn7mmPFO
	 RE9VEzcKriQzcRE04NShZN4NsSxxSszW5oe7ypg/BZpYnpE3z0slpM7hey9TJ4H1RM
	 BopnAYgQXgicfJzMvFS4H/umjlYU5lHq2SJl8fvg=
Date: Sun, 24 May 2026 08:09:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Joseph Bursey <jbursey@uci.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: iowarrior: fix use-after-free on disconnect
Message-ID: <2026052449-sappy-everglade-4e43@gregkh>
References: <20260523170523.1074563-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523170523.1074563-1-johan@kernel.org>

On Sat, May 23, 2026 at 07:05:23PM +0200, Johan Hovold wrote:
> Submitted write URBs are not stopped on close() and therefore need to be
> stopped unconditionally on disconnect() to avoid use-after-free in the
> completion handler.
> 
> Fixes: b5f8d46867ca ("USB: iowarrior: fix use-after-free after driver unbind")
> Fixes: 946b960d13c1 ("USB: add driver for iowarrior devices.")
> Reported-by: syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/6a0ce39b.170a0220.39a13.0007.GAE@google.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
