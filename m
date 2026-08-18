Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3637843B6D2;
	Tue, 18 Aug 2026 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045242; cv=none; b=dzxQpIDcZilsPW1cMTbwUz79Czlt6espslnnoCvTZZQhcpcz/ke32L2VWLuZf0uG3xgtVNHEG4lGir+Q57HWZQVCxuuybIjzKbygk4gg8uxwBpjyOtye4UvWwW3fWQJVvbFIGyNA8spR8ayvV/1Phz/RC0E5HQmzOpWmyYluefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045242; c=relaxed/simple;
	bh=Hm5iA7rQ9wRf10t9wWTq1D1NjE/GsevP4mmq3wlK4Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2jw6DB+5sQzv2HO88CrcEFAWr7zN0AEyA/tdMwfdh2kuks0yMl+C25YdcAAoALS6Z8KeGH4CdrodZFVwfTx4QxYesURXbae5MNygcwnpU7PBfbjPW/JnGR/bQn4fBR1ZVqWwrFTgNyGxy5Mb20rbVyhuBJDXx7asatF4M/avBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXKhSwse; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXKhSwse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807891F00A3D;
	Tue, 18 Aug 2026 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787045240;
	bh=pCAeP45dNHcS3g9M4gwt3hWaJQOzRtTIoJ9n13+qIfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXKhSwse5JpUIXXbguePgh5Q4+Wjri1Bk6ZOg8YeaYZemFTg1obCHqVZG2uPbI1Ea
	 zi6eiRfzz5dqkwzZpjf4gRxD5f5DD4tKT/8aBvA4zmkDWwV/BbCO6tOlMONcexyKou
	 g0AfU95Db6jL5E0+9H2sBm2hLkTjUPYtCpN2td0tzyqpLwNaB1ECxjqkGFQ5mWelvw
	 Xn4jH5f6IvgGaQt51GRfoklu1XNSBevKtjELBHLNMiK0+s0c8cIBJ83EHhbHk6IPpk
	 RVz8GwpdEeLJfzDAaR/JqoUfwUQwZRHwbqldpRS7P93yPKEivpwLdNxzy9R/QKCC+L
	 oll2GRe8z2ltQ==
Date: Tue, 18 Aug 2026 11:27:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Message-ID: <h54c2hrcsv3zjzzgojzf5sjmu3vtpobz6rwloam5kp7mwqqn3n@bqjnlellvnz6>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>

On Thu, Aug 13, 2026 at 10:51:43PM +0200, Sebastian Reichel wrote:
> This series does a major overhaul of the Rockchip USBDP driver. The
> initial main goal was to add USB-C DP AltMode support to the RK3576
> and RK3588 and this series still prepares the PHY driver for exactly
> that. But in addition to that I uncovered a huge amount of issues,
> that are fixed along the way. Some of the more interesting ones are:
> 
>  * Currently the driver might trigger a fatal SError on USB-C hotplug,
>    since re-initializing the PHY stops the clocks going to DWC3. If
>    the DWC3 driver tries to access its registers at the same time the
>    system will crash.
>  * The DWC3 hardware can get into a buggy state when the PHY is
>    disabled, which results in the PHY not coming up properly again.
>  * Swithcing the USB-C connector orientation during hotplug breaks
>    USB3 speed, as the PHY is not being re-initialized.
>  * The code always enables DP mode when USB-C is involved.
>  * The driver has some locking issues uncovered by Sashiko.
> 
> In addition to these bigger ones, Sashiko also found a bunch of
> minor problems, which are mostly harmless, but were fixed while
> going at it.
> 

38 patches for a single series is too much to review. Please consider splitting
it up into multiple series not exceeding ~10 patches per series. Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
