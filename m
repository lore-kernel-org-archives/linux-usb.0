Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913473;
	b=3VzfipeaGAy8qMJRqJm3zgIkmVTb6/ZlXL8fjUZ06YGDKfIaIdn5FlKtQF/Uw09Twhwx
	 SP13Xrh1OF4axhTHBAgu1p8OWwtv2TzeDDOIjlwpcMrysTxlM3DnF3f00Wb7okrzXf5kB
	 XldE33yKCel9fNiIB7fi8xaWjwoxzqsD8EHKRio3TYK3zWY3T4bwwfpZ0CHl7D0V6Cgd7
	 OaB3kgDsR7mQnXAzn4P3H/J7Qmj/AQAbDXw47UVNFnzLwtKqQpHQq8hZlPa9sE61Gd3d3
	 WwFhBUwC/k6Wp1x5RIKNKdbr3TTDX2sz6QBTX7IZ4iOfH7mqPGXN8nIBTMOTcpAdjzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GAWX7iXnzNaabe24Dq2spKvoT+Xp3KXo5p/hmCUeanE=;
	b=LEdOwKhuUIMerKeJ33IKuhyPZDYNezqIYQ59D3Q5kO7VEZ44ovTzFVQ9lW5dJmDdw5Ef
	 Eml/g0YpLREnnICtlBne70tfjPO+2fHPBbNwBvz+gbxNhXjnBD3+B/Vowl7x4VSGOMGeb
	 ckt4votYb54FxcAV6YoaDXGiPEY2WwNBUxo/AdNj2ovDI/LpcHy7eHL36RyEjDVOrg9mQ
	 ZywfTgBowT8Kgfd+82mekxHbc0VUSlaA7y6uEEweHfXhBoiT0TbHjC/ke80y8tKy42vCI
	 5GcN7mTXgbjAyMipjWqz1x0roGd8ifz1lZ3lGDBtTZFo0QIKUl7kQpAUmCphVWIWAgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eNlESgwt;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F70606A32F
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 21:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F70606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eNlESgwt
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91e98301805so11032096d6.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 13:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793913472; x=1794518272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAWX7iXnzNaabe24Dq2spKvoT+Xp3KXo5p/hmCUeanE=;
        b=eNlESgwt5y4hZyER7iDZG4cXKZzugtrRNjqi1PBNQL0+9ixaJNOLd/Chjcps4tsbn7
         psL3Irc3erF4aH6guwxUo9YwpKChAl2zABtFgv0MsfD2St56tp6YypmeLax4rgKtjRs3
         eVrgsyuUvaIZD43iN5NgDnaFHejfngHiw/bIOxsN4iv5wtstGf1kvmukxR+gEYtV45w1
         L2/xrJJrTRARGPKW1Vh7NI4tHvhCO/OJGE1x6Da+1d4oKKBOT0rWXFllPKIBPXvKb0c/
         VrLvNWizFMa/i3G/gu2+k03zB4hAGuHbRElVBVvluf84yrxzVoP93mE/Wvo3f0HRlEgV
         Dc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913472; x=1794518272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAWX7iXnzNaabe24Dq2spKvoT+Xp3KXo5p/hmCUeanE=;
        b=ICJpPpVKVvbW2N6M6i4u7FBDwv00KBhlm7ZcYjRa9QZAGJtee3D83BvxLaci1tMRT8
         1A3X8ytk+giokWbNQWj/MCtBMXhCbVu7AQbUPm8tAISS/Wat++6eyA613j4RpWVotazX
         Rqy52ICzHW/4aaU5JIlltGsi24/U/YDdSbBnaGlXmwZSXMaN1Z9CrSwJMO6QH7e0JB47
         hCYu5TyNI5cxlIEVynJqe+pgJP3VLZgkpjrPRQNz43UyZsQpOS1gYBuLjcEzJaVRSkY/
         dhQ6qa0ldSs0U7ezpHo1ymUBDRT9vnHNXF0wSz+mXLjEs56eGhPTSDLODb19aP2HU2LG
         k1Cg==
X-Gm-Message-State: APuU4Z8FWQ4Mr0nQJS6YYE9o2M+2PutTfQFEBYUybyY81h2fOMyECNxY
	rFxXIQJufrwxO1zaeWEWuhpycSuSWqdTCe6+u6Yix2XrwCC/1lazAad1hgqHuuuiow==
