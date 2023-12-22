Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A53ED53E
	for <linux-usb@vger.kernel.org>; Fri, 22 Dec 2023 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/lAogRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05C8C433C8;
	Fri, 22 Dec 2023 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703237333;
	bh=pVzcZ1FMA17fQA2Gn9A7fXMB1ZdDwNgkwxOh7HmBRHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/lAogRQCtgvcse7L/QtxvPV3MsRxffXFxJQJJGhAEWS2j3kuzJmGSRpqH9W1zr3V
	 Ua0EsSo8K3YR4ngi0LT4T3atieaj1vNbdFERVJGz1MNghZXGqyl5txhzAaQEPTqlw8
	 1wCowcs9GKZpnbcL+49nMEVYX89ultVWj88Lt6B+QOE3qh17qiEX08AnYmKVAu/pbZ
	 2juJy+ad9QKU48YJJKydW+cOU80DpGAon/XzZe5lcfARhPjhi1Uo7jaG+eHA1vBmp9
	 2fI6ElCb7xYGiipbe3raMHIZQAJjoEHU4efJWTlSlYDkJjiUMohzDIGpk9JCrdcHbi
	 o/AOJglgFVYHw==
Date: Fri, 22 Dec 2023 17:28:42 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, luca.ceresoli@bootlin.com,
	jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] usb: phy: mxs: remove CONFIG_USB_OTG condition
 for mxs_phy_is_otg_host()
Message-ID: <20231222092842.GD1951375@nchen-desktop>
References: <20231218061420.3460145-1-xu.yang_2@nxp.com>
 <20231218061420.3460145-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218061420.3460145-3-xu.yang_2@nxp.com>

On 23-12-18 14:14:20, Xu Yang wrote:
> When CONFIG_USB_OTG is not set, mxs_phy_is_otg_host() will always return
> false. This behaviour is wrong. Since phy.last_event will always be set
> for either host or device mode. Therefore, CONFIG_USB_OTG condition
> can be removed.
> 
> Fixes: 5eda42aebb76 ("usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> ---
> Changes in v2:
>  - add fix tag and stable maillist
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index acd46b72899e..920a32cd094d 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -388,8 +388,7 @@ static void __mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool disconnect)
>  
>  static bool mxs_phy_is_otg_host(struct mxs_phy *mxs_phy)
>  {
> -	return IS_ENABLED(CONFIG_USB_OTG) &&
> -		mxs_phy->phy.last_event == USB_EVENT_ID;
> +	return mxs_phy->phy.last_event == USB_EVENT_ID;
>  }
>  
>  static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
