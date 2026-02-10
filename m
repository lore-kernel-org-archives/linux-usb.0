Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC91432B9B1
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704609; cv=none; b=hpFWDC9mrD/Q802cC6XzgFJw4hTL18WDrzAsCf837ec0x4/pdh26nWWYUC1yjPLuhUxcv+2sv6AzeHHpQ0XBGT611mQ02bDarmjpY3PI+HBBZXuJ7Z391PETRDHRV/lludb0nwc3ZAq3vyPoU/s1ddqh7feqKCPpR22Y9M9PHKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704609; c=relaxed/simple;
	bh=vAkD2Y7A3kX2N7NxVpgDP67IrLuf+CkR+cYwyIBTEGo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ejx6CpTWeEN/GR+yi8L3zq8jIyAATcF0O4PNZEvO+yxM5Wt0xr60fp1/d5yzbG5fujgip7sKHep6EViEbLsKwbEgXF09izQP4aM3W9wlZYf4a9T2FG/ORLT+jQQj1s7Z/YtGcU7+oXQCOnO3UNxvD1s647hIEpzlDn8DIsHDotI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wp4Lu1hQ; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wp4Lu1hQ"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770704594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pi7LgHt89ZeNTeQkWsRlsUpjNQmreE7zjeBsTGPhing=;
	b=wp4Lu1hQiCozVcyhh/FpdV+vgG8UXf8D872DxmZl0PGOPV7/3FPpF7HOn7C9jvNE2ywfgd
	L8E4VAv2/EFSdypKiRJ79gFyNbaXQOGVFf0KgnhDL91gCOWHDA/sTWQ28vQ9bHumk1gdZI
	EzCsjdpdqs6tr+u/gzJmjx/cpv8s3+Q=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 14:23:06 +0800
Message-Id: <DGB2E17NBWO2.544ZZ15AEBLC@linux.dev>
Cc: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH v4 0/5] Add onboard-dev USB hub host managed vbus
 handling support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Marco Felsch" <m.felsch@pengutronix.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Fabio Estevam" <festevam@gmail.com>, "Matthias Kaehlcke"
 <mka@chromium.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>
References: <20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de>
In-Reply-To: <20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

On Fri Sep 12, 2025 at 4:22 AM CST, Marco Felsch wrote:
> Hi,
>
> the whole purpose of this series is to make it possible to control the
> USB VBUS regulators of an USB hub via host managed regulators.
>
> Regards,
>   Marco
>
> ---
> Changes in v4:
> - dt-bindings: change to vbus-supply and shift doc to usb-device.yaml
> - onboard_dev: make use of new regulator API to parse child device
>                regulators.
> - onboard_dev: drop hard coded downstream port number and make it more
>                dynamic
> - onboard_dev: drop limiting support to SMSC hubs
> - Link to v3: https://lore.kernel.org/r/20250821-v6-16-topic-usb-onboard-=
dev-v3-0-6d2b38a5d818@pengutronix.de
>
> Changes in v3:
> - fix dt-bindings issues
> - Link to v2: https://lore.kernel.org/all/20250327172803.3404615-1-m.fels=
ch@pengutronix.de/
>
> Changes in v2:
> - fix compile time errors in case the module builds
> - Link to v1: https://lore.kernel.org/all/20240807-b4-v6-10-topic-usb-onb=
oard-dev-v1-0-f33ce21353c9@pengutronix.de/
>
> ---
> Marco Felsch (5):
>       usb: port: track the disabled state
>       usb: hub: add infrastructure to pass onboard_dev port features
>       dt-bindings: usb: usb-device: add usb hub port vbus-supply suppport
>       dt-bindings: usb: microchip,usb2514: add vbus-supply example
>       usb: misc: onboard_dev: add hub downstream port host vbus-supply ha=
ndling
>
>  .../devicetree/bindings/usb/microchip,usb2514.yaml |   7 ++
>  .../devicetree/bindings/usb/usb-device.yaml        |   6 ++
>  drivers/usb/core/hub.c                             |  55 +++++++++-
>  drivers/usb/core/hub.h                             |   4 +
>  drivers/usb/core/port.c                            |   6 ++
>  drivers/usb/misc/onboard_usb_dev.c                 | 117 +++++++++++++++=
++++++
>  include/linux/usb.h                                |   3 +
>  7 files changed, 196 insertions(+), 2 deletions(-)
> ---
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> change-id: 20250821-v6-16-topic-usb-onboard-dev-b8d4d1d8a086
>
> Best regards,

Hi Marco,

I'm checking in to ask about the status of this patch series.

We are currently working on the Spacemit K1 SoC and we have a use case
that requires onboard_dev to manage the USB VBUS regulator. This series
would be very helpful for us :)

Link: https://lore.kernel.org/all/DG8QBWSJ79MP.2MVIHFRBX3WXX@linux.dev/

Best regards,
Ze Huang
