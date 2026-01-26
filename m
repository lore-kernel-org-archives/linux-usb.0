Received: from cczrelay01.in2p3.fr (cczrelay01.in2p3.fr [134.158.66.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7799A20DD52
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.158.66.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769415854; cv=none; b=g227vmOH+TZU1WCXEupPxaNE5dYXEVVUGeJLShhqFW5tnS/uRgEqte4vTAyaI6KGjXbguAwDedJXf1xVk+/fGN/2j9XecWOkGQ01B//r8OUg2xnVyvx6hy6TnJNavJmmqQGSb5Tx+dpRZ/h6UVXyzUn+kUcBa5egfQ+9mXmqkUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769415854; c=relaxed/simple;
	bh=bz/HOyHkphK1Zn02296WEge0OiFR3qFjQjWBLCvNL5I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=VhhGqDQ6Q7R9cw8KO/JmFwBkSo2PRjm5G55joClwT1Pf2Ss6wViZoij5XtHhCZXJNOm8Bm4ji3lVni0lDUrKsf2DVmJxpt0Wy3UTPzy9CVAUg9BCaWXCN8eIqbOEgsrZK50LZanuHP/n/QzPfPSdPGwufYaDbhJjwUVwBZktioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clermont.in2p3.fr; spf=pass smtp.mailfrom=clermont.in2p3.fr; arc=none smtp.client-ip=134.158.66.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clermont.in2p3.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clermont.in2p3.fr
Received: from [134.158.124.135] (clrelecpo09w.in2p3.fr [134.158.124.135])
	(authenticated bits=0)
	by cczrelay01.in2p3.fr (8.14.4/8.14.4) with ESMTP id 60Q8OA3q011960
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 09:24:10 +0100
Message-ID: <1a8352e3-c06b-4e7a-b62c-1b61c9c62d8f@clermont.in2p3.fr>
Date: Mon, 26 Jan 2026 09:24:10 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: can't enable UPLI-compatible PHY
From: David Picard <david.picard@clermont.in2p3.fr>
To: ML-Linux-USB <linux-usb@vger.kernel.org>
References: <a22356cc-4e55-4b09-8b76-5444bc55cb18@clermont.in2p3.fr>
Content-Language: fr, en-US
In-Reply-To: <a22356cc-4e55-4b09-8b76-5444bc55cb18@clermont.in2p3.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Well, my question doesn't look very inspiring... I may not have posted 
to the right mailing list?

Can someone point me to a mailing list or a chat channel? I really need 
a hand.

Thanks,
David

Le 22/01/2026 à 16:31, David Picard a écrit :
> Hello,
>
> I can't enable a ULPI-compatible USB 2.0 PHY (Microchip's USB3320) on 
> an Intel/Altera Cyclone 5 SoC FPGA (ARM core).
>
> The PHY is supposed to set its CPEN pin high to enable a power switch 
> that drives Vbus to 5V, but it doesn't.
> I was told not to worry about the regulator messages.
>
> GPIO0, the PHY RESET# pin is driven high by the devicetree (checked in 
> Barebox).
>
> The Barebox maintainers think it should be easier to fix in Linux. 
> Could someone give me some hint?
>
> - board schematic (p1 bottom right: SoC FPGA connection;  p2: PHY; p3: 
> "USB load switch"): 
> https://filesender.renater.fr/?s=download&token=36b95591-74c7-4a2b-ab7a-b0b1b5b65a82
> - PHY: https://www.microchip.com/en-us/product/USB3320
> - my configuration: https://paste.debian.net/hidden/77078877
> - Buildroot defconfig: https://paste.debian.net/hidden/e8b1d0fc
> - Linux defconfig: https://paste.debian.net/hidden/d578d0f9
>
> David
>

