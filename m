Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367520;
	b=OizrtfA3X0BGYRsTR3ve8iYbVM1eykqLhc7ZHshigz8KkUa88G4rY1QcDI5NRidjY+v1
	 cITj0fjV1Ev+frRxbRcmKtbS9/JjjIaJ6qXa/hdztgAby1+4Bb50vTiTxBWHdtZASieNO
	 fUnfblOIKZ7B6zIA7sSWttRfSaLB6JLyFjaZs63VamEzyzISf++aJ9OGgmMD4kUnYseI3
	 mc4ZKNoMYEeeQfqrdnBIa9IXnQgAa7DHVbNqAyO486mqnj+EpbkgSt35BdqKFRQ8q9glk
	 wE+VsAijtpxf1od+yAdIOnLlOzV79vnKdJe0751090YuESzRr3ON0W6i7cbhF8PLaOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367520;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rmLr1ey2VGJg23FCjd32+fEvEQvGO0PpAP6nwCXEVO8=;
	b=4uWcKxeDWeB343/qPt03uBJs7ZpUpcNPnoil1s3Jo452wK1TowZXNOeDxMGsdjBlxF+D
	 pwxC4PzHnWSXs7EIAB9POofiMN/voFmSK97iXs/cuerXWvtWOpYJ/XpTma4/zlfa0MA3B
	 TZTtruSjLXXJit8swgij1+ZSwlqUKdA9AP7yO8jHAGNL/APhN4aPtPigYJzBVGvLnrWNW
	 Y1n9h+DuTFagXYBLK1vm5E0WGbPfEErPJyud944JzSqOICNcyXQ1FSWkl+C0W1Lr4NvRk
	 +6oCwggQeTrgJ5gNb5I5lee6/JrTFCF/F5FJ9mxhjdOdph7jPdcWLm4+MgdyFg3Lf2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+ZwTyX4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002160A261B
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+ZwTyX4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906DC1F0089F;
	Wed, 11 Nov 2026 03:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367519;
	bh=rmLr1ey2VGJg23FCjd32+fEvEQvGO0PpAP6nwCXEVO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M+ZwTyX4d/MCQAnPwogdxsBGkbn4KEgby45vgERAvLF96VXBp8NNNzdJJgmP0Dphl
	 9yt1X94MB8LI7MJbLxbpmp16DvfOoAncN+gDAj5Xa7fIo46b+b+E31VZI2XTT2U6F+
	 ksWq5tJ7Ye+B3mp4MESs/XcDmFohSAKkiuMMN4PeOJOwvudRazlwDEhJHnZxqzPYWr
	 6DLUOKhMeJPSAEQszOesuguBYq+rZNJimopv8WNuDfjj5qIL8480n0J2x4QADudZUx
	 z6liJEAXF/B+xbdTMwVPBnk64f7GvFdCX3WbBTpcUKKvVkQCDDSR8zieAxe4xvrPgb
	 6XAsLOTI2aa/A==
Message-ID: <sashiko-outbox-208192@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 11/11] r8152: enable UPS for RTL8157 and
 RTL8159 QFN68
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-12-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-12-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] r8152: unrecoverable RTL8152_INACCESSIBLE latch in
  r8157_ups_en()
--

commit be4db4d81b51525250cdaed81bde5b818204e21b
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>

r8152: enable UPS for RTL8157 and RTL8159 QFN68

This commit adds r8157_ups_en() and updates r8156_ups_flags() and
rtl8157_runtime_enable() to enable UPS during runtime suspend/resume on
RTL8157 and RTL8159 QFN68.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 703ec5483778b..9c7031f938bc2 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -4496,6 +4534,58 @@ static void r8156_ups_en(struct r8152 *tp, bool en=
able)
>  	}
>  }
> =20
> +static void r8157_ups_en(struct r8152 *tp, bool enable)
> +{
> +	u32 ocp_data;
> +	int ret;
> +
> +	if (enable) {
> +		r8156_ups_flags(tp);
> +
> +		ocp_byte_set_bits(tp, MCU_TYPE_USB, USB_POWER_CUT,
> +				  UPS_EN | USP_PREWAKE | PHASE2_EN);
> +
> +		ocp_byte_set_bits(tp, MCU_TYPE_USB, USB_MISC_2,
> +				  UPS_FORCE_PWR_DOWN);
> +	} else {
> +		ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT,
> +				  UPS_EN | USP_PREWAKE);
> +
> +		ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_MISC_2,
> +				  UPS_FORCE_PWR_DOWN);
> +
> +		ocp_data =3D ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
> +		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +			return;
> +
> +		if (ocp_data & PCUT_STATUS) {
> +			ret =3D read_poll_timeout(ocp_read_word, ocp_data,
> +						test_bit(RTL8152_INACCESSIBLE,
> +							 &tp->flags) ||
> +						(ocp_data & BACKUP_RESTRORE),
> +						200, 20000, false, tp,
> +						MCU_TYPE_USB, USB_GPHY_CTRL);
> +			if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +				return;
> +
> +			if (ret) {
> +				rtl_set_inaccessible(tp);
> +				dev_err(&tp->intf->dev,
> +					"backup-restore timed out\n");
> +				return;
> +			}

[Severity: Medium]
As reported by Jakub Kicinski on v7 [1], does setting RTL8152_INACCESSIBLE
here without queuing a USB reset or returning an error leave the interface
permanently dead on runtime resume?

When rtl8152_runtime_resume() -> rtl8157_runtime_enable(tp, false) ->
r8157_ups_en(tp, false) times out waiting for BACKUP_RESTRORE,
r8157_ups_en() returns void and rtl8152_runtime_resume() returns 0, while
rtl8152_resume() skips its usb_reset_device() fallback when runtime_resume
is true:

drivers/net/usb/r8152.c:rtl8152_resume() {
    ...
	if (!runtime_resume && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
		usb_reset_device(tp->udev);
    ...
}

Because RTL8152_INACCESSIBLE causes subsequent r8152_control_msg() calls to
bail out with -ENODEV before reaching usb_queue_reset_device(), and
rtl_set_accessible() only runs in rtl8152_post_reset(), nothing recovers the
device until a physical replug or system suspend/resume.

[1] https://lore.kernel.org/r/20261021005214.1255071-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D11
