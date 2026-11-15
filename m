Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794720090;
	b=y+ZvOIEv3SAGpnZiGKgQIwY6Mh5SUhlostn/VQNjlprIDIDi8I+AzgejbIRAZCzEnAv7
	 +hc27ETeDvKtFKNp1zddMrXU1XR1YoLZZFPfBBtr/agbpiKPzuNNtWwIecE4w+78BbP0d
	 IEUnkE7raU1+KOC7pcif02bGynl0/Nuf0a2DDhvmcQKQiX7mPhKJUHhomCwQcZOqyvx7a
	 LhRVVFhAkGnD/kkEtkC4DTfF4qmgXe/RC9UFo/BTxdFYU8vT4d7eFFwaqy1S4RxLx905u
	 siucmt+c9KyncJEcw/UelF7CskXcfzIq/dgkeKAJXat6d45VrBACfThuGxxjbq9BS2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794720090;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xOqIZDOVem0rH3DFVodrMQurwQCioC/lXxRcUKM4shg=;
	b=Ngjyt4+2whH4ArGch8dtpFM0V8B4yFFpcxeQxn0m+KxMkToKB+Kwn/psfHRWCv3I3R5t
	 3/2NkPaUuuO7xs4reHOtzn9d45Agx+LO+jIZOv+L9KTMjwQj2obHydJfLCguZ5K/KarqK
	 8sVymdwDLC+9uStl6z/vXzYcvsNhqeZUhJ2WZkVkgQEjnPrCnzpEcR5l6cUfyGfQelNzf
	 UkHFJKmpph+nd4E5Ywkk1uBNfbZHU/s3imvpW+msGZrFZjMZIq9S8G7sK2t+fUCRf/yDF
	 xzWas0pU6g6vhX/JTA1IPkSNRhTF0w48IdQl27wiu+RZWyDhGbI7/CaAvh9YCVm9x/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhPu2EJM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793D606A327;
	Sun, 15 Nov 2026 05:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhPu2EJM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10E71F000C4;
	Sun, 15 Nov 2026 05:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794720090;
	bh=xOqIZDOVem0rH3DFVodrMQurwQCioC/lXxRcUKM4shg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HhPu2EJMu+PVaTix0N0SAs9uIexGMNqwrDgK5YHs++2b5wzyziEkCRZR9Z6598vE1
	 oM0b/zHtlFvwFJ6feWgehk9dzzZHEkvu83FDFrpLl71RM+pAG6PvCmxx8HdEUwFSwU
	 0OqGDjOw4GAvKuctUcWozv4wSa0x95p7zCHQBnN0rHwkILLEMnBKxN01WVF8I996++
	 O1HqTVgip2SvI7nfCd1HqY7nDo7CfcADlyrloKL9YR74UXoXPZj8itEEm5WgKE+tJu
	 KLKkHmVGDS6hHDUGUQELjc+7gp4iX/GrVWb0mDIPzmvv7QAi/ddzVH3Ys6fyyNfDgx
	 DYAfHYD/aoriQ==
Subject: Re: [PATCH net 1/2] net: usb: smsc95xx: propagate MDIO reset errors
From: netdev-bot+sashiko@kernel.org
To: artem122novak@gmail.com
Cc: steve.glendinning@shawell.net, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, alexandru.tachici@analog.com,
 andre.edich@microchip.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Date: Sun, 15 Nov 2026 05:21:29 +0000
Message-ID: <179472008914.2199510.6969426942670882537@kernel.org>
In-Reply-To: <20261114050954.275495-2-artem122novak@gmail.com>
References: <20261114050954.275495-2-artem122novak@gmail.com>
X-sashiko-severity: Critical
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 1 · High: 0 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] The patch makes smsc95xx_mdiobus_reset()
  (drivers/net/usb/smsc95xx.c) return `ret` instead of 0.

--

net: usb: smsc95xx: propagate MDIO reset errors

This patch changes smsc95xx_mdiobus_reset() so it returns the result of
the PM_CTRL register accesses instead of always returning 0. The goal is
to report a failed external PHY reset to the caller.

> diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
> index 130a460c1f546..f85ee5f8a5394 100644
> --- a/drivers/net/usb/smsc95xx.c
> +++ b/drivers/net/usb/smsc95xx.c
> @@ -291,7 +291,7 @@ static int smsc95xx_mdiobus_reset(struct mii_bus *bus)
>  reset_out:
>  	mutex_unlock(&dev->phy_mutex);
>  
> -	return 0;
> +	return ret;
>  }

[Severity: Critical]
What value does ret hold here when the reset succeeds?

smsc95xx_write_reg() passes back the result of usbnet_write_cmd()
unchanged. That result is the byte count from usb_control_msg():

drivers/net/usb/smsc95xx.c:smsc95xx_write_reg() {
    ...
	ret = fn(dev, USB_VENDOR_REQUEST_WRITE_REGISTER, USB_DIR_OUT
		 | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
		 0, index, &buf, 4);
	if (ret < 0 && ret != -ENODEV)
		netdev_warn(dev->net, "Failed to write reg index 0x%08x: %d\n",
			    index, ret);

	return ret;
}

smsc95xx_read_reg() also returns 4 on success. After a successful
external PHY reset, both "if (ret < 0)" checks pass, and the function
now returns 4 instead of 0.

__mdiobus_register() treats any non-zero value as a failure:

drivers/net/phy/mdio_bus_provider.c:__mdiobus_register() {
    ...
	if (bus->reset) {
		err = bus->reset(bus);
		if (err)
			goto error_reset_gpiod;
	}
    ...
}

It calls device_del() and returns 4. smsc95xx_bind() then takes its
error path:

	ret = mdiobus_register(pdata->mdiobus);
	if (ret) {
		netdev_err(dev->net, "Could not register MDIO bus\n");
		goto free_mdio;
	}

That path runs mdiobus_free(), irq_dispose_mapping(),
irq_domain_remove(), irq_domain_free_fwnode() and kfree(pdata). It
then returns 4 and leaves dev->driver_priv pointing at the freed pdata.

usbnet_probe() only aborts on negative values:

	status = info->bind(dev, udev);
	if (status < 0)
		goto out1;

Probe therefore goes on to register_netdev() with these leftovers:

  - dev->driver_priv pointing at freed memory
  - a freed mii_bus
  - a NULL dev->net->phydev

Wouldn't later driver callbacks then use pdata after it was freed? One
example is the pdata->pm_task dereference in smsc95xx_read_reg() and
smsc95xx_write_reg().

smsc95xx_unbind() runs on disconnect, or when probe fails after bind
and calls info->unbind. In that case it would:

  - call phy_disconnect() on a NULL phydev
  - call mdiobus_unregister() and mdiobus_free() on the freed mii_bus
  - free the irqdomain and fwnode a second time
  - call kfree(pdata) a second time

Can this double free pdata?

This path is taken whenever HW_CFG_PSEL_ is set. That seems to break
every probe of a device with an external PHY, which is the setup
809ff97a677f was fixing. The bit is read from the device, so an
emulated or malicious USB device could trigger this as well.

The next patch in the series, "net: usb: smsc95xx: propagate MDIO write
errors", does not touch smsc95xx_mdiobus_reset(). The problem would
still be there at the end of the series.

Would something like "return ret < 0 ? ret : 0;", or setting ret = 0
after the successful write, keep the error propagation and still return
0 on success?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114050954.275495-1-artem122novak%40gmail.com
