Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859754;
	b=oB536Y8IAGQ0nddhoU6wvK3dbnC5lfBTq9IhEGibgdYg2qBLL3E8FfpPfxo4agPX6maI
	 f47CweoEArfLNNBnBzM0VNnHhvJ+sK2kzfds4BwNzprmsYus5Yw7DkOe3DuZmeiZqzD/A
	 2PJITGWUiEVty2KSTERzLGkxx0vz1blCD8pYYCrCszux2PpcUfe9Um5VH4hR4mefX62uq
	 NVW4mesZAXpX68hfyvXyhWH657r1kCAX4GzwyOQ6WvSLI7VCi3BBbE9OJ01wqp7Chge76
	 F1dXL8+CTyil1aPFf09eDD0tBLkxnzSZcKD48GgINp20THw8m9DLPBSxPmXadObm8gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
	b=r5w1fURlZ1L9AHCntO7LJtleP3ViVGeqJUUl+XNhb+tQ/86/WeyGoeeXt5pQDJqxNjuF
	 q9mw1VshCV5sjhpY+U0DZ8SHLN4xZz9coiovvZwV/hacBc/DBuXu/ZtdLSkZav5VrA671
	 QGuRkM87ICCmc+m1gs0rhjZDBv2FjVMLbw4ZDFaCyNkTibSiEAZKOlja9PgN2v/KgxdFH
	 +COJ/qlfU3ZprmyelBFJNTm3S5xwvzuqC856p/6OtnQ9bT4NSMTVI9BkRDD6p/goE3uqn
	 8YG+UhmMimnz4XET8yRkSIFQdSlriX+62XfihP4/1hUIxhQNbesx0xz9vFLrYYk1Kqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562AC606A337
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 20:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562AC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-536717a4d83so40754521cf.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 12:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794859753; x=1795464553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=nbZUyxTk1xDDi9/JiN9In9kNH24m3xvR3W8MPaMB063K/nb6P74sDih4ebpP83k2np
         SjqTAYuPLCHW+FRVrjLKSTbDX5aM/IVbZZxu+ASYJ/ssH0gDFbMJvSJmLcdHAAsDSEL+
         FG47SOuU8PRulqvpOebFRdp+iKyncNtYeoKxWrzhMSjcb9i+1jD4cThvDUO+7PnMd3zc
         ImV7NXhI8pI4k1LW/eM2oLltJhXP6hUveoFekGEVH6+oWgooyZkYdcVCIAs0jW9hoXxW
         5IGbSHDAmwoeFMTug5VO+bv+VKknP1f2hoIrUsvWYeNqALAO8eTePO8ZOjSwRNnR3p0b
         L2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859753; x=1795464553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=fFfRPhJ2Gy9vO8CwZrQiYrfEJ5YF9i2p7lGieLDwxEgr+AThANuq05+pnFhdmoCuqq
         gNPomkpZ7FJNxAdgNyiOLuYaYDgtr/iHKCQP94k2ygpy7JH46lsHuq/KR5bEjY8t0Xo2
         3rTsFYA76UJyhMcKh4iWIoi6LmzI1LJ0Iown5/dAu0cwSlJvWBfcIof85C7WwNWScvYx
         yMgSQfIwOosXe0z0Bhip34x2ud/IpWWe2o7hUk75eNd1axWWoP5dWqXFKWl81Hh5MtGU
         G3LjWBz/pVCK9Ert0NQ/5yjb8rCTMBG3pPx1W0dSmuEMVQCXtjZvxuGZdV9jQxoy1h8c
         beJA==
X-Forwarded-Encrypted: i=1; AL+hErG+WeOV+dOOuTSZciNAIGVVCJgU4g3KX+F0jy6EKefsRyQ5a36QwiN8YDkpZiDNmvvPgFUYE2G/O+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2NpGAAHg63g0j4JsEzEVGFArwFlmBwhKzifPT4PijGOb2UxF8
	npAlLK6+KkxO5A3LIyduc5IGasr84lUPEiGrTd4BME31G1416DCzn34RqzETaN7NOk8=
X-Gm-Gg: AYBFou10boctFc9x0WOQb2ia6aX60l1mSf5UQjmsPPBGNycwySbmJMsw/J4JYnxkxIn
	oAT3fMe87utM5UYry76fOh7Dv80MXMSkd7b5/lBNeYWMKiIld9NbcUyT58yt1ulSc6OCC8jEn1f
	oo2mzyVx8njpW0L+TrEzxtzGUy0q5yfM/Ci3a0sVhmQzmLDwXVNesP0WrrJg69lbtjsc9Qc1IlL
	+oDjC78WV3l0ELY0qYcYyvmDb7nrnXAlWsukj6BqZJNgA/ug5FUhlwl2ZDeYaBFRH03L8aSjQWe
	ax2dwWKvdBMxUjoY+GlTlrJrem9on6A1EwSe0OMMP5MgUUDhCeD72FQOl9iF+YWnmRUBbclioBm
	SIy43dAheuXjvBjaEPwsqDOelOPYWUbeNKAIr0ESGkKXi9I9vPXc+fu+26pzzRzGpeWVM0BXmvF
	6ZiFNEcnR/f8GLNm2N9+vjL7gDilpPIdsXAVViRv5m+Ps0bj9/A37XiEQyc9VMA36XDoFDkOvWU
	jxRx8AJd6ntkmYk9bAe6kESXo7UN8rcXsrazVYyMgR76uVHKaiwTd+Z0ObMmCYlrimOrxv6vugc
	tiUwIw==
X-Received: by 2002:a05:622a:5144:b0:536:98da:f790 with SMTP id d75a77b69052e-55ac43909femr187873791cf.6.1794859753196;
        Mon, 16 Nov 2026 12:09:13 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d445d1sm92856046d6.8.2026.11.16.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:09:12 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT30p-0000000ANtb-30lh;
	Mon, 16 Nov 2026 16:09:11 -0400
Date: Mon, 16 Nov 2026 16:09:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/19] PCI: Replace untrusted state with device trust
Message-ID: <20261116200911.GA2473219@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>
 <20261116190417.GD2299285@ziepe.ca>
 <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>
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
In-Reply-To: <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>

On Mon, Nov 16, 2026 at 11:24:17AM -0800, Kameron Carr wrote:
> >> My scenario is pci-hyperv in a confidential VM with a paravisor. The
> >> paravisor is inside the guest's trust boundary and owns TDISP. It locks,
> >> attests and accepts the device, then answers a VMBus query describing
> >> which BAR ranges are private and whether the device's DMA may target
> >> private memory. Before a driver can bind pci-hyperv has to:
> > 
> > Sounds like a user in such an environment just wouldn't use the trust
> > level mechanism at all.
> > 
> > What use do you see for enabling trust level but having all the
> > devices unattestable and accepted already?
> 
> Previous iterations of device trust used the trust level to make
> decisions around DMA bounce buffering, etc. Is that no longer the
> case?

It is not, this is now just about userspace attestation really.

> I am looking for good hook candidates. I was hoping that trust levels
> would end up directing DMA behavior, etc. but maybe I am
> misunderstanding the design direction for these trust levels.

I don't know, I broadly expect some flag in the struct device to
indicate that it can access private memory, but how and when hyper-v
could get involved to set that flag I don't know.

Jason
