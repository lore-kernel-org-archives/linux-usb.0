Received: from mail-m15596.qiye.163.com (mail-m15596.qiye.163.com [101.71.155.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E432F748;
	Thu, 16 Jul 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198876; cv=none; b=S3AVL6ADFnk9iJBbe+S2dg5oODI+icWQC6CP2lLqVlaDHQ/wO37F7SfFz3sVWDFNMiITjWDiE4ke3bCb2XXSMiFwSRNifOxW0Usk1h6HdyO8z6GrRwZmbrPMWTWo8nfJ2HYFomVWrukBYXoYZZcQ0f+OZaT0VauDR/pQZcddfJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198876; c=relaxed/simple;
	bh=mHdQZ4FgDvLZfFORUIe1L+AKEPPKIUtp/1N2bVG3G/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpVR/fcK2NOtkOanowK7GqLH5f0sjQiN9klYamef+p0uitotaUdZXXzQUDL37D68DtYh88S5DGZ7nEDUMYvt+tvxB5tgAwmsd1ExvH7tkYLI2P61owQdzLj2EAwWV9n2MsEmfAJY9/D7jZ1Prz97AiEaCtP3sp/PfUhpXk/2ZOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=FDMJI7YM; arc=none smtp.client-ip=101.71.155.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="FDMJI7YM"
Received: from [172.16.12.33] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 465f3be24;
	Thu, 16 Jul 2026 10:51:03 +0800 (GMT+08:00)
Message-ID: <ae33b62b-a207-4f4d-991a-08e003b36abe@rock-chips.com>
Date: Thu, 16 Jul 2026 10:50:55 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/35] phy: rockchip: usbdp: Clean up the mess
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, William Wu <william.wu@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@flipper.net>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, devicetree@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, wmc@rock-chips.com
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <alfM6dFBovHMaYn2@venus>
From: Frank Wang <frank.wang@rock-chips.com>
In-Reply-To: <alfM6dFBovHMaYn2@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f68d5b30109d8kunmfd1a7f0d1e28fa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQhpKQlZPHh1MHUhCSU
	5KS0JWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FDMJI7YMtrsEAYHSUTOBUg7CbM/exOlB4gdt+De0hvJiq4tmKbIdtfxYHzM36rbp/zvX9TjlLDNJVEkQggt6bEkamKvD97Qn4aLDazDqIr4DvOZLOQxoz1FqxrS9Ce1o6EcU5I9VLqD0LodEemf0s/JMzUCUa9IRYckKajsUUtY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=6YZoRqw4V646mfHPwBC40d1B2IIwaKjX06C/hegVfHI=;
	h=date:mime-version:subject:message-id:from;

Hi Sebastian,

On 2026/7/16 2:24, Sebastian Reichel wrote:
> Hi,
> 
> I've gone through the Sashiko feedback for v13 and I do not plan
> to submit a v14 for Sashiko feedback at this point. The issues
> it reported in v13 are either fixed in later patches - especially
> all those "pre-existing problems" - or do not apply.
> 
> The series fixes a massive amount of problems in the USBDP driver
> and unblocks USB-C DP AltMode at the same point. It would be good if
> we get this into 7.3, so that the DRM series is unblocked for 7.4
> allowing users to have USB-C DP AltMode in 2027.
> 

One thought I had was whether you've considered splitting this patch series into several smaller, targeted series, for
instance, one covering code optimizations, and separate series for distinct groups of bug fixes. This would keep each
series lean and easier for maintainers to review.


> My proposed merge strategy is to route everything through the PHY
> subsystem as the changes in the DWC3 driver are not very complex
> (purely additions), so a merge conflict should be easy to solve.
> 

On the dwc3 core changes, based on Rockchip's internal testing and experience, runtime suspend does not kick in as
intended during hotplug events. The dwc3 core uses a default autosuspend delay of 5 seconds (defined as
DWC3_DEFAULT_AUTOSUSPEND_DELAY). I think we can try to make this parameter configurable via device tree properties, as
this approach would result in a smaller, less invasive change overall.


Best regards,
Frank

> Greetings,
> 
> -- Sebastian
