Received: from smtpout17.a1.net (smtpout17.a1.net [194.48.128.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7232E128
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.48.128.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790455548; cv=none; b=eSDwUCEG5/8FRn5B00YO3uM+cJA80Wb9xEbo9qP9BWGsMwUxccgqUnIdUrsNvnuSss5SWiH+TEu0yhsw6yCuhT2ZNtwQ7jj9xNK3B03stgkxJ129vrcnWQNUixCvx+10HABcntK7As9JBsV4cwMp1WwomYm+etCv1MX0kG3PJjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790455548; c=relaxed/simple;
	bh=3+n39fNnQtk8CI/6hGOJPOoIxd/FLI7tz8anfFIy14E=;
	h=Subject:References:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=s8eSFjx/6wJvWGPG37fFo+xykO/JCzuX8Q0wW46UKHb1H6zVLqQ0R7870vSzWmxKZ8Jo0jrC55ILRt1R3ts1dFL/6OAyz7tdE3aUvHC3OWlhARwt4T59qBDMp+/KreeCGpYuzX5FSb2EutoA4YZZuTP86pqQRBKuKFz+uo/7FhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=PJqJP+8i; arc=none smtp.client-ip=194.48.128.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="PJqJP+8i"
Received: from [192.168.0.6] (unknown [100.64.124.178])
	by smtpout17.a1.net (Postfix) with ESMTPSA id 4hsfjD1l9lzGrqnq
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 22:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790455536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/krdb+n32+wzjLy/vrJU96ajzzr1DQvaDARb9SXdQ90=;
	b=PJqJP+8iJSx/en4Vh3jY67bGeEUdn617Ccbuq/DvHnPRvFDxlvtubzR2utZn9NBknUbfw5
	rK/qRCX8rQYekft2RKcQm1Dl99eQUQT4AAaF3JbSsrvkELN1sUsiX0M5kKBfJady0waQXJ
	RFgRhD1tac9Er8Qz7VBAB26pZe00bd8qOZc4Q45EMsH1wRkUUne39qbsDQswsDl58bOY0l
	G91oiYi5AqjBJYKl4cG5iZrKjQ4yEE5MXpfht2RMS7Ba28IZ7CybyO2+zDqwpBeBBXHCuT
	JeLUwqa982PKcPvzE0HGQXZpdht1oji/6LBM6h3MTAP2NcfuFMc+/Exd3A7zqNdpgiVJy1
	gd3s3vkvk20yDkDGHf3UcrfCFEH4KM/+gxgBKRbV47RGEL8HAgKzNdeiSfpHxOPyifkYzY
	i1oH9UOIguLAJdcfH2FKN6dj+wacZ1S8Fj2M+5dYHhixwawyUmQrH/9zN+5UGMcZHXW5q7
	DQfOSw9q/NIkz9Yl0gSc/ASleS/spfDWmEVp5E+d+3hk0rckZSGgyt7I5bdmlhYKMPE+ma
	MnkdfRLZtFR4d8a0Ty8rZhOCtBkBCOuKMs8riH3OaNC3+ms671/QXXC3B7J0T5xyPfmLFT
	UEiU10FUwchS/1GohGNXHqHpxsZBHolFUOJoBEhASMk5fyl4fzIYs=
Subject: Re: possible regression in usb-storage?
References: <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>
 <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
 <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
 <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>
 <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
 <605c0845-cfd4-0702-4322-53d9c8037b70@a1.net>
 <be5899e3-3e3e-4977-e4aa-32ca368f06cd@a1.net>
 <7e2440cb-41aa-3429-fb6f-b0f4cf761029@a1.net>
 <986f81b9-c195-4ef4-8176-ca69a8f506c4@rowland.harvard.edu>
 <04f165bc-e79e-4ef4-1f22-d4ad086c3ffb@a1.net>
 <0a83299e-c9db-46fb-a4ee-85b4e861f5d4@rowland.harvard.edu>
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Message-ID: <bc169809-3fa0-0a8f-911b-909ad2f8d46f@a1.net>
Date: Sat, 26 Sep 2026 22:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0a83299e-c9db-46fb-a4ee-85b4e861f5d4@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Level: 



On 9/26/26 4:46 PM, Alan Stern wrote:
> 
> Don't know what you mean by that question.  If you're referring to
> the packet size for endpoint 0 and the device is running at High Speed
> (USB 2, 480 Mb/s) or below, the answer is No.  SuperSpeed (USB 3, 5000
> Mb/s or above) has a maximum packet size for endpoint 0 of 512 bytes.
> But transfers can contain multiple packets.
> 
> At this point I don't see any reasonable explanation for the difference
> in behavior you're observing.  My best recommendation is that you try a
> bunch of different kernel versions between 4.9 and 6.9 to pin down
> exactly at what stage things stopped working.  A git bisection could
> then zero in on the exact commit responsible for the change.
> 
> Alan Stern
> 

It seems that my power supply is unstable. I had a dvb stick and another 
hdd(selfpowered) plugged in, and with both disconnected the drive comes 
up ok with and without the quirks(except for a cache consistency message 
when unplugging). Plugging in the second hdd with the seagate mounted 
gives me `critical target errors`in dmesg. Plugging in just the dvb 
stick with seagate mounted gives no disk errors but unplugging and 
replugging the drive it won't come up.

Sorry..
