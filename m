Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766213DA5B0
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533845; cv=none; b=gIl+XOWRz0jr0wpTgi1c5xRTsatIl+5/+nDZ79z1w014qqCRcNwO2ZgGRywjRaGCVINp3IlF1lMairt8ajUyRiUWXdOMOwFFstV4/+Qj9RQlD1ryrZyzNz4KCZgx0vHrZIB+NZJexfyh5UU/mEezHSftkIWt8mJ8Akgg2LNJzXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533845; c=relaxed/simple;
	bh=8mWapVgeKTp1ciGQ8feRxWs2x6tLDwWgKo2Z6JEVvkM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PC9bcMAruEHgZF12up6jHHxgoN+YpHflWVw+VaDiYt791ab/XrL3pFX4/OH8COpE6JEpcb02Pgb9SofggiHdxhlAJvU2JcHM5mV7EPmjKmUysmmi5i0rbqvQK8lv7XsO3t4jv4ZaQjIpZWyYF3hyoK2ji7AJZgp1KIZdngTz0Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYaE4THD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYaE4THD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED401F000FF;
	Fri,  9 Oct 2026 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533844;
	bh=04qHtYu67Q+3rOxt3JejZkFDYmVwQrJ4JQm6Cswi7RA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYaE4THDBFiehCuWzwFdS0KebMb9bD3jucD9gRtOc21LXr8AEZ/6dODo+9C43EMKs
	 HuJ9XwogmtJzbiJym2yHrCLnrFkg+lgPUrHLbFB2rVMRyIgbjWlQlDO6Xw75wKgIQ/
	 WTDWmMTOeoCP1oFRkgUBTkjkswWSyv8x57hdVRnAPiBnTnz5/gw3WN6rFZdeQFF9BA
	 EAKKA+ruodoMQU3hrjUjpVu2MdBESSsYAT813bwj0do6GOF15wP3Ul5oGm1SHVBH2w
	 H+Rq85GI8ImRnaNFYpAPZIExzrVNIWoem9ezKMEiWXAfa2EnGpuqWOSz2IemrUFX2I
	 vr9BEti8nFQYQ==
Message-ID: <sashiko-outbox-165069@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 09/10] r8152: extract rtl_fc_pause_pkt_en()
 and apply it to RTL8156/8157/8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-10-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-10-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The flow-control configuration keeps the device from sending pause
> frames without limit. Only RTL8156B (VER_12/13/15) got the full
> sequence from r8156b_init(). RTL8156A (VER_10/11) toggled
> FC_PATCH_TASK in rtl8156_enable() without the FC timer and
> FLOW_CTRL_PATCH_OPT setup that has to precede it, and RTL8157/RTL8159
> (VER_16/17) got no flow-control configuration at all, so they could
> keep sending pause frames indefinitely.
>=20
> Collect the per-family sequence into rtl_fc_pause_pkt_en() and call
> it for all of them.
>=20
> - VER_10/11: the FC timer + FLOW_CTRL_PATCH_OPT sequence that
>   RTL8153B (VER_09) already runs from its pre_fw/post_fw hooks,
>   applied directly instead.
>=20
> [ ... ]
>=20
> Fixes: 195aae321c82 ("r8152: support new chips")
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D9

