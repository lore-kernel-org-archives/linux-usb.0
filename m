Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B85487CCC
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176823; cv=none; b=PeAlLG4tAobV8KoUvUA6qYXfZVj/uPHqSj5Yz7y4AxXDkVc16bZO5zXPO9iGTsP2t/OoCATfEQAIpRp6WwVufKLzXqIamzsalfzvInYDAnOdTptu5KGloAWmQ2wNXlSoRI5jdMFrm3Nv4SNHXaujabZkhQsaHeh/OgfejYctuMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176823; c=relaxed/simple;
	bh=f7T4XoDuVW89cAkYMVkufdPNfhOaAmDIgSpturUHN74=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YGTvsTSppZj6CvhHJsq9EniBNerU9OzXTv9FO4qb2SeZ56iwOOQFVqyMiHHzKJqnlxCCgIlNjdpil9T7vKaYWqRk4jVh28I0nbRtktWn0H6BJVGr/+e6u5H6axpTonuiNHtHJi+X9Jc5/DJ3FyiPFGOozl34zCZ19DQ7XxjmAiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i79iTkJK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i79iTkJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3DC1F000C4;
	Fri, 16 Oct 2026 18:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792176822;
	bh=f7T4XoDuVW89cAkYMVkufdPNfhOaAmDIgSpturUHN74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i79iTkJKSSD2auDXUagYhQT6cJysAEGf6ETZohM17trEcrqa/lEjWFB8ue2NOnUD6
	 5HpjkiJg4iJcLBjdFpHX6i1/6DaC/2+l/MGkaNhx03xO1kqCjEl6CiUmosu0pB69Ct
	 RAwVugAV0rGsxPioFuWUdTxp+3dYWM5yZh2A5wiwx1PSiSUByWswrFnTqWTXJ+nCCG
	 VOShVriwagQnhtNQwnkIYAXmnz0yU9jLe2uEKN+X8nREdgKFncmH5uuHhBlig+lG/Y
	 bDf/i0F1IveHfpWpNZ/VLKwr3Zg+lQ+zxybNdO1eaxWLSXwYSjsk4Ffj5QLTe3r7iE
	 hdJzt9HwNBX6A==
Message-ID: <sashiko-outbox-174784@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 6/7] usb: gadget: define stub for
 usb_udc_vbus_handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-6-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
 <20261016-b4-rockchip-dwc3-rockchip-glue-v17-6-876f96893e2f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:53:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Platform drivers with optional gadget mode support may want to
> call usb_udc_vbus_handler to properly handle a cable being
> re-plugged.
>=20
> Ensure these drivers can call the function without a hard dependency on
> CONFIG_USB_GADGET or having the ifdef logic in the driver.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-b4-rockchi=
p-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com?part=3D6

