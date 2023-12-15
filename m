Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B322DB6D
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="miHCo2Xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702645774;
	bh=sEPSrGz3WNWD9RYGOIAzyHuQB4tk3+U5UYg/MXlXb0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=miHCo2Xdl8MnKpE+ghGtf26gvzPwYXYO75lqdAr9XMC/JWM1Atqh1ylYXK7FEfA/Q
	 uTOxfVgAM0GhupJUbXo5697f0ChjwqR8cFwNuHSdZ8WBUO8ICMNk0UBxcdnTueEmkA
	 uM2FIiM4GsN5lhx0zlCOxOhNA8+oeXt9RswKRKpbVV0nFAqI60KvJUtTRHAY4Ni17O
	 DRGsTIKFW0yXv7M96frrf/3ABQAtC26blNLJ3w8Z5ji0Ef/dfq1B8WUmMo01awJByK
	 ByXX5fWOCrG8r1CBjwjDBe1aORttzvaI86C5GiHchzNhGcUBIJcUEbRp7lO18czclq
	 U8B3cjVHYeuQA==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2381D3781FD3;
	Fri, 15 Dec 2023 13:09:34 +0000 (UTC)
Message-ID: <425720a1-da7d-4301-9e49-b107801be925@collabora.com>
Date: Fri, 15 Dec 2023 14:09:33 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: gadget: webcam: Make g_webcam loadable again
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, kernel@collabora.com
References: <20231211123819.76648-1-andrzej.p@collabora.com>
 <20231212190517.202002-1-andrzej.p@collabora.com>
 <2023121555-carded-lunchroom-9233@gregkh>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <2023121555-carded-lunchroom-9233@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

W dniu 15.12.2023 o 13:47, Greg Kroah-Hartman pisze:
> On Tue, Dec 12, 2023 at 08:05:17PM +0100, Andrzej Pietrasiewicz wrote:
>> commit 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
>>
>> has rendered the precomposed (aka legacy) webcam gadget unloadable.
> 
> Why the extra blank line here?

Readability? No problem deleting it, though.

> 
>> base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
>> prerequisite-patch-id: 5ebe1b40adede82d8413ff25a9e69f3e6b9fdfa6
>> prerequisite-patch-id: 0525706498a65e3ffe25cb6ee19462da9ae6f5b5
> 
> <long lines sniped>
> 
> That's crazy, are they all really needed?
> 

I already explained that the patch was rebased on top of v6.7-rc5 and,
consequently, these were not needed.

Sending a v5.

Regards,

Andrzej
