Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1893CEB84;
	Wed, 17 Jun 2026 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690189; cv=none; b=dRjUai2j1qFEtHyPxTM17FE/m8frRcPGzDV9GiH5psHiVHUGT5Jtzqrx2hamsg1Dg0LMPyhiRnU52b4piIJEGo9xyr0KGsiJj/Sj/Whs99o8SEHRFAOSRbSu+a5gX+URJrvQqt4bdDfEo1mIZ3kfJAyU93Iskhmh7ZU9USkdGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690189; c=relaxed/simple;
	bh=bKuPF1jciv5rGcATJbV83smzdeIoBQJUO4qKGvnIIrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDuyLbC/W9kNIifoeycWoYDi79Mk96tlobvkV/uMddlFEnpOhTq9t/J9XcXyXFufdl3vQxT4E5w6ezV6ql6prs2esvhvYkSf5c3ouzoH3lZILRHS6l+hXm7r5yCLv5a+R+zIxe8b0gf23XuROcvlP64oC62/NLxp3rDWzSoAyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=pgL2nCaP; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="pgL2nCaP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=4o5E/OJf6ov/XyBHFiOqKgadDhbRD+SgWGruomRWPNk=; b=pgL2nCaPad+jTWcq
	tQYFXhLWEEpvHw3lW2IZSZFvTz2gy0OlZk17mL5ZRJTqC0OIzQdAtkNImdE3ek02YWjxuLRejV2tY
	2K1lpqoOQTZBpLUv58bPM1t01vxCxORo8+Vel73Gssvo8YL82YB4UJ4UDTagN+l9KrCtZ83wRPfMg
	LwoxejZ48S5OgwMs/C613chgYVSyb/miksLVf43aBgD/dBDZPy646pqf01pkth5haAubxAYPb6eve
	126XkSPVXBwfZ7recA81NykJDN4HHWaV/xoR6fnR93WUAFfql9Nbs6E0jGDKpjfcr1vHRqzxqvPqa
	1kK5ENYRTFdR577gSw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wZn0A-00Cs47-Ei; Wed, 17 Jun 2026 10:56:06 +0100
Message-ID: <c1108bc0-190f-4ebd-adb2-51a4a07fc144@codethink.co.uk>
Date: Wed, 17 Jun 2026 10:56:00 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Sam Day <me@samcday.com>,
 Michael Bommarito <michael.bommarito@gmail.com>, Kees Cook
 <kees@kernel.org>, Ingo Rohloff <ingo.rohloff@lauterbach.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260617085930.711146-1-ben.dooks@codethink.co.uk>
 <2026061715-rift-strategy-cdec@gregkh>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <2026061715-rift-strategy-cdec@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 17/06/2026 10:34, Greg Kroah-Hartman wrote:
> On Wed, Jun 17, 2026 at 09:59:30AM +0100, Ben Dooks wrote:
>> The wMaxPacketSize is __le16 type, fix the sparse warnings by changing
>> the type.
>>
>> Fixes:
>>
>> drivers/usb/gadget/function/f_fs.c:3346:32: warning: incorrect type in assignment (different base types)
>> drivers/usb/gadget/function/f_fs.c:3346:32:    expected unsigned short [usertype] wMaxPacketSize
>> drivers/usb/gadget/function/f_fs.c:3346:32:    got restricted __le16 [usertype] wMaxPacketSize
>> drivers/usb/gadget/function/f_fs.c:3371:36: warning: incorrect type in assignment (different base types)
>> drivers/usb/gadget/function/f_fs.c:3371:36:    expected restricted __le16 [usertype] wMaxPacketSize
>> drivers/usb/gadget/function/f_fs.c:3371:36:    got unsigned short [usertype] wMaxPacketSize
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   drivers/usb/gadget/function/f_fs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 75912ce6ab55..35d885178b52 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -3332,7 +3332,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
>>   		struct usb_request *req;
>>   		struct usb_ep *ep;
>>   		u8 bEndpointAddress;
>> -		u16 wMaxPacketSize;
>> +		__le16 wMaxPacketSize;
> 
> What commit id does this fix?

bdcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across 
usb_ep_autoconfig() call")


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
