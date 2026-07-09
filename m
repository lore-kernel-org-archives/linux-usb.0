Received: from mail-m49212.qiye.163.com (mail-m49212.qiye.163.com [45.254.49.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72D3D3B3;
	Thu,  9 Jul 2026 04:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783570596; cv=none; b=JSoQx7qDwS9k7ng6Ek0jkk+rIb1kr36YYy/v+Kyj5IFYtYYDJOmjNDZuJtjI4kgRh5VC5GGrTBy75xdkLm5NMqxCAqwP+R+CHXZhx7kTh8y8ZqNtq13oRXXOKSdDHYEGtQigTHAPl4YINofFXPDZrnTIEmPcCdVIU3bx730+hbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783570596; c=relaxed/simple;
	bh=7hD12oWxTNxMGVxJW7KdkczaG0Buol2uSSDVgMYS1V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8Bl+ufQeljNGiV6jyIQ873Mbm+EbB99+TZWuVpMzRqF22huaDUDf/XTjFrfTSUi/j0fkRie7Qj9lZTRWE1GGYeQUg+00++sXNv42tJzYq7tyITnYlpf9az2TsUyLSflv50ahruB6ukosXH5IX4wGQJccVvX6O8ItO5hBHUVjl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=LWkv9UHp; arc=none smtp.client-ip=45.254.49.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="LWkv9UHp"
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 458316113;
	Thu, 9 Jul 2026 11:00:45 +0800 (GMT+08:00)
Message-ID: <f0316f09-e78c-495b-8ca9-c7d4fdde3d75@rock-chips.com>
Date: Thu, 9 Jul 2026 11:00:43 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Julian Braha <julianbraha@gmail.com>, Xu Yang <xu.yang_2@oss.nxp.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <kernel@airkyi.com>
References: <20260705065832.184-1-kernel@airkyi.com>
 <2026070830-tattle-corporal-6fcc@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2026070830-tattle-corporal-6fcc@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f44d2117803a7kunm67ab04a9159782
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQhoYVkgaSh9KS0pDGEIeTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LWkv9UHpemTmW7z8RWmboEYt1AYxn+E4xnPh1BHBSoAHaoqnZSwb/LAeIrOjcWLLY09pfSPv0oEUZSxXLGJ8TGUUsQKwFkgSS9xmfaXhWGbchRqmsz1sGPn0dcFkcB4mOfQUvL8gC3iYoZXN+UTwkWL5e+UnuqPxYY7V3E1Xpfw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=eTHLCri6NVonZFITbaCpUIOJYDszyTae3Bs0i9ejkuk=;
	h=date:mime-version:subject:message-id:from;

Hello Greg,

On 7/8/2026 7:51 PM, Greg Kroah-Hartman wrote:
> On Sun, Jul 05, 2026 at 02:58:32PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
>> also needed for embedded platforms. Select it when available.
>>
>> Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  drivers/usb/typec/altmodes/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
>> index 7867fa7c405d..1f35b253d6b8 100644
>> --- a/drivers/usb/typec/altmodes/Kconfig
>> +++ b/drivers/usb/typec/altmodes/Kconfig
>> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
>>  config TYPEC_DP_ALTMODE
>>  	tristate "DisplayPort Alternate Mode driver"
>>  	depends on DRM
>> +	imply DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> 
> I hate "imply", as this just makes things more complex.  Either this is
> a dependency or not, right?  Why not fix that?
>

Perhaps we can just use the v1 content directly? 
Hopefully that's already simple enough.

https://lore.kernel.org/all/20260702022036.44-1-kernel@airkyi.com/

> thanks,
> 
> greg k-h
> 
> 

-- 
Best, 
Chaoyi
