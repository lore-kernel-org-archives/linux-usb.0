Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794720091;
	b=ojbzdiXx6gp9STodPKtGyuvlZjb4pZzsvA/EdT+dWF+2AQ/Tw1BasR0dqgU0MiWGrp0v
	 6/LUT776s+nVoFcHAHSc7+gl1yCLi6ePfpfX408bk9ZzVMDcsgHuX7JY7u0Hrjmuy3fA5
	 l1A5qHFwYzo5guJpTuL4ymD0a6Qm0m7FnoWE9NxFYTujXhcZXHFOLw9GGflFtEq2R546F
	 xvLO54GMH+BLyVkPdMkE3c6tPgWvG9/RATjB3aQTIXWXNgHutaaH4gq983ZJ9dqhnXGHn
	 Rn5fuOULYRG3dsd23DTXOp2y5p3Ys2LzfZGENE2y0ChG0Qe8HTVmwy+e7KldEnqTyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794720091;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1aeL3aZartVWRoaJ+wOqIGtbhTzirIWecZnRwMU3oBQ=;
	b=Qqh+KehbfFb+JXOluVOW/gu7e0IFIrOi6H0gnOKrsbq6k6TaozJFJRdCXMVJGfv67VYf
	 AtmAlu7qRlhA63D6bemMEONaUXWRzuLmVDjKvyLAi/g7lIFRI+cBHJBW8bZj27Tqocbsl
	 8ZJAWRMJFEDcT8EmMwEtypGhMqvqisj5Iq6neTtpGVdiBVWZFq0UxDCjlBsNEzcaOJ1bA
	 XmN+Uu3Y5o8tKCyF1VwrJDnF0nbLIGdw1cOrBkqvpT4BwRN4jtIWLZRCDEROsXqvl3blX
	 srzUNaI4GT/e5jbLd9gVADI53M68FG3aTra+kKUTjvWunTXwCj8eo+MP7n77CTdVpEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMcx57V2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E5606A329;
	Sun, 15 Nov 2026 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMcx57V2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C241F000C5;
	Sun, 15 Nov 2026 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794720091;
	bh=1aeL3aZartVWRoaJ+wOqIGtbhTzirIWecZnRwMU3oBQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gMcx57V2yLrBvmcA8OqgHuSFoDVTXHMx1TwzWi/IxtAz/WMM75m7uLAJF3bCw5jVa
	 flhDRJyqEMslA9N/fVwltREE/jpQ/1Del8S+0wAeVbN2l960bNyBk+VrUsum4gpDhq
	 H5Z89sTSqgUIxYj1oKaovzo3wbIJwievgcw5msChQh1XfOjiL0Ogfe0FBeV3o2uwQy
	 54aJLy3eVlUYpRvcnITBAtB1R/XQOLCN4TNaxoYEbZv13yfI6fcpj804nBlJbQ0/ZE
	 KqwBCS3g6S8kJ8smZinWZgTMbYFoc4/V9TZN0wilXyTizUxKsH0D5olcxMesxngGxB
	 otbZgfzo6Ro0Q==
Subject: Re: [PATCH net 2/2] net: usb: smsc95xx: propagate MDIO write errors
From: netdev-bot+sashiko@kernel.org
To: artem122novak@gmail.com
Cc: steve.glendinning@shawell.net, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, alexandru.tachici@analog.com,
 andre.edich@microchip.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Date: Sun, 15 Nov 2026 05:21:30 +0000
Message-ID: <179472009047.2199510.16640520776686219500@kernel.org>
In-Reply-To: <20261114050954.275495-3-artem122novak@gmail.com>
References: <20261114050954.275495-3-artem122novak@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch makes smsc95xx_mdio_write() return an error, but
  only one of its two callers was updated.

--

net: usb: smsc95xx: propagate MDIO write errors

This commit changes smsc95xx_mdio_write() from void to int so it returns
register access errors, while still treating -ENODEV as success during
disconnect. smsc95xx_mdiobus_write() now passes that error back to the
MDIO bus instead of always returning 0.

> diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
> index f85ee5f8a5394..52035c160f4b0 100644
> --- a/drivers/net/usb/smsc95xx.c
> +++ b/drivers/net/usb/smsc95xx.c
> @@ -215,8 +215,8 @@ static int smsc95xx_mdio_read(struct usbnet *dev, int phy_id, int idx)
>  	return ret;
>  }
>  
> -static void smsc95xx_mdio_write(struct usbnet *dev, int phy_id, int idx,
> -				int regval)
> +static int smsc95xx_mdio_write(struct usbnet *dev, int phy_id, int idx,
> +			       int regval)

[Severity: Medium]
smsc95xx_mdio_write() has a second caller, smsc95xx_enter_suspend1(),
and this patch doesn't change it. Both writes there still throw away the
return value:

drivers/net/usb/smsc95xx.c:smsc95xx_enter_suspend1() {
    ...
	if (pdata->features & FEATURE_PHY_NLP_CROSSOVER)
		smsc95xx_mdio_write(dev, phy_id, PHY_EDPD_CONFIG,
				    PHY_EDPD_CONFIG_DEFAULT);

	/* enable energy detect power-down mode */
	ret = smsc95xx_mdio_read(dev, phy_id, PHY_MODE_CTRL_STS);
	if (ret < 0)
		return ret;

	ret |= MODE_CTRL_STS_EDPWRDOWN_;

	smsc95xx_mdio_write(dev, phy_id, PHY_MODE_CTRL_STS, ret);
    ...
}

Every other access in that function returns on error, including the
smsc95xx_mdio_read() between the two writes.

What happens if one of these writes fails? That could be an -EIO from
smsc95xx_phy_wait_not_busy(), or a USB error other than -ENODEV from
smsc95xx_write_reg().

In that case the function still writes PM_CTRL with PM_CTL_SUS_MODE_1
and PM_CTL_WUPS_ED_ | PM_CTL_ED_EN_. It then sets SUSPEND_SUSPEND1 in
pdata->suspend_flags and returns 0. The controller waits for an
energy-detect wake, but the PHY may not be in energy-detect power-down.

smsc95xx_suspend() gets 0 back from smsc95xx_enter_suspend1(), both from
the autosuspend path and from the WAKE_PHY path with the link down. So
the usbnet_resume() recovery at its done: label never runs.

Should smsc95xx_enter_suspend1() check these return values too, since
the subject says MDIO write errors are propagated?

Also, unlike smsc95xx_read_reg(), smsc95xx_write_reg() and
smsc95xx_phy_wait_not_busy() in this file, the new int-returning helper
isn't marked __must_check. Would adding it make the compiler flag
dropped results like these?

>  {
>  	u32 val, addr;
>  	int ret;
> @@ -255,6 +255,12 @@ static void smsc95xx_mdio_write(struct usbnet *dev, int phy_id, int idx,
>  
>  done:
>  	mutex_unlock(&dev->phy_mutex);
> +
> +	/* Ignore -ENODEV error during disconnect() */
> +	if (ret == -ENODEV)
> +		return 0;
> +
> +	return ret;
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114050954.275495-1-artem122novak%40gmail.com
