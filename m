Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896023;
	b=5p7vE/a2iABZKS4uu7+YfEBptXTL/sdfs3GQdanEzazknFXUT2aULoP5xVtknSq+DMR+
	 EODtu0Kkbeb77d2UeyuZT5KiEWzNBZVBgmWhb1x2JZka7oO/IMaWKbEPoOuJGBLSHPJEn
	 9lGBGGvmhzoWHoWqk4ku0/aEj9IyeNixFGOhNeyyNc08ajS+Dacae2xp+LngQAP2gf+vc
	 N9fy2lBc+4ZsK7TLk0aoD15fCt1eKShaNk/Yj1JWqibPH+r8Rjfvvjo6bIVjBu+B/iGgY
	 o94w4HoK4y8ye/ytZOcFgYA1gjvHgh5cLOyeQyc1xlK0moCchxSjdUELEXGR9JJUwCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
	b=OnoZn9EbvCkj+3SYEjm1Zo4NzWNZ+yh//OPOgrZneWMqwCsoAmC2z3uDgg4Vi/oikYCQ
	 4Vc5jdZnOnxZk3yCO5uCpq+6Vqx59U64fgtGdwO193vGYHbkKzO3hFY4RfMBOhmcPIcwH
	 oy7HKjLX/U/PlHYVgby5+254ygwzebtmQGS1crftb2fsnR5xVTk3qduhvIcf9+0oY0bj+
	 k8SE/fWSgInQq1WHyf0fqHzOzKmrjc05iG8YD0iJMSNqBv5YxvjH55nvgH/sz4JZLOD6X
	 iGILvODX8MgbG6prjVsPj3/WPZqMHAVWKe6HRA49XGRFcPjmHd/SuwObN5nAUI8dN1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TH080M2b;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE8606A33E
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 16:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BE8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TH080M2b
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so727135137.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793896021; x=1794500821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
        b=TH080M2b2W5GU83fC4bkAl8rc89cXnFJ2JUZ1DQM2E1G7nxV0uZ+iMHWJDX5M/hBR0
         v8Q4S1dZz9e+Wy709/pkQPJoJ382ui88GBuCa7YwB1Pwv+V08ySzbQGdCs4et9sFRxVX
         1a78LWa2r/qDmkC73yn92WJjnMydzWl2HaDmNekF7y5RHwsZB7YPGLTTr3xjjmuI4LbR
         sgpTrG1DSTm++FzIJZEq0knZSmQ9xxE9IezNyVfi/1ZtU95O+iPlQHI5LWAc3/YmXStT
         Vgy3IZE07Q/+XWoEa8k60w3BygO7yb8zhuyYBqBwOLPUaUevbalW8R2MAA5wjUpSFz6r
         zz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896021; x=1794500821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
        b=AiGOl0ZXGT4jj/xhsEqP44astLjJI2o3G1V2RQk7+NIBCk9ow+RF5cqhCxstcrH8eL
         VEQmVYvdOijqiaa8urZhLkDggc1R6Cge7dCJpKzq9ftd4YGz1RdiNkxGgoucpxOIqIv1
         WEUynZXVsZzPEcrJHJ8K+wTiUPEsjqngMx5CD5v/CQyMPd8OAKiBQc25XWX547FjL5AC
         55xiDOoikmo4enmNHX1+GGZZv6eKmaK0/yYQkUm0r8YCDfxwziW7IGTTGZDT4MGDBdCQ
         drvP8DfO7ko/1Kf0usHfJ0I+gbbYCrHn/xUcS1QI5ETqs6KipaGAUlcOZjeB8UiXh9SQ
         Ck3g==
X-Forwarded-Encrypted: i=1; AKwUvBxSVzkCc1NmmZ+orKmWaCSfIjSmdVWXAEvBRy67DUaWE3qamR4qblsWWXYiUa6oGZSEOmOLffS+G2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ndoaF7GjJDdfPw2whczVGnKnJxUzlyMKLGXn8F7MqZs+xc7Nk
	dJLOGKbAgws8bK8GPGnHmNPzvXumEHFNjIhLpRXrOOXwPdrJe6p+nuAtjCUME2Zp63M=
X-Gm-Gg: AYBFou2TXE5IqliqFWmzRMluM0BMK+WRrdvik+D1zxI5StOBcRXbaMPQE7fgSu0vyTl
	GoEifkoLMZbKdbc+lNhgMi4qPUYgyhYaB6g+W1NM9qdRz8KU2aZwX+n+yLsyJ5uP2GXESexeTvi
	+MXN4LnHrDWwrcxT5mhnENnKEepyiqlxqbAqGwqCWn+gNwXB++LPHFBTQ+bxkFICEH4wX4Htda7
	liFb5OHAqpw6XGxtsbpPqPKZqEYoglsGEQIlbC1QQgjK4zFJCN9//4YOvyUNqEzWkVzbSLXHbDC
	GNzD8SOtcM8BBGxY3F8uu1+dRZY7YJkaMQ9ypee7GdZO+JJi5a8WgVUngT3C9tp7obDHQ7U2q98
	BQ/4z3kCCK4Aarcw4L0Dwrx1MAVF5lKo0C02nu/Fana1uKtk9/daLjP5aOcO+MZMGaOQO7dui8D
	wj8upYUcgFVkGYyVZn9v5Zwla/5KdXORu42MjVpLr3PSdFqOGrmsHdxWIH+EFEju4zLR3E39wAL
	Sh85p+kbG8gCGPlJA3H5b/oNYTc3Fm8XcySbQL/ArwfidzfUW0S4vpJfZxw36DV6HztE6R/iLUY
	H03jRz7+JUM72GpnmJMEkVRV3wnDzjehryR/SPnEBG3OOLDNqccLU8jvfCLYOOooAMbPqLCXMxu
	SM0iqTJfT03NInmKHyT1k6pHyxjW0/IE=
X-Received: by 2002:a05:6102:3f9f:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7d2a15715c3mr29296137.15.1793896021174;
        Thu, 05 Nov 2026 08:27:01 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm4667110137.11.2026.11.05.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:27:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP0Il-000000032XP-37xT;
	Thu, 05 Nov 2026 12:26:59 -0400
Date: Thu, 5 Nov 2026 12:26:59 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>,
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261105162659.GB663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <2026110526-aerobics-correct-4c06@gregkh>
 <20261105131856.GA8298@unreal>
 <20261105140352.GF3889730@ziepe.ca>
 <2026110558-tartar-juicy-036a@gregkh>
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
In-Reply-To: <2026110558-tartar-juicy-036a@gregkh>

On Thu, Nov 05, 2026 at 10:43:00AM -0500, Greg Kroah-Hartman wrote:

> > But I supposed Greg is asking about /sys/bus/usb/devices/DEVICE/authorized ..
> 
> Yes, that is exactly what I am asking about.

It looks like that does the same basic idea of delaying driver binding
that this series does. Hopefully Leon can harmonize it to use the
shared trust level flag instead of a usb specific flag and retain all
the uABI around it.

But, even with this v1 the user can choose to use the generic trust
level and ignore the USB specific authorized and get the same
functional outcome.

> And I know there are other types of devices that will want to use this
> type of thing (i.e. SPDM seems to be spreading to other new bus types),
> so it's good to have and get right.

Yes, we are investing alot of time right now in trying to get SPDM
uAPI right when we bring the general framework into the
kernel. Everyone needing SPDM should be able to re-use it.

Jason
