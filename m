Received: from smtpout07.a1.net (smtpout07.a1.net [80.75.33.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1054CB8B9
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.75.33.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271012; cv=none; b=JDq5/EkVTb8aHwUFzSUcmvjkAQBhRazcRdHfOM7D/aX8Epd1bQg3BF2u5gJS35LORLALuR9cKaTBngXKurh5zreIKYcMZ/kjA8tq8cSLeGGtNSiA+OZQMMHFDnW7vtbWfRqcneOYjnt0RrkBqIJuTfYviyyQchS96YghzKQTr34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271012; c=relaxed/simple;
	bh=oMmx7vLmbNJKupNloemXf7bu7Ds+0N8ZgtKcLbE0qK8=;
	h=Subject:References:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hcCj0pOfVAh2O8veFQo+0tdAKkv110YgHoEEmFgRAW4t2FvJbB1GraTSOeHnovuiJfl9PbrxX+pYSWlvUHi5HJZwT8lIg3UOu54EZtWgmo3HznNT3dOMBHj1a+lOLyuDYS6AqQpHM0hAFlmQsY42ZM3IOg6hIl04ANihqWlHtdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=tKiV1GQ+; arc=none smtp.client-ip=80.75.33.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="tKiV1GQ+"
Received: from [192.168.0.6] (unknown [100.81.136.137])
	by smtpout07.a1.net (Postfix) with ESMTPSA id 4hrLST4GqnzGrqnr
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 19:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790271001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOObnqVW9tAJ3b4Pk5/l4zMQnX/T/BpU3I8YVn5gcP8=;
	b=tKiV1GQ+T1RAUX3WTP+pv17i0Cnj6cQpek2TUmbNChKv9OP57lfnUQTeaRgvziR6OCvu4o
	OfEPt/06BQSgsNtFzEKdIqFf+QJ6jfnDRsGawQxoX8oO1vxnNM5F3mR2bNDDjni1RVIxaN
	UkZEOklxd7ymnnN1wUhUxsoo+yMealwM3+LmqRWse+9D5QLX5l/ZJuUuUIlbTSk6FnDW9l
	h//hdYI+22clGo9ezpst6NUVj8CSIOYsdWe0cyB0ow/2tmei0R21pKTp6+b8i3mK94Kpr2
	tVsJ7ti5lmLdJp4flocCJguTQ5T554SdaDvvzDWWbVpjqbp0jZxqTKZc73pB/scXZieAU9
	XAWmJczC1kgdAdPiLzvSNvXg1R3UOsx/p9nXmTgFFI+xLpqedo2NHwFnNaT+WtQVX1Yejt
	jcpwHhRYHOjFOPEII5KYfb4eEKKRLuf9FOfYV0bzjtIGxR8hx0r1fyoKo1W0C5IUXXFL5+
	cnpK2zOx7RjrhmcXUKbgYuYjF9yjirQ7ZQRXUqgmwFdyYn2sKA6wsaj1nOp1Ma4KniXiS1
	M6tVScQPFCyJVyPK53MHn2lQu9bQqLMnW4nszL7NeKR03/cAZLtqfVhWdvBITjWq0/7/xV
	NO+o4qkqzVvTFHy7K0ZKbJX0FDqE+y3a0qNPj30D1ALpfwdahREHA=
Subject: Re: possible regression in usb-storage?
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
 <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
 <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
 <3df6f96f-1553-6842-0e11-9c08254b8da7@a1.net>
 <0ec3cc09-0c51-47b4-9f3e-934d5c23ef5d@rowland.harvard.edu>
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Message-ID: <7e152f4d-f829-7cc0-8188-9c7c5c2b7b4f@a1.net>
Date: Thu, 24 Sep 2026 19:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0ec3cc09-0c51-47b4-9f3e-934d5c23ef5d@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Level: 



On 9/24/26 4:24 PM, Alan Stern wrote:
> On Thu, Sep 24, 2026 at 07:00:25AM +0200, Johann Klammer wrote:
>>
>>
>> On 9/24/26 4:08 AM, Alan Stern wrote:
>>>
>>>>> c6f9c300 1171417312 S Bo:1:007:2 -115 31 = 55534243 03000000 00000000 00000600 00000000 00000000 00000000 000000
>>>>> c6f9c300 1171417339 C Bo:1:007:2 0 31 >
>>>>> c6f9c300 1171417347 S Bi:1:007:1 -115 13 <
>>>>> c6f9c300 1174819198 C Bi:1:007:1 -108 0
>>>
>>> And that is a perfectly ordinary TEST UNIT READY command.  But instead
>>> of responding normally, the drive seems to have disconnected itself from
>>> the bus after about 3.4 seconds for no apparent reason (the -108 is an
>>> ESHUTDOWN error code).
>>>
>>> Alan Stern
>>>
>> that may have been me unplugging it.
>> here's a longer trace. I waited for the threads to crash.
> 
> How do you know that any threads crashed?
> 
The dmesg output shows a worker thread and then udevd getting killed.
The logs rotated since yesterday so that's gone now.

