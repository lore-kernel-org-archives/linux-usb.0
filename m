Received: from smtpout07.a1.net (smtpout07.a1.net [80.75.33.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A951356F
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.75.33.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271093; cv=none; b=SyVkcIph4XKWM+IIl1N+7RopzPR/mjhPvmhqjezDJKdSau4bS1yMh3n0pQZIfOoSe9VnhFYlRSO9AXd13sMAN4KHiIEhVNwIL3c+WNcqMNkX6WbRgTE1/pwSK8aMMfoDQc1KZzRGDamhorBN2Wa+40XNRwpe0Cv5fd+lVqRVNhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271093; c=relaxed/simple;
	bh=uSg8en1gccqC28CjLlDSQ9smEkUwiC1T4ewzJE4o2oA=;
	h=Subject:References:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YIHs5WVXyjIPOUE4Iy6N+Nd7TcM+zgE1+nj1ALif2DHYLZ6mnsne/NcBjUVmZMq+Jk1pfyYK7sp50uBjMysmy81XPEsSRP+GFNB705r41iSVp969Idwle/JitM5Je6Seoc92hJl/4E53T7VW/NWdmFg5JhxDUGwaR+dSSRqc3eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=0DBQsPqG; arc=none smtp.client-ip=80.75.33.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="0DBQsPqG"
Received: from [192.168.0.6] (unknown [100.81.136.137])
	by smtpout07.a1.net (Postfix) with ESMTPSA id 4hrLV61Qs8zGrqnr
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 19:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790271086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DG2LIl3JkN02KFZj2DPeqysMn7EkmOs3aA5FdwGwLsE=;
	b=0DBQsPqG2c70KZ20iAg8sVonSOqi0YdmcsUwpYr6NQCE2b/c5JGf4m3W/ieQxddoDmxUyC
	vtzconCsNzBje97kD2Y+hPGGuPmyiS+rP4selelxa1Rgz6K8Vihkc/jdq6cZsZW7hgO2e0
	teuVH6lblhVwhtKjnURhvinagh2bnQqBPajlPqCeF5A0HDC+XO4eCigwV3fX+qrGLjSIZH
	gIemopTP1kdkl8pdT+Afd4uV2omiRcLouQ1/imseWfjUdWHtGxzY9S1ancvs303FcavNo1
	YhId9iEYrRed9KggObb7Sw5/M3sM0MoPhjWsVnb60QQOgeGI+kxINgvoOENm71ryP2G2Jk
	46M6r9dPlvKTVUVR+/n2fxcxFslalLndLJ3k92QWNHVgnJArBn9fu94povI+172u79H9Nr
	NSKKqdzNZ8pDXGMpBP3VXOXsmW0PhVyV0TF4y7cBzwaDjzt/QrcdcoyCMz8BBgBjHpIMHD
	h0Z5jZT6JUpntwMOfKoIaJNK4Lndcbd1OdA7+43XrFbwF0s/hPR3wQTYIfjr209Qd1Epa7
	puf7bKAYGEyG9dgkTeFzh1S1B+Y7y/ERdUnMngvypsIk+oZ3vAVIkoyKRJQbi42PiFACXj
	c3mZIj3lKPWtVybFH5x44fhsuwUkb0tGwfayAQlmQGF0FEKpJC1X0=
Subject: Re: possible regression in usb-storage?
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
 <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
 <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
 <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>
 <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Message-ID: <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
Date: Thu, 24 Sep 2026 19:30:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Level: 



On 9/24/26 4:28 PM, Alan Stern wrote:
> On Thu, Sep 24, 2026 at 07:18:20AM +0200, Johann Klammer wrote:
>>
>>
>> On 9/24/26 4:08 AM, Alan Stern wrote:
>>>
>>> Better still would be is you could also collect a usbmon trace under an
>>> earlier kernel that the drive worked with, so we can compare the working
>>> trace with a current non-working trace.
>>>
>>
>> this one is from a 4.9.210-1+deb9u1~deb8u1 (2020-06-09) i686 GNU/Linux
>> the device node shows up and can be mounted but the drive light is on
>> permanently and I get
>>> [31473.010372] usb 2-7: USB disconnect, device number 4
>>> [31473.016105] sd 4:0:0:0: [sdc] Synchronizing SCSI cache
>>> [31473.256060] sd 4:0:0:0: [sdc] Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
> 
> When do you get this?  When you unplug the drive?

yes

> 
>> the log filtered by device 2:004
> 
> ...
> 
>>> ddba6300 2786664488 S Bi:2:004:2 -115 112 <
>>> dcd97860 2786664509 S Bo:2:004:1 -115 32 = 01000001 00000000 00000000 00000000 12000000 24000000 00000000 00000000
> 
> This trace shows that the uas driver was bound to the device, not
> usb-storage.  So it is not at all comparable to the earlier traces.
> 
Sorry. is a different box. will edit modprobe.conf and regenerate..
