Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234516;
	b=zINpna0+m1oyDELCln2OfG0nk487Y1LBWONTZtUxwsIDv32FVEcHmpcfVyp3MrNvpB0p
	 9uriSaU3OMZxSBLgt9iQkFHraeJ9rwL4k6dLJhnyvMMJ3fh6NR8VqlqQLLGEaVqKGRg9V
	 KojnbyKa9VB9uGzKrE4Q/GPGCm3ajOiDXyS52Ph8qAL4Fg1eyRUxCasc8NaNFrlGNUoZj
	 qMYg/u8CI3jDIlWZDHgyFcQeSlGJOXroEHd0aaSDhArNTmSO2KK05hWax+o3oBLEVV+eO
	 KHIUlzYoB4wmeAp083nb5BUi9SJNxHD0sv9QLhCaxFrDUv+o17xRwCNbBnzs+a/X/ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
	b=2Fr80z/TRUjyl2M/Ah4Vsy+qt3FqppfZZ7N0ixKFpcM7OFwmEgRpa5MaGZcKjb35MKDC
	 LOMaYgDLpPErv3N+w125M80Sn7mgUkWH16fv0Ci2ysUGd009kNOaZwZqKEyv1i7lxOYj1
	 gHmEpvo3KxKGO7aqOq022DymsuYZzIvivYScnzTzAg8lEIrkTzMH0uWhK2G/FNuf+7BKD
	 OBPyuVxFRc/SVS3ZrywoxVv1GHru4xurPbvCEjFOhS0+QWTrHvcxfeiVJLsmk+yyL6Kez
	 x9dksXVgxLvoiWBGwmcGWny8tO0WtBPKVcsGYcDZBvXumCcBbRF6VoEVymVVkF0qmYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=QToSrRLd;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5376606D80B
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 14:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5376606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=QToSrRLd
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so533879b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794234515; x=1794839315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
        b=QToSrRLd4t7HkK/8/o4zJPpEAuQS72r5AsdEqGxsfs3VQep2BS+ODfK/0F7W3Z1rc/
         tBbwNxS+IXjBBrpvsaLMbhTj+SAFf8+iPVMYOibtHJhgTg9dnW3tuVGfbA6BgqcFUscx
         84KtGfnFSdWbppCe9hBZzzxNj7c/tdZTvLFdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234515; x=1794839315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
        b=XgmoDHgNTkMNmU9hOOnw+tJTVIlVwVf30BZQYz6N1lR/xEEdeFl6ReS9YHemGNKDbj
         5To2a8fGyxIaTBJBiqQEHTtchuMTu6xmAL+Fuep4shfNKDD2uCiXUKL6Zi4LtLkoNWUa
         yVuDEv6yoUAXDijAALS8/IAOstQsUIpBJv/vCy+cETMOg+JBJI2ANfGU4331DoUsjiNv
         +aqt5aLO95t273c4IIeolKzbOycTNfptl+aPro/a3MtgIyLYi3NeYqqwx6fzWdOqBssc
         k0FgAheyH6tKVNm8ZQ4Go5zdjVZQpb5nfm0xpWXVSzVbnFAJEIFc3Jp2d4256HJBbWPb
         cFMw==
X-Forwarded-Encrypted: i=1; AL+hErH9rw5mb0V1j2ykKWQQsK5U/VPreEdSRIO2bCZCkJ/8lSUYl0q9eGvRwYTUnNlrodOSipdAIybuxDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UkxWKIhMxUX4+vh5Lo8fvQKT6liJ6RcksRM3r63GhFErOoQyX
	QAXzSnrGhMTYsuqi0+vFjrf91Q/yXN/AdXwkrVhYmxVfu7JRIwFzRObBDopdXKfc3w==
