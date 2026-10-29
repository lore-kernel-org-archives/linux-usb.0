Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254762;
	b=gfov/b0Ago2y6QltlzFGp2PfxQ63/Qgg7ysNT6UdUEGPR24yOo4HX2/LfyY5Tqu2lwuB
	 9c1u0/7Q9y6Jnh857Rd+BUDXnOGBqXQHyrnnBXMXVwXfzKYKHdkVuSroVVRkj7xgJZp7g
	 7PU7/6c/zHltJRyNv7wEh7JOR2Rc1SM4DbgNqv39VngX49ybz9KLLkw7sRU3vOFEpTB50
	 CJWoBqo3t331vbhgPl2G0Top8b2NxrhDyhDjgkOG3qSe5J2uX9mwAj2YwZjsUONg+4IDz
	 3/oLlhNebvuTiPzU6Gh7ZE+mJWvKT9t36I5GjfAMnw3o+Cf5/2ju7YwJwcuzCcT72Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254762;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lsnGyKmxljlS9M0P5z8GnqmBBygb/TK5WIWMseE8XdQ=;
	b=uNtmmY1A7puE2aaDNrNxdBKu863YrOWvrhSkWicXpinxsRWSsefN04W9o1HahVrd4kds
	 BHDyNLkj/Pstmm68AD+Yfn9lOfeKmumvO+K6rFVvjLCVqxHyiq5K24QGK99/4RJ0Eser6
	 Gn/ge2rxPEJWbGpNM6GREl4B2+EXEF6uJF5xrg4mEPQqxzKM8HoSf/O0DVdYhYsDEYFj7
	 L2Osv/pXcpOod0pGotVl2iWRGLNecc88lMnxMARZIEQWRV8ENJYQhfoAYJ0zuZm8Kmdxf
	 wm8awILuL2ewKysfrDzCckUdAuvh72GgK3QiZ9vQ/7gawIQfN8ls/y1i9XjxC2JwOQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HVOEAKMj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5E1606A31E
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 06:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HVOEAKMj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170471F01825;
	Thu, 29 Oct 2026 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793254761;
	bh=lsnGyKmxljlS9M0P5z8GnqmBBygb/TK5WIWMseE8XdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HVOEAKMjRRzIIlnkRzXpXLk3Ah5hBfoIzo5sW59QMktuiWh9OrVNcn17io1RuNMj7
	 q+HpX9kZYxneel/HEIcBcd5SslXYLJYMbesrm+pG2edcAHlYULkqE8fFZjoQOyqwqu
	 BXk0ZLoH/Q44mgkx0K0yqkuTf8TKf5y/ZuD2b0/8=
Date: Thu, 29 Oct 2026 07:19:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Basilisk <basilisk.bat.lol@gmail.com>
Cc: syzbot+67d9d15423ddc0f15859@syzkaller.appspotmail.com,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in
 dummy_free_request
Message-ID: <2026102904-overspend-rubble-4443@gregkh>
References: <CAA-r21oVYLu6atoQPGdLsucggdQ+oi-HRS1HYeJkThx6WZX1qg@mail.gmail.com>
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
In-Reply-To: <CAA-r21oVYLu6atoQPGdLsucggdQ+oi-HRS1HYeJkThx6WZX1qg@mail.gmail.com>

On Wed, Oct 28, 2026 at 10:45:06PM -0700, Basilisk wrote:
> Hello,
> 
> I recovered a standalone C reproducer for this syzbot report:
> https://syzkaller.appspot.com/bug?extid=67d9d15423ddc0f15859

Great!  Now you have the tools needed to make a patch to fix it :)
