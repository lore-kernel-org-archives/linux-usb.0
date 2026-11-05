Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910721;
	b=VaOlDJakU70t/EIrm5NZVLrFIO3l4B4aWcd0t0jlfbYqNF0Sc3OUCQ9JwMF8YYyIrAwZ
	 SlAigu8PokO8ACGxj9p3oenTFwrnDyauq4AbKxx43Gf2g+7PGpqq4T5Mue6ZgmqaLiE4y
	 KeBN6cAkoICwP9MErV0QgrvmNJ68Zca6l9AFHkCiBSuo8FPhSqlaOtRYLldDglEpKr/Dk
	 hwYQgCsLsK9spAl0tW6XQMm3GLxKDfRHmtlGPsp7MgevXYjzZuBY0oo3BygXTOTsXMXSE
	 gzxNYE+jz9uGaMfw9Mnw/d0wUO5Ff2N8oNDa8atmdJ+w4lXaJfsFhLO8WHcmDzoGlUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
	b=RtSDGrJJKsLvRCsOupW+nj/uTFWW2jOW5MsiAuzR+ga+fjijYTk14YLke4fx4CCWmX8A
	 tTdD86ZrFf7JgakRI58vYtdZ93PWHx/vllZfNMBnwcN5V0mhtrzI9o3Am4LS+sVoW9hms
	 O5QLjT+L+AR8+PCrR4wn/8AlVIsNQma2s5U6YD4YnMRJCaNMgKmD1eIxEb84buA1cUgMN
	 pdYkTbtlwDB0JumrO9XE8ZgdSXve2OtLfiqZFJiCqs0l5+VbUyJ/oKSCTwRVX6ujttpVH
	 ERsW9LEwjTfX4d8ktXvyVMMVLCFBnh2g77ya+EI8eQ9mqyy4dVaTfWA6Ipvtl5lDWbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=QuEcehMG;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02731606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 20:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02731606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=QuEcehMG
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5366463571cso24143161cf.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 12:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793910720; x=1794515520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
        b=QuEcehMGpMoP1K0IVbN/jVj5FL16+s94k5t0K2g5d5AuYxTOCh6G4Jz8w3y0e27Ot2
         zjBFLHRAzM/Ti0n2KRuJaKiZ6olZN9GtZRXeHTVndUylx9APp6ow0YwbN7xjTxyx10zJ
         kdOYN2vLpWaJFVSHUEHHJ1hmP19gmsD7CISX8rluknE01JEHFdBxhDChOCXZKhEPxxPl
         v87bQoOa90cvKjHG3/jJXdY7C5Zm7dx6vyByYMIw0erq7zDu+/jRkawvk1sbni8vxpQW
         vi1jBCewTx7IZ0PNMjwxUuVSUuI553Yxr1C6eovL76hM822B3OBk+EWb0+m3HwoCP2UL
         hVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910720; x=1794515520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naL9ZYlGHpjK154MUN/eO3m7g6+A6qo1lAhYSkBJyWI=;
        b=OYXmuc5joEUwVvEbhYYEJWs4vln8JQ6jDabqC5R7+mYvErlI/inIC0q4y8ubEKHLjC
         o9MxxWmm5vyezZtl/+38aEkZbJCKuaSmM/yiKUg0gcSF3JmcmIbpk23Xwzmsf7tvLwWh
         /Ad9Wf6HCwx04FtX+R/xAh27j7xiKKt5z75G7bAiEdOknz36CasHF1dmidi7LRCZsmXf
         0EIPb8XV6AQjJbsPQcJFmIolx1d5dz2XNYrDSCtFfO42GkLmcWfFRdF4FUfRfcGHtPfa
         yStVaHI+bHJJd7Q7N86o4jRCrrbUswLY/KM/NtADW4zjSW0+7FpTZ0rrMv3dgj7CZYx3
         /nqA==
X-Forwarded-Encrypted: i=1; AKwUvBwhtqYFzHEgBkmtirUuha5vG9B5H4JAQ2xwnidV+6ETilc+wm9u1VEAwl+g96FhE23G6lxAeeXPuuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IU/hZ7Q4ZlFM2MaiN2fW1QqXvZ7y04dsVtZO723TewWSx3Fut
	EHq9vnwMo7fF0vPKHdw8QnMakeE2Bo2geEHFcDiTaTpVz4NQos3IuKp4CYtVdxWhHA==
