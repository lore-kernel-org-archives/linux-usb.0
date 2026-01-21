Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73935CB9B;
	Wed, 21 Jan 2026 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769032809; cv=none; b=WmAubPCiKePxjnX4HRPi5rGKqeZ1Yqn84SW1ZRvedzHuRHQ4B+qB7njnFsQ2BNMEZX3GBBh+Xvx1L7DtzTQXCjtZY5HYbNTodpcc0vtKv1Mk4/p81gxRlO+zvdNgIiCANQzOKY3FPzAvpi2RaMP66rTgpbsQD+dyo7s0YdI1Rmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769032809; c=relaxed/simple;
	bh=sIpd53dSWYWcjeJX4XHP2ng08zAC8byF3TKhSotZffg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SijFyBy4MQS5VFE+tOdp3CrR3awkrd5+Nd0SiXUdAwBV2ULK7DqZe9xmQX2uutc/jicvFYBMV38nuWdDv2drhicdgJumEZOilFUqzrtGU4MKTE+nZPUxUUtqMHLRdrd6YoO1gKdHMUpVF5YI6lzEIuQ+aKDZ5NLXeOdvx3gQbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXrxBF1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXrxBF1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1BDC4CEF1;
	Wed, 21 Jan 2026 22:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769032808;
	bh=sIpd53dSWYWcjeJX4XHP2ng08zAC8byF3TKhSotZffg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gXrxBF1OyZMBX3kpw3aXuV35SCwyjrgUzaYkLbaywrsPaoOwuyECF5sUdiqVIlY+Z
	 KN33R17gfiH2JAvE7V9WAqJ1l2Yfm8z+T75sgKYCr/Fg/SWJ+wYUnIEgHoYieKntkb
	 1mcwrkNxIbne/hlvE/dA/BGauipFyzn6hGhw+tqAuQ+TEZuZPucJ5Y42Bzkwt4TGkE
	 0T/nOZAKrrIiy3Mj4FJUKEaN1e4qbShwxr7iwz8RDoi3ivCQf+i1AxoyDFb4BcURuS
	 ZicwafuYDoCRlnTreNl8Twg7qABq8pXhclQCYIp9wmJl3mHidWg9ORaL+sZ7/iw0Rd
	 MG6PMObWkoleQ==
Message-ID: <2ff6dbbf-010b-4ce1-96e4-1bdacf0d121f@kernel.org>
Date: Wed, 21 Jan 2026 15:00:07 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Reduce CONNRESET message noise in dmesg from stub
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org,
 ignacio@hernandez-ros.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260121163721.11933-1-skhan@linuxfoundation.org>
 <aef9a040-aa24-40f2-83ae-44d2c74dc759@gmail.com>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <aef9a040-aa24-40f2-83ae-44d2c74dc759@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/26 13:38, Sergey Shtylyov wrote:
> On 1/21/26 7:37 PM, Shuah Khan wrote:
> 
>> stub_complete() prints informational messages for each urb unlink
>> filling dmesg. Change the message to dev_dbg() similar to vhci
>> reports the CONNRESET condition.
>>
>> Reported-by: Ignacio Hernandez-Ros <ignacio@hernandez-ros.com>
>> Closes: https://lore.kernel.org/all/0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com/
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   drivers/usb/usbip/stub_tx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
>> index 55919c3762ba..4cae452bfadb 100644
>> --- a/drivers/usb/usbip/stub_tx.c
>> +++ b/drivers/usb/usbip/stub_tx.c
>> @@ -55,7 +55,7 @@ void stub_complete(struct urb *urb)
>>   			 "stopped by a call to usb_kill_urb() because of cleaning up a virtual connection\n");
>>   		return;
>>   	case -ECONNRESET:
>> -		dev_info(&urb->dev->dev,
>> +		dev_dbg(&urb->dev->dev,
>>   			 "unlinked by a call to usb_unlink_urb()\n");
> 
>     Please re-align this line for it to start under & again.

I missed that - thanks - will do that in v2.

thanks,
-- Shuah
