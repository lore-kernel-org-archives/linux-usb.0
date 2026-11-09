Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192718;
	b=BJ2lbw7AcJDf34Ng0prBiIOvK/cQRTlEPsCDYLpyRC1+KneqGzm5sTZEVh5ENNPAO4Q2
	 m+2tyfvONyG8oYpr3PxrOnaxINtife03uuClaKnRWq5ZZp5a3aZ3ResF49KNgd46Ee0Ib
	 VS++g8xNmqfyz6T94QuNclKTPPIN/ic9Q4Jfp0w2nI2EQHLO2X2yRlXvKceai1DYizAz0
	 1MAtZ1wdbqfGDwrmEZOCDOm17r1qreVbtDOmDY/H2yW21rGjdQSTZPd3rGBUZMZThfpL+
	 wdvu5snH3n3LJEzYcZucQVCwknf/R38jMaHfeDMR0CuJ8hvALXLLKlckAt32XsAJlXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ThjTfZ/MJMf53cu8iV1tYBuaT0UO+WOxcCiqTzZZCs=;
	b=OXZS7JH8eMGIxJ2Zygqvo7rFXI8cEVqZzUhBrryRLaAQnxWcNfjGvpPnKQhZ5ytsT5jD
	 P0i2fwbiPdLqtN1TziKdvVbWIfgJA8D9smqimZdVIB0JIUBgN41ifO70jMzdWacg3N0+p
	 JlttzGdJg7iCloQIyQ/LmTM0woi+fYpPkKR/QUCw8NsMpLAgnbV2AZiA9qMAA+ieBciz2
	 yrTKIfQ5v7/mbuq3nXp+VA22ExlDlHfC7yHk5d7aHY2AWQiRUyY8MQFKNwLKh7+yjX6or
	 IXa2TyOYAUUeyhsRzTzqTBlPj8TzlvC1+ZGvG+IAt/IZLsLHMgxnAOduxUWR7EGvRLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=mjV4alyH;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6DA606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 02:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6DA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=mjV4alyH
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f269e335eso46710885a.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 18:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794192717; x=1794797517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ThjTfZ/MJMf53cu8iV1tYBuaT0UO+WOxcCiqTzZZCs=;
        b=mjV4alyHvHteDJGUx79A+Yh6O4U2gvVx/bauhnUf3WUFunfdjR99dVqiZzt1ielCh/
         MvEzmdzoVCayVexgIrh7SDM91evMyZtu6MAIEJDd/4mJTDsUnGYO4umRJ81sO9yFciaT
         uLoA8ulj5z9VkElVo/wjHij+4vx79bBjDQeixW9/icdEEgnNEjy0zp8ZrUz2QfN+atQb
         BMrUK9k69uKWW6Z0CVNzW/2mnyZ3PnuuCmK91CmRemMd766NcF+9WkirI7v3L5dvYivT
         hz3YOuUN73tGBCH6tMPVR4iZRRRBbMvXEZsfGEHZxJ6Gfh8UONKP4Et9WsCh7lnJS8Tg
         zchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192717; x=1794797517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ThjTfZ/MJMf53cu8iV1tYBuaT0UO+WOxcCiqTzZZCs=;
        b=SBPx6tJhc/6HBW4mBq3YBurztgRmsgBFpGsf/S382D03BoSzNZQvKs/bbJCYySINFh
         m0//f0oeluAvTFZGEkfeeEAWXRzYfecFvBPnKQIiGcHIeZF2Bn2k29R1DIHxBUq6+Kfg
         xuQmj8FhtS+pCmzHANLO8KtV2BilatxKb7rVTogX1mVbbUpsLP6ZflTJ4Jq4d52q0sJy
         IezsNujSYmG6v0S9c5Tioq4P9gndEV3j8ZVUYlWYmv1pjQPUS0VX3HOF2FPoXftezNpy
         KBRnkHr8zK1qOHbzl5MCvCBZLA70JWRFIdSaZoTKVZ9EwzAjeP9LYlVewVRvmvPSD+Uc
         XG9g==
X-Forwarded-Encrypted: i=1; AL+hErElu/0EtAkuKrK31cIo5nHVLUIfeezmPcmvE9wcJJC9SO1tQvvL20nuG7ZnO0bPUbh3wNTPeiUpsF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w/BdHZXscNdB8L7/sNigfh3udi8Vop4AuuB0bK4yNOZmmFMgQ
	Fj8S8sqBWatcIDsRMs0s+2OFgE6k3PUtdeBC4pas4vuBm+JB6VY1JghNXYNTg0vfEg==