X-Gm-Gg: AYBFou1LB0Z0oLPKnQ7zvdHQP0kVyfJ0v8pHvmX1e3geZrdkzjQ59X0ajxiJz1m0RKc
	K9O1h2Uxnwe6t5qecxJMkiKp6JJamrL8RqVjlwaJ2IlJ9fH82Lgx2MS3R7mhd0jhRDM7ausslk3
	EqFMsoynZ0Ab8JFHv+OxfhhIKesnh0bj4X60difZSUhwADV4pY1EDutQetDRBtMgVkXsPvS7lUB
	GsBA0GFWZBXQkOSct8nPCmlFKxNrPoqgN7xz03RCaye0Hg/imeZGjSVnfExmsY2VqErIKaiD8W2
	ThdGTD3cfbRwlzvLB7ukRRrKGMuikkNL51+KSBpxbumBg3cVMrsjsEeOEJ88a2k5bSnAIW6gq9H
	LPnBx2beeB80ng7eCp5dkFH06Aq50qhzl3OK3mL7lOcYUtDefBnDObUOCfwkNVupAY1wkayJhu1
	G91eOwxhLpr57BUCyl7SJgHQNsrb8RCAzdWv1yMtKOcgnXXQSlg7ykq9rzgy1T2ZK4NwWX1I0g8
	xi+rJfcn3F+Weor5QtCdhnuA0SvKeIHjqYBDAXx31CWBgxGGxx5akzd2PPtUWZSy62WiVRE3FPH
	ncw1yEybLa+p3RZLJ2JWM2+YP+8x
X-Received: by 2002:a05:622a:5a18:b0:535:85c0:fda2 with SMTP id d75a77b69052e-54e100e5826mr8821511cf.11.1793910719615;
        Thu, 05 Nov 2026 12:31:59 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a870dcsm3921886d6.30.2026.11.05.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:31:58 -0800 (PST)
Date: Thu, 5 Nov 2026 15:31:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <a0918852-57e6-42b3-9321-38d766a20025@rowland.harvard.edu>
References: <cover.1793669297.git.jjc@jclark.com>
 <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com>
 <sashiko-outbox-194542@kernel.org>
 <20261103053952.1138398-1-jjc@jclark.com>
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
In-Reply-To: <20261103053952.1138398-1-jjc@jclark.com>

On Tue, Nov 03, 2026 at 12:39:52PM +0700, James Clark wrote:
> On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> > First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> > onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> > still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> > to configure the device, bind all child interface drivers (triggering
> > deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> > all down a few lines later in the error == -ENODEV block via
> > usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).
> 
> This is deliberate, and documented in the @pre_probe kerneldoc. An
> error from pre_probe() other than -EPROBE_DEFER is handled as if
> probe() had returned it, after the generic probe has run. This keeps
> the -ENODEV fallback to the generic driver working as it does for
> probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
> from probe().
> 
> > Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> > other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> > err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> > usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> > unwind the generic probe and runtime PM state. Because really_probe()
> > clears udev->dev.driver to NULL when usb_probe_device() fails:
> >
> > - When udev is later unplugged, usb_disconnect() -> device_del() skips
> >   usb_unbind_device() because udev->dev.driver is NULL, so
> >   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
> >   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
> >   remove the port entries added on USB_DEVICE_ADD, leaking struct
> >   usbport_trig_port objects and sysfs attributes with a dangling port->hub
> >   pointer to the freed struct usb_device, and usbdev_notify() in
> >   drivers/usb/core/devio.c never runs usbdev_remove().
> 
> This was raised in Sashiko's review of v2. I missed that it can be fixed
> when the device is unplugged. I will attempt to fix this in v4. I think
> it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
> has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
> device that has no driver.
> 
> > - For drivers with supports_autosuspend = 1 (such as
> >   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
> >   reference, and hub_configure() enables autosuspend on hub devices; once
> >   the device suspends, usb_resume_device() fails with -ENOTCONN because
> >   udev->dev.driver is NULL.
> 
> This is a pre-existing bug that is new in this review.
> usb_suspend_device() does a generic suspend for a device without a
> driver, but usb_resume_device() refuses to resume one. I don't know
> why resume is refused. If a generic resume is safe there, that would
> fix it.
> 
> > Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> > returns -ENODEV, the error == -ENODEV block runs
> > usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> > err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> > used in usb_unbind_device():
> 
> I will fix this in v4.

This is all starting to sound very complicated and fragile.  Isn't there 
any way to simplify it?

Alan Stern
