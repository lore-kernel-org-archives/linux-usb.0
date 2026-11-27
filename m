Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786037;
	b=Ae2fUi/ljgTzh1uS5h+Dag3CV8KjGCjz5yOrWM+/UTj/wXkBtyGnsejuSOTq8N40WL8x
	 mPk3y3KOx8ZAj+UAcEAG6nCQNagfirN6eSHfFudqtSVuvJluQ1nhjVHRN7J+2b0xCsH+G
	 RtHp41Qwa419By65ROgMg0+hlv5Nuar39eHK3ULB/jRxOr/MPtTCIyuzJb0dGFyK5b70q
	 CQRVQEkPqNg7AoNZ9JVyWUwdmsMy4gkArfXSiM6gJP1RMXTftJHQ+JuCaR23iXCDdyjNL
	 lytbsRK6mYSI9a57sQ0Rj6HcEnNKOY0rwVXKqUIJtWpOXmehXHSHEx1Hd4JZ/sDR5Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786037;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+cC6jkt0fs1aVmCVuZjyI9Aox+sP11O0eJ64+3URhyE=;
	b=AqxCQKbOwOAyoPvU2HNaBOsHJsVIXM7aU5eHjRdretMlu7919EEOCrc3LW8JSf9zZS3n
	 BAMUzzfVVvIkdQ3xbYdSSlaGzvEmJ8QUm7v644b9xU+QfeJF9yHMaGE4S2qgg8s4rVH69
	 jJEUPeqS4YAnFS+HxX/dD6HC/kdTvl/cRbI6fOIbnblqTYFrMvBLnbELuGrU/UOb8vu1k
	 HgzckG7gyk7zC/jaamdg4fAlcwLxwwl8MZisWlmfc9cQZ67yvSQ/MfzjybANy2c7uC6Da
	 HPPqcmfuIk6bNFU5keD47C3TpmxtZaVh2Zn6wGrurCgk9iI/V6nYQobWNizuG1qC1mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvNuWl3O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E46606A31C;
	Fri, 27 Nov 2026 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvNuWl3O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627091F00898;
	Fri, 27 Nov 2026 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786036;
	bh=+cC6jkt0fs1aVmCVuZjyI9Aox+sP11O0eJ64+3URhyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kvNuWl3OBMwGIYW+yMrfBJE4TlWvI0SZQqSbkeTnLZR8VI5GAfXNspra1+OcgXlra
	 q2GQDiXdsHNhpjj8FAPbBTxuYUk18+5cpiB/F5UDyyVEl/kvv/au7TwOOON6AhGTp+
	 fBcdCTJrNzr8jZXpJttopJfnokoYnrikbBOgcp7cphW1LdsC/At7/ql7BYvCS9Jq3A
	 YDogAQjToCfvRJbS+8EniMobRDdaRGYQoMF/V0KNmDSWqPsf6NdrsalsLXghFzque5
	 NrV7mWIQUrruoxvJzR0f/6ApDD+0GjGYxwUL6/EJsiX0WUotJbv9/n0gzOq+QgtgQl
	 QU/y4xXTCtYWQ==
Received: from johan by xi.lan with local (Exim 4.100.2)
	(envelope-from <johan@kernel.org>)
	id 1xWvyr-000000024Px-42P0;
	Fri, 27 Nov 2026 14:27:13 +0100
Date: Fri, 27 Nov 2026 14:27:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Adam Simonelli <adamsimonelli@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] USB: serial: visor: add vendor/device IDs for
 PalmSource devices from inf file
Message-ID: <awmFMRGA_DXdbiLZ@hovoldconsulting.com>
References: <20261110033452.306269-1-adamsimonelli@gmail.com>
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
In-Reply-To: <20261110033452.306269-1-adamsimonelli@gmail.com>

On Mon, Nov 09, 2026 at 10:34:52PM -0500, Adam Simonelli wrote:
> PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource 'devices'.
> 
> Vendor ID 0x13e8 in the inf file indicates PalmSource as the vendor.
> 
> PALMSOURCE_DEVICE_1_ID (0x0600) appears to indicate PalmOS 6.0 Cobalt. No
> devices were actually released with PalmOS Cobalt, but a development ROM from
> a Tungsten T3 made its way onto the Internet. This ROM can now be loaded and
> booted into RAM on a T3, which once loaded, the T3 now presents this deviceid.
> 
> PALMSOURCE_DEVICE_2_ID (0xff00) is just included for completeness since the
> INF file from the driver also defines this one.

I try to avoid adding ids for devices that no one has.

Can you please drop the second id from the patch and just mention it in
the commit message instead?

Johan
