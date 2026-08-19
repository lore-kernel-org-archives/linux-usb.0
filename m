Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CC73C1D75;
	Wed, 19 Aug 2026 03:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787110311; cv=none; b=mGeYN2w2joCd67RrMXpsxJ4nQ3SX37n0xCJbNXHHTTpoG/yzwnkpc1ujxUVQ6Zzwz9tFnAv4BsvfDOijzkMBwnPVOnTr2FjZZBe850RIrXuF9uJd9zipuZGp/0H38FnHJ/ykgY8sBYXwFlnKdw7czJSEoE4Fid2iT+7mKyXtpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787110311; c=relaxed/simple;
	bh=sf8LYeIeLSV1yNTk1WTwsx3YWCK9LsjsmNZOOY/x6i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5u1AzYuk5xB9umW3aWwwh+aOkAY49f0rzkFwWSXoPV3XLylD0PUfwZwCzTCnHJGWMlwIYrcaA80QBXclda20ptU26GyoIQ4fRTGDI8QN+Jg5MINKAa2OxJWZgvmLPr1bZFBAz08tkrHKNutUoA7XLhJB3DV+2D+J68RICepFlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kE6DlpN6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kE6DlpN6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097D61F000E9;
	Wed, 19 Aug 2026 03:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787110309;
	bh=UalBPFxKWe525mQfd39B3IwwYujzdCNWKW2ZUj1VaBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kE6DlpN6ORvE9hBR0WEqXrhVrgorQ880nzjV3Z3gYnB8XnlMLNXIFd/g7/GfeA1Sm
	 gZy+pxK7cgTERy6qykXDEMC4l2+212vdWXco7uEK00f8IQPHWvN9qabtqA7HurZXnc
	 aD5N4kF0fplnVCpbGnQ9oOHgXrRO5i7KuAhNPXRSvmShoEiktLEaOdkDMT/rKZ7+IZ
	 9rRm7o0FdW8HbfzqOkzmj5RuqEkDIOWoAqcIBGWnFTyCV+IsCeZcyUnIcPrBk6zx11
	 GfAh9n4QUNIK2SndUvjiX9RSJccWIZHZ9XJ6Qf5DwH2iXGfjp9pUGK3G2IKaLyp4lT
	 ickEg6i7LUdbw==
Date: Wed, 19 Aug 2026 05:31:37 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Yubing Zhang <yubing.zhang@rock-chips.com>, Alexey Charkov <alchark@flipper.net>, 
	Igor Paunovic <royalnet026@gmail.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Message-ID: <kwncmhsrq6sr56rsgf2ng4pc5fvyyqfryp3s2qfskoxunxx7jp@pdq4kedpw4gq>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <h54c2hrcsv3zjzzgojzf5sjmu3vtpobz6rwloam5kp7mwqqn3n@bqjnlellvnz6>
 <aoTMQtpYYw8O-3cj@venus>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoTMQtpYYw8O-3cj@venus>

On Tue, Aug 18, 2026 at 11:42:50PM +0200, Sebastian Reichel wrote:
> Hello Mani,
> 
> On Tue, Aug 18, 2026 at 11:27:07AM +0200, Manivannan Sadhasivam wrote:
> > On Thu, Aug 13, 2026 at 10:51:43PM +0200, Sebastian Reichel wrote:
> > > This series does a major overhaul of the Rockchip USBDP driver. The
> > > initial main goal was to add USB-C DP AltMode support to the RK3576
> > > and RK3588 and this series still prepares the PHY driver for exactly
> > > that. But in addition to that I uncovered a huge amount of issues,
> > > that are fixed along the way. Some of the more interesting ones are:
> > > 
> > >  * Currently the driver might trigger a fatal SError on USB-C hotplug,
> > >    since re-initializing the PHY stops the clocks going to DWC3. If
> > >    the DWC3 driver tries to access its registers at the same time the
> > >    system will crash.
> > >  * The DWC3 hardware can get into a buggy state when the PHY is
> > >    disabled, which results in the PHY not coming up properly again.
> > >  * Swithcing the USB-C connector orientation during hotplug breaks
> > >    USB3 speed, as the PHY is not being re-initialized.
> > >  * The code always enables DP mode when USB-C is involved.
> > >  * The driver has some locking issues uncovered by Sashiko.
> > > 
> > > In addition to these bigger ones, Sashiko also found a bunch of
> > > minor problems, which are mostly harmless, but were fixed while
> > > going at it.
> > 
> > 38 patches for a single series is too much to review. Please
> > consider splitting it up into multiple series not exceeding ~10
> > patches per series. Thanks!
> 
> So let me summarize:
> 
>  - Vinod wants Sashiko feedback to be acted upon

This is fine.

>  - linux-phy does not want series with dependencies ( [0] )

This is not something I expected. I read the reply from Vladimir in [0], and
he seems to be sharing the limitation of the build tool of linux-phy. But I
don't think that's a big deal. Every subsystem allows sending dependent series
as long as the dependency is clearly described in the cover letter and now with
b4. So I don't see why linux-phy should be different. If you combine all patches
in one series, it makes it impossible for a human reviewer to review it
thoroughly.

@vinod: Can you share your view on splitting the series with dependency?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
