Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6683D3DB311
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370759; cv=none; b=YZ6UstCjTx4g0Sd8SHKcIT//e936a2TKoUsu79wkUsvA092lC510uf6HUjofxQyDPhh7CXbUQIJBDsWLlxmKB9YhleHaDu4lSEvURsD32z0TQSfZo9cqqQAL+lopfCw370jyIXrtn6+hPj7U5bkM2bV/DBaPYrztY8Q+k8GMGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370759; c=relaxed/simple;
	bh=PE+DawgEjAv/QG74ZlOobOWqVlqvp4GWFZ0aXCE+9Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPBn7tkle4J6RPO/6mxsGBZbX0N/0lItcb8s7JsLxLZHo6mEbPNUtu25LAUZqGAYUfuc65PLdSyOkgcTYh5eEtriZ+AZ5HcrSGTPHp7/380rtNtw+PLRxm9klBirliwaZDVMAskgIRFm1WDCC9LhZPfioDq9VKKMUhS8W+/PMhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Z9c04bgL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Z9c04bgL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c149c5722so14345201cf.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786370757; x=1786975557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=txYMP5LSIe8bGNvKOOCl7bq8DLNUIYu6vPP03PJS3sU=;
        b=Z9c04bgLlQ8v2Y8lZfK8WAlXxI0rdUI6mLXZ1HaACqC4W3wtI1eUCokpB5xcMjEm5x
         s2jZYzVTuGW7JXtzsDcam3VHeeRnfMVfgHICZs2J2vaQSKHPJEQFBoVttB8n3IYefC9R
         6z/Lcutmi72qFoU9RWTAEuXNPmHDmelrpR1fWfI/xnLWECAQtSTC+vm0LZ5TWeMG5IT1
         cmzEEg/v8Rnh1E52AOV/NK0wNa2gd5oTbvRcDEhnXwfhfxAmVH7agfFZyeiGBrPhogqD
         gMuYIezfiQt0yReSA2PwLJFjKK0luApeUTyShd1yDCnfNVCrBZ3Mh/OR9wTFS33fafbK
         9tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370757; x=1786975557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txYMP5LSIe8bGNvKOOCl7bq8DLNUIYu6vPP03PJS3sU=;
        b=IeMhB5oOl62f8KOTna43OSnS3TgeTaoeAy6DYuQkL0EcW1nVMoQhuZriAPmSWpPTdf
         qNfh7TZn8cYtB6hHGRuURdnqP2rFkS4mHH34KrWQvrW/ys0JVGq9kFVTbkbZTeSIS/q5
         UiNqbih3ciPlpUNqzbb5Rir1DJG3lus1ufbGw9L6owV+U30MDsNgGY0Mxz5BfZdmq99x
         cjf0x4+qEXiMP/MLe7/x/yU/dilCHMuDFtdL7vnAuCFtoKZ3MnQDPRi2kib4S1UZgqpG
         NB1UfWOpKIaBVPCEIppg+RGlpntCCWkk2j0RuszIMzOFKy+lQdqJuF92kFzDpRKfTE9P
         Ercg==
X-Forwarded-Encrypted: i=1; AHgh+RqjBrMEW+4tKg24higXusqmHF941eK+E6d6hT0bg9uZ4kQ5SYTYMRp05kOFar1gqhX+gFEcSZTGPJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC2e4SegUpoa19DnP/7oDUhDcU3vYpmOhdfn3530HYeZbmOCSd
	Vjvy9jvpka15Jde1Cgaji/sEBimOParmnrkYt+SaWc7KUkxOUPDTTw6waPUALA2Paw==
X-Gm-Gg: AR+sD11xa4tKohadXffqEKXxjnpjQvuP6kLvCo5J6yT6QVZstbtAW53vA4GzMZZGOU+
	5p1mEvrgIDhmPu7Nl24uRMNUMo0eQoGh307Yg+8uQzW2LJR9ixERfRGsVDBttx6+fRpcvtnk4V2
	sD8HRQauU3SB9pwfOnbybeJPPQ42zJ0Wkrp7Z8zNUDVXMSGo5GPvLLCQ2zJ2RmuYSATkS95Fbr6
	afdoDAoxUXIpRU66f2y34Ch09EdL8AW84FUC/7CPZ5mI2gF+8jxNEnLNZ72Wflhfp0edqlNTu2n
	aZzIeDvJ6l8dnqziLiU3tt64mahuDzey8ZOUtLXleesyDq6pENMRJlHRVcNT7T74naB85H+iVBU
	pmj5GtTd3v5H4te/1VUfOcwjzPkbVwVkcjuNGCrt6JOb2UyMoVZ+Nb9xpVJuGSEUnErsbN6be79
	RcibHnbqqSQl+FDKYhYz8S2MxBR+fycXlcj/if1D5I2iP5SXzVXTeHJUNvwNOy1ZcIYClWgb+kD
	isEjn27
X-Received: by 2002:a05:622a:5587:b0:517:87a9:6a89 with SMTP id d75a77b69052e-52d236950f8mr196889581cf.6.1786370757176;
        Mon, 10 Aug 2026 07:05:57 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1659b9f0sm73461751cf.14.2026.08.10.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:05:56 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:05:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Remove unused SuperSpeed EP0 maxpacket
 handling
Message-ID: <b9ff5b7a-f552-42df-ae52-bad89005e6e5@rowland.harvard.edu>
References: <20260810081212.59877d78.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810081212.59877d78.michal.pecio@gmail.com>

On Mon, Aug 10, 2026 at 08:12:12AM +0200, Michal Pecio wrote:
> 512 is the only control endpoint max packet size defined by USB 3,
> encoded logarithmically as 9 in the 8-bit bMaxPacketSize0 field.
> 
> Up to v6.5 in 2023, core assumed 512 and ignored the descriptor,
> but now it tries to decode and use it. One (emulated) device was
> found to specify 8, see commit c78c3644b772 ("usb: Fix regression
> caused by invalid ep0 maxpacket in virtual SuperSpeed device").
> 
> Thankfully, xhci_setup_addressable_virt_dev() always initializes
> EP 0 packet size to 512 and xhci_check_[ep0]_maxpacket() has never
> been called on SuperSpeed endpoints, which means that none of this
> has any effect and 512 works for all devices ever supported. The
> regression was caused by core refusing to enumerate bogus devices.
> 
> Drop pointless calculations and correct misleading logs, because
> we don't actually use out of spec packet sizes. Moreover, some HCs
> (NEC/Renesas, old AMD) reject them, though others don't and there
> is some effect - enumeration fails with -EOVERFLOW or -EPROTO.
> 
> But those effects are only seen when patching xhci-hcd; altering
> ep0.desc does nothing, even after the usb_ep0_reinit() call.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> By the way, xhci-hcd only updates max packet size at full-speed,
> which means that the high-speed workaround doesn't work either.
> 
> Renesas does accept high-speed overrides, this time Etron doesn't.
> 
> Whether any of that works correctly with actual devices with unusual
> packet size, and whether they really need a workaround (unlikely if
> all their descriptors are shorter than bMaxPacketSize0) is unknown.
> 
>  drivers/usb/core/hub.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 5262e11c12cd..d9409943f388 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5143,22 +5143,14 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  
>  	/*
>  	 * Check the ep0 maxpacket guess and correct it if necessary.
> -	 * maxp0 is the value stored in the device descriptor;
> -	 * i is the value it encodes (logarithmic for SuperSpeed or greater).
>  	 */

Nit: Since this is now a one-line comment, it should be written as:

	/* Check the ep0 maxpacket guess and correct it if necessary. */

Alan Stern
