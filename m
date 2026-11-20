Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180650;
	b=qI4O29Wvzi+weM8Sm4Wui3HxiGHWyx/0zjzvOKvmkvMgi2sl6oSH3jNIgw4/68BuTAhE
	 jwIfFwCcDG66RUjD+w7cUfBUNRpCrI6PrD/cPm4m+yleiJZ9S0bUyxG7QZo4Bxta+tBhR
	 DPgQd3cmgJZ5p9ogErdmUdbbuCJeHLmbT0byhG76mU+D70vwtkFpBjBQEzx9GF/ATa7B/
	 cYeMf+hozQtHsl/I6DB5qknoZAGr7Bo4yYzGk5w20hKNHdYUVJR0GAGhHdv3/KcHxgn0O
	 tsGfQglsrp40WokegQTM+b3rF+oC7fej9cNQwlsEPW+fGgSvrxVZZDQaeG5VjtvTHtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180650;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Yfi++D6oszvjepr5rUx6lj7fIJgPuxXGkYRr/hVBbVs=;
	b=LxasIooWkW25tjc34BJZ0hZftgZ1VK7GhjZkmtoJkHrUdWD2FCs8VC1ASpk+hf5lIoGB
	 Hsa6iWxmEK8U9gM+UZYohVy6OILJT5xVwCjlVPzMY5Mv+I8UXWUQ8aPbS47Ef5Fqr73Wm
	 sHd8lxkiAbEl28ct338x3oBmZvu6sPqxp9fkVHvhLhdP0ifFeQhVEt90pvI10snHqIjTT
	 ue2Rad8XU9GGXn18WtgrHC2Z0m+JIwVK28Ykh1R0SL9aDwT3Un63MIEgP8cM6T+q+kUY6
	 SpoaUJyqpBu/rbXwVBpyZhoCAt4JP2+JWvVry8trUh1NC8Vq2YSsjJ84obhivJZjpPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MVbXI+tF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2A8606A325;
	Fri, 20 Nov 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MVbXI+tF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE431F000CA;
	Fri, 20 Nov 2026 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795180650;
	bh=Yfi++D6oszvjepr5rUx6lj7fIJgPuxXGkYRr/hVBbVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MVbXI+tFU+xGm8cwDSFiKohl6/oAqMaJ75sFO2jac8PwE/9OOKpHQRbJGFhJpOKQk
	 8ymqFYSmEBiUt7NQgiTn4JayVb9nRNrRgWmzvUbhz41ec7FVZy34qnyt1FhrB+CnxY
	 yKd4ZWgI5q3Af2kuWfwa22PNoKTLnyypsQ2qO2Wo=
Date: Fri, 20 Nov 2026 14:17:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Subject: Re: [PATCH 2/2] usb: gadget: raw_gadget: fix memory leak on connect
 event failure
Message-ID: <2026112020-sesame-uncut-fc8b@gregkh>
References: <20260822024850.2504871-1-hanzhijian1991@gmail.com>
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
In-Reply-To: <20260822024850.2504871-1-hanzhijian1991@gmail.com>

On Sat, Aug 22, 2026 at 10:48:50AM +0800, hanzhijian wrote:
> gadget_bind() allocates an ep0 request and stores it in dev->req.  If
> raw_queue_event() fails to queue the connect event, the function
> returns without releasing the request, leaking it.
> 
> Release the request before returning in that case.
> 
> Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Full name please.
