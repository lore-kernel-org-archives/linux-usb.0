Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100443DA38
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754348; cv=none; b=jEpjlcYLLLN8lgRrLcISdpmkgh1Oub80g8LFZE7U6KkDyiLETOXmNJbVK0DTcyvwHEAPsOyykKTNCf0ESybTAqwdp7JP3fcaXJ2W4bIS83LrmkTFAZWZ64TuMkf34bloin2Ez/+/ampCG0MHGvnWsBAT6IRbDy38s8ElZefUKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754348; c=relaxed/simple;
	bh=el41jJYiChJ+vjXmRIToeNHzqTCXYoqkbICWX2N1awY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCGb0lDZK0P25okqjqZ119gsAUJd7v1PESIbcEb8JF+ql+0g8/MBI/sk6/i5tI1ah06Hi7K0JiAx2NR2+Vj1V4mdd8vu4CJRmjVTpS/pam5BJvx5dw8MHJWSrF6DuGTM5SfKppW97j52TTkdxuFhaLUbIfHiK4c/Jh3tnjDmRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lyGqHBzH; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lyGqHBzH"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90cd065f79aso2748556d6.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787754345; x=1788359145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=skZHhH369VPUOeA1qWU/JjUNfYqgeJvWRZG+FN1ThEI=;
        b=lyGqHBzHG1QG8/37OH/ETU1iVglRFFBy6K4sIL3KaO6r156maH5eadKD/C7ponmUFy
         QEcDwQIW48QuNp7uq2lx0yMtltKyk4THSPLZkIU9Rg/soTv0Hw0y9bDXIXlREL9Sfgo4
         0k2E4+1LAfWtDideUd5AOZgUkh8502y+kzXOFRIAznbOmFB7BtwgI1npDFSitEQ24WD7
         BHcW4CEVlrD/UbWBT/O5XpQqepi9G7kY2Dmipof0KrvPFnEljDkb5UwwIHiaTr5vqpO7
         LhhPmMDF7U5aaPPCFFNGvBRniDh0xc2hJ2oH0hBwOQuvnYj4FzjKJs117c+vNh/ehj19
         h7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787754345; x=1788359145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skZHhH369VPUOeA1qWU/JjUNfYqgeJvWRZG+FN1ThEI=;
        b=Ae/7E+eDrN1ozDUqK9N7W0r7+eVtn3v9MGZXEnTLzTitR0K4n0iTHKw3/fhfiAuRB9
         bWw2y2OY+xVUDQWCDy1HTTd01/8ZYgJ+BIF6G05aBMP9ykMuYW/LEm89JKVIHQnXYOkb
         EXeMnXeyCS7IusRy9wNvT1/eN1PLJs5spm6QGRLlRbdzmGPgIU2kStbzxlZ8fi0jbToB
         k6ps0Smg74x6ppo1DJ9l8HjuzuWFeidJVQehIi/iXpWTUX8x9NTw7TqATnPHGS0bh6Fg
         ZnmXtk+pgLbJB1gFM7TAN6g1pFuy4UWy9YlF17u4nRy3/JYvZDtpe+I53wDyAeAwNAmq
         kypw==
X-Forwarded-Encrypted: i=1; AHgh+RqugvjP44JEe7wBOSH2ZpwP/ZkF7tD0i5CoSZgXqLhDUVzVSnPgVenbEjfBwH10uCo62n1dAgrw6eA=@vger.kernel.org
X-Gm-Message-State: AFuF++mI/JjIAhfk4Us2+hWHVfW8z5ATsalQQiEiwlMt4Z/+UBbzBb/z
	/VdVP87z+RxplUMneeDsKKvIFS+F2/hOSIIEL9C6NSVwhiCWWxkBhN0al0j52AVhXA==
X-Gm-Gg: AR+sD114aspd9qdgjPIuxTuAD3TKylOtx0Bu17ssp428TcOxJ5So6yd1L0ToyY9Jmi8
	BupKZtdOthSv1tUnzBXFtys4Duzh936Gxb6qnIfDFpA2MX1ovrsr0e0HqPGVD0y7jx+7PlrA/0J
	e4lMmSwiBaxFPedk2fFr7/3lvp5FPebJSSYYgMdmgpjAfdHYRT5YdDqpqy6AWdGBlmd98o1ngnt
	GVz3n316jnVFYIUv82bCrty4PszE7CXmhSh84+a7DiBJwHvTAuKUgHxHfVg9kkSZ3PZulFHb+WS
	A4N51GzqrNKeSrv6hcEsqdB3a2SHssMe33YPO+M+bQV5ATqGrHgTEPyRzh1eir85Lt9gNsfzfx2
	NYv+blMHqC1SDivaPiPNhHz+DbEbmm8t8LSYsckfwsCVNZN/+1mLdka5hZmSn2N49Tvg+SJVMgk
	tClVlmhN2+ZBvIM97Oipf0YY4jWoT0ErnMUdeH4D4uSufh3dUM6ngLZfwhA6FAseRKWLhzpkn9R
	wn9Q0Oh178sRFeZSw==
X-Received: by 2002:a05:6214:611a:b0:90c:d36b:9095 with SMTP id 6a1803df08f44-90cd36bad1cmr4129476d6.27.1787754344510;
        Wed, 26 Aug 2026 07:25:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc65283bbsm26904326d6.35.2026.08.26.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:25:43 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:25:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Ignore remote wakeup for Fintek ttyUSB device
 to fix S3 auto-wakeup
Message-ID: <b1b67706-6fa7-443b-acc8-8fad20b1b505@rowland.harvard.edu>
References: <20260826085924.2083522-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826085924.2083522-1-dengjie03@kylinos.cn>

On Wed, Aug 26, 2026 at 04:59:24PM +0800, Jie Deng wrote:
> The Fintek ttyUSB device (VID: 0x1934, PID: 0x1202)
> has wake-up capability enabled by default, and changes
> in the RTS/DTR signals can trigger a remote wake-up.
> This behavior causes the system to be automatically
> woken up from S3 (Suspend to RAM) state unexpectedly.
> 
> To prevent this unwanted auto-wakeup and ensure the system
> can stay suspended, add the USB_QUIRK_IGNORE_REMOTE_WAKEUP
> quirk to the device entry in usb_quirk_list.

Shouldn't this problem be solved in userspace, by disabling wakeup for 
the Fintek device?  What if somebody _wants_ the system to wake up when 
the RTS or DTS signals change?

Alan Stern

> 
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
>  drivers/usb/core/quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index b5b577f0b931..b0856e05580e 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -528,6 +528,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	{ USB_DEVICE(0x1908, 0x1315), .driver_info =
>  			USB_QUIRK_HONOR_BNUMINTERFACES },
>  
> +	/* Fintek ttyUSB Device */
> +	{ USB_DEVICE(0x1934, 0x1202), .driver_info =
> +		USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> +
>  	/* Protocol and OTG Electrical Test Device */
>  	{ USB_DEVICE(0x1a0a, 0x0200), .driver_info =
>  			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
> -- 
> 2.25.1
> 
> 
