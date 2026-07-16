Received: from mail-m1973197.qiye.163.com (mail-m1973197.qiye.163.com [220.197.31.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869043A8723;
	Thu, 16 Jul 2026 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198834; cv=none; b=U03WtBgnpFE5/iFdpY70iDe0VbFBZA9sZgBLK0hp7wis4oUrklNzJqLvKuNsoh0nzJEgm0ub4ER79dueQquZH0DVsR6GkVzR1Yy9TADtt53bZFfutsnneq5oAZh+Sb/CxU1llNOPbNFTjgZaDDZNgn/aVEedvHO5MF8HqtIzrwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198834; c=relaxed/simple;
	bh=3/y+nFUROVTEhsSSdEPk9JZPqdrXPLLqfA9r3Oxfglc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gB0BOcspXG2OpYoJX2ih3UAB5eyg3/LAhray3BKvGo5cMwvlhLouR4je6SQO1WoDHvTtuX6T0B2RB/jtUm1JeAQ9mMCkueNvLaAITkRTLIWMjxn20pa72eqTIca7x5TmIqMlevkcEjOb3ZEHV2Vro8UTGGWshuBfZGGc2kEfhk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ZeuMMymM; arc=none smtp.client-ip=220.197.31.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZeuMMymM"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 467096e7a;
	Thu, 16 Jul 2026 18:31:46 +0800 (GMT+08:00)
Message-ID: <b2c3f187-92f1-4583-997b-64568d2a02c7@rock-chips.com>
Date: Thu, 16 Jul 2026 18:31:45 +0800
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
 <04a68703-14e9-48f8-8e5d-471bb54887f6@rock-chips.com> <aliZ-nRG55rfmaui@kuha>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aliZ-nRG55rfmaui@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f6a7b7f3603a7kunmb72e64531cf460
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGUJIVkwdTU9PTUoaQk9NS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZeuMMymMhGQsem6eQ/PXhSupAs9IeYLWE5MA9l+ujtNqyTj1n4Sx1HMLGbagYW/nQsxpEOwtopWM3Yq+ARvMcZrK8eLnKSO+tOYNJT09yB46UNzvgZug0t1+EQvZAAXv2zsBv2lgUWT8O6JMm+nLc03X/XIBBXTEoGqWtgUejNM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=fqsrydM+UUN1GECs1wVZQuUy50HdaCtLeMfzq7qVfJ4=;
	h=date:mime-version:subject:message-id:from;

On 7/16/2026 4:44 PM, Heikki Krogerus wrote:
> On Wed, Jul 15, 2026 at 09:19:24AM +0800, Chaoyi Chen wrote:
>> Hi Heikki,
>>
>> On 7/13/2026 5:35 PM, Heikki Krogerus wrote:
>>> On Thu, Jul 09, 2026 at 02:21:47PM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
>>>> also needed for embedded platforms. Select it when available.
>>>>
>>>> Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>> ---
>>>> Changes in v3:
>>>> - Link to v2: https://lore.kernel.org/all/20260705065832.184-1-kernel@airkyi.com/
>>>> - Use the same "select" as v1 to make things simple. 
>>>>
>>>> Changes in v2:
>>>> - Link to v1: https://lore.kernel.org/all/20260702022036.44-1-kernel@airkyi.com/
>>>> - Change "select" to "imply".
>>>> ---
>>>>
>>>>  drivers/usb/typec/altmodes/Kconfig | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
>>>> index 7867fa7c405d..b054c0b6a8d4 100644
>>>> --- a/drivers/usb/typec/altmodes/Kconfig
>>>> +++ b/drivers/usb/typec/altmodes/Kconfig
>>>> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
>>>>  config TYPEC_DP_ALTMODE
>>>>  	tristate "DisplayPort Alternate Mode driver"
>>>>  	depends on DRM
>>>> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>>>
>>> Is there really no way of making this into a dependency?
>>> Doesn't this, or something like it not work:
>>>
>>>         depends on (DRM_AUX_HPD_BRIDGE && DRM_BRIDGE && OF) || !DRM_AUX_HPD_BRIDGE
>>>
>>
>> I think Xu originally wanted to select this item directly, since it
>> wasn't visible in the menu and there was nowhere to select it on some platforms.
> 
> But now it is user selectable, no?

No, currently it needs to be explicitly selected in Kconfig, 
and it is not visible to the user.

> 
> Thanks,
> 

-- 
Best, 
Chaoyi

