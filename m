Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.40.151.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926511;
	b=a5tIaCUPnnTJEwDtUURmy7IYFSxsk6r7tAdUQvagS8CH9kugCZ1QSKt22NsfVmh/srzQ
	 /d2+pFeLtRl12q2SVHZMs4Iv0Wo4AXIf0U5q3qHPlBwIrIpywbZTOmUDalOvpzsK+9vlY
	 56G4K//iGFv0n6LWGB3ZwaYh+iUGYpKtzmzJ0O8FIc/WseLF01z2pT/Bemb4DMOgstOvM
	 Y/uWOjRJFa2PFdrKLfOdidjAs394wGBd+0/buzdeeLxJd8HS/41Mvv2+7wcXuJHRay4LK
	 RNqiCEz3s/CRsjs64LvwkLl6RHQoAy/lgpAa+s3K4VcvUufQh2R6vb1DAsxyRLepQ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926511;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=LVrYcLJh1TssePERYPtnyqWLCOz66h5xJEgQXcWt/Ls=;
	b=WDfKVWEx8vlg0qnXbjfKI746FHOM37Lea/xlacKW1eGLnpTf7lXWRyd5duQpxOgLKqVt
	 S/1xJ2hd4i46uQ4Wc6d3JN5l7eAZRsz4z+R5VNi4zfnvvdeSZW8inY4IF3fbJpyDcTveG
	 wzOUKISJWUapqntNRpmIscbCK+Ip1/4vOOtuptnyR6tOM0i0I46R6wjZamu6ISzgOvguH
	 8QdO9rfMVlkH7g3z0a3vY9Gg3mgKwh94mhKrh+JFTIa8XM9Tu3Z1xIGAvdiE4rt/qL5av
	 gnpI56RgiIR7uyBex1pOeT9nL2qP3+3eQWKZHvN08COoJSt46Ispwn6Y7E1PKTfbz4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ehuk.net;
	spf=pass smtp.mailfrom=ehuk.net;
	dkim=pass header.d=ehuk.net header.i=@ehuk.net header.a=rsa-sha256 header.s=default header.b=ATRHcoSo;
	arc=none smtp.remote-ip=78.40.151.100
Received: from james.steelbluetech.co.uk (james.steelbluetech.co.uk [78.40.151.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C776C606A32F
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 14:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C776C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ehuk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ehuk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ehuk.net header.i=@ehuk.net header.a=rsa-sha256 header.s=default header.b=ATRHcoSo
Received: from [10.0.5.25] (tv.ehuk.net [10.0.5.25])
	by james.steelbluetech.co.uk (Postfix) with ESMTP id 84DC0BFC26;
	Tue, 17 Nov 2026 14:41:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.10.3 james.steelbluetech.co.uk 84DC0BFC26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ehuk.net; s=default;
	t=1794926508; bh=LVrYcLJh1TssePERYPtnyqWLCOz66h5xJEgQXcWt/Ls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ATRHcoSoaBJflVQp9NbgBfUnIAuJsv9j224VnnpkdMW5eFPU2iQVFe5e92bbfJAY6
	 2MrkqF3ZQA/OKLhW2VJet+i0riMCNCodKA4hOCj5redoYDKNtM7TVqCcmoiVrhQiPX
	 nuYyiHf+BPiQAaF4RQHtsz7CaAc+eKNjeFYwpGwIxghKXpPiCXxnSZTzX7QMY/a9dE
	 17govN2N64c6ibwzeUJohysqI2UctGmYLtO+xxGr3d5724QDHrlDQHf/TqhW9AUJSo
	 sAhJ4ifGIQyOdr/dOvt+D7u0gcNRSXGv71BzVM7C134Z4pg5oYuARQiowPyGzcStQa
	 E6nMmVEC6kXwg==
Message-ID: <13c443fc-cd23-4bb8-9aca-71b6b0f7b09d@ehuk.net>
Date: Tue, 17 Nov 2026 14:41:48 +0000
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
Content-Language: en-GB, es-ES
From: Eddie Chapman <eddie@ehuk.net>
In-Reply-To: <5ce29ee1-ea5e-4ebe-9a9a-f16844ad7b78@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang

On 17/11/2026 08:34, Oliver Neukum wrote:
> On 16.11.26 22:04, Eddie Chapman wrote:
>> Bringing this a little bit back on topic for issues seen in the Linux 
>> kernel with Asmedia USB to SATA devices, I'd be willing to wager that 
>> a lot (if not most) of the time, if there is a firmware update out 
>> there for a chip, there's an excellent chance it will resolve the 
>> issue. But it is a mine field for users who are forced to take risks, 
>> and it is a 
>> very problematic situation for Linux to deal with to say the least.
> 
> Hi,
> 
> do they show a different version number?
> If not, I am afraid we will have to be conservative
> and blacklist everything.
> 
>      Regards
>          Oliver

Hi Oliver,

Yes totally agreed, if the firmware version cannot be easily read from 
the device somehow, today, then the only and safest option for the 
kernel is to treat all such devices as if running older firmware. I 
mean, it is definitely *possible* to query the device to find its 
firmware version because Asmedia has firmware update utilities that do 
that under Windows. But I've no idea how. In an ideal world someone from 
Asmedia would one day provide a patch that exposes that info to the 
kernel somehow. In the absence of that perhaps one day someone will have 
the time to sniff USB packets using Qemu to see how it is done and 
submit a patch.

In the case of this particular device that reports "ASMT135x" as the 
iProduct seems it's a little unusual, I'd love to see what's printed on 
the chip on the PCB to confirm what it actually is, as you can easily 
write any string you like to iProduct in the Windows firmware utility. 
I've done that myself when updating firmware, here's one I did recently:

   idVendor           0x174c ASMedia Technology Inc.
   idProduct          0x235c DD25-C3-GY-BP
   bcdDevice            1.00
   iManufacturer           2 Orico
   iProduct                3 DD25-C3-GY-BP
   iSerial                 1 234567890126

That device from Orico that came with much older firmware initially 
reported a different idVendor and idProduct which I can't recall. But as 
part of the firmware update those 2 fields changed to the above and it 
is now recognised correctly by the kernel and works better, which is 
good. But the string "DD25-C3-GY-BP" *I* chose and set that in the 
firmware utility, it's just the model number of the device. But I could 
have set it to "111111" or anything else.

regards,
Eddie
