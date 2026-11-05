Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898126;
	b=D93rQG/dAE7wbYuuFz9MFx5XwMa0gLQ6R/61LoytwQsrpCrKaWs0S4oz8nR4SlN7Ir7L
	 Y2Ys6jMhLhrT9cveCcflCGhXuZ/4CXAFrBv+JJtdHpbEzF3dtKE9lVT5v3cz+nIxXZhnU
	 9C9Z46ifdFUx57A3jJvya5Gr0VbaJuhb68HXOYaV+O7ivXCFNLM1vpY5QxaMh1RvaG3dx
	 Qs+0Ilk5pgie4/MdcvGnhIdZff6d5GC3CHFnQwgxArUvZ/vPLi24D1u1I6DfvldkyGdQA
	 ScEYEfm5kRcLnzyfIatV5vJS3Dkbbd5RHkqUxZCmHnezQUgHsQMMMXFD5mlerrFj6KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
	b=k7BLqbBSfjf4GKxfNT1eprI/CwP8yaM0VcOmucEF5XrRIxoaGhl8HsK/XzzZrnRN/jHX
	 nRg9bj6YJHu+YAuIBoQ0jQ1NeCKvsPz/6zGcp5gAxb4pwqiqVJ07HqfCIjZwJ+M61VxUC
	 Lp1FEwomYiTIT1E0gO20Xj3Z+gnACu9lU8gHbW0IS4z3gtautZ5TDqYLeBW+vAbWdInlf
	 AHtzyP+VZmbsnXQxYqsFrPZ8UK9qvzJq24DnMDO2DeOBMRZhWyeEtydR7fPzenyP3Vby9
	 knIfWw24Pl9ZwrXfp+nmczYUY1Eexq09Z8KQ9LG4BXFQbZZd9Zd1jgyGav/bD/FNghg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="UT/D8aSt";
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A85606A32E
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A85606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UT/D8aSt
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc365db987so1379058137.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 09:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793898125; x=1794502925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
        b=UT/D8aStYb7dPEp/Z1PTR1znD76pBm0Z1nPlORuFlgDbzwSX/aHEaMIKgxREgduhMs
         7b184i+9WuyWU3kP4ECdvxL5tqJCBp+sE58xftFr07RVMuYSe2D0AHX1L8wkHJuC4lcP
         6d7IEtulMVc64pTkfBc/dFTnsuyCXdHVpF//V/K2Xgp9mPmSNI4/p7tLi2H5V42yljeY
         GtO1ChQ2JjqDeaKC4B9biWxL+z3aUuPX/f+FWBrD4U/FW4Q80YjAWhMK/Up13oskn2O3
         3V6ObKXKjzYpPS1tL8mHYVexmV3sD/kfJUj7ToJWfvaytzTBimAL6fO0bssiuf+AQf9l
         4B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898125; x=1794502925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
        b=m47VtCJs+sxmhf/f8kEOayxCVvNlO1ewRJB65wvyz3tvwupfHamEp+JFnmazdRYrY9
         wqQcHlNB8l5Gj1HewR25GRq5U16zPePAXSOKwAkmYgNBnQT6AuY4dlHK1JGvNe8Ac5qo
         Ve8vEZBc9lt3bWxEdThAtR4WbpoV0pDw6SYl+HW2daJY+ZR9Q1ziqvyNumNs2ozSU48k
         Tp2+MMR1gDSrt9j+Taa5RRrZXqgKktGXerXCTxkPuBS3VRnqDR0LbQnGcOKqu0Yh7yJs
         /lnd0kXhYkiv1765AtKnJIEhBFaHGKfQISOJCP8iy6myYt8Rsbg/7CZkixJ4tPnEPqpu
         9Sbw==