X-Gm-Gg: AYBFou1o0WfuRB1dKdu1+x4Bjxb23SRYNoNDD6jjm4/dspf7BYXoAie090hJkjjRT+L
	IXmHlQEyEj6GyblmKzlKz3scpA9dgGMHOTPjB1XgvsQTQhXQW5ImaL1ZsCMxgjX98I/YQ9yNT/l
	7/8Rgd6MfD98Mkfy9AlkMwFPg2Mq8Jc/8L+Z21GkAlja1BG0w5BKT8xfQO9nrWE7JDY1VD9i4Uj
	/YbhWhdZAHStux2JNBoRDg9O4srnoAsX9MDMvjrqK0snm119nZi7tP8G6nMic45zMPSsoNeQtfg
	3SftshfScKOk2CeRHYYYfQydgKKMHYvTVjTqrVaUeB+1Z8l5JJi8aUN2DPfozjFQEAD0QsnJpiS
	s2jt2vuPdlTA98xrxPmL6fMTB1gYkcpIEelbfoWG5nK5ud2S4E1wQAZhFteqEm2Z6JzVVBx6mTY
	Tvsp2msB46JXvbeB2gFXpXmyI8sfOdp5VW/GAG6S3NWCKyGv6uGQjXZCh+XR+v8JRAPRc2V71eH
	QSRT9Mtlt+qfKWpGWvq72NPwoIytD9bNvscHPBAKIOlBDuybuJLFOrtIIMzsTx05YsusoE6JUYg
	c0PP0HcL42nYqacnAP1pZkQVlQTE
X-Received: by 2002:ad4:4ee5:0:b0:91e:a5c2:37f7 with SMTP id 6a1803df08f44-91ea97a22b7mr4156006d6.42.1793913471840;
        Thu, 05 Nov 2026 13:17:51 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5d9sm4853366d6.10.2026.11.05.13.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:17:50 -0800 (PST)
Date: Thu, 5 Nov 2026 16:17:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH 01/19] usb: core: sysfs: take the port lock to read the
 BOS
Message-ID: <6d474d49-25b3-41db-880f-53bacf50f211@rowland.harvard.edu>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-1-b9751ddb9c7c@linuxfoundation.org>
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
In-Reply-To: <20261027-llm-usb-v1-1-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:41PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> usb_reset_and_verify_device() sets udev->bos aside, lets hub_port_init()
> read a new BOS into udev->bos, compares the two, frees the new one and
> puts the old one back. bos_descriptors_read() takes the device lock
> against that since commit 4e0197fbb0ee ("usb: core: sysfs: add lock to
> bos_descriptors_read()").
> 
> This does not cover one caller. finish_port_resume() does a reset-resume
> if the device has the quirk, if its port lost power, or if the device
> does not answer GET_STATUS after a normal resume. In an autoresume this
> runs without the device lock, for instance from
> usb_autopm_get_interface() of an interface driver. The comment above
> usb_reset_and_verify_device() says that tasks which hold the device lock
> are expected to resume the device first.
> 
> bos_descriptors_read() does not. The file is readable for everybody, so
> a reader can meet the temporary BOS of a device which is being resumed:
> while usb_get_bos_descriptor() has not set ->desc yet (NULL
> dereference), before it has corrected a wTotalLength which is larger
> than the buffer (read beyond the buffer), or when it is freed (use after
> free).
> 
> The file was made to give the descriptors to everybody without USB I/O,
> so the reader should not wake up the device. There is a lock which both
> callers of usb_reset_and_verify_device() hold, the one of the port:
> usb_reset_device() takes it around the call and usb_port_resume() for
> the whole resume. Take it in the reader too, inside the device lock,
> which is the order of usb_reset_device(). A root hub has no port and is
> never reset this way.
> 
> The port belongs to the parent hub, which removes its ports after it has
> disconnected the children. usb_disconnect() cannot finish while the file
> is being read, device_del() waits for the reader.

This is not the right way to fix the problem.  It should fixed in the 
same as commit ff33299ec8bb ("USB: core: Fix race by not overwriting 
udev->descriptor in hub_port_init()") fixed the analogous problem with 
the device descriptor.

In this case, usb_reset_and_verify_device() should allocate temporary 
storage for the new BOS descriptor, and usb_get_bos_descriptor() should 
read the updated descriptor into that new location, leaving the original 
one alone.  The address of the temporary storage should be passed as a 
new argument to usb_get_bos_descriptor() (which means also passing it as 
a new argument to hub_port_init()).  The kerneldoc for 
usb_get_bos_descriptor() should be updated much like ff33299ec8bb 
updated the kerneldoc for hub_port_init().

Alan Stern
