Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670FB2737FC;
	Tue,  1 Sep 2026 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228768; cv=none; b=qbFANTJgll8tOeAvTJLHPBLTTaZoBO+IyyCC5WolgasHW64IIPJd8Y8biIVIDmZU48408RdIgdinZ0lxorp4SKnf22R9vY0uHtjSb2CxmHWzcidfv7lGSRJ4TF+IezOpB+K3bJZWquKIBbOviCPG+1oCBa3CspDF4/ttfZYRqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228768; c=relaxed/simple;
	bh=YU/88RN9JkkCN3yLiBCcSeGMwpKhQ0RhOpRzmucmrNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8M4QYtXbU1dFGfPK978jXvM3xEIO+qSuXhU1Ch7+mmdMIzocJfSC7YAWG6n6UZ3eOU1yWUTprRWaqn3o2LfhT/z8uFqd8iMw4rnZd7vIiNiStYD8M+RaN19a7Na+hGALRmpfkuFGqbvRwd4URdnbO78+zQEieqbOG/SdXF6F58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FTT9zOTx; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FTT9zOTx"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hYq2h0ps1zMlGN;
	Tue, 01 Sep 2026 04:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788228348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2y8XeoQYUNdcL/xqpcqRez98xcbT3PO8hh/NnsKkpMo=;
	b=FTT9zOTxMTtHPP1SVnuKS6hfgftrqIp6AMYPecQcJdUoE6Rf8G9i8nLEwqC1uJuEvuspvT
	IniFXp/KvRsutlb5mXRW4KEXC3UkMN+Ds6ajZ2wSDiq4V/ThSVNtivkEHfSb3AT2mSRRWs
	HRiWOMY4Bozm18ZomNqRGwsPDul7TXs9/Nd5LduVOf2rTXQPsvVME04wb3tf7lgedw5Htj
	0IblF7d9SY1bay+A8I/6l1UmprHElmywHAJ3MfWOLbU8VP41NPtuFig8Md1eKwLb2N4rP7
	DE0Xp6LBLSQabMOELSJIcBxafkX4VM4+a6YzrYOGrfWBUexjQcsW1U4Uf6reXA==
Message-ID: <2634d23f-42de-48f3-b10b-92158e86fdf7@mailbox.org>
Date: Tue, 1 Sep 2026 04:05:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
 <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
 <20260828183046.86F731F000E9@smtp.kernel.org>
 <d7444dd8-c94c-41ef-b5ab-52cb32313df7@mailbox.org> <apIGMJ6wveRRRMCv@vbox>
 <1fa4e305-5717-4a99-9e53-3a7fa1c5df1e@mailbox.org> <apYmMt_vK5fbjBUJ@vbox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <apYmMt_vK5fbjBUJ@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 6q91o4e3wz8qu4cza198yg11ixy5rgzi
X-MBO-RS-ID: cf0bf38f6decd032bc5

On 9/1/26 3:17 AM, Thinh Nguyen wrote:

Hello Thinh,

>>> , but please drop the speed == USB_SPEED_WIRELESS check. This sanity
>>> check is not necessary and would be flagged by dwc3 core if set anyway.
>> Could you please point me to the code which filters the WIRELESS USB out ? I
>> can't seem to find it in either DWC3 core or USB core, but maybe I am not
>> looking for the right thing.
>>
>> Thank you for your help !
> 
> You can find this in __dwc3_gadget_set_speed(). The switch statement
> explicitly handles unsupported speeds, and setting the speed to
> USB_SPEED_LOW or USB_SPEED_WIRELESS will trigger a complaint there.

But this is only for the gadget/peripheral mode, correct? The controller 
in R-Car X5H is capable of both host and peripheral mode (DRD), so 
shouldn't the check be kept in here in case the controller is used in 
host mode ?

Thank you for your help !

-- 
Best regards,
Marek Vasut
