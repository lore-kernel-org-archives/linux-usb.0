Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F1425CE6
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829144; cv=none; b=EO1qRwtN8gWMCsiZsezxVrSH6Vs63UCJvwObdZo8Yd7bxn+9eBdKP0FKzSJjK5K2e6EI8EN80CHvetHpzgOURjb4byFkeZ5dtNtZ8cDQCLL8R0Q3UXI3W2eslY4Xek+2pA2va0Va21i60aPWSGX2jKMYVI0f1/tFgP7wI4svwBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829144; c=relaxed/simple;
	bh=tykj47PCBA5+6osvG5nnRGpMgmvFHPUkpVNSMndoCME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s41TZuqDms0LDG6WuxkIC885JA2dWZKX0EXT63dBrwL7IPvRQZFBxPNv/M5NQ+A1ZneQNwCvO0VgY024uslyQ89aLjv1ytDy4HUpv1jCjTk+r7aXXAtCTi0N5b5HqwwqgbYSu6bNQs7ex4sj1pzO3t8P30PQShL9A4Z4kk7/FMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TqRn/d5W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TqRn/d5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5976D1F000E9;
	Tue, 30 Jun 2026 14:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782829141;
	bh=TC/5NP+SJVFzZd/fng0V3XAuexTl7vmMVf/YxsS5kAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TqRn/d5WfWfvrRzmfFKCIa09DgDi9lqITpRvmLMhi6y+B+dIpURIpXglhDvPSGuK+
	 bDOwYaMsIvAvkSVGZEnMTp+L//994iEAsvglRAsPl26IqF9kNst16zBhYJPm7co18u
	 vHBrmzKxvUp832W0ic+mqlsVLw1sCPTlj2Kfi6oI=
Date: Tue, 30 Jun 2026 16:17:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: DongliLiu <dongli.liu@outlook.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix off-by-one in connector validation
Message-ID: <2026063017-mayflower-shuffle-9051@gregkh>
References: <KUZPR04MB89683432655A607BE9A4838F85F72@KUZPR04MB8968.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KUZPR04MB89683432655A607BE9A4838F85F72@KUZPR04MB8968.apcprd04.prod.outlook.com>

On Tue, Jun 30, 2026 at 07:30:31PM +0800, DongliLiu wrote:
> From: DongliLiu <dongli.liu@outlook.com>
> Date: Mon, 30 Jun 2026 19:30:00 +0800
> Subject: [PATCH] usb: typec: ucsi: Fix off-by-one in connector validation
> 
> UCSI_CCI_CONNECTOR() returns a 1-based connector index, while
> num_connectors represents the total count of connectors. Using '<='
> allows num_connectors itself as a valid index, which is off-by-one
> since valid indices are 0 to num_connectors-1.
> 
> Change the comparison from '<=' to '<' to correctly reject the
> out-of-bounds case.
> 
> Signed-off-by: DongliLiu <dongli.liu@outlook.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index xxxxxxx..yyyyyyy 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -xxx,yyy @@@ static void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
>      ...
> 
> -    if (UCSI_CCI_CONNECTOR(cci) <= ucsi->cap.num_connectors)
> +    if (UCSI_CCI_CONNECTOR(cci) < ucsi->cap.num_connectors)
>          ...

Please actually create patches that can be applied and not use LLM tools
without documenting it properly.

thanks,

greg k-h
