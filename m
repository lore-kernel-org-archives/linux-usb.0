Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1F469847
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 20:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987406; cv=none; b=TB7pso4HrszrOHEdgaDBkydbrc4weVZZz8B9dAej1X0cJGuhd9mrMGc6TJ5YcU3Jx4bXm6PQLDaipuIfDJ4Op4auAW/0NCuL6sDkSxJqsa6ajcsiYDb32IEk4GmyvTFn2zUH/cuakGJ2pMVju1mNJTIdnyPGxqCqLHHd7iw5n34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987406; c=relaxed/simple;
	bh=8n2x4+oQjKgoBuQkJQIXlCUgVb3Yjm+VjxbJSDp/6QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnpoJ/0SafFX5ZSjX5ENIybr5LyqWElucuSpJ05rQhFLKKz7wHHTnjAIrr5468EkNP/I8Zz/+wFnMcb6vP2L1sEim2MDy1IOvwYIQQaXfVo22cqZK3MNHa/TSAPtIKfYx65eP0YHyxOfCHYAgYhs5ZAtlueBaQmVHZRlX5q///c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rI+K5tei; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rI+K5tei"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-936623c6dd3so31826585a.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788987399; x=1789592199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y727yYl0dVIyP6iqOFhDnAiWMOdMmGcyQzect6GeKCg=;
        b=rI+K5tei5edB0E0woOpTdXs+UhZdZksIvbMDfOOHZ4WgyG9bEoDpmOLo68o93fTzHB
         G6qDInQj5hsUAgkIL+JbIp1rhNT0ukPZE1trTSGAfaTZ+KyLVOHDu3U4VRnwy6MEU1hh
         AfB/22Gr7WlEB11Zw9cekq6sq0cTbAw9m2Qwq2yfIEI9F3pTBtkm908/zepgG3tVml44
         YEK+b9Ez81df7W9dRR9OGdamjhMRL2QwuWdaduZ7gB9GDTQGEyvd5dNzOYiweTql7lIO
         E0RiBadbFj3r1ogz5OZcJmILT9TTz4gWLyzGnwFWvBNxXHBC0if1C/WjNQXEJQ7cgVU6
         aGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987399; x=1789592199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y727yYl0dVIyP6iqOFhDnAiWMOdMmGcyQzect6GeKCg=;
        b=WBkrsdC6OOSI2MAb9U4DOsRZYCbP2QS4YIWicgDPcnsGvbyR/wWJ96dhPTTOU8Bh6a
         M3Py7qpIngsmrbguz/W/cucJpEc4FMSDuChqD7fVWz/esJPjaHRKawh2l05lEkBDNTeG
         TvhGbCaIm0Rid21KRCPaZkduXVlnA8TbXSHb6fLfHMN1Lq6GfvgPlDxSWOFc7DCZuCG9
         dARIJb8qd3jM1hLncyErYA7JOX+w6UCvFjyOrmrZlxVpRgrg4nkEsq4hD5fUKuuFAngx
         1Vv/juZukoHhPEQum9Ax/BrjnUt05l7zEdoHyMuMU08OK632rfMrSQnJMEQRdvuaWCtS
         mP5g==
X-Forwarded-Encrypted: i=1; AKwUvBxT6xstZdSt2X3+d+1jMr6QoMxCPtjW9vvTzNtYnOF33mZzzJDt0s4JEr5hx0kGiFsmncgC+Ng7PNc=@vger.kernel.org
X-Gm-Message-State: AFuF++nZvw94B1V1ijafgsXgatXY5SnmGZvhJ6VMq+fuoApgmmz6E2+i
	Z1pG4MchLT88kGuY0oHsverMAw2h+PwRshTgOw5iuFstx4FZaiBGC7UxBnbF8TUV2Q==
X-Gm-Gg: AYBFou1sb8PR4a1pPkjRXHUROiilNAtOXxkKRErh951KORIjhzRHEvloqYDuSZM06nT
	qpfNPI9uti+DnWYFuc4wXlIiojmKOcszG+4O2vUtxNdrq5F6sGDl4FjxTGEke76bSTnHLsXfOYw
	pZ0VZ4uxOWX4jvcGllpYzQy9nsdV2j2O1eUSJweEHbiz6Ep3jesxtjMuq104z/iNEUyhIQ8F/Re
	Q7+gMddmjAkzyAyLiQ1bgcwFRk9YcjQsm2h7QL4zFJwTT6Dh9D5pwlCIKZ/vcyvkyQ8pLcnL1xa
	ReStvNhalFp9TW084SmwIJPTwKHJ8Bu62nDWW5HjUF5pbaAmWPCqJYxrkqCM7rvIDSBT9HZUg5r
	39asTazmm1PefEsLPzcRe/CpWqW6BDxRLLvfzWL6mQQguWNNy8p4YxjtLkxIznP+DG/YI91w8eW
	eDxSvg0y1GgVsvCAhXoZmmB1wy2x1yyPg6c6Cnh9paDmYNUR4cBvKW4s/zeQIkQI+F5tvmgbF5
