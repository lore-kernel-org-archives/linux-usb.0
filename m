Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190841;
	b=anXXS5mWFjuzbDQu6rt1Xqcz5bF9l7QhcJG+bwCtwxsU/N69MUwR+17HUGJrKW5efcjT
	 GA+UfPgvGLu9mz8p59CUbBwEmrX1bun8VaWQ8g3nZ3EwV4XbeFTtRe9PUio4Uy2Lsz+lW
	 /Z3/GpTUIfck6PHVLp5FwB5oqTMHbENow9DHbdg8XmzsTqMg6bdNmv3nPXuRg5LCa2p/4
	 DGGuyPc/M0SzblGkYnXxnFE2JH3ENIUED72u03VkZMKVdPGSOgB7bqeFhMWzTORmfKWa5
	 Jbxo/iFPWv9ubImG0mN8O3t9Xr5c8Lc38hyMlydCIRx29RF0SoiRizB1Ezb0XlPcmKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190841;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5vycqt7uKRC1d1nHkk0APGNrL8b1KJ65ZtEYEdgPAnk=;
	b=fsPelQSx4yakEX2Dh1zYT6RBqftgh9Qza653D80FSkMtAfGlp3mO/s9Zog0O+2y0t9Ud
	 2nw+0kaSxaiY1NvTY4KYwDLeginyMaj0mW9gQio2yu2tgXSqAZw5m9BZY6dJyEtji8pnP
	 cYihU0RfP9DFUjBOlF1uCCLP10bKd1fJx1nuLDt2DsMOJlhyZW98KXX7/wdySb6Z90btA
	 X7kEnM+c2dI03uNnJIgKHMNJV0QEmpIMVm7kzUtihYyztTnEN2k081lFlqYOC8yU4PH6w
	 oE9THb/n63zhOEPTKGXI4P30TVX7+WX3JqUc8mmYM5TfNdJEXl80MWbbhf37TSbnHsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wVImjlIJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A9660A2600;
	Fri, 20 Nov 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wVImjlIJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED001F000C4;
	Fri, 20 Nov 2026 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795190840;
	bh=5vycqt7uKRC1d1nHkk0APGNrL8b1KJ65ZtEYEdgPAnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wVImjlIJ/u7n19k/DQBYyre8pstvyUxPne4q5dI4BdWWmRa2ggLiPKwjEsn9t50Vx
	 NlwPm/mLq+LUg5R90rVmrJk6mEjGRJ2nUAEho9YU/MQhevymsIyd3zFeXBXuHBn7kj
	 EgdSD6KvC6u3sg6yiaDsBctlrVIUttieQk/vmjbI=
Date: Fri, 20 Nov 2026 17:07:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: contact@blakejalexander.com
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: log invalid UCSI version of 0
Message-ID: <2026112051-drainpipe-trustless-fba2@gregkh>
References: <20261119-log-ucsi-firmware-quirk-v1-1-6d42d70a6158@blakejalexander.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-log-ucsi-firmware-quirk-v1-1-6d42d70a6158@blakejalexander.com>

On Thu, Nov 19, 2026 at 04:56:59AM +0100, Blake Alexander via B4 Relay wrote:
> From: Blake Alexander <contact@blakejalexander.com>
> 
> Some devices ship bugged firmware which sets the version of the UCSI
> mailbox to zero. In such cases the ucsi_register() will return -ENODEV
> and the driver will silently fail to bind. There is otherwise no
> indication as to the cause of the probe failure.
> 
> While existing (and future) machine-specific workarounds may resolve
> this issue by assuming a known-good UCSI version, future devices or
> older firmware revisions with this issue will still silently fail.
> Both users and developers will benefit from a clear diagnostic message
> when troubleshooting this particular bug.
> 
> Add a dev_err() log message when a UCSI version of 0 is reported during
> ucsi_register() hinting towards a potential firmware bug.
> 
> Signed-off-by: Blake Alexander <contact@blakejalexander.com>
> ---
> Hi,
> 
> I have a ThinkPad T14 Gen 2a which is failing to negotiate a DisplayPort
> Alt-Mode connection to a monitor-hub with a USB-C cable.
> 
> I spent quite some time troubleshooting the issue and identified the
> root-cause only to find that a patch which fixes this issue was already
> submitted:
> - "[PATCH v2 0/2] usb: typec: acpi: Zero version quirk for Lenovo ThinkPad T14 Gen 2a" <20261103-ucsi-lenovo-t14g2a-v2-0-e85c659b56a2@resetko.pl>
> 
> Similar issues with other laptops have also been recently submitted:
> - "[PATCH] usb: typec: ucsi: acpi: Add quirk for ASUS ROG Zephyrus Duo 16 GX650PI" <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>
> 
> And existing quirks are also already handled in mainline:
> - Acer Nitro ANV15-41: commit 8c51ea651d04 ("usb: typec: ucsi: acpi:
>   Assume UCSI 1.2 on Acer Nitro ANV15-41")
> 
> In the hope of saving future developer's time, this patch adds a
> dev_err() log message when the UCSI version register reads zero. The
> log message hints towards a potential firmware bug and gives an 
> explicit cause of the driver's probe failure.
> 
> Tested on ThinkPad BIOS R1MET65W (1.35), EC R1MHT65W without the
> relevant quirk patches.
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 9e453d216c16..fa79ba6dec02 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2396,8 +2396,13 @@ int ucsi_register(struct ucsi *ucsi)
>  	if (ret)
>  		return ret;
>  
> -	if (!ucsi->version)
> +	/* Version of 0 is not valid but some vendors may report it due to bugged
> +	 * FW and there may not already be a workaround quirk to correct it.
> +	 */

Wrong comment style :(

thanks.

greg k-h
