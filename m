Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE73DA7F7;
	Wed, 20 May 2026 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275444; cv=none; b=qNYrxgR+A7l8OHdbJqa+vQSSBVo8SR1ZMH/49KIr0XHXIrRIUTjfln46IXkSCKc0HGlGiba6s/EBEr9bto4Wk1+oIyNrs92YY7KbetyGMd4B6OQiIU/U7sCJGl03UcRRItkvD/9TOGTHTodsx1J8Q2iqCgNMHFuJ1DR8OAOhX88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275444; c=relaxed/simple;
	bh=urNxKPGArF5/uTgaPa+k4PcGuCAQEVtkDFM7il0mF14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+/KTiecmFzTnxQ0++2tejBuGgc7Gg4JZNcNcvvYDjHRcQbHUNFyjNyYDbL2Y/oacXYyI96LHIGGK4mI6b21sa+BZ12XrwsrC4r2gI0Ci8NbIy2dOaoTwqh764Flfz5e+4HAZyK1q+f8EM9onrAdOBJK1X6bYx570XwGWNDsj70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=c9zO4kaB; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="c9zO4kaB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=urNxKPGArF5/uTgaPa+k4PcGuCAQEVtkDFM7il0mF14=; b=c9zO4kaBgtHWE3EXKJ7sC33Ape
	m4r4WQipdjvV3iIwLY1TcpQ/3SywEXsmlz9NgdprgAJuiVgln3Jy2il1xoPrrPLIacyWwOuzSIdEC
	RS2uhyuw9P2DY264i7zglkCbxfJ7Afw8dsYB65aZuetdY0UfXriEM8YOuI1CoeC+3G47WGF7E0IQN
	Fv84/KypCryGkVYuyixbU8Yw3ZQE5bp66AiyfHMwJvXNmrkRdGJSVfxoNCtT3STcQDnYu/F2qWvAr
	Uug6x0hVPZTeRpEaZ0sBdK6eJQN7CC8AyC8yleUjnUto4JGDSc77qZwRwRWBHVqvNfGf3xop+uC2x
	Y0z9JN2g==;
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
 Re: [PATCH v15 6/9] drm/rockchip: cdn-dp: Support handle lane info without
 extcon
Date: Wed, 20 May 2026 13:10:19 +0200
Message-ID: <8662323.tM3a2QDmDi@phil>
In-Reply-To: <20260304094152.92-7-kernel@airkyi.com>
References:
 <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-7-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 4. M=C3=A4rz 2026, 10:41:49 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> This patch add support for get PHY lane info without help of extcon.
>=20
> There is no extcon needed if the Type-C controller is present. In this
> case, the lane info can be get from PHY instead of extcon.
>=20
> The extcon device should still be supported if Type-C controller is
> not present.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



