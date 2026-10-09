Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E71279DAD
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517916; cv=none; b=dkKcJWmLCRbNCFUY8gsozGKOPNyLybr4nLJIKu6PZpItXrbYT1hMoo0o4qXcDVFS4ES2vOGuUFzJQsfi5FMBeH6oObOlcgJv1cMiDw5ydkLSE8HtzkoKWT583FZWLAO/8/HlpiRg7X0C89mXc8a1BwzgLeDfKGk1+h3gRuFOhns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517916; c=relaxed/simple;
	bh=JTRKP6CDhPn5mvR14cnsUoZBeHeUTJXKEddcaljSCxw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PPqjX6/ZmE5rBw+uv2cJVG6RsMv6rSbpZdZUVy1IoWfM5ByFuYdiZH9iXC/KLGiCQMp67GfuxIdMuwE2sV+p0Xpfh8+W0lghwh8i2ant2+dybFVdlOP18HuQtynZqRXSkoCMndoRgmtRdwKsbnaGprmHW8n4pDCJ8neZNNSPKag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LN2MGuTw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LN2MGuTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6881F00898;
	Fri,  9 Oct 2026 03:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517906;
	bh=lJPQV8an2/8GE1Wugywpy0rgPgt7MZn8ojB8J1H8ktk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LN2MGuTwzDrYmXGzLGBqBZxqQc6OKxfhowc8lgC5LuJMSn9zPkxKK8GwsQ5PsAIAF
	 X7Wxc5M7mr4iP1uo/N9pzJ3NMpzxgQeLylAj2Ykf2fBQ/gCl/+4UJCP9/B4IBA/mgw
	 LLihJbK+9sxiQhEOSH1tTGpg+HcU0z8gU5umlr7IhX2Xlap0JpA7N8aTF/i3ncYro+
	 k5c/yvMstqyq+PD1mw2aPoaECWSHdXp0G/LKv6KdQ4xAuhBXIPalx7u//NWo4KEY/S
	 3NgNPg0f/JjB25qJPwYFyvUgnLy1iKm4m4kCA0rOfYWuE+rzppAQL48dVTGfFTpuKw
	 kfMZO2U62U+4w==
Message-ID: <sashiko-outbox-164800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-9-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-9-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: ax88179a_reset() clobbers user-configured MAC address during =
resume
- [Medium] net: ax88179a_resume() skips phylink_resume() on hardware read e=
rror
- [Medium] ax88179_178a: ignores usbnet_suspend() return value in suspend
--

commit d715e3f0710659f4025065a805e16bf7832459fd
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add Suspend/resume support for AX88179A/772D/279

The suspend and resume functions are called via the usb_driver structure,
for which the driver has only a single instance. Add wrapper functions
for the different implementations for the AX88179 and AX179A architecutres
in ax88179_lib which calls the 2 implementations in ax88179_178a and
ax88179a_devices, respectively.

> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178=
a.c
> index 071b03b4f145c..ef0856627d08b 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c
[ ... ]
> @@ -1356,9 +1359,9 @@ static struct usb_driver ax88179_178a_driver =3D {
>  	.name =3D		"ax88179_178a",
>  	.id_table =3D	products,
>  	.probe =3D	usbnet_probe,
> -	.suspend =3D	ax88179_suspend,
> -	.resume =3D	ax88179_resume,
> -	.reset_resume =3D	ax88179_resume,
> +	.suspend =3D	ax88179_suspend_wrapper,

[Severity: Medium]
If usbnet_suspend() aborts an autosuspend (e.g. because of an active TX
queue, returning -EBUSY), ax88179_suspend() ignores the error and continues
to force the MAC and PHY into low-power mode (AX_MEDIUM_RECEIVE_EN disabled,
AX_RX_CTL_STOP, etc.).

This stalls the active network stack because the hardware is stopped but the
USB core reports success to the PM core. The patch refactors this into
ax88179_suspend_wrapper without fixing the underlying bug.

Does this need to be fixed to properly handle usbnet_suspend() return values
in ax88179_suspend() to avoid hardware stalling?

> +	.resume =3D	ax88179_resume_wrapper,
> +	.reset_resume =3D	ax88179_resume_wrapper,
>  	.disconnect =3D	ax88179_disconnect,
>  	.supports_autosuspend =3D 1,
>  	.disable_hub_initiated_lpm =3D 1,
[ ... ]
> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index e86cbe3e4400f..e9913a7c70390 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
[ ... ]
> @@ -135,6 +194,47 @@ static int ax88179a_auto_detach(struct usbnet *dev)
>  	return 0;
>  }
> =20
> +static int ax88179a_resume(struct usb_interface *intf)
> +{
> +	struct usbnet *dev =3D usb_get_intfdata(intf);
> +	struct ax88179_data *ax179_data;
> +	u8 reg8 =3D 0;
> +	int ret;
> +
> +	ax179_data =3D dev->driver_priv;
> +	ax88179_set_pm_mode(dev, true);
> +
> +	ret =3D ax88179_read_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
> +	if (ret < 0)
> +		goto err_out;

[Severity: Medium]
In ax88179a_resume(), if reading the PHY power state fails (ret < 0),
execution jumps directly to the err_out label.

This bypasses the if (netif_running(dev->net)) { phylink_resume(...) } bloc=
k.

Because phylink_suspend() was previously called during ax88179a_suspend(),
bypassing the resume call leaves the phylink state machine permanently
suspended. Even if the hardware error was transient, link state updates will
no longer be processed, resulting in a dead network interface that cannot
recover.

Can this be modified so phylink_resume() runs even on hardware error, or is
there another way to prevent the state from becoming stuck?

> +
> +	if (!(reg8 & AX_PHY_POWER)) {
> +		reg8 =3D AX_PHY_POWER;
> +		ax88179_write_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
> +		msleep(250);
> +	}
> +	ax88179_write_cmd(dev, AX_FW_MODE, AX_FW_MODE_179A, 0, 0, NULL);
> +
> +	/* Now, that AX_FW_MODE_179A is enabled, the PHY needs a power-cycle.
> +	 * PHY-power is re-enabled in ax88179a_reset()
> +	 */
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
> +	msleep(250);
> +
> +	ax88179a_reset(dev);

[Severity: High]
Does this clobber a user-configured MAC address?

During resume, ax88179a_resume() unconditionally calls ax88179a_reset().
ax88179a_reset() calls ax88179_get_mac_addr(dev), which reads the default M=
AC
address from the hardware EEPROM or DTB and writes it into dev->net->dev_ad=
dr.
It then copies this value into dev->net->perm_addr.

If the user had previously configured a custom MAC address, this custom
address is permanently overwritten by the hardware default on every
suspend/resume cycle. Furthermore, modifying perm_addr outside of device
probe violates the invariant that it holds the permanent unalterable
hardware address.

Should the resume path instead restore the existing dev_addr to the device
registers without calling ax88179_get_mac_addr()?

> +
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_resume(ax179_data->phylink);
> +		rtnl_unlock();
> +	}
> +
> +err_out:
> +	ax88179_set_pm_mode(dev, false);
> +
> +	return usbnet_resume(intf);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D9
