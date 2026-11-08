Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794157164;
	b=YcrabDy699OvVWsbBkjc2les4ZnmBpKEsIo90crOl93ZN6+AHPOZ0iiMeSWdSb1hDf80
	 DAjJy2qTkQKhE+SQH5kLfWrmIX0JBYM8ioUjwH3YaOQ7psLh//uQpg1i/vKborAFEJpxN
	 1yzvRVZiWtq9zd4kA5sr4xQ1zirDlpdE3Siorzy4SWwifjT1Pja9jnChuMsnJjzefE3bQ
	 nh37ceESImBeH8K6s8b81mUq9tZoJ1sHHDmYilD1yDcMz23tZYBmi1WCc0CrHy+pg3GXN
	 d+AAy1U66K501N75V7shDpRib9M/dzT5y7ZscvNuVJTbSoKkIYNLwTOrszZy+ZnJUvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794157164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
	b=c/QqAmh3QzPTnsIiajYO2Lk09jBucOyuzAifqswDm3X8uDclAXkFQuOVqsc9PzZmCZEz
	 9g+AohIwk4vwdHusmkjbWhuXCDI10JZwGrCveJdVL2kA0y6IISDuAq0dZXb4qyNgjogq6
	 ZnON7pQ/nN2do6mnkyrdAR5iqDv/WVHhizLwHk1Ril5Z34N44g+sAPWkkGL/ORnaHyR5g
	 xIBrlPbwfq9fRpEj11dUFNVlHS7ptkWV+CTBBFRSjOBlPIO6nvJtGl0BkFdiP+gDWPota
	 5L2PGynuvZfQvFNxDa4+6ZpZCj3s5XtRi81vCMxgR4JhC7+RoH0toUrI3lRm2/UlrMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=vVWQLNs+;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D9606A331
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 16:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 051D9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=vVWQLNs+
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ebf4cd218so2050816d6.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794157158; x=1794761958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
        b=vVWQLNs+Rnn6NOsMpjKSpUM9H3gRT4E/HZTt53PMAZ2SXIz+Low080hQm0r2oKAsG+
         HZ5TLknOMUGXKR3KUCz20FyQXU1Y7n4k67s/O97MTY2HciAv7W5/XWWVJI3wnxiYTpJN
         gDPuohXn6LbvsrECp0/Ji6cvN5My5wm8EgfEsTmjv66hd/4pZ3HhjPBADrWO+gshRLZX
         1w4cJtE0RQlZSB1u8qCDumnVcL5w0oR/W9xf8l09re306PAWvYklsReVbujjFSq7ckfb
         ysHxLPgUuyjzLYLRPYb0BIszOUV4j3JsJcseKz7sg4xVYz+KH4V8tOVQekOfo5kBRIRc
         SzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794157158; x=1794761958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
        b=wQzkgeVQ7ZOsUu//V/bx/6TD2N0LxGuBrsrXNxRRxnn2so3JuDobFMIW753vD4IKdT
         ge3a2d2XZ9K0nils6O5AFiM7lU1WAtn5aI4/MUjDKx6XA6PGJt0eyZS2k9AwXsc4IK3E
         dK/eS/cKFLwUNLDK10UteuFbXizcGZFJFr+hKQKPhDKWfVF3/AYhLsbNDOj5TDdeld2e
         bufItTMJ1Aod30j/4NUC6PftU4FZ9M7f56MXgOANqN9ON9AgPadzoAQwu1cPA6Qz4LgP
         gpkPmHSYQq2383AzvVVoOMQ658LzctdS9d+xNTkV4hyvhNfQ8rwwrjSNyHOkSuZjKgH0
         fgpg==
X-Forwarded-Encrypted: i=1; AL+hErEnuVdZ/Uu4XY3sjTzczSB/eiP6/cCENCY0Q3/+bdmNNOj7aaK4rXnJKylBWQB89F7eURhR7hWm0Js=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B3j2J1XimKycOHBgCt+i/MBwF8e8pY9p7vDpKAawa8eegpWql
	lTLcizRY3FK5yFEdGIySQVy1ky5ZLHpQIRakPvFgwHb/vp58pABTKa1bzbns5qh84A==
