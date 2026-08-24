Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F01A34D916
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556004; cv=none; b=kgmgqLfMtLAwRj/44KdTB3SW0zm9PVKnNgh3xV9VkODykRT5H6JSqTcEgsMTLAb86Mt/qx0kwszfW7u0Aju70MO9yKT/Z5yix4mGzmvXPwP1a9OmaQGR1fVbDacVWxrVD1S0wPUZ8Do41w5316werXBbizJem7NMW/JHli6O1vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556004; c=relaxed/simple;
	bh=aXL4UHrf+0humdIEef+4JRKRa9+MfpcNujWBdBmDGOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5vXVunHQhd5nHYCnpYT0kArA0ZUpCUNvYl/O8BNjmQsfR8lTeGTQtE7nXdy2oNSLf+kvwZHLZQoEFnga267cn9IHnFKyW84c+wGKlXfzBsMqSTwzoAL1sYj+nLDRCF006nz9L1xHymfzCo4fqjhhy0TXOXsX5DxmQ3TmJBlXck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUFpmHPm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUFpmHPm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso468699266b.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787556001; x=1788160801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=;
        b=CUFpmHPm1dpajm8kHJo/EBAKIRfUvFM8CCblNrP7igR3Bf8DjmaR1GXSQJwvGGexqM
         qkrwtSZnEB77wsfsRUASTLWuasfR7/3sN5ZGMTTNIdvs3p36/cJKb3FpuYlIgbwKuTHi
         E8QX4ghP/fMaLC4oRBeNXUclwjPfydI7y51tRwdps0wyA6rlKj3zruXeYQXWWrDrSEhw
         tbnowEjAVVGLWjTVx/6GE4zmj87DwtqhUOTkBdZYb7Qc7jb5+gKgl1X6PxnBMi3Kk+st
         x0IyJKR3Ehvm8kY+iHZ0Yj5gPTiRO0Wsr3jBIrb1jlxEiRM7skIaHEhfoVac+2BAQrkH
         Us0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556001; x=1788160801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=;
        b=dOjxMKO5R0Zlj8sRnsZPBUOdqYaCbL8xIbmAKWeeJP9A1dLw79on2kO6E/D5tTOtIp
         cpt8fsU/AO10LzGBhG8XByGx+YzjKFBQmwNhW6QYGpmuZYcda5Jk+3ld6y530pBa/GpQ
         /IKz89ymkZiLSBbU89WjzPZ1M76kGSpa4smmy4VX5fVG4pby1DRX4pAd8WxBe68HDxVi
         QyriDZHPeZmd5gIgrn4jzQaH/WOsi8JwZKyYOvB8Js72+yxex6v46zblAgKzwfCuEH2k
         wyKSsO3Yh2NXOkHTNf0d4RolnjC4OjkCHrXY5+VdoNeciV6imWPB80PEdcrkYR80cvw7
         O2tw==
X-Forwarded-Encrypted: i=1; AHgh+Rq502bNoeueBOVk2bO362IgOrERLaos1DjFgzZ5W5UJFsFZzU7vsqS6j0QkHWhz8W7LrGWwXf9rLqo=@vger.kernel.org
X-Gm-Message-State: AFuF++l8uJmEALJOLuOOJraas/4C4eap82WZTNHrckDVH8UA5l/hm0Wq
	tEOHmiI3f9t8ZF2tl6J2b/m3ELQOfBGp3Df9LzvR/6EysUNSIxVE9YDv
X-Gm-Gg: AR+sD13njnFsSeBjdo14l7BkthHi3Bmfe0wVviS9OemaiyHbeb6iwHdMbO/cwgJrcLS
	0z84QC+uYOKVOcM8NptcxQez5r7w6baYG7YnQecy7jRY8JcxLIfVflqf6Z+4ZgP6uHBEGcBTZcH
	R5390hKS6Ch/bTbanTIFKL1KJucjru5jinQ+8S2sYOlGUHfnXD7j6+PEhLSQOKVGxpq04N7/413
	DHGyiNyhrgXc1gIzc14hLiFokll9ffNehOrJQ6NBZfAnBrJReGrFSe3nXF4vcew+TIakiaSBO4k
	Jxgizjx3o3duJl/Zk/BWSifjUjmTxVdUULsxscoueMjrFdKy42PJi96PKkNhQsBbJ+KFTTFgjjr
	h/yMMBaWyXKMx/yJ50kwWbdBfgdXVKRWItAcXwCtcD7f1IIXDlQ5V8iSobnXJJ4Gsn5vY2YKEZM
	MSmuLRUO0AGvxO0bZCwKLH0dA9N4kQKOcXJFyqWpYnxGpswiVm3DsbYotQBcsWYyUR+zQJZ3Dac
	C1lm/vLcO6Y8efLSjQ1bhAN1h5D8e0qsoPUr1r9HH6DirAcUQ+GiYJLzH/Hzgj65rMylflGbWFV
	7caMOCmV9T5YMhDADrQuenEX6zXbJL5GmJg=
X-Received: by 2002:a17:907:7b93:b0:c20:5213:56f1 with SMTP id a640c23a62f3a-c246a60348emr2628478966b.13.1787556000424;
        Mon, 24 Aug 2026 00:20:00 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1137673466b.49.2026.08.24.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:19:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:19:58 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: Add USB HSIC related
 nodes
Message-ID: <qyrzrmrvymwhoziwf3we4fxwb4nfyhb3s7hiuqauzoco52auns@7rihmyhkti2v>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
 <20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com>
 <aohtVk57YIWkj05I@SMW015318>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aohtVk57YIWkj05I@SMW015318>

On Fri, Aug 21, 2026 at 10:23:02AM -0500, Frank Li wrote:
> On Fri, Aug 21, 2026 at 04:58:57PM +0200, Franz Schnyder wrote:
> > From: Franz Schnyder <franz.schnyder@toradex.com>
> >
> > Add the required nodes to support the iMX8QM/QP USB HSIC host controller.
> >
> > Keep the HSIC host node in the QM/QP specific dtsi to not conflict with
> > the address used by usbotg2 on the iMX8DXL variant.
> >
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > ---
> 
> I already post similar patch at
> 
> https://lore.kernel.org/imx/20260720212401.C2BD31F000E9@smtp.kernel.org/
> 
> Frank

Hi Frank,

I somehow missed that imx/dt64-intend branch.
Do you want a V2 with only the changes for Apalis?
Or will you just drop this imx8qm-ss-conn patch from the series?

Franz
