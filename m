Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3C53D1CA2;
	Wed, 20 May 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275211; cv=none; b=dQqMLVSpCY/2y8c+Q80VnHoQpzgXjN6uiyjf/Iq+J9B69OgvasXCjVxGQ2oly8Qw3nNv3UXqjpYeTXNXGmxOU0EohvQ6vShIBYCnTKqQqedolRDERk+sUYCo1Z3lUwqEAAbFVrLbtW3tlTyAuiFQa1RmtSIqZUsQxosp2hGZ2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275211; c=relaxed/simple;
	bh=4DQ+Z2QTK6zf/R0PR67dSNm2gN4T+XP+6ofTVJ0EgWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EcxPVybwQlJEN15MeEN6k1XPzmz4kd5cLctZcgLKDsHEFp5fX9FVezcQuVSm15f5nSWKDXETGsh2+TA6dUee/YnC8XaMxRSZu1PRXNF0CEOQRYu/JfJE0MarhUHNpAAzodkjegkJk6D9cdZHVBvCQTl1ghiw8zITUPoKHOPDktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=h34rCyzW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="h34rCyzW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4DQ+Z2QTK6zf/R0PR67dSNm2gN4T+XP+6ofTVJ0EgWM=; b=h34rCyzWSizvdmYrJY3LtxwPYf
	6pcft3/GMrE2vVjZLMAslEGwIUN3u9xI8wipRucHSb8LfUZBTGbVxC+YnMgxGQb8avEKbPxDPH0WU
	4DI2wOdWO+b3zzpMwLI9maETh439DnARe1LRJv19uMYYyL2k6scDPI8YaLz4sx22kHRmlgVorC80t
	dTyKbHJi/jngreltubMgNqJRiVmbHrLT+ML6vdMantBMP1cHBQedw0fegH+4LCRk15gk5UtF4ttCk
	E/B6meFzp2AgJDqNyRQteeKEB7Ye6ZoP2Iz/wuZ4lrk9Ct1LoIEv+EdMflwG0h69/gZy4uk6CqAUU
	/epKFH4A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject:
 Re: [PATCH v15 9/9] arm64: dts: rockchip: rk3399-evb-ind: Add support for
 DisplayPort
Date: Wed, 20 May 2026 13:06:16 +0200
Message-ID: <4056242.GUh0CODmnK@phil>
In-Reply-To: <20260304094152.92-10-kernel@airkyi.com>
References:
 <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-10-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 4. M=C3=A4rz 2026, 10:41:52 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> The RK3399 EVB IND board has a Type-C interface DisplayPort.
> It use fusb302 chip as Type-C controller.
>=20
> fusb302 chip ---> USB/DP PHY0 <----> CDN-DP controller
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Apart from what I replied to the cover-letter, it might be
nice to split this into
=2D patch adding the fusb and general type-c parts
=2D patch adding the dp altmode

To make each part a bit shorter.


Heiko



