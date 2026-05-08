Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE61F3E122E;
	Fri,  8 May 2026 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245154; cv=none; b=Ehiq3nXLqb4WjgnwPjcRcDyEwvGInHteC5Ag9+8qSKV2KzHHXD5bA0FzBGw3g5FxOHVUPWW8rTUzSuRWOXnHKX6TO/jWcIUeBkofwqnE5ALvK19V7rIi9f5XBNAahRSV6nWeO5V70KvUiuUrmzPF7zQvlBekZdAE2rQh4HfQ648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245154; c=relaxed/simple;
	bh=Z4QVziMW2zfbi4OOJBElFuezAzABKP8OuKkYve4nDUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=juv3+Ukz5t9zqD2qwGBWv6PR5dc/uKNriBzHsetw7Uogvx9hI+1E2K234rISO7b+h/cWI55WT7W73r1773+x4hAxBKiox3JsoMo8L+/s8ANmlmy6uJBgCEceJpkBYpxaJV1Pefla3oMF69dev/+FyBOyoFDBMb5YRCff3kRyBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=lI7hjVHf; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="lI7hjVHf"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BRUCPEr2AUN4TJQVDxqJVgm4z1kYj7WQwSKGQ+zFEnA=;
	b=lI7hjVHf7CyZVCA3baj2zwwCwhpMyB+9npPUzNEyjhyAufyQAj1+NOHMpa/Wy2zTrpI+l7z29
	LSZJ5mG6qWPmAur+NovaTpCHC4v7wlTty+RyDJhBEliz1ZaMBBql9NX06g3DWjF4a1vYSKc3icF
	ulQg+u4yN2quzx7XAsg7Nvk=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gBpsL2T2Mz1cyST;
	Fri,  8 May 2026 20:51:34 +0800 (CST)
Received: from kwepemr500015.china.huawei.com (unknown [7.202.195.162])
	by mail.maildlp.com (Postfix) with ESMTPS id 321934056E;
	Fri,  8 May 2026 20:59:07 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemr500015.china.huawei.com (7.202.195.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 May 2026 20:59:06 +0800
Message-ID: <1886be01-2dcf-4aa7-9aac-067634db4ce7@huawei.com>
Date: Fri, 8 May 2026 20:59:06 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 & 5.10] usb: typec: ucsi: validate connector number in
 ucsi_connector_change
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <heikki.krogerus@linux.intel.com>, <nathan.c.rebello@gmail.com>,
	<kyungtae.kim@dartmouth.edu>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260508092026.1364820-1-lihongbo22@huawei.com>
 <2026050843-denatured-bonfire-6337@gregkh>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <2026050843-denatured-bonfire-6337@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500015.china.huawei.com (7.202.195.162)

Hi Greg,

On 2026/5/8 19:03, Greg KH wrote:
> On Fri, May 08, 2026 at 05:20:26PM +0800, Hongbo Li wrote:
>> Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector
>> number in ucsi_notify_common()") and commit 5a1140404cbf ("usb:
>> typec: ucsi: skip connector validation before init") add the bounds
>> check when do the connector change both in pre-init notification and
>> the forward notifications. But they are difficult to backport to
>> early stable branch such as LTS 6.6, LTS 5.10 due to many dependencies.
>> Instead, we choose to validate connector number in ucsi_connector_change
>> directly to avoid out-of-range issue.
> 
> Why just these 2 branches?

I only noticed these two branches, but in fact, there are more.

> 
> And what specific commits are needed exactly?  Why not just backport
> them all?  that will make future changes apply properly as well, making

Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector number in 
ucsi_notify_common()") use the ucsi_notify_common helper which is 
introduced in 584e8df58942 ("usb: typec: ucsi: extract common code for 
command handling"). This commit refactored part of the code and involves 
many modifications to USB ucsi controllers (such as stm32g0...), which 
were introduced after 6.6.

I think there are two possible modifications:
One is to adapt the modification for different branches, and the other 
is to modify the code in ucsi_connector_change (as in my commit).

Thanks,
Hongbo

> the overall work much less over time.
> 
> thanks,
> 
> greg k-h
> 
