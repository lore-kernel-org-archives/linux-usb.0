Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.40.151.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014321;
	b=zjx7eGT7Avl1k+fix99//6uaPIAtMtHc4Uc0K+BqJlzHFER7D+UxBLpd4fj3v7A5lywc
	 dC8PSwVonXl+akh32WbRWIyoq/1QbE8HzyN7RXUcI24NUlUjRM2yk56VpmMiLJVmlX9jV
	 +yH3+LHlz5A0J6MHL+MaurOxraCHF6RRILtNkylrtlk10xx9xKMGY3r8ZzLX+eFetEORr
	 a5un+Jxokzu9dVvkEZzfu3Ns4EKgFoyoHTjWAX3Cjta1CE3O1HOUT+lZIioVzHagMazcM
	 T5NRbkYNHLzmpBUt7GrW27B35zL0tcwWDNf/TMZKX2kzRKi7+Z/i4CzyjLY2h/SfYPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014321;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=1A/kLj9X5mwkBddtho1nVNXH2qVSGGXWewufsUWcwA0=;
	b=LNoMyt89tk1M4kF7PiVz7jSGI6TLkpG1VpLXd/sHA4kpXcZX3RnEYtQVKyRpu7ZiQMTB
	 4o8WJCDxmQHKwc5eu6HuXeoqCVCxUIgsbN81zRYFEIaVUoTh7N3YRx2dCthgx9F3E+krK
	 KlM/YEQ7KVJ+Pt5hnDzubXTZ7zuQ3w3xZ85mKB7TeU91GFP+SL56dsTRqy+Ub2l7lTBJ4
	 3cb3ALxrKqE5Zk5awMGWw3MasLim3m1zleUbDWlFM7Wl1ih8tVXXtyyZb4JOPS5Z+wQVj
	 e1257DED8G3ioCpUOZ8ZcGFOsi6oCIwh5cFAY/QJ9nTVyYHh1ETvUgC53SfwHTufWVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ehuk.net;
	spf=pass smtp.mailfrom=ehuk.net;
	dkim=pass header.d=ehuk.net header.i=@ehuk.net header.a=rsa-sha256 header.s=default header.b="I3GfwJ/U";
	arc=none smtp.remote-ip=78.40.151.100
Received: from james.steelbluetech.co.uk (james.steelbluetech.co.uk [78.40.151.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9CE606A330
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 15:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B9CE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ehuk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ehuk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ehuk.net header.i=@ehuk.net header.a=rsa-sha256 header.s=default header.b=I3GfwJ/U
Received: from [10.0.5.25] (tv.ehuk.net [10.0.5.25])
	by james.steelbluetech.co.uk (Postfix) with ESMTP id 11205BFC26;
	Wed, 18 Nov 2026 15:05:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.10.3 james.steelbluetech.co.uk 11205BFC26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ehuk.net; s=default;
	t=1795014312; bh=1A/kLj9X5mwkBddtho1nVNXH2qVSGGXWewufsUWcwA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I3GfwJ/U0l4+QeGH07Kf6VcwsRsBVpd/DezSTI+TrcawZygISQDdfn+y6fvSUtVik
	 IKylZDPZN1XquIVy/Iq9uEn+h2F64oqgGs2OdStme/ORADWbredZDzL/OcB+sRh4kg
	 oGDw8wMaMzqjQqZC6fdioFJuHzCX/Zux7skVHZ+pJ+Yvs+XUgUv2bTkQnO1AQ/dx3Z
	 7UJnFNI9+54sLQepD/WXueSGIKLZsNkVlPlwhGkNk8T/e/Sh//VtHnZgdnsjDQUKN9
	 LWN+bpNmBCZvknFaX04EhM1H/0Hq4gNJMynkBQoPwrmt03ECvBie+ry3Lsu+iFle31
	 mbfO8sBfdGeJw==
Message-ID: <df921e32-598b-4006-9aec-ddba517311a5@ehuk.net>
Date: Wed, 18 Nov 2026 15:05:11 +0000
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
To: Oliver Neukum <oneukum@suse.com>,
 Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net
References: <20261114174932.53895-1-olivier.kaloudoff@gmail.com>
 <e2ded4e1-a7f3-47d4-a3be-d7c6eed3e436@ehuk.net>
 <5ce29ee1-ea5e-4ebe-9a9a-f16844ad7b78@suse.com>
 <13c443fc-cd23-4bb8-9aca-71b6b0f7b09d@ehuk.net>
 <399a19e6-9dc0-408f-89b6-3c326bb07f30@suse.com>
Content-Language: en-GB, es-ES
From: Eddie Chapman <eddie@ehuk.net>
In-Reply-To: <399a19e6-9dc0-408f-89b6-3c326bb07f30@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang

On 18/11/2026 09:18, Oliver Neukum wrote:
> On 17.11.26 15:41, Eddie Chapman wrote:
>> Yes totally agreed, if the firmware version cannot be easily read from 
>> the device somehow, today, then the only and safest option for the 
>> kernel is to treat all such devices as if running older firmware. I 
>> mean, it is definitely *possible* to query the device to find its 
>> firmware version because Asmedia has firmware update utilities that do 
>> that under Windows. But I've no idea how. In an ideal world someone 
>> from Asmedia would one day provide a patch that exposes that info to 
>> the kernel somehow. In the absence of that perhaps one day someone 
>> will have the time to sniff USB packets using Qemu to see how it is 
>> done and submit a patch.
> 
> Hi,
> 
> do you know whether anyone has tried talking to Asmedia?
> 
>      Regards
>          Oliver

Hi Oliver,

Myself I don't think I've ever seen any communication between Asmedia 
and kernel community about this issue in particular. I definitely have 
never *heard* of any mentioned in blog posts/forums I've lurked in. But 
I'm not a kernel developer just a very interested user due to having a 
good few Asmedia devices in use.

I know that the Asmedia chips are highly regarded by people interested 
in USB to SATA under Linux, as in general working better than others. 
Particularly the more recent 10Gbps chips seem to be regarded as the 
"gold standard" under Linux, especially when you update a device's fw.

I think if Asmedia were to ever make the firmware update process easier 
and less scary for users (e.g. if like Realtek, Mediatek and others do 
with many usb net devices they submitted blobs to linux-firmware and did 
fw loading in the kernel) the popularity of their USB to SATA devices 
would skyrocket and the devices would work so much better under Linux 
with the newer fw. As it is, most devices out there are running old 
buggy fw, even under other OS, and as we know there is only so much the 
kernel can do about that.

Regards,
Eddie
