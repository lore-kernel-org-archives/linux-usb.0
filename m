Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CAD48DB45
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176702; cv=none; b=s3Hz1TOOpD4GhxDm7S0+wqiLrTqFrTs0gH1Cgg3aN9N59O8Y51y5KOjzOuPOHrT5eoevYyr1n638IKYcOqmFqS2VWb5u6ESYrfKsqEV91Jy+ABYZNSHqXNBZYhFTORZbdFVAZVwNFp8R0ZfbEvjO0D5RB9bG+9aRKUfgxp8H9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176702; c=relaxed/simple;
	bh=CvRSpmUMD+xm33NfDCXE2YAqj9uMG3WeLnkWGfPDYLk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Cy+cc9f7lYd5VvPKBlZwsWuddLbDyy/WZ1kst0Ji1gCH81+Puj56ItjhY0CM8IzkT8OB/LZ+5Edzsxn85/EwKQBO6TvgrH9Gmglie7ZTHNOFaEHGEzKRZFE0R3NEKYZzr0lybdD+EfCycnqTQDnKgtCvxD1b1F4O/yYOafe5D9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R70idxbX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R70idxbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9511F000C4;
	Fri, 16 Oct 2026 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792176700;
	bh=CvRSpmUMD+xm33NfDCXE2YAqj9uMG3WeLnkWGfPDYLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R70idxbXX5QPVaSQVZl5sh2amz5ATX4jRK18hpXihaM+vHrbRea5R+L/5jwd93r/2
	 ssGD+73MgYGznX5al2Nmtnoj946ZTuseF3wHmRdP9GF8Xr0KkwdOZjnm1WLhgvioY2
	 ciRJ3H/utk2eylL0f/ywpyOdMYhq5dXjwHQ6zZIgRuRPpS2So8fRp99Rc3Qo+uyCUP
	 QvthFx/OkwWYTNhsghHF3kDiC6AklwSlrH3Im9xYkuWqPXlmHghxfGHSBJeGyjQXw0
	 esNTvxjZRa0ZATu5cusIEOMiK7gZ0OTV2AB8Nfk2CR5QbE07sb93cL4Nw5gN6RKYMO
	 7Fig46e/RMznw==
Message-ID: <sashiko-outbox-174783@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 4/7] usb: dwc3: core: add post PHY registration hook
 for platform glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-4-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
 <20261016-b4-rockchip-dwc3-rockchip-glue-v17-4-876f96893e2f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:51:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add support for custom PHY handling steps in platform glue code
> by adding a post registration hook. This will be used for handling
> PHY reset notifications on the Rockchip platform.
>=20
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-b4-rockchi=
p-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com?part=3D4

