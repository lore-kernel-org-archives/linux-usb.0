Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504542;
	b=loKHqbGJdfn4bpWCUlIbIT/CLJtWYDad2BR4RMnHzvM+jDKEZLUEYdCz68ZNAsX6756p
	 4GQnm74Oj+qdkszyjC4HGu75DgfT5kRJGBgRNHXLKQayTyxDX9IG0Dawd/e9/8GDh+7mb
	 giMcKQpD8Aak1RXJD4wayEKldlT2Kl71BQ2GA4V2kAV3ZtBu6MDA1fr1SIEuYWl0evQla
	 6ww396tRuY48Ygvlq16QRNv0EXFkz0AEmzvywz3BpbIwkkUMFVJA5ozM+lNOcrCW+KaXF
	 BvqK2XdRcMe9gcOlpDYVGM9bWTdjP2F0nKgDjTlNgYCn6r5ey+mm8HhRh7X5HaoZ5Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504542;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=/bzHgQhN+yFXipG+x/f4PXim0QXiuDvsgUduqFPkHKo=;
	b=0+0B8IWAhZhq+P6A4NFfmKrLZmAcVz4fR7mYW3Ehff3v/oZlMkDzYfcHwi4l/tfbnK/U
	 TFoBMbo5qmtCbiygWp6ZXDVQQnu+I/YMiHcl2/Of9j9SsogMSQrGA5gxj/PV5lEVPat3G
	 5d0dkxBi6hXPjdqTROTgNKU83wNhXV3IUpnKufed30K2FLS2yD5NMmtNOfGrgyk8M4pVr
	 Dmw3TwPU1hIn18j/DeEnc7hIsQ6Q+G3XxcMthZgHuE03E7/jJrsUAjT48oIhrA7HWjwB1
	 TZ2SrfgP2qbs8nSX3qSResrmbU5Z7cBwlBQxSAT/8FBpJuDPhl4cfaPNf9YtZxTGNTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCyeSVdW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ADC606A32A;
	Tue, 24 Nov 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCyeSVdW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5661F000CA;
	Tue, 24 Nov 2026 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795504541;
	bh=/bzHgQhN+yFXipG+x/f4PXim0QXiuDvsgUduqFPkHKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SCyeSVdWntK6tSALDO3GKU2KnHXkYMM8jGUnbnPiRC+2teekj7kZ8CeXIAU38RlSZ
	 QWXbmT6AhQWyflEUqbKMmqq3l10IiyoWAQZ7pAQa8SeOHbHHlRj7BleHR8gY69kqFy
	 GCktsNsDCfaNItd0DMGZmQOJF4EarrUuRdXS3QYTpsn6bkhN/ip/E3seyWRUDVZ7r7
	 1KdsGCtbjJW0Sy0doN0gvbePM5P/6UC3/iftgi89VN4SCI+1AEDDcTpB8bW63J/Gr6
	 6fjG8vko4f5euKo7AOyKdl03FemstqddPILxjaOG2pBwQBvKKuPzikc8TOA1EgMlgI
	 dXUC9x9Pincdw==
Date: Tue, 24 Nov 2026 09:15:37 +0200
From: Mika Westerberg <westeri@kernel.org>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 5/8] thunderbolt: Add platform NHI driver
Message-ID: <20261124071537.GB953598@thinkpad>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-6-chunfeng.yun@mediatek.com>
 <sashiko-outbox-229175@kernel.org>
 <059072e15558d6aa74eb046e4d9b260baae09200.camel@mediatek.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <059072e15558d6aa74eb046e4d9b260baae09200.camel@mediatek.com>

Hi,

On Tue, Nov 24, 2026 at 06:37:40AM +0000, Chunfeng Yun (云春峰) wrote:
> On 一, 2026-11-23 at 11:54 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Low] thunderbolt: invalid SPDX license identifier GPL in
> > platform.c
> > --
> > 
> > commit 69e07d737f3ccaa08c0332e46cb3614ab51f29be
> > Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > 
> > thunderbolt: Add platform NHI driver
> > 
> > This commit adds a platform driver for Thunderbolt/USB4 Native Host
> > Interface controllers enumerated via ACPI (ACPI0015), along with
> > support
> > for an optional dedicated wakeup interrupt.
> > 
> > > diff --git a/drivers/thunderbolt/platform.c
> > > b/drivers/thunderbolt/platform.c
> > > new file mode 100644
> > > index 0000000000000..05dd858ac8342
> > > --- /dev/null
> > > +++ b/drivers/thunderbolt/platform.c
> > > @@ -0,0 +1,170 @@
> > > +// SPDX-License-Identifier: GPL
> > 
> > [Severity: Low]
> > Should this SPDX-License-Identifier be GPL-2.0-only (or GPL-2.0)
> > instead
> > of GPL?  Bare "GPL" is a MODULE_LICENSE() string rather than a valid
> > SPDX
> > license identifier in LICENSES/preferred/GPL-2.0, so
> > scripts/spdxcheck.py
> > and scripts/checkpatch.pl will reject it.
> > 
> Hi Mika, 
> 
> do you prefer to use which one? the checkpatch.pl prefer GPL according
> to the patch:
> bf7fbeeae6db module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2"
> bogosity

I prefer what we have now:

// SPDX-License-Identifier: GPL-2.0
