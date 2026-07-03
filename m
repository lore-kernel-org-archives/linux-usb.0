Received: from mail-m19731105.qiye.163.com (mail-m19731105.qiye.163.com [220.197.31.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E51D6BB;
	Fri,  3 Jul 2026 01:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783043491; cv=none; b=J/Kmkt+FW82t5xQ/7HeIQMhuFJ4BdyQM8Q9oaWzOyS/Ij6rZq1TbN+H9Uon3h1NrdKdvCERJyHHI7LT6lF2Tx3Adc+0MUvzKjOUSv8lvJdzCJMIcgtZerjYR0HbSImGvCX9TumNVB6YaF3kVXHgoRj18b4Vrk2KfjQF9RyU/H1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783043491; c=relaxed/simple;
	bh=kvdJlBNsRcIQVwqRaGkHlFc6XNlOELzgEKGdG7cC3Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFZvA0Sc6jrcCRKXEOH5ytJQSjBzlKZcW8P7Am2odrVwMZINCkz9b5vb4e0vUzwy9hCv8FAKXjQp9ATAmubeqBr/+n2glsHr/2tmi6vKjm1F6OfMWoXh1m85C7JARaZRdQAK4BYhalJi1x0TQZ0KW9mfKHLqr9+xvtNdhecfcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=kxPS793/; arc=none smtp.client-ip=220.197.31.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="kxPS793/"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 44b98791c;
	Fri, 3 Jul 2026 09:36:04 +0800 (GMT+08:00)
Message-ID: <49bff117-e1a4-4d46-84c8-1b6a0eb1eac0@rock-chips.com>
Date: Fri, 3 Jul 2026 09:36:01 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
To: Julian Braha <julianbraha@gmail.com>, Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xu Yang <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260702022036.44-1-kernel@airkyi.com>
 <a6d660ae-44b5-4f42-a1b6-267d42f14c4b@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <a6d660ae-44b5-4f42-a1b6-267d42f14c4b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f259e5ff103a7kunmfb422583452fd9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkMeVk9LSE5JSk5JSx9ITFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kxPS793/WFZk+d13GO7wNYWyqvnh690rsjeZTSnUHcn8d/qtxMgLpZ/jEGK3KCvsIAcZh27uE8d/cIUeir4VmdVGLUeYxzJISOQ9NHPjHGIa+yrUUIx+vOIDMrH8ZAUaLtkiXrQFeYa4KgV+etXAUTJG7K7tZfrkPzciiFAzJi0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=3dQXESvAkAHvXMyUWuvW7indmh8vNbuDcU6V90FIbjo=;
	h=date:mime-version:subject:message-id:from;

Hello Julian,

On 7/3/2026 2:46 AM, Julian Braha wrote:
> Hi Chaovi,
> 
> On 7/2/26 03:20, Chaoyi Chen wrote:
>> most likely
>> also needed
> 
>> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> 
> Perhaps 'imply' would be more appropriate here instead of 'select'?
> 

Will fix in v2. Thank you!

-- 
Best, 
Chaoyi

