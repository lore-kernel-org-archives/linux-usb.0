Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843383;
	b=wO1bLalOzB3e1Srb2zB9nLe/qCanmSUoakcAdIq1JM2HYD1IfWfrUN8o+6vbC8zxjbTM
	 SAy5d3keAKnc+iMheuXAJQ/MalW9u41Ni2M1uxtd/kpsTEe8K1Cknpic0hx2a0FqWzmzu
	 PXVIbQM6mzxJBJTWJGp0hcCYXtVybfaipPuqLn0FMy1arWapEiZZ2VUaeQIca08gUQ9SH
	 Bv9EapevTcSc9Baf2JpTow7+qfAv1hnlLStXXevn1I+Ki4mjBSWaJW5zj6lOu2PCecxGd
	 8b11rPmQkuXiNXMd8ckhkElq3di0jhXdN9Z98swu4FArWmo8LHyKtRrSuyPkbYDzZxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843383;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fu0vGzZttqOFsgF/YIvQVMH1kv2wSUrfZv3T195PlFk=;
	b=kryCPX+44McBaP63gnIICXMtyBHwAV1E4j6OtomE19mF186F0HQ2g2GEVr65gNR2LgDH
	 IEqb3zIC3381SH5BtKyCuddYMgBqkIPBJ96RLQiwBnN8uBjtXRVXIpafpY6e6zdMPkhjX
	 9HZq7B8CniQeE84KZTY54tbHQADLUxkpyXajJinar1nua+i+hKnCxDW10M4aDQbVinn21
	 ctHESDuBks8dR9ns8WPC4kea7HLVpUu/XTQq/Y9mS3XlvpzvruQMa0jcWNHYP8VcvtRG0
	 JzjRjks1rFfGIGIju/Tu6fFvyud4N9ipwSyzMkemTGTcr8eF32IShrkd2CecOsKq05w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6qJfwWV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CDE606A329
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6qJfwWV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADC91F000C4;
	Mon, 16 Nov 2026 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843382;
	bh=Fu0vGzZttqOFsgF/YIvQVMH1kv2wSUrfZv3T195PlFk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M6qJfwWVi3wP86AVz0Lavq3c+LvjdKu5DgkaotW4TUFpcxYBVEPwIuUQso2iYTAXa
	 scCsLjuX52AMcwu+GkrctmGpLXjnEX8wMyetDLIreBzD5zrIAYK420drRCh2vN6Yup
	 L6wbOPwMK+Xit7cjTz5R1GII3aufZdEPuhFCbs4CtBX7WYAYAVgFqGuhIpTo1b5Zhp
	 WInwBSfUMSdSD5fArjTOlMVR4toAWx2/wKuEsMA6tw1w/ZUOARNg4Ts5vTXYAXlk0S
	 67ZMUpNu5Mv19AN7M9yoUvxZ0ryUlKIo8ZNwQsizWN8b1+o+GP0mqB5TMCjxQBXtAg
	 WqMS2nOiACt5Q==
Message-ID: <sashiko-outbox-217302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] usb: xhci: tegra: Add support for Tegra238
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-6-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-6-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:36:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add XHCI support for the Tegra238 SoC which is similar to the Tegra234
> XHCI but only supports 3 USB2 and 3 USB3 ports compared to the 4 USB2
> and 4 USB3 ports on Tegra234.
>=20
> Unlike other Tegra devices, Tegra238 does not have powergates for the
> USB host and Superspeed controllers and so for Tegra238 it is only
> necessary to manage the resets for these controllers. Add a
> 'has_powergates' variable to the SoC data to indicate if the Tegra
> device supports powergates for the USB host and Superspeed devices.
> For Tegra238 the driver uses devm_reset_control_get_shared() to
> obtain the 'xusb_ss' reset because it is shared with the Tegra XUDC
> driver.
>=20
> Handle host and superspeed resets independently. During deactivation,
> attempt both assertions without rollback so a host reset failure does
> not retain the shared superspeed reset vote. During activation, deassert
> host before superspeed and unwind failed deassertions to keep the shared
> reset count balanced.
>=20
> Finally, rename the functions tegra_xusb_powergate_partitions and
> tegra_xusb_unpowergate_partitions as tegra_xusb_deactivate and
> tegra_xusb_activate because now these only handle the resets for
> Tegra238.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D6

