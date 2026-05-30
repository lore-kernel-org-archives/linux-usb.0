Received: from mobintestserver.ir (mobintestserver.ir [185.204.170.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC625B082
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.204.170.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780169338; cv=none; b=NS2ns3ZPnS+WB40DufQVnHJsAVofy6dT3D2K5PQSz76j0+Gr5P6c15ktolo7hAgZrKBi2xT8oUmFa+x1PpsspEA4KnmSmO6FpXbuM9Hz3ccAlDaMmq23daxwARZ2C09+yhqGwtTaEWbX3dBUxKCKfiK2xLmi8Y28pJ9jB87eJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780169338; c=relaxed/simple;
	bh=pxjNLR00GqGn4VCgjyHs6LGljsWw9ehwm2y4wz8BDpQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=cb3xh3gTaKCYEwY2I7YYg1UG8ZHD0G+GEP4rfNLU3hgPq9TLzRi90kzLy/vJIR/BMPjlm4XSd0WKaHPZbvb3wkCztjL4HoOuKV+hUG658MUtsBrllbl69hImuvb1de7UYJibHrylHzawCu8krZ7u6tF0rnUzf3jeFj9wZifs3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mobintestserver.ir; spf=pass smtp.mailfrom=mobintestserver.ir; dkim=pass (2048-bit key) header.d=mobintestserver.ir header.i=@mobintestserver.ir header.b=k2b6drdG; arc=none smtp.client-ip=185.204.170.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mobintestserver.ir
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobintestserver.ir
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mobintestserver.ir header.i=@mobintestserver.ir header.b="k2b6drdG"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=dkim; bh=pxjNLR00GqGn4VC
	gjyHs6LGljsWw9ehwm2y4wz8BDpQ=; h=in-reply-to:references:to:from:
	subject:date; d=mobintestserver.ir; b=k2b6drdGd3Yy7w2eyarCTBdoXg1D1kLc
	OCs4Mw7YfXzHHkbWtPJdWtHgxFle/zeEGGBbbdOF1oikJcnjSROW0tQDvUPI7eDwSNCCzQ
	Ii7AFqiKHV7Z6jj0qJEs93Ia2VOyl8PXCaIMRVvXuWRpUMgEYoF92fp0RlO8UmBdKWaLPY
	nilerJlW2ZlRuow5ieNDyeB+l5ljDQKnr/BpnxEZV0avojL66CFhPWWLvnlGR2Kz+mJYAY
	RIpn8tb6x/3bSa8ssvKhD5bsin6lK5F9rjVb63IEa7LHjMxzOybLfpTRcNwIraUAqF7JwI
	FyETApMQ6oCZBtrshXSEWNSyXHj7uA==
Received: 
	by mobintestserver.ir (OpenSMTPD) with ESMTPSA id 6435d5c8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-usb@vger.kernel.org>;
	Sat, 30 May 2026 19:17:31 +0000 (UTC)
Message-ID: <38eefbed-6f20-480b-aeb1-9f3f05b6146c@mobintestserver.ir>
Date: Sat, 30 May 2026 22:58:51 +0330
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unreliable UAS behavior from 125f:a88a A-DATA Technology Co.,
 Ltd. SD600Q
From: Mobin Aydinfar <mobin@mobintestserver.ir>
To: linux-usb@vger.kernel.org
References: <6466fbc8-e9de-4610-a733-8ea24cec109d@mobintestserver.ir>
Content-Language: en-US
In-Reply-To: <6466fbc8-e9de-4610-a733-8ea24cec109d@mobintestserver.ir>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/26 19:51, Mobin Aydinfar wrote:
> Hi.
> 
> I have this ADATA SD600Q 240GB SSD and I use it as the rootfs for an 
> RPi4. This device is known to have problems in Raspberry Pi community 
> and everybody suggest using usb-storage for this device.
> 
> The problem is that when I plug this device into my PC, everything seems 
> OK but suddenly the UAS failed randomly multiple times in the past 
> unlike on RPi4 which is always results in boot failure. Today I couldn't 
> make it fail on my PC with copying everything from it and also write 
> benchmarks by gnome disks.
> 
> I attached "dmesg" and "lsusb -v" outputs of RPi4 and I hope someone 
> come up with an specific quirk for this device for the unusual_uas.h 
> devices list. That would be really great if I don't lose TRIM 
> functionality by using usb-storage anymore.
> 
> Note: I tested that SSD with and without a powered USB hub to ensure 
> it's not a power issue.
> 
> Best Regards

I retested on the latest available stock kernel in the repo (7.0.9) and 
it also happens when using that kernel, it's not linux-rpi specific.
