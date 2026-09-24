Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038723B83F9
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260089; cv=none; b=h8Ca6nKl74+BzsDpqUAPRmw6JTEQaHIeWKIcrC+Brz4L49TUUntah97umoRgpzfGJQm0U+tb7KrA5BiiH+ttp3piEHg32QQZ764PaISMTsW7iBaQxfMPMXcJyUjpPvKIiWB8A/RdqZjCVq2GJ9MqZXKi51CSWnBWdSv2mrpnlgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260089; c=relaxed/simple;
	bh=Pxat2Xb8VQzGsfdF8jUB0vNzqa7EZk6++nhkfiZ+FDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e308lynaClwCbU72fg3na6e6ji4sJxGjSPYhezYH6HgH/Lv7O1PRBfCfdPxm2GGh88wzYqEzQhN+Iu9GbGjIy8aV0jOOqmq1PlR7QmUsRmHBiay1JQwcHEBgbVC5T60IUkuQDk3k5L38OLgtkTB37emkQeDot1HkLjeOlyELdMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ghtXcn8X; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ghtXcn8X"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so19014291cf.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 07:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790260085; x=1790864885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rqDDblUSujyS0FvgZyFExCbJZd+ab+FPQ/66S3dp/84=;
        b=ghtXcn8XWfY0Ua1PGs5pCrURu/cS2g25LLIe8lYTZryPwzD91kNodkjcPwHJ8tsCB7
         ol6O3pQ7/XrWULbZN98pBksXeYgLAm0JnGqsl1iqtEZeFl+lGq2t3VKEzGIDdTCr3pLQ
         NSqm1/jM2dzSZcQoUovTg9JIW0zT4kgmuVXGeTfeAg4235jFYJsHHOFWfScCSdL3ihQI
         XhgJZwZ8muX214CLXuSeS79jwMPiMRO2Y1b+pyfkG3q9uvEuqg6EVp3EOnsdMlHVhfIH
         65L1BQcmZnGzBrjJLVVG/5HyhmXFPTaj6uRXEAvyzJKg9sz7XDZnb2VkdKHoovNG3aGw
         u49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260085; x=1790864885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqDDblUSujyS0FvgZyFExCbJZd+ab+FPQ/66S3dp/84=;
        b=Sh6fqS8L/FNdksDbep9BcFuR/GDobSa1GI2FOCt3JqHxsL1Gg+fsTHHC4g5L+vjxZd
         ma+I88ODSIcSnJgiqEOQYKS+S3abHkoMy1uKDT2wlFPaujUKPqkSxz1Nfh7sUQxuzIoF
         o2TF0l6f3y28p+KwIhzb+n+Fcv80gvaDkiEEOsZws5y8hrwJa6lWbGUQHH/+iM2PtITX
         1lQBU3RidOhDMRdLX+M0lS6CHxsItZKEaSpUyihLLmOMg9NuVb6Lj6Mv+5jnw6x65dca
         fMCcddXSFwrkWGFBEsvrbMz7Cu1igIFGJz7aI8pbQN+FgDeaq3fibhoqEY9k8BhYprSB
         x6Rg==
X-Gm-Message-State: AFuF++mOyrLBR5vLFtLgM5GLitRckgZBNb3b4HZzevZ0RaWaIMYyeHRv
	HsYBjjE5gW6QtbEwaII2HKw5bwn62Baoa6aJUmUT2Hc2IswIzpFYZuXnT0/YvLaLscfyWOIkgdQ
	BMcLBZg==
X-Gm-Gg: AYBFou1YA8tH/mubkg2S06BWSf0uuisPXagFT+47E91e6rUN+wPMD0Lwz1x3tWv7OID
	Ov7PCcDis7YTsRLDEzYoDSzT82YRvUkVZwbKpEM2HOEfjl1sLxnbEKXXnAb8eMBpo/QzoMIIYTS
	oJKD3qYNTbxUE5ESDvyG9KAbPaxBhukiXTcCAcwYID/IAxN5/UJp+BUYoIRcc826Hai73YX/w3B
	cQK5AaNFS7FCGKhgMjoOHsXVgaOjHEq8PCWvizQXkecxNzMHkzMrAfKVYOo+TjjnwP1k4GAZWeD
	uw+KW05bOgrOWWa+wVgvfnzmdGvUQQahpRIARZE0rsO1sN1E7bkdyx8IKZZD1d5Zwc9PIRtWmXf
	TiXsc0yv/CLhJHbkYGhC4dihfiYaZBOj1vKkrQ45dGi4Iq6n6BnGTneHbN7jcsk+0YfD6zbPRu0
	l/v+icJ98i+FvH9N+XMbbEdq/2DNcqSst8gAZ359v7M06nsDO8DY71AvTMvQ9/x9X0nJp+eYzGM
	45Etkm/URWnkJr1
X-Received: by 2002:a05:620a:2803:b0:93b:d79b:9a5b with SMTP id af79cd13be357-93c3640a746mr295405285a.60.1790260085356;
        Thu, 24 Sep 2026 07:28:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485dce4sm478149485a.23.2026.09.24.07.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:28:04 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:28:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johann Klammer <klammerj@a1.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: possible regression in usb-storage?
Message-ID: <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
 <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
 <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
 <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>

On Thu, Sep 24, 2026 at 07:18:20AM +0200, Johann Klammer wrote:
> 
> 
> On 9/24/26 4:08 AM, Alan Stern wrote:
> > 
> > Better still would be is you could also collect a usbmon trace under an
> > earlier kernel that the drive worked with, so we can compare the working
> > trace with a current non-working trace.
> > 
> 
> this one is from a 4.9.210-1+deb9u1~deb8u1 (2020-06-09) i686 GNU/Linux
> the device node shows up and can be mounted but the drive light is on
> permanently and I get
> > [31473.010372] usb 2-7: USB disconnect, device number 4
> > [31473.016105] sd 4:0:0:0: [sdc] Synchronizing SCSI cache
> > [31473.256060] sd 4:0:0:0: [sdc] Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK

When do you get this?  When you unplug the drive?

> the log filtered by device 2:004

...

> > ddba6300 2786664488 S Bi:2:004:2 -115 112 <
> > dcd97860 2786664509 S Bo:2:004:1 -115 32 = 01000001 00000000 00000000 00000000 12000000 24000000 00000000 00000000

This trace shows that the uas driver was bound to the device, not 
usb-storage.  So it is not at all comparable to the earlier traces.

Alan Stern
