Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862746;
	b=x+ayc5/ToYLZB6/J6OFgv+i19rs4amPOobqEp1YSgttgR9M79IDZNpK1MhhLgbbo/s6A
	 7cbpy5/dKUN/G+amC7eoWNpQlkmHa7x39BlJF2zntwW12gFjBdrIbmfDYgL1R2PKourn5
	 T1A01s8TcjsmsFFjpy+J4Mr42ySWz0TXgoRLxFq6zkXJETngcpYQwRYSS4bMuEmHzNE0/
	 GeWsD8mIXPQK1BeTdAd5ZtRX7Ii5MBe0OwCiyD0zNc09T48OPypRGKfeyYC2K13gtqc8k
	 FZBZN5oSqrvCvy5Cbm4BtI//CZpqidN9g8HBGwA0xKFU8yUuHer9xwx9mftbZWMSJYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
	 X-Originating-IP:Content-Type:Content-Transfer-Encoding;
	bh=KJkXoy+1B4sAjKLBJw4PexLrXqELau3FR2EsvrAmmGg=;
	b=ChjhHFgTfTEJWeVWJUTWE+sumYt+ZXfd7y2e3ic66mqBuYs8ZlRnY0BYxrBF1Krslovx
	 usq5g8C9h8pIUJi+322qVNIPE8XCMS1Eq3vzw7uwY8dcAwfagLR3weC5egxQTayVEHQ5e
	 rvjG8+FEuZUjYzyH4nhyHl+pYqXdm6PJtssCb+5Al40oHBSaQ36By5vs2sDf0RrKqum1k
	 OAOb7FcOD46XcoE45mAaOlllLIe2nJSzC38moX8OyxYLigJw0paphiXaoKZewfS/bTtXn
	 zrq18UZIhJ+U0E1OgRMkp6iN1PZ9o+koKkCJqv2ipg01rpO6IqLyW2krJ1kz7WVnUUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=BdnQfbfa;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06705606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 20:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06705606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=BdnQfbfa
Received: from webmail.iinet.com (web1.iinet.com [52.129.46.51])
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPA id A929AB402B4;
	Mon, 16 Nov 2026 12:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1794862739; bh=KJkXoy+1B4sAjKLBJw4PexLrXqELau3FR2EsvrAmmGg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BdnQfbfaR3Uy071Olg5YHp6uwC0/JVHXYYf15Is0u5vNe6RPNd+lOPD68GlRMPekr
	 T6mGHv2vLcJ3HjecpQZdJinX6my4afR1UrGp5qoIW72zcraFbxMJe673hRCwxLBQF3
	 DYNGWvoXohAtN0wfy+rsej5xWk9kcUyy6f9Sa2FH6Q0u8tqiqk/cxejNpTyPbkkWoM
	 5IEwkcf0pyYuMRpQDw4+JsqdTzOfk9/uMXYyhh5w7nh8t54xSan6xd1Oc6AHh5h4La
	 W2MB6TdwOBOJLDC0JK91FEXPZYCfAaHSU3fIDN3hUW3uOk8LbLDgkeU+vVVerV8eZc
	 vPc1E4OC2w3mA==
Received: from c-98-203-133-45.hsd1.wa.comcast.net ([98.203.133.45])
 by webmail.iinet.com
 with HTTP (HTTP/1.1 POST); Mon, 16 Nov 2026 12:58:57 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 12:58:57 -0800
From: kaf@nwlink.com
To: Neill Kapron <nkapron@google.com>
Cc: gregkh@linuxfoundation.org, pavel.hofman@ivitera.com,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac2: prevent invalid bInterval
 auto-selection
In-Reply-To: <179485828707.2938203.11219663125374064721.b4-review@b4>
References: <20261028222800.782988-1-kaf@nwlink.com>
 <179485828707.2938203.11219663125374064721.b4-review@b4>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <e7a09da6d72d3d03a025adcab089c4b6@nwlink.com>
X-Sender: kaf@nwlink.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-16 11:44, Neill Kapron wrote:
>> When p_hs_bint or c_hs_bint is 0, the driver selects the largest
>> bInterval from 4 down to 1 for which the required bandwidth fits the
>> maximum packet size. The original implementation intends to keep
>> bInterval at 1 when required bandwidth exceeds the single-packet 
>> maximum,
>> but the search loop instead decrements bInterval to 0 in that case.
>> 
>> A bInterval of 0 is invalid for an isochronous endpoint. A Linux host
>> reports it and substitutes a default:
>> 
>>   usb 3-8: ... endpoint 0x1 has an invalid bInterval 0, changing to 7
>> 
>> Stop the search at bInterval=1. Maintain existing clamping of
>> wMaxPacketSize and warning about possible data loss when the required
>> bandwidth cannot be accommodated.
>> 
>> Fixes: 355a05dc8367 ("usb: gadget: f_uac2: Optionally determine 
>> bInterval for HS and SS")
> 
> The change looks good to me but you're missing Cc: 
> stable@vger.kernel.org
> 
> Reviewed-by: Neill Kapron <nkapron@google.com>

Thanks Neill. I'll make sure to include the stable Cc on applicable 
fixes going forward.
Could I ask that you add the trailer when applying the patch?

Cc: stable@vger.kernel.org

Thanks,
Kyle Farrell
