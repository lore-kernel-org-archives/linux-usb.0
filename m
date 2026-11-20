Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173486;
	b=cIXGY+Y5Ajh/BsPQhNLvXG7jlBgd3elRESn2XUMx5eP1M3Z36sd9Cf0XJP56eVQDv054
	 q0QSTe3R2+6WB2sB7ks5kJPkhiQZzUxbrZcvm9kGqsFKlXJRrlizSq6GrjqOQ/PRK3pU6
	 GHqAqfNmcWWnQpX36i76cJpDmgH15+xWjnBZck2Mfw67D49mllg4klOkDM5ZzzRXNcGNo
	 3fAydCBPxw46eDlyi4fcvesKu7twbY4MIwuZGCiSaS1l9FvrojSe47LbHbhGXwxyD7RWd
	 wAzxdG5IFK/dHTGGDknW8ACdR12qm3RhzNm10IkC6SOz5ZBfU4qCRFZgB6EBiwT9BdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173486;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wGQnjEYAPzjACd5gj81HC/F0YGOUuxlk8ZoMLOgyMoU=;
	b=cYLVlkYogVHFD5QBPlE0r/P4V7ibStPpwKSYqaYBAzcjDCzEnJp5PkgcCkAmA5SyotNU
	 OT+ydq39Y5CQOb9sBMCPqbNtwk3TTn5P+wc14dR8E5ABL16YuVHXwoZ6JbSM6oMp/VPvx
	 lF97Fd+3sj/fTa/cexap59BJrdlNAqAN+GvtbfsvsjiaQDq8YGqzM+NcUa6gdFwoqU2EW
	 Ei5jZOxLZLgaMT2Wx3vY70AAK+9SfIGGphqrz3ddlQZsvds79okARNc4PjHF9ekFEDaoS
	 H+/hguxlSb6hR6FUSsQSQCp0IRmbU18X2E5/r5m0t+Nz2w+UD6QnrW7EOnNIIOjUXTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lKnVtn6b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C0B606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lKnVtn6b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DD91F000C0;
	Fri, 20 Nov 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795173486;
	bh=wGQnjEYAPzjACd5gj81HC/F0YGOUuxlk8ZoMLOgyMoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lKnVtn6bDhkEpKWSDOuH05fCSFF3kAFMrQnheDeHcmlhDxSNBLWBf+5z8JudjBF+G
	 WXVJA1jpYJasX3T4xvUv+ywYxBT5Hi+OMZyEEcC+AMqF+QK7kvt3e+UjNL614pRdcp
	 1VvbH9Jhhm808lKqCRQ7gZWEIxopu9GyKzgaCHcI=
Date: Fri, 20 Nov 2026 12:18:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adriano Cordova <adrianox@gmail.com>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: gadget: inode: fix use-after-free of struct
 ep_data
Message-ID: <2026112052-mortality-fiddling-7035@gregkh>
References: <20260905144905.263941-1-adrianox@gmail.com>
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
In-Reply-To: <20260905144905.263941-1-adrianox@gmail.com>

On Sat, Sep 05, 2026 at 10:49:05AM -0400, Adriano Cordova wrote:
> gadgetfs_unbind() -> destroy_ep_files() frees each struct ep_data via
> put_ep(), but the inode still points at that ep_data through ->i_private
> with no reference of its own.  A concurrent openat() on an endpoint file
> can therefore reach ep_open() and dereference the freed ep_data (the
> mutex fast path), even while the inode outlives it.
> 
> Give the inode its own reference: take get_ep() when the endpoint inode
> is created and drop it again from a new gadgetfs_evict_inode(), so an
> ep_data can never be freed while any inode still points at it.  This is
> also safe against dcache pruning, since the inode reference keeps the
> count >= 1 until the endpoint is removed from dev->epfiles.
> 
> The inode now holds ep_data for its whole lifetime, so an open() racing
> with an unbind never dereferences freed ep_data.
> 
> Reported-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
> Tested-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
> Signed-off-by: Adriano Cordova <adrianox@gmail.com>
> ---

What commit id does this fix?  No cc: stable?
