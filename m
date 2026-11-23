Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413604;
	b=Gty6u+YdU41REtUYQL4c4zjT5cvkI/f3csbxouSe5wawP9AeKZpOw9SABQA5V5uZ2+YX
	 DEXcgAE1eNRgaTjAtHb3EC7EWTLNCJDvV8Eyn4/Cc5o3M9CE53AHzjh37JTyjzkIiT0A0
	 aSBuLhceMwiFDSpEneBEwd5sjLh164oXxTAbt0DNR8Ta1QEs7EHfQ41uz2ND3F66dG9vR
	 Rs7P1TUONxGeLfR2NlF9zZq9fl5yb6hYo4A+Cv6cqMsA+Ehan2cha5SfDa9sVGiY2xSJp
	 sFrf1f1t8qWLPbM73FrMBV19DrK1WmU7y4dRRfnW+MUEzZo4iqerD3HMDYP1yhR015A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413604;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lNiQK/CVyCooKuzbcHYaZxZnwoMMLJSGxGbdq3g8+Qc=;
	b=CZgMitqfg1JzA5FYA/Xj/1zm51LjyOLFCR73pRYb5kln/+FxiFu3A8AHhjqtFFKKTj15
	 mJsrEJSkjrqfrnKXi10FdAhQHI6JF5Wn5Sq1ve/BYuaCJk+In5n3JXedfLX+n3idU4zrg
	 TqAadQhtqvSXfcUsu5dk9YHM1SDY5H5jVAp8YRaSH/zBKUR7kJXvtIIRh4SizlnknlOvT
	 GekJ5oEf3Wz5PGwLvK+qOwn4we6KEy68tf42lyL+jkHXtqWNDUHuZPbHttIzbM9zTfQIO
	 5AbCDb+usaMcZWob/VdIHFzVprRlPs4odiMr321U92/zzkGYt1vdgihf4sTjNDq18Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rqx2nh03;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A49606A31F;
	Mon, 23 Nov 2026 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rqx2nh03
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0E41F000C0;
	Mon, 23 Nov 2026 06:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795413603;
	bh=lNiQK/CVyCooKuzbcHYaZxZnwoMMLJSGxGbdq3g8+Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rqx2nh03g+TfcS1Cl1MkoRqq1BkqjyRRXvNZ9RSco1yZikeg5Wg7lKFTouHFNKWP3
	 PTnub3+tjmJyuLmpy77hKLyfrBFOqmZ2YWXwzV8TbNYPZU5PPeO26v7hmhuUo4wuU1
	 BDal1xNbdYbZ9uQGJ3swWgKrXCaKU6lH7jJ/N7Tc=
Date: Mon, 23 Nov 2026 07:00:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhijian Han <hanzhijian1991@gmail.com>
Cc: andreyknvl@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: gadget: raw_gadget: fix memory leak on connect
 event failure
Message-ID: <2026112342-factual-providing-187a@gregkh>
References: <2026112020-sesame-uncut-fc8b@gregkh>
 <20261123055027.1141887-1-hanzhijian1991@gmail.com>
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
In-Reply-To: <20261123055027.1141887-1-hanzhijian1991@gmail.com>

On Mon, Nov 23, 2026 at 01:50:27PM +0800, Zhijian Han wrote:
> gadget_bind() allocates an ep0 request and stores it in dev->req.  If
> raw_queue_event() fails to queue the connect event, the function
> returns without releasing the request, leaking it.
> 
> Release the request before returning in that case.
> 
> Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
> 
> Changes in v2:
> - Fix author name and add missing Signed-off-by (full name), as
>   requested by Greg KH.
> 
> - Fix author name and add missing Signed-off-by (full name), as
>   requested by Greg KH.

This goes below the --- line.  And why list it twice?

confused,

greg k-h
