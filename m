Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09E392C25;
	Tue,  7 Apr 2026 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546119; cv=none; b=rQDrXxT+XTykn0UWEwub3/CUjadU8JyWI86StsVsCuCDR8ffrnMTOXk2N+UlhwK+ZnC/xebNvfA54WQDLsQBTZ9kUhQsjJJZUi9dVRX6REgd6EpAxB/cI96j23mbrAXNjs07lbE9mLFTqid9TyQlxYy+p0tWNHVEzmUiibmNGR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546119; c=relaxed/simple;
	bh=JK7SS5vNkXB3cmmAuHdGhiZGsP1gCik+zSjoA2DSEKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmBjtHw2p4LSL5GDBJW/rqnI02bK47PYOtkxojM7U184Wu0dTNP3dTR7a5+fXff7ln7ml3bAsWvMVSf8Rg/MW/VqtesZUoSfW7MyeOMPffO+K0U1MDn4loEXC3sti8ShXKV2U9wltzZBXJPVAPzDliTz7FvXhjfWrghdgvuTxAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7jie/kw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7jie/kw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A30BC2BC9E;
	Tue,  7 Apr 2026 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775546119;
	bh=JK7SS5vNkXB3cmmAuHdGhiZGsP1gCik+zSjoA2DSEKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7jie/kw19dUEZZduMSMx2B1GuEIypE3LUSZ69iE37MvpzmDWtgtEw3MH4GlY/em4
	 +oGscg8pTWYX8dhViWeHueKoPzwKWpq6uzH0zUBXc863UPQxHbXd2920ANcmwXj2Kv
	 iM74d3xwrMeTRc5zosMAZ7qKcqvQvibG/RLwgI1WjVD86OlE5OwmZx9Sfn3IwFBC4A
	 hgPmWoUW1hHbLU9PcJ8FFrKGdcs8mDMlFnkgqY+yx7aoeoTgKEVclDoBtci6Wen5HE
	 4vzPmugBrhfUNFTughD8aGg3J+kV/Pec0sB+mD8h4aHltcyAXQGIV5lzvWH59+M692
	 OkazXMPfA8bBQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wA0ea-0000000AhTS-3cxO;
	Tue, 07 Apr 2026 09:15:16 +0200
Date: Tue, 7 Apr 2026 09:15:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: option: add Telit Cinterion FN990A MBIM
 composition
Message-ID: <adSvBMMUp-t1yPiu@hovoldconsulting.com>
References: <20260402095727.108281-1-fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402095727.108281-1-fabio.porcedda@gmail.com>

On Thu, Apr 02, 2026 at 11:57:27AM +0200, Fabio Porcedda wrote:
> Add the following Telit Cinterion FN990A MBIM composition:
> 
> 0x1074: MBIM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (diag) +
>         DPL (Data Packet Logging) + adb

> Cc: stable@vger.kernel.org
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
> v3:
> - Added the full output of usb-devices
> - Link to v2: https://lore.kernel.org/linux-usb/20260402083722.100973-1-fabio.porcedda@gmail.com
> 
> v2:
> - Added "Cc: stable@vger.kernel.org"
> - Link to v1: https://lore.kernel.org/linux-usb/20260402082747.98441-1-fabio.porcedda@gmail.com

Now applied, thanks.

Johan
