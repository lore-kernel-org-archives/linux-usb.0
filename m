Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231042DFE6
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829159; cv=none; b=Am2FGdRqHLm5C5zO7QS0c2jGoq8FWLd7AoPKc8w0BRK3wta00Gxniqp81Mm/u6+HI1KWqmSpU1SAasMtwbHpBLDsaf1DIqBc7/msL7mI69ssccbkOoxozwaHpH18BHJy/gNXCaD9VzpVzFQh+avnzh8GUy/PJlrq1aPrU4EutAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829159; c=relaxed/simple;
	bh=RX7CD9m2hoGDAE6z1m1m2ymI9TCKmt0OG0/JF+vtUOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RISnyTnjkTZbhuIjaspeEkj62JNZbgCbXCzxkFUxbnaX2LZB5FDwNyyVemGvSPnCCQYHTzl127CUiQ78HLZLTcapjRGTdBUK6KIUK/Tc/UkWSoxaigjINt1a5oNDWi+e8hjDH24Djx+YVyGsw5T7uwc6PFERumFrILbOajcmQq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tJPxodh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tJPxodh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BE61F000E9;
	Tue, 30 Jun 2026 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782829156;
	bh=KusPALpbYl+tC0/rc/vNIt1hezMUmzjJprrc8q14GV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tJPxodh2DRQdiSlUuqyY09l8YsXbIWO/q9xPEqhevmVpLdA/ClqKH9a5ghq6prf3S
	 prL3DmidvEospkN9HZ++MvaFl5ifXKlsryXi5BKApjB/uPKsDbKS1N+GTkAyr8jj/2
	 oX/TLjY3mNgOY8EKcVTjtkGzlKERMsOiZl54rtPA=
Date: Tue, 30 Jun 2026 16:17:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: DongliLiu <dongli.liu@outlook.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Add bounds check for enum array index
Message-ID: <2026063045-glacial-rifling-8211@gregkh>
References: <KUZPR04MB896814FEFE2D859FE194F45585F72@KUZPR04MB8968.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KUZPR04MB896814FEFE2D859FE194F45585F72@KUZPR04MB8968.apcprd04.prod.outlook.com>

On Tue, Jun 30, 2026 at 07:31:29PM +0800, DongliLiu wrote:
> From: DongliLiu <dongli.liu@outlook.com>
> Date: Mon, 30 Jun 2026 19:30:00 +0800
> Subject: [PATCH] usb: typec: ucsi: Add bounds check for enum array index
> 
> The 'sop' parameter is a C enum that can hold any integer value, not
> just the defined enum constants. Using it directly as an array index
> without bounds checking can lead to undefined behavior if an out-of-range
> value is passed.
> 
> Add an explicit ARRAY_SIZE() check before accessing altmode->plug[sop]
> to ensure the index is within bounds.
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
> @@ -xxx,yyy @@@ static void some_function(struct typec_altmode *altmode,
> enum typec_plug_role sop)
>      ...
> 
> -    if (!altmode->plug[sop])
> +    if (sop >= ARRAY_SIZE(altmode->plug) || !altmode->plug[sop])
>          ...
> -- 
> 2.40.0

Same here, stop making fake patches.
