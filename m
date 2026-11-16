Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844785;
	b=vau+x9h3iR19K9bClWDvZPtYkWaHo9Ng8fMg7WcRKJ60EvQtuhMTOtyFuuYhiT6nRsUb
	 f13jg+kOXD9I4acXz+X/ztArGhWC6OEljhHAGUcmqAWID5FNMndG5cObw4v2bBB5e4TuS
	 0wQJzFfkQDMAZdXzUIfg3padZie+eqz83+BAZJ5/k8e835o/z7qwpjl/0mLRc6bMLDO0Z
	 I/Yn6tGeE5hcff/ve3e3IU6r65PaYvI5uKA3EPd/FMqUT5ev2N//E7P2plJ7C07+fkSIF
	 aTZ/4JIqNNi82DF/mPF85a8OtBCn471va+ljbZY/WBCFSWEk01goi/bVeg1Rh7xrlgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
	b=HNX9LDcxaGw+4m3uJU1W/aOCO0q7zQDeU9sOqkrXZ6maecASIaMBaDdwPQzfoHfja3Nn
	 SskiizuNEqWJjg0sa/Bv0gHPAeq6ip0GSFK6cpUIgIb+fZymyuA+ldH71Pju+6nvLrSat
	 N5STCjM98a/4DzSBVedwonGeHmRokRcSD+nN/aZT+jwmkwGQXZs8J6NTeRa7KPfHggl1o
	 7z0lsCCgGiUmGMSI/3qe8rndyWrD4kcbln+1ZYj0JDk0QvE0MTRLLceLtrqEwiV4SoUAw
	 Wi2YDDnymBLb/5THhyxmSuuZCM33VLo1f9Z5nxq+oaH37796vtTbzz3fZKa464UhMMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="T4EaFVj/";
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543E606A32F
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0543E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=T4EaFVj/
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso56873916d6.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794844784; x=1795449584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=T4EaFVj/Db2Oh0QQIN6fEsneaLWasSmYdaomNevHcWQV9XfC0eku9uiWRA8yiTc/gq
         beN2zhlEBUDpPwvlJXNnJXYG7SLeGP2RUl/CIxz8vHb+CRPGvwOGP84P37zc/ASqwdCv
         a2ZImH/j9PEIljcRTrH9YjQx1m9XzvHX9w4v1GGAYhpr16oDLUf0JwGEJPe+tOCosZjE
         d53ULE5uBklWCIuWvycUfx9hIvJ8w6anXEcNacgC3MbLl4k/Apkhq6kLpk0rmKpAkcTv
         Trqjo9GQ8ASe6EH/m27mrq6sK/GeD3Uc4wVkpatMXBaBSojYeEkRpq+DgrGx3awVmJv/
         hg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844784; x=1795449584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=MWC4XOcIhabtZDpDoIVvscUr8MmnlwzOk2UIJY+NKyBwRjNahqqsbXxuk00cFXuCJO
         rFZ0JwOoCGroXamie8Inn+AYP8RRYOCIRxwjNgPXBQ7k2cLH2lD60GLQRlqq5CRsAa5u
         MuIXg6AwCcoOBM/FF1GwvZu+z3XEGWS3GGZqlv8JODd0lfSl9AG1ErLcQZx2zDOyYK0E
         cOj+S84U18qLrqz2SxEc3Cji64H+pzWnOm1Hu2o6fAHeSrlyaNY7Wt/lku1pmgZbjRFZ
         bc3UGwLjQYPjRFTc3LN6QEyDsJj9/v5gpuNQs2hU6b5sKu3xwA43FXfU+jx8azE3MYf1
         Wv6A==
X-Forwarded-Encrypted: i=1; AL+hErGfjUgE3inEbvKmoO+awkItQpKf1NN3RjJf2xCmecjiRC4w+BgcdlQzdm9Q3EKv9HJKX2DNjPqoyrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T4dvqGZP07piEVQumnsReVNJUf+/7CDFX5Pnur6k3vU77XgnP
	SkhJX13Nt/e9kHORwQ6x8wgAIdnWEdQcFeq/9CEKdWho4jtt3XtYT7zn2rfvt9tjUpE=
X-Gm-Gg: AZFdTZf5VMJbUqGq/dAzi4cTpppDFbOQxCRnroBow5fbtP+yfn+D+mKHeI7BD5mPaTa
	P54P1TdykSNjVJeJuNMy1yZ9jz7SoD1MKwz9ErEmOdte0hWD8c6OnU9P2zH6rk1KncxEj3wjqYj
	xJmm83wjgtlqFNYg1IiF+hN+/+xhVFBUvA1QX2CcqLlE+vkKnFiu6tElY3nQYkQOywmCyEJwinD
	UaSzyllRsFS41jugGDQSalUPwUp7xs3QwILSHP54QCD1GOu7Y1/+w2ON0NZRseC0aBVxsxMr6IT
	xBgNopjXZ+ATesINv6yriDki95g9vEz0iprYgVfYNmZPxh27ykzisjeLIxMxqHO8AhiRuXZD1/p
	w0KZ+VatMzQhWW8Hp0YpyYpe4AOdwqUQ5jO7qG1F9ytJaT20WbEOsB5SMVeixJ6PmBa1AzzMdEL
	ABULKxoT94KtUgrBhYiHCasV2JvTIzOEDP59bzKi4x6SdWVgRrLPZa+9t7fqKyLFIyHk9Ql72C4
	Hv92y2ZkQ8BWYfJPlWhsrOnP5iI2LahMf4ak3OtXiJu3b1D4QhXimJDvmE6bWx8bCOq4Zp2Vfwg
	/KMCzg==
X-Received: by 2002:a05:6214:2467:b0:91c:7f1f:2c9e with SMTP id 6a1803df08f44-91f24209db6mr171122396d6.55.1794844783992;
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d93f10sm87735096d6.30.2026.11.16.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSz7O-00000009eOI-3Mx3;
	Mon, 16 Nov 2026 11:59:42 -0400
Date: Mon, 16 Nov 2026 11:59:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261116155942.GA2299285@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <yq5aa4n8ydsk.fsf@kernel.org>
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
In-Reply-To: <yq5aa4n8ydsk.fsf@kernel.org>

On Mon, Nov 16, 2026 at 09:22:11PM +0530, Aneesh Kumar K.V wrote:
> > Once you turn on TDISP you effectively activate DMA, just like turning
> > on the IOMMU.
> 
> We considered two options for doing this:
> 
> 1. Via the ->accept() callback in pci_tsm_ops.
> 2. Via pci_dma_configure(), based on a combination of device trust and device acceptance.
> 
> If I understand correctly, you are suggesting that we stick with the
> former?

It should still be done in #2, just with nothing to do with device
trust.

You can't run a TDISP run device at all if DMA_ENABLE is not done,
there is no half step here so it has nothing to do with device trust.

Jason
