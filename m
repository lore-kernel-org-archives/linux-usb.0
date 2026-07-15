Received: from mail-m49251.qiye.163.com (mail-m49251.qiye.163.com [45.254.49.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B392DCC1C;
	Wed, 15 Jul 2026 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102960; cv=none; b=X6QcsCydj64kkwRHVcS0soyQaHxANeFX0+KqVw+U+TjRYeKQSVJDVwdjP//dhdRekMGsgmUIcnijgfHtY+uyvQS7aeIA2V3N2sob+HEYPwP2cU/pUjQ2XWuBKGOMV9dv1Ug/cbi1eZdzyzFV/FTh/v4UuLMDn0AmfDcHWd7zsuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102960; c=relaxed/simple;
	bh=AVBKkPKMddoF33xQn6XiY1DVWppZvgi2eL2nfmHnlys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwbJkPY8jxLdla/KbS8XANvGMorIT9ZJTAWHjWWw1XhxmPec6Yh39P3IKKK7Qz9bEr+fg/rYFVTiazbx/Tt/L/9ATylPMGlMwClgRfhUqGM+ARTx2KnGy2JgsMdSaNM6g9k6QI0il6E66IF4fPkhjSbBXAVxuLBam6Nmjt/oR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=dSS3l7tf; arc=none smtp.client-ip=45.254.49.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="dSS3l7tf"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 463324cce;
	Wed, 15 Jul 2026 09:19:26 +0800 (GMT+08:00)
Message-ID: <04a68703-14e9-48f8-8e5d-471bb54887f6@rock-chips.com>
Date: Wed, 15 Jul 2026 09:19:24 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Julian Braha <julianbraha@gmail.com>, Xu Yang <xu.yang_2@oss.nxp.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260709062147.240-1-kernel@airkyi.com> <alSxX055MoxkdahQ@kuha>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <alSxX055MoxkdahQ@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f635b75b303a7kunm7a032f7ede75a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSx5DVkMeH0oZGBhMThlLTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dSS3l7tfdmSu1Smj2HY3KWrsJUgpHJR3/7xC3SPXmrdrwwDeWAej8VR68wGLeplEdOOlQ3Pylw7BXEJloqzF39/pMOmGcajcbGWtgzHlIIwPKK2Pxy7ORxEmuz4iYfJ62gfkoAtUsE9fuCx/Y8y2Q0Ny8klXWbrl+Jwohg18iVE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=xxJ4SMXY8TvkUQcmTjZLckWj794mCj3g8OOEzPhLHZs=;
	h=date:mime-version:subject:message-id:from;

Hi Heikki,

On 7/13/2026 5:35 PM, Heikki Krogerus wrote:
> On Thu, Jul 09, 2026 at 02:21:47PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
>> also needed for embedded platforms. Select it when available.
>>
>> Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>> Changes in v3:
>> - Link to v2: https://lore.kernel.org/all/20260705065832.184-1-kernel@airkyi.com/
>> - Use the same "select" as v1 to make things simple. 
>>
>> Changes in v2:
>> - Link to v1: https://lore.kernel.org/all/20260702022036.44-1-kernel@airkyi.com/
>> - Change "select" to "imply".
>> ---
>>
>>  drivers/usb/typec/altmodes/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
>> index 7867fa7c405d..b054c0b6a8d4 100644
>> --- a/drivers/usb/typec/altmodes/Kconfig
>> +++ b/drivers/usb/typec/altmodes/Kconfig
>> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
>>  config TYPEC_DP_ALTMODE
>>  	tristate "DisplayPort Alternate Mode driver"
>>  	depends on DRM
>> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> 
> Is there really no way of making this into a dependency?
> Doesn't this, or something like it not work:
> 
>         depends on (DRM_AUX_HPD_BRIDGE && DRM_BRIDGE && OF) || !DRM_AUX_HPD_BRIDGE
>

I think Xu originally wanted to select this item directly, since it
wasn't visible in the menu and there was nowhere to select it on some platforms.

> Thanks,
> 
>>  	help
>>  	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
>>  	  displays and adapters to be attached to the USB Type-C
>> -- 
>> 2.54.0
> 

-- 
Best, 
Chaoyi