X-Forwarded-Encrypted: i=1; AKwUvBzubj4wLlpTTnGHJpmbO8B5wWk4izgD5cbmXkFjk+15my0v6aSXH0Tgl+DnvqIE+n+cEbX9AZWRPFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/myJoio8WuvspdMkW+rOUUHSidYf4t6/uAsNVK1+bdkGdyy5Dw
	GLpKaVlmVkXRqeIoxqRoJ8r3du5c+ybreY/aM6aSrEzhK1AiLstEz/EhpvlYcphFkHo=
X-Gm-Gg: AYBFou1DruzHncsCjUEXCexiG6rWyKwiNXzQIqa1lkYVQPI50CttBizU+Q0vX/4F1or
	6rNyJXXgwl40gwEnfwehQ4CpMpOQIAKKQrzqO0ZRdugFKd+xyoPkmAsyOgsGe/Fq20TkgmLIRgD
	9j2UX/bZTYw/lc82DMwFLHEoQweDCt7axVV7gjqBdrXYzUoaGNdbIohRrCWJ3leurrTLLSLbU4C
	a9j4yO1ih2hc2zrh3h20dUNR4QEwznXwJCgTz8+NAorBWjonASllYGyV31IzVu1zU6qbU4UQt9L
	lH9naSyGVVOgvcGJMVilAntbh2GLKNRnnK1+7e/MtpQ9LWig/AoOnabA1du/5MEI2VG1dxHtyf+
	uspmBn7uaA/RzmEi0yWhCgL65jpE49bwPH68F0qmD5nSjVedUKUlwTFld56SgdhoZSg+zz66gP6
	eg5MmHne2UlRqHkQQCDOHPTpr3FYpN/9jJq4GVQ3IlZm5uFLLA+ddbjDJRmLcamYr+ehc23dy/N
	hC55L3egBBWttyTVSiXS0GNPwP0u3+q3qzwJp4I46EkOv1sjvq4XCvi/W8v9syx4fy5oAKDNa/V
	uEI58H2he7nMrsCFczRtwVtj1uubBnTqPqVjPCScu6Yrd8SXZbdwcJkAOCc8kWCX5G6HTyFuCPf
	E4Op1yNcEUUCbUn1+2tK/DUERxyhyjIU=
X-Received: by 2002:a05:6102:2c1b:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7d2a16c7f35mr120203137.33.1793898124846;
        Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm4619225137.3.2026.11.05.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP0qh-0000000388I-28Zd;
	Thu, 05 Nov 2026 13:02:03 -0400
Date: Thu, 5 Nov 2026 13:02:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
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
	iommu@lists.linux.dev
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105170203.GC663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
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
In-Reply-To: <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:23PM +0200, Leon Romanovsky wrote:
> +		(RW) The requested trust policy for the device. The initial
> +		value may be selected by the bus before the device is
> +		registered; otherwise it is "default". The policy is resolved
> +		to an active trust level before the device is probed.
> +
> +		The values are "default", "disabled", "adversary", and
> +		"full". "default" lets the bus select the active trust level.
> +		"disabled" prevents a functional driver from binding.

For making this more general:

"disabled" prevents a driver from binding and informs the kernel to
provide containment of the device. For example a PCIe device should be
unable to DMA to memory.

> +		"adversary" requests operation with the restrictions that the
> +		bus and DMA layers can enforce for a potentially malicious
> +		device; it does not isolate DMA by itself. "full" requests
> +		normal operation.


"adversary" informs the kernel that the userspace wants to opt into
any security defenses the kernel may have to restrict and further
validate interactions with the device. This may have a performance or
functional cost compared to "full". As an example the DMA API and
IOMMU layers will avoid exposing unrelated nearby memory to the device
during DMA.

> +		Successful resolution to an allowed level commits policy
> +		and operating level before driver or DMA setup. Both remain

"before driver startup"

> +		fixed for the device object's lifetime, including through
> +		failed or deferred probes, unbind, reset, and driver reload.
> +		Later binds must resolve to the same level, including when
> +		the policy is "default". A resolver error or disabled result
> +		before commitment leaves the policy's writability unchanged.

Not sure what "resolver error" is.

Jason