X-Gm-Gg: AYBFou0kboCbTVURMdv96E+tre+55XgVl6QScZZurgYUm7Yxtq4ICPiX38Obue7dfGa
	kIEh//GNdcZDXGGcxt6HsKhLBjcRO8lnrN+o+fM3dSgROgN584v7vfBfJWIaY1bUfwad5qsqT/r
	2Sm3rMFMRmD+wATil+B0hmDgU5hzztiIxccRxls1srjwm0lpG5lcikZXvdhYQU8notc9NyJn/zE
	VyoZ7agdFtRkle+UciyX6/xZXI+TwV9baSOJyQitv9FZnc5zsivkvOMQZligySVwEJBPVjjal2v
	PB3JKebr9kHiVfj6RFizuOOppEk+kdozWBdhjvJdq6hapZtt7z0S/DOkt3Oq00ay9YQ+z/M6vK4
	GTsJuDAtyCzUU8nDm1tneOhi99odJmgedNfY7Iu4SbBps/kOfKtgtuPV+Sjm+nJFF0nRUjhLVuJ
	qh4PI9c+bFQDQ/MUI12+tvWr89JCfGBEiLVlaa7dwEmKtl2v0geIwaKQI81Jv+Dp9y9dSzZy0d7
	Zb9ZD/SvCCuRoKvFfTiG929QiCbgRi2Cge+XWuFG7Iyoo1wBPV4svYwVRMX/90M+hAUBTJi8vZo
	aXOWVhxAxzsbYCO+I+t+SyLFFgJk
X-Received: by 2002:a05:620a:684a:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-9478429958cmr426106785a.60.1794192716567;
        Sun, 08 Nov 2026 18:51:56 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecee18a77sm32225636d6.26.2026.11.08.18.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:51:55 -0800 (PST)
Date: Sun, 8 Nov 2026 21:51:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] usb: gadget: gadgetfs: fix ep0 request lifetime
 on disconnect
Message-ID: <bcb55195-2ed3-4b20-9afb-44b5e0efaa61@rowland.harvard.edu>
References: <20261107-b4-gadgetfs-ep0-v4-0-86bdfd684b54@gmail.com>
 <20261107-b4-gadgetfs-ep0-v4-1-86bdfd684b54@gmail.com>
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
In-Reply-To: <20261107-b4-gadgetfs-ep0-v4-1-86bdfd684b54@gmail.com>

On Sat, Nov 07, 2026 at 09:46:13PM +0900, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active.
> 
> With dummy_hcd, disconnecting does not necessarily drain ep0, so a delayed
> userspace response can leave dev->req queued when it is freed. This
> triggers the warning in dummy_free_request() and a use-after-free when
> dummy_udc_stop() subsequently drains the endpoint queue.
> 
> gadgetfs_setup() and ep0_write() can also race on dev->req and req->buf
> while a control transfer is in flight or while a completed delegated OUT
> transfer is waiting for ep0_read() to copy the payload to userspace.
> Overwriting req->buf with a descriptor pointer causes clean_req() to free
> the descriptor buffer instead of the request buffer.
> 
> Copy completed control OUT payloads into a separate setup_buf in
> ep0_complete(), copy control IN payloads from userspace into a stack
> buffer before preparing dev->req in ep0_write(), and reset req->buf when
> control transfers finish. Track whether dev->req is queued, reject reuse
> while it is queued, and dequeue it without dev->lock before freeing it in
> gadgetfs_unbind().
> 
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c73e1942197af9f54ca3
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>
> ---

Quick question...

> @@ -1781,15 +1842,21 @@ gadgetfs_unbind (struct usb_gadget *gadget)
>  		usleep_range(1000, 2000);
>  		spin_lock_irq(&dev->lock);
>  	}
> +	queued = dev->ep0_req_queued;
>  	spin_unlock_irq (&dev->lock);
>  
> +	if (dev->req) {
> +		if (queued)
> +			usb_ep_dequeue(gadget->ep0, dev->req);

Suppose another thread wants to submit dev->req, and has got as far as 
setting dev->ep0_req_queued and releasing the spinlock, but hasn't 
called usb_ep_queue() yet.  What prevents it from making that call right 
now?  Then the request would be active -- same problem as before, right?

> +		clean_req(gadget->ep0, dev->req);
> +		usb_ep_free_request(gadget->ep0, dev->req);
> +		dev->req = NULL;
> +	}

Alan Stern
