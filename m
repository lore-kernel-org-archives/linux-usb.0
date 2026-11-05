Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887599;
	b=4Os28ET//veeZJMc5asZWK4iLAYKpuwuVYRiCXUWq3j8zwPLLI6RX0/EQQWg2SI1+FyV
	 iHKjDLluxi/TqDN2rol7lX1yZOrOlRkVkD5FPp/9YYhAOzc3e31HBNz9ahh1MgY7rVg9+
	 fZMFuh6U7dmiOLihGdvclq1MzA/mDBa7U0Ep8yyF/lY37PVqopR5OoWYra9mUfpFQDRt5
	 bcVUhkKovpeFzj4OHzxzly3MG0zwltrlrAD7ydEp7wpTsKF68IrHxTLb/jVmyMFFtnE1z
	 2FU2W2VcaRfxjAckwse8Zcc5J9fMxHCsc4GvBK30Xy3AHRe+uROLMCJ0TAKNFpNd2oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
	b=tATKXS0ShhTZvpQ8JqxrLGWHqIYnfoSVFo6F/K0J0g6hsUrAOoPQdhoyJy69Tcym7sOg
	 zbUUlFtBcKp018aJc+rfOF4PtXiAN/a3DZK7xzp542Vh8Q34xCvh0pAfiHErZo1UNDc/n
	 PnC0Ni0S5F0I3ZNOf3+Fa9DZwkfwFQPA75lH1XgD3B3nadRdNGG805s6ydoRBc9wMeKvh
	 HfNd2CwKTMa1i1PhchOYhVmcRMJsRd4KXqOSQjYc4T+xBI1yvdIY81SgYSPUyoOccQI6g
	 dJIsG/uvTU36T6zWnnUXoC47ASjZ1tsxEornsjswxOkkr4odomD+I2NriSwFJAjHzZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A2606D804
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 127A2606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so578918e0c.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 06:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793887593; x=1794492393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
        b=RnR9WnLw6ZCMoaFK9OfD+Z3SyEdhvj+uf0rMG8hHCJ508GqyJ6ANwZoUk4+aGiOUw2
         /BkiFTe3GFbXdlDhgGNTyo1p8KbFcLTeuViDrXT0G8rPqBzVVo12Ao+p4Nr1qmRZcl61
         4eaArBRyBLbC70PWW9D8DSwCjUpFcwxnrtfrVG8awSc3G2DLBl7ue9/tyD5BZlfo0PwR
         zdxT7MPa5WtJxCqrk+LMM1B4PGIKPha9YDx2d3ZgVPNqHnLfPw9K0SbdoIeozyBU6kJV
         fXJaMOJT5b2NTv+4F4NS5Cw1swAwWPhfu1r6zxddYwAc/lzTbX1ed12Z3pRWm4FFq8m7
         OBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887593; x=1794492393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
        b=gzSaHgxoe3LgvL2QKVViXzo0HmIzCrLuLVON28zDE7i/KEz7AR0dU6PSVNiLKmsHNU
         ED4UpHJxAU3oHPnnXOAboJlqrrMLU4kPZK/XbeZ9D7aysFWCTi+UotEgFQHGAuFaLYCq
         HcsKPUkaB0DjS5jU5JlviC9LimhH75W4Wcw8wIvsT2XvXWAW59kfVkTDRsmMkXFzRzUf
         m30roMSDfQyv8AAGEpPt0TrcRMKGAYzzcL3Fhb0GJLMLjjKEDsJYop90eNZBV/bDWvT5
         TMIa5pVvDhRAyCJN3OqO0wmcScY0C6tZe1tTYFp3MwgOUHSSTPJMcnzTGKqWzsAafYEE
         sn9A==
X-Forwarded-Encrypted: i=1; AKwUvBztUtsKceN6wKwBQYeU7h8xQmW5jVypFcegXoYpb10uoRrtkswo+yTA8SMWRqkAgOvZSksCcmYUhKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L6evh6ZcfZRNvRwzKmAOA3iVikwWjheFQBs/1iEVibcv/jzdV
	fLTZTdd+BWd/EXAO7EA2akRZqnAedpt7soueBRsP6VjZO8geA7UNyjn3ThmD5g6vflI=
X-Gm-Gg: AYBFou38aGwl3deFojxN6epDyQU9C/B828eWmTtX11PbY9I+ezIg39tdfDogyHCHlFH
	7wntlEsIJM0ozrkc+SEw3IyNvfwMoKyEhYuj/9/TjWNp9wUj77YkPfeWI+h0DH8upNwdQWLxj1Z
	uWeZiCfqOtpRmbSU02N70Op1EVXjUphbgE5yAwqc6eEZytqd43lgdqZ9z4YMA6ZCdzLhK3mGYS8
	+jeOk7bXNsxa0log5VFnzszpjhfMfUE59d+bnSp5mb3fu39nYH++mWh0/teTPmfsa+rWqV+ORmf
	ppvM8JBzTRE8xlJ1iGxuG9Ua3bI6Pw+92+F3Ql3+gKqJgwCCBoafvXtTqZ1tKpK0xMz9S+mN+6P
	Ng/m5L559uabHfGa2f5dX+Gqy3vr5NQ9jgYftey5QT9O6hfYuq9sTbfZZ1vDGM26XWgiJXbXPbC
	tzP/KabPQRKyWUF+RgpyXs80rKxU4sFzX2RMJ8US6VCWvJFdXXgdqd2qhQrcgMy9bSUAUFtE0cM
	Z1+lb5CXJrTleQqRCAFMaURRZZ7yBqM/GziZm8GiMY0qDRgViONYHWu0oY8V86+AfJ+WW/oKF8F
	wnQX9jDOAWxsBO89YZMydOgzStPL+mTtpaqbYTrrvTOYliz9piaa/vS9BrXARNShJpmYXClHNrV
	Fg9i+ERdQDQ==
X-Received: by 2002:a05:6122:4f9f:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ec68949c50mr9274698e0c.17.1793887592873;
        Thu, 05 Nov 2026 06:06:32 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm4161881e0c.8.2026.11.05.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOy6p-00000002ezu-00ao;
	Thu, 05 Nov 2026 10:06:31 -0400
Date: Thu, 5 Nov 2026 10:06:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
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
	iommu@lists.linux.dev
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105140630.GG3889730@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
 <2026110514-bunkhouse-handset-6a3a@gregkh>
 <20261105132729.GB8298@unreal>
 <2026110535-engulf-precut-cf10@gregkh>
 <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>
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
In-Reply-To: <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>

On Thu, Nov 05, 2026 at 01:59:20PM +0000, Robin Murphy wrote:
> Yup, and that's true even in the PCI TDISP case - there's a major amount of
> "communication" and "configuration" involved in that. The principle which
> should (hopefully) generalise is that a bus/host controller driver can
> always interrogate its child device to perform whatever attestation and
> general configuration is appropriate, but we won't hand off any _control_ of
> that device to a specific device driver (nor enable potentially-impactful
> bus-level features like DMA, interrupts, etc. if relevant) without the
> requisite agreement between the bus code and the user.

+1, I think that captures the idea very well.

Jason
