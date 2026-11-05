Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900682;
	b=tnBP2fvlzSQoRy6CwvratuFZcTiVuuD1dhfz3/TCzszRUWxfJdfidb/qVRMEEKmSeija
	 H8XcK7ia2rmoNw/49klOV8FywkOQdUj//CBXlL8zz3FwYeNay1vopWLxzX1gj9BzMXjAS
	 QMHFsPUOx7YBnl0FrsAiKyBhXWwmj+ffKooNhFpjbxaRZn2XP0Tb17l54AZ0j6BcH22pa
	 cf9q6msv56YIgz0rSL6YaCdU82R6rX3VESFjN7iwWkI7DUz1u0nBgZslbU64QDIn5tV/E
	 ZEWruoflzUfWb9PM09idNTCK77MQ6TknwKwT33xGsSDnuyV5RKYrS0cpWLltynLFivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nZAOGAjOf6sEpVtM8pdi7ewS7F4GJROoGs03Q8/6ak4=;
	b=BzZ+LS8CPKT08e7hDDT38GRbER/q28gjZCYtG3U81OHCDHbahnSmW+4Qyx+yCDYANLg4
	 tMwt/zd8y8kTX//aAXY05giZ6nAICPS1IKK7cC1XfCPIf2CH6Vwsghzxfy8D3a9PzSN/x
	 t/ygloJHPDQpDrEyhrThj8JbE3NIeKM5PKmypvNe54WodWk+gOYDJzQzV2xNGIo0YENX5
	 Ea16lzfoZdMwNX12gtObOdMzUPk3T10QrrWsw1NYurmbznZp8TOAjsr2+nuAKw+yRvsKb
	 S5YtAl5NxxZk0s4p5PFH8MgPfzwIVDcEU98o4ykNnrx9XLsksdEFf9S5Q3TAqFd8IAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nM4HyT51;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B41606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B41606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nM4HyT51
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e6eb77f0bso223183685a.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 09:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793900681; x=1794505481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZAOGAjOf6sEpVtM8pdi7ewS7F4GJROoGs03Q8/6ak4=;
        b=nM4HyT51BzNzQEZm0VzMIBTMyd4jC8paorZJ1Eklr1/wIQSP2AbQWGWTQ3QRqIlvDK
         MYz9O3rXsd8B96sXmIO0m8PnXeQvMeyzxnyVX4vi3CNVtCU2mXgzQXrf7Wfm11fnmW8s
         2oIjtAXP4KEPMLzjhgw+bXM7Yy/oZ+tqxpZIlnuryuWD7ZevRwG+JyENVz/2mqmm5uSg
         ETJQSF9/8ijH+KEzTcenCEpwH4gD2B6Fl+fdv8BKhgnZeCQnK0Z4iM+hZhjg3awhLDB4
         kEYOGrql67xj2rbYPY7GuL59Fm2N8y7Bj6HfcBUBI5BbospXsv3I8FyH0+iSgBAE2uK2
         P3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900681; x=1794505481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZAOGAjOf6sEpVtM8pdi7ewS7F4GJROoGs03Q8/6ak4=;
        b=H66EWsSZNnA7CL1IUESHWIFzldAZfVToqz3P0HFVPFIkBABMOcBlTJ9GtdyYdg+cSC
         wyvh2jJi0BY9FBGT2xRw4FWGQnKWf9ddzzlbsmxYwxJzpSAf0OtE6X3txP2fy3Fu8rWk
         T7X05RMTUkDUbmHg8a3CYEl393ud30lXohhlj1/bYZozddek83m3RqZ9YEiV1x1FGNfc
         dI25SIrCfX641awWZoArBaHRnNXNPQ1aLQMnNJDRyWDyqyYiCgBdG0E4/CuH3EC9zc6r
         ZmrjMZGw2IJQaPDYGliM3SShMbmec98kGOB6KGCdXHaJh2VvLyD3IIplrJ1ITJES2RLx
         6kiQ==
X-Forwarded-Encrypted: i=1; AKwUvByompxALb9YhgUHctJW9m1xccxlWJXX3cJnEnPrkry/lwqqlEkFAcY3cqH2BLfKm7zmwdDwYg5n5O0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0AT6a+jOOWf0kVyg48Q0PUh2OjWY1xK61uQNTbjstZB2QB5Yt
	0xxpk1Y+w5bbpW0HudbKYLBBE2HVljjC48gL7VjT0xDAKdkJxTaylm+6PBxTbyWHUw==
