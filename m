Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6703CC32E
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533842; cv=none; b=PIAvKOU3mtsqU4KejPrnREIZAZe+U0fOLWCSVY72/WtnzLsBKoJHvxzCBbO1Hriux+Dpeci6UNaOKVkCCuhRT4SrZLUWc4xZuOEhbKx6vbxzSsv4TplmRA1melb9kGbhUy3zD6yHEVpqPmNaZZ2LgObxl8ON/WjGn4FPVzVYeKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533842; c=relaxed/simple;
	bh=/KR3zfeciMLvzdrcubbd7ZMBK264d8wfJH8IVWdYv3U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FgMM0lxsbUeQIjH8Lbeg/Oqv5oogbBaIa9pDEvGze68Tzvd1WhqQX00qqmeEM41+kUduASypw/eGkTEIWdkgmfgWVw3JRJRzhoTT3frbfOJIN8v5MWvIRHn1g6EuOxQt5Rrj1/f8jHOSr1g7bsQwaHvv1VAw5mU3334T1fAJ0QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIxo8666; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIxo8666"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97831F000FF;
	Fri,  9 Oct 2026 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533841;
	bh=/KR3zfeciMLvzdrcubbd7ZMBK264d8wfJH8IVWdYv3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nIxo8666NqljrFKG7sY9o7rEvuJD1qcN174lrXGdnkev27WKVMK7CqP33XJQeE61J
	 0jtmJf2l2YsO8stRDz0qVOhFikjk0CMLeJe9mo89ljIxxmJENjuiV0C/vT2dWYJt0F
	 F6VFiw7U6s3By9txFzQDlNoq0BQE4cgt0JaC590AHqzMAyz9BbJReyY+6DefRp3A8m
	 qkNyIPSPlY4stiyS8PD27Jfz4ZoWObePecQ2OSq63eCq4pLhkndp9YPRnRGPvm80sz
	 2US3Nx+N9ugFkVjf7jOsgGg8JtTZIkwiiNnA/+yC2N+pujzgyVOpLcoa5iPEwr2Z1L
	 jGv+PsIVvJWkA==
Message-ID: <sashiko-outbox-165064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 07/10] r8152: add rtl8157_unload and
 rtl8157_change_mtu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-8-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-8-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> RTL8157 and RTL8159 used rtl8153_unload() and rtl8156_change_mtu(),
> which program power-cut and MTPS the way earlier chips require. Per
> the datasheet, RTL8157/RTL8159 need r8157_power_cut_en() (already
> used by r8157_init()/r8159_init()) instead of r8153_power_cut_en(),
> and an MTPS scaled from the configured MTU (10K-16K, max_pkt_size /
> 64 capped at 0xff) instead of a fixed MTPS_JUMBO.
>=20
> Add rtl8157_unload(), used only by RTL8157/RTL8159: calls
> r8157_power_cut_en(tp, false), then the Interrupt Mitigation disable
> that rtl8153_unload() used to gate on "tp->version >=3D RTL_VER_16"
> unconditionally, since this function now only runs for those
> versions.
>=20
> Add rtl8157_change_mtu(), also RTL8157/RTL8159-only, and wire it up
> via ops->change_mtu in place of rtl8156_change_mtu().
>=20
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D7

