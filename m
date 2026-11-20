Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189114;
	b=PQ2YR7usIw/DecRR86cHXC1kYldgPi0ILqw8YmxHNFwqxEEZ0Una+4xxiRTMArgNEC/j
	 HGw/w7jyjvK6M62MPOw/P+Kq3VzZZ8m7ISpgltnkeWVsU3XHotpZYl6W6etOwxj8k0a9W
	 Ax5H9xP0e6nN8q5MYVcKgJY0I5+eJHdmlWGa0aP+Y++yIHQzw159IskQhTpIP0YwNhU8O
	 2O1QkQ+O0/mM4j4p7nevS2g3nDknUr6g4fxn15npzWr6B/F/BROjwS2AGbB0enUpivQ6Y
	 13O6e7B13hqFgdJbl1Umdpr136zjKB8V4l4JSKO+I67VuZ79n3h8ePJpN2XhaDYXp5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189114;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MXF1x7LeNoo/GRfbT1e+mu45xaRXyRT/vqdlcg+km2Y=;
	b=p7Hgu1TVFPlOVGvCuVDujlt9hsIcLNtcVSdyreprBp9cReN6BgV7ZMNSvsyPlL/uwmmr
	 zrg1MeT2fsvkbHRItzjnu3p50Rs95KrxlYzL1m66WFebU+KZqTx2FiF0+ettpYwL/tT9e
	 qf8YYM43HEMVEkoR44/oKqnxRxVHVevroluMWOgmXe9yxT8UYDYEBzuG/qBmWj5APxHdF
	 uH9fmabyzwk1dD3I/hEf3PsOubdtRDPj+0GBxxHbL2uXOGQx5LjTz4w8yyNh8Imbi9L/h
	 ZPQIKMdi17S1+eewmk/0Aj5AXt/zPT8cS/CrfKzhrg4ZwkIRgkl7UapzDvwl/ai9sVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=g7KiVtLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7672606A325;
	Fri, 20 Nov 2026 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=g7KiVtLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756391F000D8;
	Fri, 20 Nov 2026 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795189114;
	bh=MXF1x7LeNoo/GRfbT1e+mu45xaRXyRT/vqdlcg+km2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g7KiVtLxtxmlpGkcHnoibSYQpwg6CMpUKWS9Sj2Mnafs0GlPAHk6jlWR2VDU7noMr
	 zwYm6Y379Ooyc1eFCzYQf06vc0R4RvYolRclopGKZvFX1GPecsxDPpPnOX2Nr3b8mJ
	 TKSoQ1/+mPfrMfwpxM6RiOZ70AT1JnZiEbH2FmaQ=
Date: Fri, 20 Nov 2026 16:38:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yang Siyuan <hsyysy@163.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: phy: generic: request the vbus supply only when
 it is described
Message-ID: <2026112011-macaroni-manatee-e057@gregkh>
References: <20261117091956.12103-1-hsyysy@163.com>
 <20261117094539.13527-1-hsyysy@163.com>
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
In-Reply-To: <20261117094539.13527-1-hsyysy@163.com>

On Tue, Nov 17, 2026 at 05:45:39PM +0800, Yang Siyuan wrote:
> usb_phy_gen_create_phy() unconditionally asks for an exclusive "vbus"
> regulator. The legacy usb_phy_generic platform device registered by USB
> glue drivers (e.g. sunxi MUSB) has no firmware node, so the lookup ends
> up in the dummy-regulator path and the regulator core warns:
> 
>   usb_phy_generic usb_phy_generic.1.auto: dummy supplies not allowed for
>   exclusive requests (id=vbus)
> 
> Only issue the request when the device firmware actually describes a
> vbus-supply, and keep treating -ENODEV as "not present".
> 
> Fixes: 03e607cbb293 ("usb: phy: generic: Get the vbus supply")
> 
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

No blank line after the Fixes: tag please.

thanks,

greg k-h
