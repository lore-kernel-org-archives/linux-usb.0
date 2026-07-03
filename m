Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40A326D4A
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 19:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106115; cv=none; b=bnlmzhhR2YJBczeVZRyGeFovObqZ/orJHwG9SsmBAv4xxdYm/cnKnWuZnhL1BtZlzi06K0tgsLpKqKFU00xiseD8d4nwuxVwjTzhzSOhICZOCdcQ6TkgALx7M936LRBqp2Fj6OOpHYqjA8nocZ/BfI7yQ+SPMDm/UAX3yp+cDyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106115; c=relaxed/simple;
	bh=L9p9Y4VXzxuekZP/EEZ0z7wzuiFIMpYE6a3TZYZUhac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etTEn4HmRc5w6PdwxIe0FZWlvrkZnZhvtGZiKOjSKr7qIuJeIBDTEBqVVfAUWR3KZNhXO6UomVSPFSscQDZhSGVYcarcohQHe97+5y47e0dzgBZTKWs8jBkgGKhAOQiwVTLW3G6qn1oO9prKdMSgU7WPcTt56FXRxs79CBC4raI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6KfzN2e; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6KfzN2e"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so752750e87.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 12:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783106112; x=1783710912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GacK7qnd6Vmm65ky3QjmKHqAzlgQEODDT7V52bQINNE=;
        b=T6KfzN2e+hAuereRlquz7d3O3o1bccxkq0WrV+v3fB5Me19bgAuSwHvaZyrrYj/kbb
         Yz9rKY1aBmsMbiUdg06QdbJN8w/4Ldz5ngGXY5+7iowt4WyBSTcWy0Q/Z/I5uW6gJPag
         iTJkdf2+Yb9Pov5dbk/r9wrhn1w6cnXqW6qRo0q/bTGkorgmsn3f423hVNil/C2lF9XY
         iktdkAK+ZKckDRr1ONt6jEaSbTFu38m1C6tsyvuzXTTTC9BRdt4bQgviaoXv5fNxbtyd
         M3tuPwd/qXHAWJi8ORXIS+PnxoAQcioGuhvY8mc3+N2WOlZ5jYP9iXprLWyGU+Gqhs3H
         6ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783106112; x=1783710912;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GacK7qnd6Vmm65ky3QjmKHqAzlgQEODDT7V52bQINNE=;
        b=MZy8S6OQJ3/aOKht2T0Tgd4D1btWSocsB6/i2G1YIw/QJs8VoBjnK64f7mfw0YYejb
         +ce0aGKDMKpYQO7dHwEsC4zq5rlDg9a89pKKdXBtxT19PKyivwIXj/x/xHf/OEG+Sqh2
         7q1/2EZ8DFNRtUvW0RX/PPt2ir87ZhVz2oa2bbCkn+L7l6PaAHG4+SzqbFGD7DtKe39d
         eLpVV9NeLAJccacD3sBhwFv06HqFWGEjrxvwHFMSSf5zvlEqUwDTv+C2YL2xLHvotDkp
         /FiHcKAtx+MiwLKvl4GvH0sn8uHAS8uf1btgzuWn4p5GzL76i4poqe9HZXB/r841ScHM
         PAew==
X-Forwarded-Encrypted: i=1; AHgh+Rpt96W/nBRvIsu6BOCay4n7bOMEo/CnuWTKbJJBvOYfjNUS7HGUkU6RtgY93D6bxxm5JUDQqb5mV30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJqfwLnwvpdiJ+dXVWOLbygcUWIxq6fn/K1vi6DoVzGbta7S6
	xWcda7Rk6gCE+C7ex6OBi9ITnoGZbfHhBjVy5iA9+NoBSu8OoXv+bQZpnrYZZA==
X-Gm-Gg: AfdE7cluKqmaVMEE2Ww8HZ7DlXYyV6iRRl5xUJlBqyR+vXgSweMWVdt/oLyl3PeTASY
	nYw5Budv7N5JVYwmKngJ+DBtb7OsGGeg5Cqp31sAe/hjTFDIiglTpPijRAlWHxAQaJ7h/qX9LVE
	vKkmZjnfP5x/0Q0jQ76Zszuxq4MxVvYIPyJriDACOBhMwqx+TJ8jyVIsMZAKEAwBpe7zj81ECt1
	Xb0Ex7/0vhdGlfGrwSJo34n1diHiTf96rgSSnSEf5cN42zIDIsQ0jripl9LJpsyQUEfn6kX61i3
	lPk9zuSUvARNsYWR5y0IzQPZ1fA44t1xfWjPktXqjdEAIi59fd879LF5dISpP72Z5gSgPJg65b2
	0st9OPFPiPc7xrJgsypBU4ttVa1soHjHZqJ35ydUxMX+/1kMr1nKXYlmJQ6H0xDYYmeIg7ObVlY
	xV7LqQlKXF48OLIgVLSH/sKYstQCka7gCSzY8wa2GrJTCCtTg3oR6eslmLsw6ySY3KBFKFcMGTU
	wooVQ==
X-Received: by 2002:a05:6512:8059:b0:5ae:a89c:3cd8 with SMTP id 2adb3069b0e04-5aed50b4a23mr30279e87.46.1783106111832;
        Fri, 03 Jul 2026 12:15:11 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4320:f42:12a1:e009:28f8:7d6b? ([2a00:1fa0:4320:f42:12a1:e009:28f8:7d6b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf590asm4217581fa.25.2026.07.03.12.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 12:15:11 -0700 (PDT)
Message-ID: <c5409222-f541-4ba2-8bfc-d16473baae94@gmail.com>
Date: Fri, 3 Jul 2026 22:15:09 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in
 dwc3_ulpi_setup()
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@kernel.org
References: <20260703162033.2847599-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260703162033.2847599-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/26 7:20 PM, Ben Dooks wrote:

> The dwc3_ulpi_setup() calls the register read and write calls with

   Hmm... maybe "does the register read/write calls"?

> dwc3->regs when both these calls take the dwc3 structure directly.
> 
> Chnage these two calls to fix the following sparse warning, and

   Change.

> possibly a nasty bug in the dwc3_ulpi_setup() code:
> 
> drivers/usb/dwc3/core.c:796:45: warning: incorrect type in argument 1 (different address spaces)
> drivers/usb/dwc3/core.c:796:45:    expected struct dwc3 *dwc
> drivers/usb/dwc3/core.c:796:45:    got void [noderef] __iomem *regs
> drivers/usb/dwc3/core.c:798:40: warning: incorrect type in argument 1 (different address spaces)
> drivers/usb/dwc3/core.c:798:40:    expected struct dwc3 *dwc
> drivers/usb/dwc3/core.c:798:40:    got void [noderef] __iomem *regs
> 
> Cc: stable@kernel.org
> Fixes: 9accc68b1cf0 ("usb: dwc3: Add dwc pointer to dwc3_readl/writel")
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> v2:
>   add fixes and cc to stable
> v3:
>   fixed the fixes: tag to point to correct commit

[...]

MBR, Sergey

