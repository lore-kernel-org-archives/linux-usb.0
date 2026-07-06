Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3037BE6B;
	Mon,  6 Jul 2026 02:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783305269; cv=none; b=ex7+19qDtul1y2sGN6V2zudtx3cQ0jwJYVd5f+nFOyv4hARJ3++SL09MOb0bnSutWiH860Lj2hADgr1cTFbaXAMu9zdn2TeFFhKlefXEll4A9ErSm7d69O4/m2gdJzBtkiwKOikyAMrLr1xAGOCJn2+f863OWEQsIhM2HGHa1hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783305269; c=relaxed/simple;
	bh=AKbUYsz6EGbRyiuDvoixzVEsAt4pwKQLt2Pty/Fp3RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6AIbu0l25Z0Jt5KBVXLk0J8DJPGiJf5SSNvcAZ74+/sqLzI/v04+etckiF24ikhLsEUBWKAC7vrf3/S1o1S69McZnoCXN6W2PuQjl0+mePAKWyUrfb/ZWLkmW2znKWN2n4S8NaqysTd8p++Dg5VP1WS8Hmac6L677u1pcsheUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE0BbxZz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE0BbxZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5021F000E9;
	Mon,  6 Jul 2026 02:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783305268;
	bh=ZxAALi5fI1fStgz9BZahPjNmryb28dwMaS8yY3FERw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oE0BbxZzjgpreXMhYQG2mnLoIKLBpqw3bATgOQXY7Gg3EdO8SpOLzFVVPKjdveVtH
	 ibVlkNAOmDZ1rZAgtMuyeWbSjC/8I58Y2rBfaOD9qBv/8Jankh4rJAUCxjWLMrHrMg
	 UE7k1GpT3KBlrxzIq6O1yUWslUgSBIpDLBUiQ6bH/iXUgCfVmwBrbHS1tQFNUCSsKv
	 5nmc795N+DGoMfPpepJbpqOZvLMuFD0+F9bZhtLewHbs+BG7FsWGsCryJhfaPsFnoD
	 NGaZCbq+vfhnkGWjvGk+J3Uf2IkEKz5etCXWPdvFUw0p5L0dHQcjmL4VkODvY0uDml
	 Xucx9qdC61+2g==
Date: Sun, 5 Jul 2026 19:34:27 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Ihor Matushchak <ihor.matushchak@foobox.net>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: cdns3: plat: fix a typo in cdns3_plat_probe()
Message-ID: <aksUM4lSYPOWP7wq@hu-petche-lv.qualcomm.com>
References: <20260703120136.19852-1-ihor.matushchak@foobox.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703120136.19852-1-ihor.matushchak@foobox.net>

On 26-07-03 14:01:36, Ihor Matushchak wrote:
> Fixes typos in dev_err_probe(): 'cdn3,usb*-phy' -> 'cdns3,usb*-phy'.
> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/cdns3/cdns3-plat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
> index bb5405460035..e3f32c3e9535 100644
> --- a/drivers/usb/cdns3/cdns3-plat.c
> +++ b/drivers/usb/cdns3/cdns3-plat.c
> @@ -147,12 +147,12 @@ static int cdns3_plat_probe(struct platform_device *pdev)
>  	cdns->usb2_phy = devm_phy_optional_get(dev, "cdns3,usb2-phy");
>  	if (IS_ERR(cdns->usb2_phy))
>  		return dev_err_probe(dev, PTR_ERR(cdns->usb2_phy),
> -				     "Failed to get cdn3,usb2-phy\n");
> +				     "Failed to get cdns3,usb2-phy\n");
>  
>  	cdns->usb3_phy = devm_phy_optional_get(dev, "cdns3,usb3-phy");
>  	if (IS_ERR(cdns->usb3_phy))
>  		return dev_err_probe(dev, PTR_ERR(cdns->usb3_phy),
> -				     "Failed to get cdn3,usb3-phy\n");
> +				     "Failed to get cdns3,usb3-phy\n");
>  
>  	ret = phy_init(cdns->usb2_phy);
>  	if (ret)
> -- 
> 2.53.0
> 

-- 

Thanks,
Peter Chen