X-Gm-Gg: AYBFou3DIThIb6sJjoYXt55FGc+QdT2DiCg0lOpbv4zLxpTh1OOxHDSjHCHw0bSYpR+
	BPK++4tt+XlQ9XqsZxXc5OBrINKpQfkRjAqD87TmHWvzOWMYUowIKvOkVhAArHQzOVr6S5kYMda
	rhMcD96TF7p54qM9sldlacZW5mbtmVZtKA5SVIxnKoZ0jlpZW5D0G++duAmoa+PlY3f5+Lz4u/D
	2xFe7xyYQl1tGJXnuGgDm7bu05cOLQdgXVHzmPmnQwiw3urawtnwr2qSS2HzfZ/5mZdn/F54Noi
	117zBn95fOAXDFtKTR59K7FKcBuZEt/4p7dM9GMb1/6j72Jzt/zyY4yKhWWITOuGVNlh5anRa14
	pTOWwd7eGqyk9A7VggKVpGWKVd01lVlmwQQY7VdBUdv0lolvcQbGZxitR2U4+iKa2PTIeplaD9c
	jWj/tIK3kph2f161e9Qlq6uvxCw8gIDujAdXeln5duBR6RCOJfOXpb6stYhitVz/KPJPNiwGeIB
	7nfblY1+97w88l35FyF9BrXclQeDbYYBt5uFMhKYzN4zTDnCzalUfCqEoVShzSMXoXcrobj7FMh
	+VeqRHLyw/8j6Ery+zNN5vSWV/npYU/uVgQG/lvopCvT
X-Received: by 2002:a05:6808:1495:b0:4fc:3dc7:66af with SMTP id 5614622812f47-5681432edb1mr2821350b6e.10.1794234514790;
        Mon, 09 Nov 2026 06:28:34 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-56813e56700sm4463564b6e.17.2026.11.09.06.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:28:32 -0800 (PST)
Message-ID: <5a2b5e08-c33b-4513-8457-b8ac21563121@ieee.org>
Date: Mon, 9 Nov 2026 08:28:31 -0600
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
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in
 gb_svc_request_handler
To: Chandradhar Kumar <chandradhar.2003@gmail.com>
Cc: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
 <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org> <au8s1_tIBa0mpTSL@TheRealOne>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <au8s1_tIBa0mpTSL@TheRealOne>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 8:17 AM, Chandradhar Kumar wrote:
> On Thu, Nov 05, 2026 at 08:08:01AM -0600, Alex Elder wrote:
>> Here is what I see happening at the beginning of gb_connection_recv():
>> - If the connection is disabled or offloaded, return immediately
>> - If the size of the buffer (passed in as the "size" argument) is less
>>    than the size of an operation message header, return
>> - If the 16-bit size embedded in the message header is less than the
>>    size of the buffer, return
>>
>> In other words, after these checks, we know:
>>
>>    sizeof(header) <= buffer size (size)       AND
>>    buffer size (size) <= size encoded in the header (msg_size)
> No, it does not verify this, it verify:
> 	size encoded in the header <= size (buffer size)

You're right, I misread this.

We don't read the header unless size tells us the entire
message ("buffer size") is at least the size of the header.

And then we ensure the buffer contains the entire message
(whose msg_size is decoded from the header).

But if the size encoded in the message header is bogus
(and in particular, smaller than the header size) we
have a problem.

>> Therefore (transitive property), this is true:
>>
>>    sizeof(header) <= size encoded in the header (msg_size)
> So, the transitive property is not true.

Agreed.  Thanks for explaining where I was wrong.

> I have sent a patch for this bug which verify the msg_size and header
> separately, which fixes the out of bounds read.
> patch link: https://lore.kernel.org/all/20261106094303.55158-1-chandradhar.2003@gmail.com/

					-Alex
> Hey please review the patch if there is something wrong or there are any
> other way to fix the bug.
> 
> Thanks.
>>
>> And it's not possible after these checks for this to be true:
>>
>>      header.size < sizeof(struct gb_operation_msg_hdr)
>>
>> or put another way:
>>
>>      msg_size < sizeof(header)        cannot hold
>>
>>
>> It surprises me this would be missed in the AI summary--and I
>> fear I'm mistaken.  If I'm missing something or wrong about this,
>> please feel free to say so.
>>
>> 					-Alex