X-Gm-Gg: AYBFou1YKkzW7tb+npGrPwkkkKBUpjv/d88aQuBS5+I/OyY5dWqNH9M63XRXtPE/gLs
	x2CfThXyc1oe9krUF+9hgMIQ/F7boThgwTqK13+00K2CpNCGIabv314ZKv5cfXFM9+iyyp5zRUj
	U6YIKibi/WUUKoiEE5Zm/faljPsuhEFofsZ87aVIePMhcr73bM/YtRDf7azF1+aKh5HDFGejzk2
	KANYOevux1S/HSuPcLcSVBqQHQhmKucmA3TjpiyXmvgrmW9XE2w7ElMJrzKoW3iq4Kc91pOEK24
	eBb6unE2U+UjuLyAlWEOVmCDkNzKhmncL7qxljCrEV3R4wrEugBN71zwyDUkyuT8fLp8pDTl3h8
	Eybgui+8iVIRU8VJCeTt7ZsdQoNuZECzVwZXIn6w3qrZT4xVkrLv6PUViB6dA8BEFo2d0ZEjrWL
	99GAye9BbTysz2+1tJ+yQ5w2n5ezguXBdvkCumxBXdBpCK/9abCbyymarMGinSul+pO6Lpfk0kc
	3zv3ScJXbZ+ByiGH7yBsJv2orFTHrZKxvv8OlNE4MfifigSmuYPElx6SnSCjs4Gx2xJZ5NZaTDI
	Vqt6WOpVWn96+YNOfVFGG6hSUHXY
X-Received: by 2002:ad4:5d62:0:b0:91e:9d64:3294 with SMTP id 6a1803df08f44-91ed240d34dmr24616736d6.30.1794157157397;
        Sun, 08 Nov 2026 08:59:17 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecedbefb2sm22431036d6.17.2026.11.08.08.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:59:16 -0800 (PST)
Date: Sun, 8 Nov 2026 11:59:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 05/17] USB: Lock registered interfaces during manual
 driver binding
Message-ID: <647f3199-909d-425f-b485-b598a18844d1@rowland.harvard.edu>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-5-1e536825b4eb@nvidia.com>
 <bb83fe3c-cebb-4bc8-bfc9-24df1cf72b0b@rowland.harvard.edu>
 <20261105184442.GF8298@unreal>
 <bf756e50-c77e-40f2-916d-e88887426806@rowland.harvard.edu>
 <20261108110909.GA8635@unreal>
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
In-Reply-To: <20261108110909.GA8635@unreal>

On Sun, Nov 08, 2026 at 01:09:09PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 03:04:18PM -0500, Alan Stern wrote:
> > >  it ensures that the lock is
> > > acquired when the driver is bound.
> > 
> > That may have been your intention when the patch was created, but if you 
> > read the patch you'll see that it includes a whole bunch of material 
> > not related to locking during binding.  Namely, this part:
> 
> Once I added `device_lock()` to `bind`, I had to add it to `unbind` as well.

Obviously I'm not making my points clear.  Let me try again.

The entire patch description, as you wrote it, is this:

> Interface claims hold the USB device lock, but device_bind_driver()
> requires the target interface lock. Without it, trust-policy writes  can
> race admission.

This says nothing about holding the interface lock during unbinding.  In 
other words, it isn't a complete description of the patch.  It implies 
that the patch changes nothing outside the device_bind_driver() 
function, which isn't true.

Furthermore, the patch does not change any of the code in 
usb_driver_release_interface(), which is where unbinding takes place, 
because that routine already takes the interface lock.  So to say that 
you had to add device_lock() to `unbind` is not accurate.

Instead the patch adds a new usb_driver_release_refused_claim() routine, 
plus code in usb_set_configuration() to call the new routine.  The patch 
description says nothing about either of these things.  Not to mention 
the fact that your other changes make it now possible for the driver 
core to delete an interface claim when the interface is registered, 
something which was not possible before.  This is another inadequacy in 
the patch description.

I'm not saying that any of the code is wrong.  But the description does 
a very bad job of explaining the new code.

Alan Stern