X-Gm-Gg: AYBFou35g0wrrK4J1VWQuKiVWXKJQiJZVV4iHXpaoNK64t0W9HMa/MA6rfoAN4atGH7
	9su5dvz9xIHgl0cLZtw4bvs0gYrYcRRuv29ItAsKB9BXVMUF+NR11lUkpacvrUBjH4kekQTO7Vf
	eMUCUbx0+CbAVc22pjQOvd34r3L+tOAzGV9wM1AuCgFZ7vmt5k4UxcXivqWw42LI2wkFdCc8+jR
	nppMxg6LrpOdGy6u5tIXj86X/r/Oz8LZeTAxyeoGBVdnKP3NT0IGp8A2lcV69/XI3NJrra3U+H6
	nfnmFTOmafNR8PsgzbnCSsPPdNQlBiVOyc/Qhq6A+HZ54l274rUs4ZZiBDHaHzexJFJ/qALulap
	D/1Atag8PG+rlkZfGfw/gF9tjUQMjLz+CBJ82qwmRsTyk2jUhpD2dcCSDkHRNfVfJ1KUuuv3UnL
	6qbCIsYQke51Y4UMc3YW5YK2PGoLFxY8uKKJszrVrLwJLP7P19aEhJyp471RaCoL19ExJDyvF6j
	dBQVd+73R7cYBanCO7LuXBU/XNamVRsEpzWvsvvmZJP7v5dNiTU3GQPRO/eAwLt+3QRPRhirngu
	ZWzWXdbbnM6gGZ6k4E/st5ApQBVKy3xn/QAie2gArjol/4p4zA==
X-Received: by 2002:a05:620a:4409:b0:93e:f97f:f245 with SMTP id af79cd13be357-9442173e65fmr3211975785a.30.1793900680581;
        Thu, 05 Nov 2026 09:44:40 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea68fa5e2sm1219756d6.1.2026.11.05.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:44:40 -0800 (PST)
Date: Thu, 5 Nov 2026 12:44:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: usbfs: Require claiming a hub interface for hub
 class requests
Message-ID: <0aa5c25e-465f-4168-8833-387acced222f@rowland.harvard.edu>
References: <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
 <20261105172336.26307-1-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261105172336.26307-1-25031212351@stu.xidian.edu.cn>

On Fri, Nov 06, 2026 at 01:23:36AM +0800, YuanZhe Liu wrote:
> Hi Alan,
> 
> v4 drops the port owner exception.  You are right that
> USBDEVFS_CLAIM_PORT hands over the device behind the port, not the port
> itself: the device is driven and suspended through its own fd, so
> letting a request poke port state on behalf of a claimed port does not
> buy anything.  With the exception gone the helper in hub.c and the
> declaration in usb.h go away too, and this is a single file patch again.
> 
> I kept the interface class test.  I agree it should not matter for a
> device that follows the spec, but it costs nothing and it keeps the
> check in line with the two entries in hub_id_table.
> 
> Then the -EBUSY for tools that switch port power without unbinding the
> hub driver is intended, as you said.
> 
> No Fixes: tag and no Cc: stable, following your recommendation.
> 
> You mentioned that usb_hub_release_port() and usb_hub_release_all_ports()
> should synchronize with outstanding URBs sent to the device on the port:
> kill the current ones and keep new ones from being submitted.  I would
> like to write that as a separate patch.  Should I send it now, on top of
> this one, or wait until this one is settled?

I'd wait.  Also, don't be so quick to send new versions of patches.  One 
or two per day is plenty; you want to leave time for non-AI people to go 
over the current version and comment on it before sending a new one.

> YuanZhe
> 
>  drivers/usb/core/devio.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 486ced74405e..d39ef9a80ec2 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -878,6 +878,23 @@ static int findintfep(struct usb_device *dev, unsigned int ep)
>  	return -ENOENT;
>  }
>  
> +/*
> + * Return true if @dev is a hub.  The hub driver matches devices by device
> + * class or by interface class, and a hub has a single interface either way.
> + */
> +static bool is_hub(struct usb_device *dev)
> +{
> +	struct usb_host_config *config = dev->actconfig;
> +
> +	if (dev->descriptor.bDeviceClass == USB_CLASS_HUB)
> +		return true;
> +	if (!config || config->desc.bNumInterfaces < 1)
> +		return false;
> +	return config->interface[0] && config->interface[0]->cur_altsetting &&
> +	       config->interface[0]->cur_altsetting->desc.bInterfaceClass ==
> +			USB_CLASS_HUB;
> +}

More than is really needed, but okay.

> +
>  static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
>  			   unsigned int request, unsigned int index)
>  {
> @@ -891,6 +908,18 @@ static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
>  	if (USB_TYPE_VENDOR == (USB_TYPE_MASK & requesttype))
>  		return 0;
>  
> +	/*
> +	 * A hub driver owns the ports and the devices behind them.  Letting
> +	 * userspace change hub or port state behind its back, for example
> +	 * with a SET_FEATURE(PORT_SUSPEND) request while the hub interface is
> +	 * being released, is not safe: the request is passed down to the HCD,
> +	 * which may walk per-device state that is being torn down at the same
> +	 * time.  Port requests use USB_RECIP_OTHER and hub-wide ones use
> +	 * USB_RECIP_DEVICE; the hub driver owns both.

That last sentence is odd, given that the code you're adding doesn't 
check the recipient.  It should instead say that IN requests are safe 
since they don't affect the hub, but OUT requests aren't allowed unless 
the caller has claimed the hub interface.

> +	 */
> +	if ((requesttype & USB_DIR_IN) == 0 && is_hub(ps->dev))
> +		return checkintf(ps, 0);

I'd do the is_hub() test first, since that's what this special case is 
all about.

Aside from those minor points, this looks good.

Alan Stern