X-Received: by 2002:a05:620a:2705:b0:939:72cb:baf5 with SMTP id af79cd13be357-939d8002941mr148789685a.44.1788987399427;
        Wed, 09 Sep 2026 13:56:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b5c477afsm690401485a.12.2026.09.09.13.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:56:38 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:56:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: storage: ene_ub6250: set transport_reset to
 avoid NULL deref
Message-ID: <49a9586b-cb7e-4c9b-ad1b-c4920ac0f9a5@rowland.harvard.edu>
References: <20260909171736.53927-1-ngocthang2710.1999@gmail.com>
 <20260909171926.54111-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909171926.54111-1-ngocthang2710.1999@gmail.com>

On Thu, Sep 10, 2026 at 12:19:26AM +0700, Nguyen Ngoc Thang wrote:
> ene_ub6250_probe() sets us->transport but never sets
> us->transport_reset. get_transport() only fills in transport_reset
> for the standard USB_PR_CB/CBI/BULK protocols; since this driver
> matches on VID/PID alone, a device can report any bInterfaceProtocol
> value and still bind, leaving transport_reset NULL.
> 
> When the transport then reports an error, usb_stor_invoke_transport()
> calls us->transport_reset(us) in its Handle_Errors path, dereferencing
> a NULL function pointer:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>   RIP: 0010:0x0
>   Call Trace:
>    usb_stor_invoke_transport+0x55a/0x1a40 drivers/usb/storage/transport.c:926
>    usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
>    kthread+0x38b/0x480 kernel/kthread.c:436
> 
> Set transport_reset to usb_stor_Bulk_reset: ene_send_scsi_cmd()
> already frames its command/status packets with the shared
> struct bulk_cb_wrap/bulk_cs_wrap from include/linux/usb/storage.h
> and only ever transfers over us->send_bulk_pipe/recv_bulk_pipe, i.e.
> this device speaks the Bulk-Only Transport wire protocol underneath
> its own SCSI translation layer, so the Bulk-Only reset is the correct
> recovery action for it, matching the pattern already used by the
> other subdrivers with a custom transport function (alauda, datafab,
> jumpshot, karma).
> 
> Also harden usb_stor_probe2()'s existing sanity check to require
> transport_reset alongside transport and proto_handler, so a future
> subdriver making the same mistake fails to probe instead of crashing
> on the first error recovery.
> 
> Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> v2: per Alan Stern's review, justify why usb_stor_Bulk_reset is the
>     correct choice for ene_ub6250, and additionally harden
>     usb_stor_probe2()'s NULL check to cover transport_reset so other
>     subdrivers can't hit the same bug.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/ene_ub6250.c | 2 ++
>  drivers/usb/storage/usb.c        | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
> index ed49a3bc859c..3137c2cdd021 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -2350,6 +2350,8 @@ static int ene_ub6250_probe(struct usb_interface *intf,
> 
>  	us->transport_name = "ene_ub6250";
>  	us->transport = ene_transport;
> +	/* get_transport() only sets this for the standard USB_PR_* protocols */
> +	us->transport_reset = usb_stor_Bulk_reset;
>  	us->max_lun = 0;
> 
>  	result = usb_stor_probe2(us);
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index 064c7fc8e368..823a4b2e9033 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -1100,8 +1100,10 @@ int usb_stor_probe2(struct us_data *us)
>  	int result;
>  	struct device *dev = &us->pusb_intf->dev;
> 
> -	/* Make sure the transport and protocol have both been set */
> -	if (!us->transport || !us->proto_handler) {
> +	/* Make sure the transport, its reset method, and the protocol
> +	 * have all been set
> +	 */
> +	if (!us->transport || !us->transport_reset || !us->proto_handler) {
>  		result = -ENXIO;
>  		goto BadDevice;
>  	}
> --
> 2.43.0
