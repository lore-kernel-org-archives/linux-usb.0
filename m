Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792909815;
	b=tbovtctaLn2PMMxVo+QcM85dTqajg30COKvImw7Zzx2T9UBuPv+b1wZB1HmxqaaQQmMc
	 84G1Qw4/vmP4hOXleHLe6E0sC3RKHhXirB2G9vXKn/HMf1HgDWtr+IMVxKgccSEMGP35m
	 chwdilGq09WdaC9ySCSjox4SIboSJZeoGhnDVO0EVMWZpPogD1I+gIdfL5C6PN7InvW1o
	 VY/USS/1DL8++Tu+YMJiaeRqUwkru0msk8mkOPZA0qmRud1MfobZcaz1prEzg8Yl4E/U/
	 OmvDeofHCXOs/rrMDzYxaQZHGyK0fr126JHsLQpv6EE2FaOPavN8vaI113nqNrNj1Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792909815;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BnzBu4Y7K6KPa4Cpu+i1tdXBIZAfZbtTSdHfUcCgiX8=;
	b=V/1dDznMC54J4FjL7WPuxrOM/BY9zwveCUK9NexycvqiA39x6Ak6gBIw73FNbL+OKUwD
	 beNB3TerZxhX8fG5+5G8AZPNWJDeLNMNWU+qhMmrLSH9A16Df9I9AkUC0bTZlzoBRt8Gc
	 Ud65xfRKHW+ODBC3D+ABfGVsgTV+UhH99Aet+mKZFSqict6hglJy9LIA23rmS26QZj30d
	 G/bgr5aTHE78Gx4pP9mw9OHxU7lsm3sFUamlnj6DJbmg/Et7ZWzWP8/jy6kULgD4C39JZ
	 ro9DIMJvJn55Wkbd1hgfPfVHIfylF/XT8Rwz8fRmI4wS5xfKHemQLQNMk3EqZdboEdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CQ34mh4n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23443606A31A
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CQ34mh4n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5527C1F01825;
	Sun, 25 Oct 2026 06:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792909814;
	bh=BnzBu4Y7K6KPa4Cpu+i1tdXBIZAfZbtTSdHfUcCgiX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CQ34mh4n24e4POl+mYSAASXvSCMdbS7kI2ztvVd2uLYnLkDPgp5K135SFU5E8ZDCS
	 J/1fyZTV8cw99Rgued0qpkZ6AIwXFLWuqiic9Zg1rjQWtvZORMLO8wK8D5D2WZTWdA
	 5qiNQZ45gt9vK4s/1N58xOQPhP7zCEjkj9NyfLlk=
Date: Sun, 25 Oct 2026 07:30:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aldo Ariel <qwe.aldo@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: composite: pass the validated interface
 index
Message-ID: <2026102501-wrongdoer-unpaved-db9c@gregkh>
References: <20260915040947.2829612-1-qwe.aldo@gmail.com>
 <20261009030246.3057189-1-qwe.aldo@gmail.com>
 <2026100902-collie-sadly-544e@gregkh>
 <CAP48HfvjYdY2Lk-BsaVY0Hm2SUPWmW7LVWnZgj5m_UBTPYD1dg@mail.gmail.com>
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
In-Reply-To: <CAP48HfvjYdY2Lk-BsaVY0Hm2SUPWmW7LVWnZgj5m_UBTPYD1dg@mail.gmail.com>

On Sat, Oct 24, 2026 at 05:54:02PM -0300, Aldo Ariel wrote:
> Hi Greg,

Hi, please don't top-post or send html email as the mailing list will
reject that.

> Following up on the five gadget fixes in this thread.
> 
> I understand there is a review backlog. Is there any additional
> testing or other work I can do to help with these patches?

Yes please review other gadget driver patches that are pending to help
move yours up.  also note that nothing can really happen until after
-rc1 is out.  Is there some rush for these patches that you are hitting
in a real device right now that requires these to be fixed sooner?

thanks,

greg k-h
