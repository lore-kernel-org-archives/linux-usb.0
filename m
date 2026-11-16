Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.40.151.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863078;
	b=A4LqdOKBYPp4dkz77BTXdbMxXEXSpQ/9bmAHAC6e5QQW3RLij00bRTB8FUoJR1haAebN
	 U/rplx4BrNh9XcqU7WBMLzflCzeLX8jv4LwqRX2VgOevlOzS5juV8AtnbJ/iFT7KJzcGv
	 6FT91u4t3Zco8PIsPdKqFQs61kxb0X1WEWHjoDxhQuPlyOPrth/+WfXfJX0Qt8wyr2913
	 54f5fPbGFPBHMMjpV9iXGeBSo7ynpQ3BySROMRP0iBtx9lXjmvuNywdxSxdjV3ZXhmK8N
	 pwnoqDLfeFkhJ2tr6+MwdstAxp5/O1TLcx3JqVOfKMW8PjfUoohgTdf8HKOGXQUdE8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863078;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=CjtKhLoJdtSTue2zQdF2MLm7yt0HQzJg9+rAwy/nUSM=;
	b=BqFV1cWOJSLBM3LAUZEwaF7L6lLc2rc1mcMX33hTxUYfV/fnCPPb3sujSuDue8goNP19
	 AXz7T3+1qqMZLwQvjX17Xlusg4SKIjlaIYt/Ii7+KwCLHKjWsq0WTrVx+4AWnirI17ulW
	 xFBy7zWw6m/f6ij9amT6KCcIu3pnuekI1gBulsIaxgnE2+iN9A+hP2uzUk2w61WM3HRwy
	 QRep3ZI5uyp1jx79Mu3HXcm5nAs2rwSYInhCQDmoQKO+qx5tHaBApiR10eBRL2Vj7bhaY
	 Zgn6nWNYcPW3yvTPMZTkWzGW5tm4PaENnDxbl1DTb/qPFcFIpXzzshnXc6D/fD1jAQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ehuk.net;
	spf=pass smtp.mailfrom=ehuk.net;
	dkim=pass header.d=ehuk.net header.i=@ehuk.net header.a=rsa-sha256 header.s=default header.b=gC1BmTMl;
	arc=none smtp.remote-ip=78.40.151.100
Received: from james.steelbluetech.co.uk (james.steelbluetech.co.uk [78.40.151.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEA2606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AEA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ehuk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ehuk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ehuk.net header.i=@ehuk.net header.a=rsa-sha256 header.s=default header.b=gC1BmTMl
Received: from [10.0.5.25] (tv.ehuk.net [10.0.5.25])
	by james.steelbluetech.co.uk (Postfix) with ESMTP id 38743BFC25;
	Mon, 16 Nov 2026 21:04:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.10.3 james.steelbluetech.co.uk 38743BFC25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ehuk.net; s=default;
	t=1794863069; bh=CjtKhLoJdtSTue2zQdF2MLm7yt0HQzJg9+rAwy/nUSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gC1BmTMlIvLRxbmAq8XqZaptH+9mt7RYhcbSGUi2/K4PZ4dBW2rbw2YAz22n5QJ9t
	 C5EJJd+v8yjSFcB/PdXwqXaTFxU411TCIOfwh7045TEnlKT3/v4lV4j3U2xAGij4bJ
	 MYegqmNFYMp28vRIXGY2pr/TdgKcyZKbzewpnpkpMRl6wuwMzZ0kwffsCav/YxnRj1
	 tACoOwSTEns6KohSSSUH5kAvnEdzNvzGZrYPFeFHY2vhvX4CqJ7QyHp3pUGznyfUwY
	 mOH7xuqHzaCLY7HvUPWvBVFsTZXIt49GpB0iIWZjWqTCv+wiSYsI6iqn8yjDdaiYu9
	 IEviS0qbgMPzg==
Message-ID: <e2ded4e1-a7f3-47d4-a3be-d7c6eed3e436@ehuk.net>
Date: Mon, 16 Nov 2026 21:04:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
To: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, oneukum@suse.com,
 usb-storage@lists.one-eyed-alien.net
References: <20261114174932.53895-1-olivier.kaloudoff@gmail.com>
Content-Language: en-GB, es-ES
From: Eddie Chapman <eddie@ehuk.net>
In-Reply-To: <20261114174932.53895-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang

On 14/11/2026 17:49, Olivier Kaloudoff wrote:
> Hi Eddie,
> 
> On 13/11/2026 19:32, Eddie Chapman wrote:
>> May I trouble you to say the product/model of the Orico device you have
>> which reports "ASMT135x" as the iProduct?
>>
>> Also, is it still running whatever firmware it came with or has that
>> been upgraded?
> 
> It's an ORICO C10 — sold as "ORICO C10 SSD Externe" (4 TB, "800 MB/s"
> USB enclosure). Stock firmware; it has never been updated, there is no
> vendor updater for it that I'm aware of.
> 
> Identification details for the record: idVendor/idProduct 174c:55aa,
> iManufacturer "ASMT", iProduct "ASMT135x", bcdDevice 1.00.
> 
> Note the model is now discontinued — mine went back under a
> defect-based refund (reallocated/pending sectors on the SSD itself),
> which is how the UAS breakage was noticed in the first place.
> 
> Hope that helps,
> Olivier

Thanks Olivier. In my own experience just purchasing and using many 
Asmedia USB to SATA products over the years, they usually ship with 
quite old, buggy firmware, and the manufacturer rarely provides a 
firmware update. But there are various unofficial sources of newer 
firmware out there if you look. It goes without saying you have to 
decide for yourself if the obvious risk is worth taking. Generally these 
are either leaked, or are "extracted" from devices with newer firmware 
by users and shared. Sometimes one or two "good" manufacturers supply 
firmware updates for their products and the firmware enthusiast 
community subsequently finds that these apply fine to other equivalent 
product with the same chip.

There is an internal Asmedia firmware tool widely available online. If a 
manufacturer does provide a firmware update it will usually come 
packaged with that tool. It only runs on Windows (not sure about Mac, 
definitely not Linux). There are community efforts I've seen trying to 
develop alternative firmare tools.

Anyway, speaking purely from my own experience, I've always updated the 
firmware on my devices and there is no doubt in my mind that the newer 
firmware versions I've applied to my devices have resolved serious bugs 
in the older versions they were shipped with.

Bringing this a little bit back on topic for issues seen in the Linux 
kernel with Asmedia USB to SATA devices, I'd be willing to wager that a 
lot (if not most) of the time, if there is a firmware update out there 
for a chip, there's an excellent chance it will resolve the issue. But 
it is a mine field for users who are forced to take risks, and it is a 
very problematic situation for Linux to deal with to say the least.

Eddie
